using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Login;
using ASTSM.Model.Dtos.Users;
using ASTSM.Model.IdentityModel;
using ASTSM.Utlis.Helpers;
using AutoMapper;

namespace ASTSM.Service.Users
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public UserService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<LoginResponseDto?> Login(LoginDto loginRequest)
        {
            string encryptedPassword = Encryption.Encrypt(loginRequest.Password);
            LoginResponseDto? loginResponse = new();
            loginResponse = await _uow.UserRepository.GetUserDetailsByCredentials(loginRequest.Username, encryptedPassword);
            if (loginResponse != null)
            {
                if (!string.IsNullOrEmpty(loginResponse.PrivilegeCodes))
                    loginResponse.Privileges = loginResponse.PrivilegeCodes.Split(',').ToList();
            }

            return loginResponse;
        }



        public async Task<bool> AddAsync(UserDto userRequest)
        {
            string encryptedPassword = Encryption.Encrypt(userRequest.Password);
            try
            {
                if (userRequest != null)
                {
                    User user = _mapper.Map<User>(userRequest);
                    user.Password = encryptedPassword;
                    user.IsDeleted = false;
                    user.CreatedBy = _loggedInUser.Id;
                    user.CreatedOn = DateTime.Now;
                    await _uow.UserRepository.AddAsync(user);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(UserDto userRequest)
        {
            string encryptedPassword = Encryption.Encrypt(userRequest.Password);
            bool isUpdated = false;
            try
            {
                if (userRequest != null && userRequest.Id > 0)
                {
                    User userFromDb = await _uow.UserRepository.GetByIdAsync(userRequest.Id);

                    if (userFromDb != null && userFromDb.Id > 0)
                    {
                        userFromDb.IsActive = userRequest.IsActive;
                        userFromDb.LoginName = userRequest.LoginName;
                        userFromDb.Password = encryptedPassword;
                        userFromDb.RoleId = userRequest.RoleId;
                        userFromDb.EmployeeId = userRequest.EmployeeId;
                        userFromDb.UpdatedBy = _loggedInUser.Id;
                        userFromDb.UpdatedOn = DateTime.Now;
                        await _uow.UserRepository.UpdateAsync(userFromDb);
                        isUpdated = true;
                    }
                }
                else
                    isUpdated = false;
            }
            catch (Exception ex)
            {
                throw;
            }
            return isUpdated;
        }

        public async Task<bool> SetPasswordAsync(SetPasswordDto setPasswordRequest)
        {
            string encryptPassword = Encryption.Encrypt(setPasswordRequest.Password);
            bool isUpdated = false;
            try
            {
                if (setPasswordRequest != null && setPasswordRequest.UserId > 0)
                {
                    User userFromDb = await _uow.UserRepository.GetByIdAsync(setPasswordRequest.UserId);

                    if (userFromDb != null && userFromDb.Id > 0)
                    {
                        userFromDb.Password = encryptPassword;
                        userFromDb.UpdatedBy = _loggedInUser.Id;
                        userFromDb.UpdatedOn = DateTime.Now;
                        await _uow.UserRepository.UpdateAsync(userFromDb);
                        isUpdated = true;
                    }
                }
                else
                    isUpdated = false;
            }
            catch (Exception ex)
            {
                throw;
            }
            return isUpdated;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            bool isDeleted = false;
            try
            {
                User userFromDb = await _uow.UserRepository.GetByIdAsync(id);
                if (userFromDb != null)
                {
                    await _uow.UserRepository.DeleteAsync(id,_loggedInUser.Id);
                    isDeleted = true;
                }
                else
                    isDeleted = false;
            }
            catch (Exception ex)
            {
                throw;
            }
            return isDeleted;
        }

        public async Task<UserDto> GetByIdAsync(int id)
        {
            User userFromDb = await _uow.UserRepository.GetByIdAsync(id);
            UserDto userDto = _mapper.Map<UserDto>(userFromDb);

            string decryptPassword = Encryption.Decrypt(userDto.Password);
            userDto.Password = decryptPassword;
            return userDto;
        }

        public async Task<List<UserResponseDto>> ListAsync()
        {
            return await _uow.UserRepository.GetAllAsync();
        }
    }
}
