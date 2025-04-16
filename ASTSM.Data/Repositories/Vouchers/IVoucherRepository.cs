using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.Dtos.Students;
using ASTSM.Model.Dtos.Vouchers;

namespace ASTSM.Data.Repositories.Vouchers
{
    public interface IVoucherRepository : IBaseRepository<Voucher>
    {
        Task<VoucherDto> GenerateVouchersAsync();
        Task<VoucherDashboardStatsDto> GetVoucheDashboardStats();
    }
}
