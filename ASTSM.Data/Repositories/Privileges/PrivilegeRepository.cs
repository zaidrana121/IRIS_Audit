using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.Privileges
{
    public class PrivilegeRepository : BaseRepository<Privilege>, IPrivilegeRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public PrivilegeRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }
    }
}
