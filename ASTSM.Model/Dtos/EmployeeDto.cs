using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ASTSM.Model.Dtos;

public class EmployeeDto : BaseDtoModel
{
    [Display(Name = "Code")]
    [Required(ErrorMessage = "Code is required.")]
    [StringLength(100, ErrorMessage = "Code cannot exceed 100 characters.")]
    public string Code { get; set; }

    [Display(Name = "Name")]
    [Required(ErrorMessage = "Name is required.")]
    [StringLength(200, ErrorMessage = "Name cannot exceed 200 characters.")]
    public string Name { get; set; }

    [Display(Name = "Designation ID")]
    public int? DesignationId { get; set; }

    [Display(Name = "Phone Number")]
    [StringLength(15, ErrorMessage = "Phone number cannot exceed 15 characters.")]
    public string? PhoneNo { get; set; }

    [Display(Name = "Address")]
    [StringLength(700, ErrorMessage = "Address cannot exceed 700 characters.")]
    public string? Address { get; set; }

    [Display(Name = "National ID Number")]
    [StringLength(30, ErrorMessage = "National ID number cannot exceed 30 characters.")]
    public string? NationalIdNumber { get; set; }

    [Display(Name = "Email")]
    [Required(ErrorMessage = "Email is required.")]
    [EmailAddress(ErrorMessage = "Invalid email address.")]
    [StringLength(100, ErrorMessage = "Code cannot exceed 100 characters.")]
    public string Email { get; set; }

    [Display(Name = "Joining Date")]
    [Required(ErrorMessage = "Joining Date is required.")]
    public DateTime JoiningDate { get; set; }

    [Display(Name = "Leaving Date")]
    public DateTime? LeavingDate { get; set; }

    [Display(Name = "Termination Date")]
    public DateTime? TerminationDate { get; set; }

    [Display(Name = "Is Active")]
    public bool? IsActive { get; set; }

}
