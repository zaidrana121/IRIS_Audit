using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.DiscountFees
{
    public class DiscountService : IDiscountService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;


        public DiscountService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(DiscountDto discountFeeRequest)
        {
            try
            {
                if (discountFeeRequest != null)
                {
                    Discount discountFee = _mapper.Map<Discount>(discountFeeRequest);
                    discountFee.CreatedBy = _loggedInUser.Id;
                    discountFee.CreatedOn = DateTime.Now;
                    await _uow.DiscountRepository.AddAsync(discountFee);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(DiscountDto discountFeeRequest)
        {
            bool isUpdated = false;
            try
            {
                if (discountFeeRequest != null && discountFeeRequest.Id > 0)
                {
                    Discount discountFeeFromDb = await _uow.DiscountRepository.GetByIdAsync(discountFeeRequest.Id);

                    if (discountFeeFromDb != null && discountFeeFromDb.Id > 0)
                    {
                        discountFeeFromDb.DiscountTypeId = discountFeeRequest.DiscountTypeId;
                        discountFeeFromDb.Amount = discountFeeRequest.Amount;
                        discountFeeFromDb.UpdatedBy = _loggedInUser.Id;
                        discountFeeFromDb.UpdatedOn = DateTime.Now;
                        await _uow.DiscountRepository.UpdateAsync(discountFeeFromDb);
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
                Discount discountFeeFromDb = await _uow.DiscountRepository.GetByIdAsync(id);
                if (discountFeeFromDb != null)
                {
                    await _uow.DiscountRepository.DeleteAsync(id, _loggedInUser.Id);

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

        public async Task<DiscountDto> GetByIdAsync(int id)
        {
            Discount discountFeeFromDb = await _uow.DiscountRepository.GetByIdAsync(id);
            DiscountDto discountFeeDto = _mapper.Map<DiscountDto>(discountFeeFromDb);
            return discountFeeDto;
        }

        public async Task<List<DiscountDto>> ListAsync()
        {
            var result = await _uow.DiscountRepository.GetAllAsync();
            List<DiscountDto> discountFees = _mapper.Map<List<DiscountDto>>(result);
            return discountFees;
        }
    }
}
