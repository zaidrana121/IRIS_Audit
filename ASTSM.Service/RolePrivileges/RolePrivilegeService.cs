using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.RolePrivileges
{
    public class RolePrivilegeService : IRolePrivilegeService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public RolePrivilegeService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(List<RolePrivilegeRequestDto> rolePrivilegeRequest)
        {
            try
            {
                if (rolePrivilegeRequest != null && rolePrivilegeRequest.Count > 0)
                {
                    var rolePrivileges = await _uow.RolePrivilegeRepository.GetRolePrivilegeByRoleId(rolePrivilegeRequest.First().RoleId);
                    if (rolePrivileges != null && rolePrivileges.Count > 0)
                        _uow.RolePrivilegeRepository.HardDeleteRange(rolePrivileges);
                    List<RolePrivilege> rolePrivilegeEntities = _mapper.Map<List<RolePrivilege>>(rolePrivilegeRequest);
                    rolePrivilegeEntities.ForEach(rp => rp.CreatedBy = _loggedInUser.Id);

                    await _uow.RolePrivilegeRepository.AddRangeAsync(rolePrivilegeEntities);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<List<RolePrivilegeRequestDto>> GetPrivilegeByRoleId(int roleId)
        {
            return await _uow.RolePrivilegeRepository.GetPrivilegeByRoleId(roleId);
        }
    }
}
