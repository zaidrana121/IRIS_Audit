using ASTSM.Data.Context;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.Dtos.Students;
using ASTSM.Model.Dtos.Vouchers;
using ASTSM.Utlis.Enums;
using Dapper;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Linq;
using System.Linq.Expressions;

namespace ASTSM.Data.Repositories.Vouchers
{
	public class VoucherRepository : BaseRepository<Voucher>, IVoucherRepository
	{
		private readonly IDbConnection _dbConnection;
		private readonly ASTSMDbContext _dbContext;

		public VoucherRepository(IDbConnection dbConnection, ASTSMDbContext dbContext) : base(dbContext)
		{
			_dbConnection = dbConnection;
			_dbContext = dbContext;
		}

		//TODO
		public override async Task<List<Voucher>> GetAllAsync(Expression<Func<Voucher, bool>> filter = null)
		{
			return await _dbContext.Vouchers.Include(u => u.VoucherDetails).Where(filter).ToListAsync();
		}

		public async Task<VoucherDto> GenerateVouchersAsync()
		{
			var result = await _dbConnection.QueryMultipleAsync("SP_GenerateVouchers", commandType: CommandType.StoredProcedure);
			var voucher = await result.ReadSingleAsync<VoucherDto>();
			voucher.VoucherDetails = (await result.ReadAsync<VoucherDetailDto>()).ToList();

			return voucher;
		}

		public async Task<decimal> GetTotalById(int voucherId)
		{
			return new();

		}

		public async Task<VoucherDashboardStatsDto> GetVoucheDashboardStats()
		{
			try
			{
				VoucherDashboardStatsDto voucherDashboardStats = new();
				var parameters = new { };
				var results = await _dbConnection.QueryMultipleAsync(StoredProcedureEnum.SP_VoucherDashboard,
			parameters,
			commandType: CommandType.StoredProcedure);
				voucherDashboardStats.MonthlySummary = await results.ReadSingleAsync<MonthlySummaryDto>();
				voucherDashboardStats.YearlySummary = await results.ReadSingleAsync<YearlySummaryDto>();
				voucherDashboardStats.MonthlyDetails = (await results.ReadAsync<MonthlyDetailsDto>()).ToList();


				return voucherDashboardStats;
			}
			catch (Exception ex)
			{
				throw;
			}
		}
	}
}

