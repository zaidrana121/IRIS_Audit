using ASTSM.Model.Dtos.Fees;

namespace ASTSM.Service.Fees
{
    public interface IFeeService
    {
        Task<bool> AddAsync(FeeDto feeRequest);
        Task<bool> UpdateAsync(FeeDto feeRequest);
        Task<FeeDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<FeeDto>> ListAsync();
    }
}
