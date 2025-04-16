namespace ASTSM.Model.Dtos.Login
{
    public class LoginResponseDto
    {
        public LoginResponseDto() 
        {
            Privileges = new();
        }
        public int RoleId { get; set; }
        public int UserId { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public string Username { get; set; }
        public string PrivilegeCodes { get; set; }
        public List<string> Privileges { get; set; }

    }
}
