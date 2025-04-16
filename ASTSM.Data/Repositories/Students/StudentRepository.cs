using ASTSM.Data.Context;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Login;
using ASTSM.Model.Dtos.Students;
using ASTSM.Utlis.Enums;
using Dapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Data;

namespace ASTSM.Data.Repositories.Students
{
    public class StudentRepository : BaseRepository<Student>, IStudentRepository
    {
        private readonly ASTSMDbContext _dbContext;
        private readonly IDbConnection _dbConnection;

        public StudentRepository(ASTSMDbContext astsmDbContext, IDbConnection dbConnection) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
            _dbConnection = dbConnection;
        }

        public async Task<List<StudentDetailDto>> GetStudentDetailsByIdAsync(int id)
        {
            var query = from s in _dbContext.Students
                        join sg in _dbContext.StudentGrades on s.Id equals sg.StudentId
                        join sd in _dbContext.StudentDiscountDetails on s.Id equals sd.StudentId into studentDiscounts
                        from sd in studentDiscounts.DefaultIfEmpty()
                        join d in _dbContext.Discounts on sd.DiscountId equals d.Id into discounts
                        from d in discounts.DefaultIfEmpty()
                        where s.Id == id
                        select new StudentDetailDto
                        {
                            StudentId = s.Id,
                            Rollno = s.Rollno,
                            Name = s.Name,
                            IsActive = (bool)s.IsActive,
                            IsStudentDiscount = s.IsStudentDiscount,
                            GradeId = (int)(sg != null ? (int?)sg.GradeId : 0),
                            DiscountId = (int)(sd != null ? (int?)sd.DiscountId : 0),
                            FeeTypeId = sd != null ? sd.FeeTypeId : 0,
                            DiscountTypeId = d != null ? d.DiscountTypeId : 0,
                            DiscountAmount = d != null ? d.Amount : 0,
                            Amount = 0
                        };
            return await query.ToListAsync();
        }

        public List<StudentGradeResult> GetStudentVoucherResults(StudentVoucherByGradeRequestDto studentGrade)
        {
            try
            {
                var parameters = new { GradeId = studentGrade.GradeId, FeeMonth = studentGrade.Month, FeeYear = studentGrade.Year };
                var results = _dbConnection.Query<StudentGradeResult>(StoredProcedureEnum.SP_GetStudentVoucherResults,
            parameters,
            commandType: CommandType.StoredProcedure);


                return results.ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public async Task<List<Student>> GetStudentDetailsByGradeIdAsync(int gradeId)
        {
            var query = from s in _dbContext.Students
                        join sg in _dbContext.StudentGrades on s.Id equals sg.StudentId
                        //join sd in _dbContext.StudentDiscountDetails on s.Id equals sd.StudentId into studentDiscounts
                        //from sd in studentDiscounts.DefaultIfEmpty()
                        //join d in _dbContext.Discounts on sd.DiscountId equals d.Id into discounts
                        //from d in discounts.DefaultIfEmpty()
                        where sg.GradeId == gradeId
                        select s;

            return await query.ToListAsync();
        }

    }
}
