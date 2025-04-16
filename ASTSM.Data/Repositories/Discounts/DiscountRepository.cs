using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.DiscountFees
{
    public class DiscountRepository : BaseRepository<Discount>, IDiscountRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public DiscountRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }
    }
}
