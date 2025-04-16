using ASTSM.Data.Context;
using ASTSM.Model.DbModels;
using System.Linq.Expressions;

namespace ASTSM.Data.Repositories.Projects
{
    public class ProjectsRepository : BaseRepository<AstsProjects>, IProjectsRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public ProjectsRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }

        
    }
}
