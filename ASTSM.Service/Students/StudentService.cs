using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Fees;
using ASTSM.Model.Dtos.Grades;
using ASTSM.Model.Dtos.Students;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;
using System.Linq.Expressions;

namespace ASTSM.Service.Students
{
    public class StudentService : IStudentService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public StudentService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> SaveAsync(StudentRequestDto studentRequest)
        {
            try
            {
                if (studentRequest.Student.Id == 0)
                    await AddAsync(studentRequest);
                else
                    await UpdateAsync(studentRequest);
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        private async Task<bool> AddAsync(StudentRequestDto studentRequest)
        {
            try
            {
                if (studentRequest != null)
                {
                    Student student = _mapper.Map<Student>(studentRequest.Student);
                    student.CreatedBy = _loggedInUser.Id;
                    student.CreatedOn = DateTime.Now;
                    var savedStudent = await _uow.StudentRepository.AddAsync(student);

                    if (savedStudent != null && savedStudent.Id > 0)
                    {
                        List<StudentFeeType> studentFeeTypes = new();
                        studentFeeTypes.AddRange(studentRequest.FeeTypeIds.Select(feeTypeId => new StudentFeeType
                        {
                            StudentId = savedStudent.Id,
                            FeeTypeId = feeTypeId,
                            CreatedOn = DateTime.Now,
                            CreatedBy = _loggedInUser.Id
                        }));
                        await _uow.StudentFeeTypeRepository.AddRangeAsync(studentFeeTypes);

                        foreach (var studentDetail in studentRequest.StudentDiscountDetails)
                        {
                            studentDetail.StudentId = savedStudent.Id;
                            studentDetail.CreatedOn = DateTime.Now;
                            studentDetail.CreatedBy = _loggedInUser.Id;
                            if (studentDetail.Discount != null && studentDetail.Discount.DiscountTypeId > 0)
                            {
                                Discount discount = _mapper.Map<Discount>(studentDetail.Discount);
                                discount.IsActive = true;
                                discount.CreatedBy = _loggedInUser.Id;
                                discount.CreatedOn = DateTime.Now;
                                var savedDiscount = await _uow.DiscountRepository.AddAsync(discount);
                                if (savedDiscount != null && savedDiscount.Id > 0)
                                    studentDetail.DiscountId = savedDiscount.Id;
                            }
                        }
                        List<StudentDiscountDetail> studentDiscountDetails = _mapper.Map<List<StudentDiscountDetail>>(studentRequest.StudentDiscountDetails);

                        await _uow.StudentDiscountDetailRepository.AddRangeAsync(studentDiscountDetails);

                        var studentGrade = new StudentGrade
                        {
                            GradeId = studentRequest.GradeId,
                            IsCurrent = true,
                            IsActive = true,
                            LastGradeId = null,
                            StudentId = savedStudent.Id,
                            CreatedBy = _loggedInUser.Id,
                            CreatedOn = DateTime.Now
                        };
                        await _uow.StudentGradeRepository.AddAsync(studentGrade);
                    }
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return false;
        }

        private async Task<int> UpdateAsync(StudentRequestDto studentRequest)
        {
            try
            {
                //Get Existing Student Discount Details.
                Expression<Func<StudentDiscountDetail, bool>> filter = x => x.StudentId == studentRequest.Student.Id;
                var stuDiscountDetailFromDb = await _uow.StudentDiscountDetailRepository.GetAllAsync(filter);

                //Get Existing Student FeeTypes Details.
                Expression<Func<StudentFeeType, bool>> filterStuFeeType = x => x.StudentId == studentRequest.Student.Id;
                var studentFeeTypeFromDb = await _uow.StudentFeeTypeRepository.GetAllAsync(filterStuFeeType);

                //Delete Existing Student Discount Details.
                if (stuDiscountDetailFromDb != null)
                {
                    foreach (var detail in stuDiscountDetailFromDb)
                    {
                        Discount discountFromDB = await _uow.DiscountRepository.GetByIdAsync((int)detail.DiscountId);
                        if (discountFromDB != null && discountFromDB.Id > 0)
                            _uow.DiscountRepository.HardDelete(discountFromDB);
                    }
                    _uow.StudentDiscountDetailRepository.HardDeleteRange(stuDiscountDetailFromDb);
                }
                //Delete Existing Student FeeTypes Details.
                if (studentFeeTypeFromDb != null)
                    _uow.StudentFeeTypeRepository.HardDeleteRange(studentFeeTypeFromDb);

                //Updating Existing Student Details.
                if (studentRequest != null && studentRequest.Student.Id > 0)
                {
                    Student studentFromDb = await _uow.StudentRepository.GetByIdAsync(studentRequest.Student.Id);

                    if (studentFromDb != null && studentFromDb.Id > 0)
                    {
                        studentFromDb.Name = studentRequest.Student.Name;
                        studentFromDb.Rollno = studentRequest.Student.Rollno;
                        studentFromDb.IsStudentDiscount = studentRequest.Student.IsStudentDiscount;
                        studentFromDb.IsActive = studentRequest.Student.IsActive;
                        studentFromDb.UpdatedBy = _loggedInUser.Id;
                        studentFromDb.UpdatedOn = DateTime.Now;
                        var savedStudent = await _uow.StudentRepository.UpdateAsync(studentFromDb);
                        if (savedStudent != null && savedStudent.Id > 0)
                        {
                            //Adding new Student FeeType
                            List<StudentFeeType> studentFeeTypes = new();
                            studentFeeTypes.AddRange(studentRequest.FeeTypeIds.Select(feeTypeId => new StudentFeeType
                            {
                                StudentId = savedStudent.Id,
                                FeeTypeId = feeTypeId,
                                CreatedOn = DateTime.Now,
                                CreatedBy = _loggedInUser.Id
                            }));
                            await _uow.StudentFeeTypeRepository.AddRangeAsync(studentFeeTypes);

                            //Adding new Student Discount Details
                            foreach (var studentDetail in studentRequest.StudentDiscountDetails)
                            {
                                studentDetail.StudentId = savedStudent.Id;
                                studentDetail.CreatedOn = DateTime.Now;
                                studentDetail.CreatedBy = _loggedInUser.Id;
                                if (studentDetail.Discount != null && studentDetail.Discount.DiscountTypeId > 0)
                                {
                                    Discount discount = _mapper.Map<Discount>(studentDetail.Discount);
                                    discount.IsActive = true;
                                    discount.CreatedBy = _loggedInUser.Id;
                                    discount.CreatedOn = DateTime.Now;
                                    discount.Id = 0;
                                    var savedDiscount = await _uow.DiscountRepository.AddAsync(discount);
                                    if (savedDiscount != null && savedDiscount.Id > 0)
                                        studentDetail.DiscountId = savedDiscount.Id;
                                }

                            }
                            List<StudentDiscountDetail> studentDiscountDetails = _mapper.Map<List<StudentDiscountDetail>>(studentRequest.StudentDiscountDetails);

                            await _uow.StudentDiscountDetailRepository.AddRangeAsync(studentDiscountDetails);

                            Expression<Func<StudentGrade, bool>> sgfilter = x => x.StudentId == studentRequest.Student.Id && x.IsCurrent == true && x.IsActive == true;
                            var stuGradeFromDb = await _uow.StudentGradeRepository.GetAllAsync(sgfilter);
                            var stuGrade = stuGradeFromDb.FirstOrDefault();
                            if (stuGrade != null && stuGrade.Id > 0)
                            {
                                stuGrade.GradeId = studentRequest.GradeId;
                                await _uow.StudentGradeRepository.UpdateAsync(stuGrade);
                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            bool isDeleted = false;
            try
            {
                Student studentFromDb = await _uow.StudentRepository.GetByIdAsync(id);
                if (studentFromDb != null)
                {
                    Expression<Func<StudentDiscountDetail, bool>> filter = x => x.StudentId == studentFromDb.Id;
                    var stuDiscountDetailFromDb = await _uow.StudentDiscountDetailRepository.GetAllAsync(filter);
                    if (stuDiscountDetailFromDb != null)
                    {
                        foreach (var detail in stuDiscountDetailFromDb)
                        {
                            Discount discountFromDB = await _uow.DiscountRepository.GetByIdAsync((int)detail.DiscountId);
                            if (discountFromDB != null && discountFromDB.Id > 0)
                                _uow.DiscountRepository.HardDelete(discountFromDB);
                        }
                        _uow.StudentDiscountDetailRepository.HardDeleteRange(stuDiscountDetailFromDb);
                    }


                    Expression<Func<StudentGrade, bool>> sgfilter = x => x.StudentId == studentFromDb.Id && x.IsCurrent == true && x.IsActive == true;
                    var stuGradeFromDb = await _uow.StudentGradeRepository.GetAllAsync(sgfilter);
                    var stuGrade = stuGradeFromDb.FirstOrDefault();
                    if (stuGrade != null && stuGrade.Id > 0)
                    {
                        await _uow.StudentGradeRepository.DeleteAsync(stuGrade.Id, _loggedInUser.Id);
                    }
                    await _uow.StudentRepository.DeleteAsync(id, _loggedInUser.Id);
                    isDeleted = true;
                }
                else
                    isDeleted = false;
            }
            catch (Exception ex)
            {
                throw;
            }
            return isDeleted;
        }

        public async Task<StudentRequestDto> GetByIdAsync(int id)
        {
            StudentRequestDto studentResponse = new();
            List<StudentDetailDto> studentFromDb = await _uow.StudentRepository.GetStudentDetailsByIdAsync(id);
            if (studentFromDb != null)
            {
                var studentInfo = studentFromDb.First();
                studentResponse.GradeId = studentInfo.GradeId;
                studentResponse.Student.Id = (int)studentInfo.StudentId;
                studentResponse.Student.Name = studentInfo.Name;
                studentResponse.Student.Rollno = studentInfo.Rollno;
                studentResponse.Student.IsActive = studentInfo.IsActive;
                studentResponse.Student.IsStudentDiscount = studentInfo.IsStudentDiscount;
                foreach (var discount in studentFromDb)
                {
                    StudentDiscountDetailDto discountDetail = new();
                    discountDetail.StudentId = discount.StudentId;
                    discountDetail.FeeTypeId = discount.FeeTypeId;
                    discountDetail.DiscountId = discount.DiscountId;

                    discountDetail.Discount.Id = discount.DiscountId;
                    discountDetail.Discount.DiscountTypeId = discount.DiscountTypeId;
                    discountDetail.Discount.Amount = discount.DiscountAmount;

                    studentResponse.StudentDiscountDetails.Add(discountDetail);
                }
                Expression<Func<StudentFeeType, bool>> filterStudentFeeTypes = x => x.StudentId == id;

                var studentFeeTypes = await _uow.StudentFeeTypeRepository.GetAllAsync(filterStudentFeeTypes);
                if (studentFeeTypes != null && studentFeeTypes.Count > 0)
                    studentResponse.FeeTypeIds = studentFeeTypes.Select(f => f.FeeTypeId).ToList();
            }
            return studentResponse;
        }

        public async Task<List<StudentDto>> ListAsync()
        {
            var result = await _uow.StudentRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<StudentDto> students = _mapper.Map<List<StudentDto>>(result);
            return students;
        }
        public async Task<List<StudentDto>> GetByGrade(int gradeId)
        {

            List<StudentDto> studentResponse = new();
            var studentFromDb = await _uow.StudentRepository.GetStudentDetailsByGradeIdAsync(gradeId);

            if (studentFromDb != null)
            {
                foreach (var item in studentFromDb)
                {
                    StudentDto student = new StudentDto();
                    student.Id = item.Id;
                    student.Rollno = item.Rollno;
                    student.Name = item.Name;
                    student.IsActive = item.IsActive;
                    studentResponse.Add(student);
                }
            }
            return studentResponse;
        }
        public List<StudentGradeResult> GetStudentVoucherResults(StudentVoucherByGradeRequestDto studentGrade)
        {
            List<StudentGradeResult> studentGradeFromDb = _uow.StudentRepository.GetStudentVoucherResults(studentGrade);
            return studentGradeFromDb;
        }
    }
}
