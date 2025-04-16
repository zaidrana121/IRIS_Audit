using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.FeeTypes
{
    public class FeeTypeRepository : BaseRepository<FeeType>, IFeeTypeRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public FeeTypeRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }
    }
}
