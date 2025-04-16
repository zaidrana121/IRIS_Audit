using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Fees;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.Fees
{
    public class FeeService : IFeeService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public FeeService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(FeeDto feeRequest)
        {
            try
            {
                if (feeRequest != null)
                {
                    Fee fee = _mapper.Map<Fee>(feeRequest);
                    fee.CreatedBy = _loggedInUser.Id;
                    fee.CreatedOn = DateTime.Now;
                    await _uow.FeeRepository.AddAsync(fee);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(FeeDto feeRequest)
        {
            bool isUpdated = false;
            try
            {
                if (feeRequest != null && feeRequest.Id > 0)
                {
                    Fee feeFromDb = await _uow.FeeRepository.GetByIdAsync(feeRequest.Id);

                    if (feeFromDb != null && feeFromDb.Id > 0)
                    {
                        feeFromDb.TotalAmount = feeRequest.TotalAmount;
                        //feeFromDb.IsActive = feeRequest.IsActive;
                        feeFromDb.UpdatedBy = _loggedInUser.Id;
                        feeFromDb.UpdatedOn = DateTime.Now;
                        await _uow.FeeRepository.UpdateAsync(feeFromDb);
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
                Fee feeFromDb = await _uow.FeeRepository.GetByIdAsync(id);
                if (feeFromDb != null)
                {
                    await _uow.FeeRepository.DeleteAsync(id, _loggedInUser.Id);
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

        public async Task<FeeDto> GetByIdAsync(int id)
        {
            Fee feeFromDb = await _uow.FeeRepository.GetByIdAsync(id);
            FeeDto feeDto = _mapper.Map<FeeDto>(feeFromDb);
            return feeDto;
        }

        public async Task<List<FeeDto>> ListAsync()
        {
            var result = await _uow.FeeRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<FeeDto> fees = _mapper.Map<List<FeeDto>>(result);
            return fees;
        }
    }
}
