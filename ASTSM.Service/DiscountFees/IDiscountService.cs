using ASTSM.Model.Dtos;

namespace ASTSM.Service.DiscountFees
{
    public interface IDiscountService
    {
        Task<bool> AddAsync(DiscountDto discountFeeRequest);
        Task<bool> UpdateAsync(DiscountDto discountFeeRequest);
        Task<DiscountDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<DiscountDto>> ListAsync();
    }
}
