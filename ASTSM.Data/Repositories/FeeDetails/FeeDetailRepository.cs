using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.FeeDetails
{
    public class FeeDetailRepository : BaseRepository<FeeDetail>, IFeeDetailRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public FeeDetailRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }
    }
}
