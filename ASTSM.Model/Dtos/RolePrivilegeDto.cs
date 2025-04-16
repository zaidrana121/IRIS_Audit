using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ASTSM.Model.Dtos;

public class RolePrivilegeDto : BaseDtoModel
{
    public int RoleId { get; set; }

    public int PrivilegeId { get; set; }

}


public class RolePrivilegeRequestDto
{
    [Display(Name = "Role ID")]
    [Required(ErrorMessage = "Role ID is required.")]
    public int RoleId { get; set; }

    [Display(Name = "Privilege ID")]
    [Required(ErrorMessage = "Privilege ID is required.")]
    public int PrivilegeId { get; set; }

    [Display(Name = "Privilege Name")]
    [Required(ErrorMessage = "Privilege Name is required.")]
    [StringLength(200, ErrorMessage = "Privilege Name cannot exceed 200 characters.")]
    public string PrivilegeName { get; set; }

    [Display(Name = "Is Selected")]
    public bool IsSelected { get; set; }
}