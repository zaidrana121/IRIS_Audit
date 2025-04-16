using ASTSM.Model.Dtos;
using ASTSM.Model.Dtos.Grades;

namespace ASTSM.Service.Grades
{
    public interface IGradeService
    {
        Task<bool> SaveGradeAsync(GradeRequestDto gradeRequest);
        Task<GradeRequestDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<GradeDto>> ListAsync();
        Task<List<ShortListDto>> ShortList();
    }
}
