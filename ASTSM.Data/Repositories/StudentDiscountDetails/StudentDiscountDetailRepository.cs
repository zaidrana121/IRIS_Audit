using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.StudentDiscountDetails
{
	public class StudentDiscountDetailRepository : BaseRepository<StudentDiscountDetail>, IStudentDiscountDetailRepository
	{
		private readonly ASTSMDbContext _dbContext;

		public StudentDiscountDetailRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
		{
			_dbContext = astsmDbContext;
		}
		public async Task<StudentDiscountDetail> GetStudentDiscountId(int studentId,int feesTypeId)
		{
			try
			{
				return _dbContext.StudentDiscountDetails.FirstOrDefault(u => u.StudentId == studentId && u.FeeTypeId == feesTypeId);
			}
			catch(Exception ex) {
				return null; 
			}
		}
	}
}
