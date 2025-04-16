using ASTSM.Model.Dtos.Login;
using ASTSM.Model.Dtos.Users;

namespace ASTSM.Service.Users
{
    public interface IUserService
    {
        Task<LoginResponseDto?> Login(LoginDto loginRequest);
        Task<bool> AddAsync(UserDto userRequest);
        Task<bool> UpdateAsync(UserDto userRequest);
        Task<bool> DeleteAsync(int id);
        Task<UserDto> GetByIdAsync(int id);
        Task<List<UserResponseDto>> ListAsync();
        Task<bool> SetPasswordAsync(SetPasswordDto setPasswordRequest);
    }
}
