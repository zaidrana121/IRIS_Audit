using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.StudentGrades
{
    public class StudentGradeRepository : BaseRepository<StudentGrade>, IStudentGradeRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public StudentGradeRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }
    }
}
