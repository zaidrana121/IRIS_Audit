using ASTSM.Model.Dtos;

namespace ASTSM.Service.Privileges
{
    public interface IPrivilegeService
    {
        Task<bool> AddAsync(PrivilegeDto privilegeRequest);
        Task<bool> UpdateAsync(PrivilegeDto privilegeRequest);
        Task<PrivilegeDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<PrivilegeDto>> ListAsync();
    }
}
