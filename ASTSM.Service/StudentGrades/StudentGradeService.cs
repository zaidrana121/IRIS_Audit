using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Students;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.StudentGrades
{
    public class StudentGradeService : IStudentGradeService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public StudentGradeService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(StudentGradeDto studentGradeRequest)
        {
            try
            {
                if (studentGradeRequest != null)
                {
                    StudentGrade studentGrade = _mapper.Map<StudentGrade>(studentGradeRequest);
                    studentGrade.CreatedBy = _loggedInUser.Id;
                    studentGrade.CreatedOn = DateTime.Now;
                    await _uow.StudentGradeRepository.AddAsync(studentGrade);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(StudentGradeDto studentGradeRequest)
        {
            bool isUpdated = false;
            try
            {
                if (studentGradeRequest != null && studentGradeRequest.Id > 0)
                {
                    StudentGrade studentGradeFromDb = await _uow.StudentGradeRepository.GetByIdAsync(studentGradeRequest.Id);

                    if (studentGradeFromDb != null && studentGradeFromDb.Id > 0)
                    {
                        studentGradeFromDb.StudentId = studentGradeRequest.StudentId;
                        studentGradeFromDb.GradeId = studentGradeRequest.GradeId;
                        studentGradeFromDb.LastGradeId = studentGradeRequest.LastGradeId;
                        studentGradeFromDb.IsCurrent = studentGradeRequest.IsCurrent;
                        studentGradeFromDb.IsActive = studentGradeRequest.IsActive;
                        studentGradeFromDb.UpdatedBy = _loggedInUser.Id;
                        studentGradeFromDb.UpdatedOn = DateTime.Now;
                        await _uow.StudentGradeRepository.UpdateAsync(studentGradeFromDb);
                        isUpdated = true;
                    }
                }
                else
                    isUpdated = false;
            }
            catch (Exception ex)
            {
                throw;
            }
            return isUpdated;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            bool isDeleted = false;
            try
            {
                StudentGrade studentGradeFromDb = await _uow.StudentGradeRepository.GetByIdAsync(id);
                if (studentGradeFromDb != null)
                {
                    await _uow.StudentGradeRepository.DeleteAsync(id, _loggedInUser.Id);
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

        public async Task<StudentGradeDto> GetByIdAsync(int id)
        {
            StudentGrade studentGradeFromDb = await _uow.StudentGradeRepository.GetByIdAsync(id);
            StudentGradeDto studentGradeDto = _mapper.Map<StudentGradeDto>(studentGradeFromDb);
            return studentGradeDto;
        }

        public async Task<List<StudentGradeDto>> ListAsync()
        {
            var result = await _uow.StudentGradeRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<StudentGradeDto> studentGrades = _mapper.Map<List<StudentGradeDto>>(result);
            return studentGrades;
        }
    }
}
