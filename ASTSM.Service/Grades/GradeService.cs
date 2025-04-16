using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.Dtos.Fees;
using ASTSM.Model.Dtos.Grades;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;
using System.Linq.Expressions;

namespace ASTSM.Service.Grades
{
    public class GradeService : IGradeService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedUser;

        public GradeService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> SaveGradeAsync(GradeRequestDto gradeRequest)
        {
            try
            {
                if (gradeRequest != null)
                {
                    if (gradeRequest.Id == 0)
                    {
                        await AddAsync(gradeRequest);
                    }
                    else
                    {
                        await UpdateAsync(gradeRequest);
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        private async Task<bool> AddAsync(GradeRequestDto gradeRequest)
        {
            try
            {
                Fee fee = _mapper.Map<Fee>(gradeRequest.Fee);
                fee.CreatedBy = _loggedUser.Id;
                fee.CreatedOn = DateTime.Now;
                fee.IsActive = true;
                var savedFee = await _uow.FeeRepository.AddAsync(fee);

                if (savedFee != null && savedFee.Id > 0)
                {
                    foreach (var feeDetail in gradeRequest.Fee.FeeDetails)
                    {
                        feeDetail.FeeId = savedFee.Id;
                        feeDetail.CreatedOn = DateTime.Now;
                        feeDetail.CreatedBy = _loggedUser.Id;
                        if (feeDetail.Discount.DiscountTypeId > 0)
                        {
                            Discount discount = _mapper.Map<Discount>(feeDetail.Discount);
                            discount.IsActive = true;
                            discount.CreatedBy = _loggedUser.Id;
                            discount.CreatedOn = DateTime.Now;
                            var savedDiscount = await _uow.DiscountRepository.AddAsync(discount);
                            if (savedDiscount != null && savedDiscount.Id > 0)
                                feeDetail.DiscountId = savedDiscount.Id;
                        }
                    }
                    List<FeeDetail> feeDetails = _mapper.Map<List<FeeDetail>>(gradeRequest.Fee.FeeDetails);
                   
                    await _uow.FeeDetailRepository.AddRangeAsync(feeDetails);

                    Grade grade = _mapper.Map<Grade>(gradeRequest);
                    grade.FeeId = savedFee.Id;
                    grade.CreatedBy = _loggedUser.Id;
                    grade.CreatedOn = DateTime.Now;
                    await _uow.GradeRepository.AddAsync(grade);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        private async Task<bool> UpdateAsync(GradeRequestDto gradeRequest)
        {
            try
            {
                Expression<Func<FeeDetail, bool>> filter = x => x.FeeId == gradeRequest.FeeId;
                var feeDetailFromDb = await _uow.FeeDetailRepository.GetAllAsync(filter);
                if (feeDetailFromDb != null)
                {
                    foreach (var feeDetail in feeDetailFromDb)
                    {
                        Discount discountFromDB = await _uow.DiscountRepository.GetByIdAsync(feeDetail.DiscountId);
                        if (discountFromDB != null && discountFromDB.Id > 0)
                            _uow.DiscountRepository.HardDelete(discountFromDB);
                    }
                    _uow.FeeDetailRepository.HardDeleteRange(feeDetailFromDb);
                }

                Fee freeFromDb = await _uow.FeeRepository.GetByIdAsync(gradeRequest.FeeId);
                freeFromDb.TotalAmount = gradeRequest.Fee.TotalAmount;
                freeFromDb.IsActive = true;
                freeFromDb.UpdatedBy = _loggedUser.Id;
                freeFromDb.UpdatedOn = DateTime.Now;
                var savedFee = await _uow.FeeRepository.UpdateAsync(freeFromDb);
                if (savedFee != null && savedFee.Id > 0)
                {
                    foreach (var feeDetail in gradeRequest.Fee.FeeDetails)
                    {
                        feeDetail.FeeId = savedFee.Id;
                        feeDetail.CreatedOn = DateTime.Now;
                        feeDetail.CreatedBy = _loggedUser.Id;
                        if (feeDetail.Discount.DiscountTypeId > 0)
                        {
                            Discount discount = _mapper.Map<Discount>(feeDetail.Discount);
                            discount.Id = 0;
                            discount.IsActive = true;
                            discount.CreatedBy = _loggedUser.Id;
                            discount.CreatedOn = DateTime.Now;
                            var savedDiscount = await _uow.DiscountRepository.AddAsync(discount);
                            if (savedDiscount != null && savedDiscount.Id > 0)
                                feeDetail.DiscountId = savedDiscount.Id;
                        }
                    }
                    List<FeeDetail> feeDetails = _mapper.Map<List<FeeDetail>>(gradeRequest.Fee.FeeDetails);
                    
                    await _uow.FeeDetailRepository.AddRangeAsync(feeDetails);

                    Grade gradeFromDb = await _uow.GradeRepository.GetByIdAsync(gradeRequest.Id);
                    gradeFromDb.Code = gradeRequest.Code;
                    gradeFromDb.Title = gradeRequest.Title;
                    gradeFromDb.IsActive = gradeRequest.IsActive;
                    gradeFromDb.FeeId = gradeRequest.FeeId;
                    gradeFromDb.UpdatedBy = _loggedUser.Id;
                    gradeFromDb.UpdatedOn = DateTime.Now;
                    await _uow.GradeRepository.UpdateAsync(gradeFromDb);
                }

            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            bool isDeleted = false;
            try
            {
                Grade gradeFromDb = await _uow.GradeRepository.GetByIdAsync(id);
                if (gradeFromDb != null)
                {

                    Expression<Func<FeeDetail, bool>> filter = x => x.FeeId == gradeFromDb.FeeId;
                    var feeDetailFromDb = await _uow.FeeDetailRepository.GetAllAsync(filter);
                    if (feeDetailFromDb != null)
                    {
                        foreach (var feeDetail in feeDetailFromDb)
                        {
                            Discount discountFromDB = await _uow.DiscountRepository.GetByIdAsync(feeDetail.DiscountId);
                            if (discountFromDB != null && discountFromDB.Id > 0)
                                _uow.DiscountRepository.HardDelete(discountFromDB);
                        }
                        _uow.FeeDetailRepository.HardDeleteRange(feeDetailFromDb);
                    }

                    await _uow.FeeRepository.DeleteAsync((int)gradeFromDb.FeeId, _loggedUser.Id);

                    await _uow.GradeRepository.DeleteAsync(id, _loggedUser.Id);
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

        public async Task<GradeRequestDto> GetByIdAsync(int id)
        {
            try
            {
                GradeRequestDto gradeResponse = new();
                List<GradeDetailDto> gradeFromDb = await _uow.GradeRepository.GetGradeDetailsByIdAsync(id);
                if (gradeFromDb != null)
                {
                    var gradeInfo = gradeFromDb.First();
                    gradeResponse.Id = gradeInfo.GradeId;
                    gradeResponse.FeeId = (int)gradeInfo.FeeId;
                    gradeResponse.Code = gradeInfo.GradeCode;
                    gradeResponse.Title = gradeInfo.GradeTitle;
                    gradeResponse.IsActive = gradeInfo.IsActive;
                    gradeResponse.Fee.Id = (int)gradeInfo.FeeId;
                    gradeResponse.Fee.TotalAmount = gradeInfo.FeeTotalAmount;
                    foreach (var grade in gradeFromDb)
                    {
                        FeeDetailDto feeDetail = new();
                        feeDetail.Amount = grade.Amount;
                        feeDetail.FeeTypeId = grade.FeeTypeId;
                        feeDetail.DiscountId = grade.DiscountId;
                        feeDetail.FeeId = (int)grade.FeeId;

                        feeDetail.Discount.Id = grade.DiscountId;
                        feeDetail.Discount.DiscountTypeId = grade.DiscountTypeId;
                        feeDetail.Discount.Amount = grade.DiscountAmount;
                        feeDetail.Discount.Reason = grade.DiscountReason;

                        gradeResponse.Fee.FeeDetails.Add(feeDetail);
                    }
                }
                return gradeResponse;
            }
            catch(Exception ex) {
                return null;
                    }
        }

        public async Task<List<GradeDto>> ListAsync()
        {
            var result = await _uow.GradeRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<GradeDto> grades = _mapper.Map<List<GradeDto>>(result);
            return grades;
        }
        public async Task<List<ShortListDto>> ShortList()
        {
            var result = await _uow.GradeRepository.GetAllAsync(entity => ((entity.IsDeleted == null || (Boolean)!entity.IsDeleted) && (Boolean)entity.IsActive));
            if (result != null && result.Any())
            {
                List<ShortListDto> storyList = _mapper.Map<List<ShortListDto>>(result);
                return storyList;
            }
            else
            {
                return new List<ShortListDto>();
            }

        }
    }
}
