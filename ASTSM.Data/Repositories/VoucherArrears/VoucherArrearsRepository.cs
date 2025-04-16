using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.Vouchers
{
    public class VoucherArrearsRepository : BaseRepository<VoucherArrear> , IVoucherArrearsRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public VoucherArrearsRepository(ASTSMDbContext dbContext) : base(dbContext) 
        {
            _dbContext = dbContext;
        }

    }
}

