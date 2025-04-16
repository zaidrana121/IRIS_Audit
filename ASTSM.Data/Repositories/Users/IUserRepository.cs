using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Login;
using ASTSM.Model.Dtos.Users;

namespace ASTSM.Data.Repositories.Users
{
    public interface IUserRepository : IBaseRepository<User>
    {
        Task<List<UserResponseDto>> GetAllAsync();

        Task<LoginResponseDto?> GetUserDetailsByCredentials(string username, string password);
    }
}
