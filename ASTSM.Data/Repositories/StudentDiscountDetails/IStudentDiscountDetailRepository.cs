using ASTSM.Model.DbModels;
namespace ASTSM.Data.Repositories.StudentDiscountDetails
{
	public interface IStudentDiscountDetailRepository : IBaseRepository<StudentDiscountDetail>
	{
        Task<StudentDiscountDetail> GetStudentDiscountId(int studentId, int feesTypeId);

    }
}
