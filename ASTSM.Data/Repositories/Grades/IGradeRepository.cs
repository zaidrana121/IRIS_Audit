using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Grades;

namespace ASTSM.Data.Repositories.Grades
{
    public interface IGradeRepository : IBaseRepository<Grade>
    {
        Task<List<GradeDetailDto>> GetGradeDetailsByIdAsync(int id);
    }
}
