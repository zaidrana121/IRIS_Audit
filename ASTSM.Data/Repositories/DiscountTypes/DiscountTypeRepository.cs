using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.DiscountTypes
{
    public class DiscountTypeRepository : BaseRepository<DiscountType>, IDiscountTypeRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public DiscountTypeRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }
    }
}
