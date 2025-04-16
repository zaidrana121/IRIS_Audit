using System.ComponentModel.DataAnnotations;
namespace ASTSM.Model.Dtos.Grades
{
    public class GradeDto : BaseDtoModel
    {
        [Display(Name = "Code")]
        [StringLength(100, ErrorMessage = "Code cannot exceed 100 characters.")]
        public string? Code { get; set; }

        [Display(Name = "Title")]
        [StringLength(100, ErrorMessage = "Title cannot exceed 100 characters.")]
        public string? Title { get; set; }

        [Display(Name = "Is Active")]
        public bool? IsActive { get; set; }

    }
}

