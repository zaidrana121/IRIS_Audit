namespace ASTSM.Model.Dtos.Fees
{
    public class FeeDetailDto
    {
        public FeeDetailDto()
        {
            Discount = new();
        }
        public int Id { get; set; }

        public int FeeTypeId { get; set; }

        public decimal Amount { get; set; }

        public int FeeId { get; set; }

        public int DiscountId { get; set; }

		public int CreatedBy { get; set; }

		public DateTime CreatedOn { get; set; }

		public int? UpdatedBy { get; set; }

		public DateTime? UpdatedOn { get; set; }

		public DiscountDto Discount { get; set; }
    }


}
