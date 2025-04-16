using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.FeeTypes
{
    public class FeeTypeService : IFeeTypeService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public FeeTypeService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(FeeTypeDto feeTypeRequest)
        {
            try
            {
                if (feeTypeRequest != null)
                {
                    FeeType feeType = _mapper.Map<FeeType>(feeTypeRequest);
                    feeType.CreatedBy = _loggedInUser.Id;
                    feeType.CreatedOn = DateTime.Now;
                    await _uow.FeeTypeRepository.AddAsync(feeType);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(FeeTypeDto feeTypeRequest)
        {
            bool isUpdated = false;
            try
            {
                if (feeTypeRequest != null && feeTypeRequest.Id > 0)
                {
                    FeeType feeTypeFromDb = await _uow.FeeTypeRepository.GetByIdAsync(feeTypeRequest.Id);

                    if (feeTypeFromDb != null && feeTypeFromDb.Id > 0)
                    {
                        feeTypeFromDb.Title = feeTypeRequest.Title;
                        feeTypeFromDb.Description = feeTypeRequest.Description;
                        feeTypeFromDb.IsMonthly = feeTypeRequest.IsMonthly;
                        feeTypeFromDb.IsActive = feeTypeRequest.IsActive;
                        feeTypeFromDb.UpdatedBy = _loggedInUser.Id;
                        feeTypeFromDb.UpdatedOn = DateTime.Now;
                        await _uow.FeeTypeRepository.UpdateAsync(feeTypeFromDb);
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
                FeeType feeTypeFromDb = await _uow.FeeTypeRepository.GetByIdAsync(id);
                if (feeTypeFromDb != null)
                {
                    await _uow.FeeTypeRepository.DeleteAsync(id, _loggedInUser.Id);
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

        public async Task<FeeTypeDto> GetByIdAsync(int id)
        {
            FeeType feeTypeFromDb = await _uow.FeeTypeRepository.GetByIdAsync(id);
            FeeTypeDto feeTypeDto = _mapper.Map<FeeTypeDto>(feeTypeFromDb);
            return feeTypeDto;
        }

        public async Task<List<FeeTypeDto>> ListAsync()
        {
            var result = await _uow.FeeTypeRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<FeeTypeDto> feeTypes = _mapper.Map<List<FeeTypeDto>>(result);
            return feeTypes;
        }



        public async Task<List<ShortListDto>> ShortList()
        {
            var result = await _uow.FeeTypeRepository.GetAllAsync(entity => ((entity.IsDeleted == null || (Boolean)!entity.IsDeleted) && (Boolean)entity.IsActive));
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
