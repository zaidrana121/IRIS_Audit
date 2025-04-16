namespace ASTSM.Model.Dtos.Students
{
	public class StudentDiscountDetailDto
	{
		public StudentDiscountDetailDto()
		{
			Discount = new();
		}
		public int Id { get; set; }

		public int StudentId { get; set; }

		public int FeeTypeId { get; set; }

		public int? DiscountId { get; set; }

		public DateTime CreatedOn { get; set; }

		public DateTime? UpdatedOn { get; set; }

		public int CreatedBy { get; set; }

		public int? UpdatedBy { get; set; }

		public DiscountDto? Discount { get; set; }

	}
}
