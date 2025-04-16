using System.ComponentModel.DataAnnotations;
namespace ASTSM.Model.Dtos.Fees
{
    public class FeeDto : BaseDtoModel
    {
        public FeeDto()
        {
            FeeDetails = new();
        }
        [Display(Name = "Total Amount")]
        [Range(0, double.MaxValue, ErrorMessage = "Amount must be a non-negative value.")]
        public decimal TotalAmount { get; set; }
        public List<FeeDetailDto> FeeDetails { get; set; }
    }

}
