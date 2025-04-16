using ASTSM.Data.Context;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using Microsoft.EntityFrameworkCore;

namespace ASTSM.Data.Repositories.RolePrivileges
{
    public class RolePrivilegeRepository : BaseRepository<RolePrivilege>, IRolePrivilegeRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public RolePrivilegeRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }

        public Task<List<RolePrivilegeRequestDto>> GetPrivilegeByRoleId(int roleId)
        {
            bool roleIdExists = _dbContext.RolePrivileges.Any(r => r.RoleId == roleId);

            if (roleIdExists)
            {
                var result = from p in _dbContext.Privileges
                             join rp in _dbContext.RolePrivileges
                             on new { PrivilegeId = p.Id, RoleId = roleId } equals new { PrivilegeId = rp.PrivilegeId, RoleId = rp.RoleId }
                             into joined
                             from rp in joined.DefaultIfEmpty()
                             where p.IsActive == true
                             select new RolePrivilegeRequestDto
                             {
                                 RoleId = roleId,
                                 PrivilegeId = p.Id,
                                 PrivilegeName = p.Name,
                                 IsSelected = rp != null
                             };

                return result.ToListAsync();
            }
            else
            {
                var allPrivileges = from p in _dbContext.Privileges
                                    select new RolePrivilegeRequestDto
                                    {
                                        RoleId = roleId, // Set the roleId to the provided roleId
                                        PrivilegeId = p.Id,
                                        PrivilegeName = p.Name,
                                        IsSelected = false
                                    };

                return allPrivileges.ToListAsync();
            }
        }

        public Task<List<RolePrivilege>> GetRolePrivilegeByRoleId(int roleId)
        {
            return _dbContext.RolePrivileges.Where(r => r.RoleId == roleId).ToListAsync();

        }
    }
}
