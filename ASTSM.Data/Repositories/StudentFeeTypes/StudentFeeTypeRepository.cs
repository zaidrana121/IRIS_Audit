using ASTSM.Data.Context;
using ASTSM.Model.DbModels;

namespace ASTSM.Data.Repositories.StudentDiscountDetails
{
	public class StudentFeeTypeRepository : BaseRepository<StudentFeeType>, IStudentFeeTypeRepository
	{
		private readonly ASTSMDbContext _dbContext;

		public StudentFeeTypeRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
		{
			_dbContext = astsmDbContext;
		}
		public async Task<List<StudentFeeType>> GetAllbyStudentId(int studentId)
		{
			try
			{
				return _dbContext.StudentFeeTypes.Where(u => u.StudentId == studentId).ToList();
			}
			catch(Exception ex)
			{
				return null;
			}

		}
	}
}
