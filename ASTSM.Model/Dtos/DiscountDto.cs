using System.ComponentModel.DataAnnotations;

namespace ASTSM.Model.Dtos;
public class DiscountDto : BaseDtoModel
{
    [Display(Name = "Amount")]
    [Required(ErrorMessage = "Amount is required.")]
    public decimal Amount { get; set; }
    public string Reason { get; set; }

    [Display(Name = "Discount Type")]
    [Required(ErrorMessage = "Discount Type is required.")]
    public int DiscountTypeId { get; set; }
}