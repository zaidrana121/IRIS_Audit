using ASTSM.Data.Context;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Grades;
using Microsoft.EntityFrameworkCore;

namespace ASTSM.Data.Repositories.Grades
{
    public class GradeRepository : BaseRepository<Grade>, IGradeRepository
    {
        private readonly ASTSMDbContext _dbContext;

        public GradeRepository(ASTSMDbContext astsmDbContext) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
        }

        public async Task<List<GradeDetailDto>> GetGradeDetailsByIdAsync(int id)
        {
            var query = from g in _dbContext.Grades
                        join f in _dbContext.Fees on g.FeeId equals f.Id into feeGroup
                        from fee in feeGroup.DefaultIfEmpty()
                        join fd in _dbContext.FeeDetails on fee.Id equals fd.FeeId into feeDetailsGroup
                        from feeDetail in feeDetailsGroup.DefaultIfEmpty()
                        join d in _dbContext.Discounts on feeDetail.DiscountId equals d.Id into discountGroup
                        from discount in discountGroup.DefaultIfEmpty()
                        where g.Id == id
                        select new GradeDetailDto
                        {
                            GradeId = g.Id,
                            GradeCode = g.Code,
                            GradeTitle = g.Title,
                            IsActive = (bool)g.IsActive,
                            FeeId = g.FeeId,
                            FeeTotalAmount = fee != null ? fee.TotalAmount : 0,
                            Amount = feeDetail != null ? feeDetail.Amount : 0,
                            DiscountId = feeDetail != null ? feeDetail.DiscountId : 0,
                            FeeTypeId = feeDetail != null ? feeDetail.FeeTypeId : 0,
                            DiscountTypeId = discount != null ? discount.DiscountTypeId : 0,
                            DiscountAmount = discount != null ? discount.Amount : 0,
                            DiscountReason = discount != null ? discount.Reason : "",
                        };
            return await query.ToListAsync();

        }
    }
}
