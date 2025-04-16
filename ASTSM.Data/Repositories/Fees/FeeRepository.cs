using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.Fees
{
    public class FeeRepository : BaseRepository<Fee>, IFeeRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public FeeRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }
    }
}
