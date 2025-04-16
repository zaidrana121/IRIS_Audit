using System.ComponentModel.DataAnnotations;

namespace ASTSM.Model.Dtos.Students;

public class StudentDto : BaseDtoModel
{
    [Display(Name = "Roll No")]
    [StringLength(200, ErrorMessage = "Roll No cannot exceed 200 characters.")]
    public string? Rollno { get; set; }

    [Display(Name = "Name")]
    [StringLength(200, ErrorMessage = "Name cannot exceed 200 characters.")]
    public string? Name { get; set; }

    public bool IsStudentDiscount { get; set; }

    [Display(Name = "Is Active")]
    public bool? IsActive { get; set; }





}
