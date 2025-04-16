using ASTSM.Model.Dtos;

namespace ASTSM.Service.RolePrivileges
{
    public interface IRolePrivilegeService
    {
        Task<bool> AddAsync(List<RolePrivilegeRequestDto> rolePrivilegeRequest);
        Task<List<RolePrivilegeRequestDto>> GetPrivilegeByRoleId(int roleId);
    }
}
