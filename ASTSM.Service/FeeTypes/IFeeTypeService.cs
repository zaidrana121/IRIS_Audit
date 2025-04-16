using ASTSM.Model.Dtos;

namespace ASTSM.Service.FeeTypes
{
    public interface IFeeTypeService
    {
        Task<bool> AddAsync(FeeTypeDto feeTypeRequest);
        Task<bool> UpdateAsync(FeeTypeDto feeTypeRequest);
        Task<FeeTypeDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<FeeTypeDto>> ListAsync();

        Task<List<ShortListDto>> ShortList();
    }
}
