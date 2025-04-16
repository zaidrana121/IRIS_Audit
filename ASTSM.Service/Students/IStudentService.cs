using ASTSM.Model.Dtos.Students;

namespace ASTSM.Service.Students
{
    public interface IStudentService
    {
        Task<bool> SaveAsync(StudentRequestDto studentRequest);
        Task<StudentRequestDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
        Task<List<StudentDto>> ListAsync();
        List<StudentGradeResult> GetStudentVoucherResults(StudentVoucherByGradeRequestDto studentGrade);
        Task<List<StudentDto>> GetByGrade(int gradeId);
    }
}
