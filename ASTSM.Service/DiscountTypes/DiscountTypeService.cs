using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.DiscountTypes
{
    public class DiscountTypeService : IDiscountTypeService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;


        public DiscountTypeService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(DiscountTypeDto discountTypeRequest)
        {
            try
            {
                if (discountTypeRequest != null)
                {
                    DiscountType discountType = _mapper.Map<DiscountType>(discountTypeRequest);
                    discountType.CreatedBy = _loggedInUser.Id;
                    discountType.CreatedOn = DateTime.Now;
                    await _uow.DiscountTypeRepository.AddAsync(discountType);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(DiscountTypeDto discountTypeRequest)
        {
            bool isUpdated = false;
            try
            {
                if (discountTypeRequest != null && discountTypeRequest.Id > 0)
                {
                    DiscountType discountTypeFromDb = await _uow.DiscountTypeRepository.GetByIdAsync(discountTypeRequest.Id);

                    if (discountTypeFromDb != null && discountTypeFromDb.Id > 0)
                    {
                        discountTypeFromDb.Title = discountTypeRequest.Title;
                        discountTypeFromDb.Description = discountTypeRequest.Description;
                        discountTypeFromDb.IsActive = discountTypeRequest.IsActive;
                        discountTypeFromDb.UpdatedBy = _loggedInUser.Id;
                        discountTypeFromDb.UpdatedOn = DateTime.Now;
                        await _uow.DiscountTypeRepository.UpdateAsync(discountTypeFromDb);
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
                DiscountType discountTypeFromDb = await _uow.DiscountTypeRepository.GetByIdAsync(id);
                if (discountTypeFromDb != null)
                {
                    await _uow.DiscountTypeRepository.DeleteAsync(id, _loggedInUser.Id);
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

        public async Task<DiscountTypeDto> GetByIdAsync(int id)
        {
            DiscountType discountTypeFromDb = await _uow.DiscountTypeRepository.GetByIdAsync(id);
            DiscountTypeDto discountTypeDto = _mapper.Map<DiscountTypeDto>(discountTypeFromDb);
            return discountTypeDto;
        }

        public async Task<List<DiscountTypeDto>> ListAsync()
        {
            var result = await _uow.DiscountTypeRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<DiscountTypeDto> discountTypes = _mapper.Map<List<DiscountTypeDto>>(result);
            return discountTypes;
        }


        public async Task<List<ShortListDto>> ShortList()
        {
            var result = await _uow.DiscountTypeRepository.GetAllAsync(entity => ((entity.IsDeleted == null || (Boolean)!entity.IsDeleted) && (Boolean)entity.IsActive));
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
