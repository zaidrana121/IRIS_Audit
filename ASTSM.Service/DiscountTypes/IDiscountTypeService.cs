using ASTSM.Model.Dtos;

namespace ASTSM.Service.DiscountTypes
{
    public interface IDiscountTypeService
    {
        Task<bool> AddAsync(DiscountTypeDto discountTypeRequest);
        Task<bool> UpdateAsync(DiscountTypeDto discountTypeRequest);
        Task<DiscountTypeDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<DiscountTypeDto>> ListAsync();

        Task<List<ShortListDto>> ShortList();
    }
}
