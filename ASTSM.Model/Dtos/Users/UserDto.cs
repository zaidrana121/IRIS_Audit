using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ASTSM.Model.Dtos.Users;

public class UserDto : BaseDtoModel
{
    [Display(Name = "Login Name")]
    [Required(ErrorMessage = "Login Name is required.")]
    public string LoginName { get; set; } = null!;

    [Display(Name = "Password")]
    [Required(ErrorMessage = "Password is required.")]
    public string Password { get; set; } = null!;

    [Display(Name = "Employee ID")]
    public int? EmployeeId { get; set; }

    [Display(Name = "Role ID")]
    [Required(ErrorMessage = "Role ID is required.")]
    public int RoleId { get; set; }

    [Display(Name = "Is Active")]
    public bool? IsActive { get; set; }
}
