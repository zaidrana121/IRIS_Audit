using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.Vouchers
{
    public class VouchersDetailRepository : BaseRepository<VoucherDetail> , IVoucherDetailRepository
	{
        private readonly ASTSMDbContext _dbContext;

        public VouchersDetailRepository(ASTSMDbContext dbContext) : base(dbContext) 
        {
            _dbContext = dbContext;
        }

    }
}

