using System.ComponentModel.DataAnnotations;

namespace ASTSM.Model.Dtos;

public class DiscountTypeDto : BaseDtoModel
{
    [Display(Name = "Title")]
    [Required(ErrorMessage = "Title is required.")]
    [StringLength(100, ErrorMessage = "Title cannot exceed 100 characters.")]
    public string Title { get; set; }

    [Display(Name = "Description")]
    [StringLength(500, ErrorMessage = "Description cannot exceed 500 characters.")]
    public string? Description { get; set; }

    [Display(Name = "Is Active")]
    public bool? IsActive { get; set; }

}
