using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;

namespace ASTSM.Data.Repositories.RolePrivileges
{
    public interface IRolePrivilegeRepository : IBaseRepository<RolePrivilege>
    {
        Task<List<RolePrivilegeRequestDto>> GetPrivilegeByRoleId(int roleId);

        Task<List<RolePrivilege>> GetRolePrivilegeByRoleId(int roleId);
    }
}
