using ASTSM.Model.Dtos.Fees;
using System.ComponentModel.DataAnnotations;

namespace ASTSM.Model.Dtos.Grades
{
    public class GradeRequestDto
    {
        public GradeRequestDto()
        {
            Fee = new();
        }
        public int Id { get; set; }

        [Display(Name = "Code")]
        [StringLength(100, ErrorMessage = "Code cannot exceed 100 characters.")]
        public string Code { get; set; }

        [Display(Name = "Title")]
        [StringLength(100, ErrorMessage = "Title cannot exceed 100 characters.")]
        public string Title { get; set; }

        public bool IsActive { get; set; }

        public int FeeId { get; set; }

        public FeeDto Fee { get; set; }

    }


}
