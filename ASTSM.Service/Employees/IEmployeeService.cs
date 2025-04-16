using ASTSM.Model.Dtos;

namespace ASTSM.Service.Employees
{
    public interface IEmployeeService
    {
        Task<bool> AddAsync(EmployeeDto employeeRequest);
        Task<bool> UpdateAsync(EmployeeDto employeeRequest);
        Task<EmployeeDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<EmployeeDto>> ListAsync();
        Task<List<ShortListDto>> ShortList();

    }
}
