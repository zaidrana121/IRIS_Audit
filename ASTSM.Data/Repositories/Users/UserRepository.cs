using ASTSM.Data.Context;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Login;
using ASTSM.Model.Dtos.Users;
using ASTSM.Utlis.Enums;
using Dapper;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace ASTSM.Data.Repositories.Users
{
    public class UserRepository : BaseRepository<User>, IUserRepository
    {
        private readonly ASTSMDbContext _dbContext;
        private readonly IDbConnection _dbConnection;

        public UserRepository(ASTSMDbContext astsmDbContext, IDbConnection dbConnection) : base(astsmDbContext)
        {
            _dbContext = astsmDbContext;
            _dbConnection = dbConnection;
        }
        
        public async Task<List<UserResponseDto>> GetAllAsync()
        {
            var userInfoList = from u in _dbContext.Users
                               join e in _dbContext.Employees on u.EmployeeId equals e.Id
                               join r in _dbContext.Roles on u.RoleId equals r.Id
                               select new UserResponseDto
                               {
                                   UserId =u.Id,
                                   EmployeeId =e.Id,
                                   RoleId =r.Id,
                                   EmployeeName = e.Name,
                                   EmployeeCode = e.Code,
                                   RoleName = r.Name,
                                   CreatedOn = u.CreatedOn,
                                   IsActive = u.IsActive
                               };

            return await userInfoList.ToListAsync();
        }

        public async Task<LoginResponseDto?> GetUserDetailsByCredentials(string username, string password)
        {
            try
            {
                var parameters = new { Username = username, Password = password };
                var userLoginResult = await _dbConnection.QuerySingleOrDefaultAsync<LoginResponseDto>(
			StoredProcedureEnum.SP_UserLogin,
            parameters,
            commandType: CommandType.StoredProcedure
        );

                return userLoginResult;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
