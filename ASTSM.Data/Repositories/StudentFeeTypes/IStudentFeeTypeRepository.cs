using ASTSM.Model.DbModels;
namespace ASTSM.Data.Repositories.StudentDiscountDetails
{
	public interface IStudentFeeTypeRepository : IBaseRepository<StudentFeeType>
	{
        Task<List<StudentFeeType>> GetAllbyStudentId(int studentId);

    }
}
