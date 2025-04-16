using System.ComponentModel.DataAnnotations;

namespace ASTSM.Model.Dtos.Students;

public class StudentGradeDto : BaseDtoModel
{
    [Display(Name = "Student ID")]
    public int? StudentId { get; set; }

    [Display(Name = "Grade ID")]
    public int? GradeId { get; set; }

    [Display(Name = "Last Grade ID")]
    public int? LastGradeId { get; set; }

    [Display(Name = "Is Current")]
    public bool? IsCurrent { get; set; }

    [Display(Name = "Is Active")]
    public bool? IsActive { get; set; }
}
