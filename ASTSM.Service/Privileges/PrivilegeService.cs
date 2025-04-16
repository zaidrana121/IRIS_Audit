using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.Privileges
{
    public class PrivilegeService : IPrivilegeService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public PrivilegeService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(PrivilegeDto privilegeRequest)
        {
            try
            {
                if (privilegeRequest != null)
                {
                    Privilege privilege = _mapper.Map<Privilege>(privilegeRequest);
                    privilege.CreatedBy = _loggedInUser.Id;
                    privilege.CreatedOn = DateTime.Now;
                    await _uow.PrivilegeRepository.AddAsync(privilege);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(PrivilegeDto privilegeRequest)
        {
            bool isUpdated = false;
            try
            {
                if (privilegeRequest != null && privilegeRequest.Id > 0)
                {
                    Privilege privilegeFromDb = await _uow.PrivilegeRepository.GetByIdAsync(privilegeRequest.Id);

                    if (privilegeFromDb != null && privilegeFromDb.Id > 0)
                    {
                        privilegeFromDb.Name = privilegeRequest.Name;
                        privilegeFromDb.Code = privilegeRequest.Code;
                        privilegeFromDb.IsActive = privilegeRequest.IsActive;
                        privilegeFromDb.UpdatedBy = _loggedInUser.Id;
                        privilegeFromDb.UpdatedOn = DateTime.Now;
                        await _uow.PrivilegeRepository.UpdateAsync(privilegeFromDb);
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
                Privilege privilegeFromDb = await _uow.PrivilegeRepository.GetByIdAsync(id);
                if (privilegeFromDb != null)
                {
                    await _uow.PrivilegeRepository.DeleteAsync(id, _loggedInUser.Id);
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

        public async Task<PrivilegeDto> GetByIdAsync(int id)
        {
            Privilege privilegeFromDb = await _uow.PrivilegeRepository.GetByIdAsync(id);
            PrivilegeDto privilegeDto = _mapper.Map<PrivilegeDto>(privilegeFromDb);
            return privilegeDto;
        }

        public async Task<List<PrivilegeDto>> ListAsync()
        {
            var result = await _uow.PrivilegeRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<PrivilegeDto> privileges = _mapper.Map<List<PrivilegeDto>>(result);
            return privileges;
        }
    }
}
