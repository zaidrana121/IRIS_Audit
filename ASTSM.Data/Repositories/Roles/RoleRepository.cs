using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.Roles
{
    public class RoleRepository : BaseRepository<Role>, IRoleRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public RoleRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }
    }
}
