using ASTSM.Model.Dtos.Students;

namespace ASTSM.Service.StudentGrades
{
    public interface IStudentGradeService
    {
        Task<bool> AddAsync(StudentGradeDto studentGradeRequest);
        Task<bool> UpdateAsync(StudentGradeDto studentGradeRequest);
        Task<StudentGradeDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<StudentGradeDto>> ListAsync();
    }
}
