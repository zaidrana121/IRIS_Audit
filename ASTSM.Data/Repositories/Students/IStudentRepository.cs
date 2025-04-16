using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Grades;
using ASTSM.Model.Dtos.Students;

namespace ASTSM.Data.Repositories.Students
{
    public interface IStudentRepository : IBaseRepository<Student>
    {
        Task<List<StudentDetailDto>> GetStudentDetailsByIdAsync(int id);

        List<StudentGradeResult> GetStudentVoucherResults(StudentVoucherByGradeRequestDto studentGrade);
        Task<List<Student>> GetStudentDetailsByGradeIdAsync(int gradeId);


    }
}
