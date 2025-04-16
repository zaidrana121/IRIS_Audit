
namespace ASTSM.Model.Dtos.Vouchers
{
	public class VoucherDashboardStatsDto
	{
		public VoucherDashboardStatsDto()
		{
			MonthlySummary = new();
			YearlySummary = new();
			MonthlyDetails = new();
		}
		public MonthlySummaryDto MonthlySummary { get; set; }
		public YearlySummaryDto YearlySummary { get; set; }
		public List<MonthlyDetailsDto> MonthlyDetails { get; set; }
	}
	public class MonthlySummaryDto
	{
		public int MonthlyTotalVouchers { get; set; }
		public int MonthlyPaidVouchers { get; set; }
		public int MonthlyUnpaidVouchers { get; set; }
	}

	public class YearlySummaryDto
	{
		public int YearlyTotalVouchers { get; set; }
		public int YearlyPaidVouchers { get; set; }
		public int YearlyUnpaidVouchers { get; set; }
	}

	public class MonthlyDetailsDto
	{
		public int Month { get; set; }
		public int PaidCount { get; set; }
		public int UnpaidCount { get; set; }
	}
}
