using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ASTSM.Model.Dtos;

public class PrivilegeDto : BaseDtoModel
{
    [Display(Name = "Code")]
    [StringLength(100, ErrorMessage = "Code cannot exceed 100 characters.")]
    public string? Code { get; set; }

    [Display(Name = "Name")]
    [Required(ErrorMessage = "Name is required.")]
    [StringLength(200, ErrorMessage = "Name cannot exceed 200 characters.")]
    public string Name { get; set; }

    [Display(Name = "Is Active")]
    public bool? IsActive { get; set; }

}

