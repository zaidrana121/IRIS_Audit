using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.Roles
{
    public class RoleService : IRoleService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;
        public RoleService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(RoleDto roleRequest)
        {
            try
            {
                if (roleRequest != null)
                {
                    Role role = _mapper.Map<Role>(roleRequest);
                    role.IsDeleted = false;
                    role.CreatedBy = _loggedInUser.Id;
                    role.CreatedOn = DateTime.Now;
                    await _uow.RoleRepository.AddAsync(role);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(RoleDto roleRequest)
        {
            bool isUpdated = false;
            try
            {
                if (roleRequest != null && roleRequest.Id > 0)
                {
                    Role roleFromDb = await _uow.RoleRepository.GetByIdAsync(roleRequest.Id);

                    if (roleFromDb != null && roleFromDb.Id > 0)
                    {
                        roleFromDb.IsActive = roleRequest.IsActive;
                        roleFromDb.Name = roleRequest.Name;
                        roleFromDb.UpdatedBy = _loggedInUser.Id;
                        roleFromDb.UpdatedOn = DateTime.Now;
                        await _uow.RoleRepository.UpdateAsync(roleFromDb);
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
                Role roleFromDb = await _uow.RoleRepository.GetByIdAsync(id);
                if (roleFromDb != null)
                {
                    await _uow.RoleRepository.DeleteAsync(id, _loggedInUser.Id);
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

        public async Task<RoleDto> GetByIdAsync(int id)
        {
            Role roleFromDb = await _uow.RoleRepository.GetByIdAsync(id);
            RoleDto roleDto = _mapper.Map<RoleDto>(roleFromDb);
            return roleDto;
        }

        public async Task<List<RoleDto>> ListAsync()
        {
            var result = await _uow.RoleRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<RoleDto> roles = _mapper.Map<List<RoleDto>>(result);
            return roles;
        }

        public async Task<List<ShortListDto>> ShortList()
        {
            var result = await _uow.RoleRepository.GetAllAsync(entity => ((entity.IsDeleted == null || (Boolean)!entity.IsDeleted) && (Boolean)entity.IsActive));
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
