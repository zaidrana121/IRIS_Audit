using ASTSM.Model.Dtos;
using ASTSM.Model.IdentityModel;

namespace ASTSM.Service.Roles
{
    public interface IRoleService
    {
        Task<bool> AddAsync(RoleDto roleRequest);
        Task<bool> UpdateAsync(RoleDto roleRequest);
        Task<RoleDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<RoleDto>> ListAsync();
        Task<List<ShortListDto>> ShortList();
    }
}
