using ASTSM.Model.Dtos;
using ASTSM.Model.Dtos.ManualVouchers;
using ASTSM.Model.Dtos.Vouchers;

namespace ASTSM.Service.Vouchers
{
    public interface IVoucherService
    {
        Task<VoucherDto> GenerateVouchersAsync();
        Task<List<int>> GenerateVouchersAsync(VoucherGenerateDto voucherGenerateDto);
        Task<List<VoucherDto>> GetVoucherbyIds(List<int> voucherIds);
        Task<List<VoucherDto>> SearchVouchers(VoucherSearchRequestDto searchRequestDto);
        Task<bool> PayVoucherbyIds(List<int> voucherIds);
        Task<bool> UpdateDueDate(int VoucherId, DateTime dueDate);
        Task<List<int>> ManualVouchersAsync(ManualVoucherRequestDto manualVoucherRequest);
        Task<VoucherDashboardStatsDto> GetVoucheDashboardStats();
        Task<bool> CancelVoucherbyIds(List<int> voucherIds);
    }
}
