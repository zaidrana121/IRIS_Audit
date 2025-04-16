namespace ASTSM.Model.Dtos.Grades
{
    public class GradeDetailDto
    {
        public int GradeId { get; set; }
        public string GradeCode { get; set; }
        public string GradeTitle { get; set; }
        public bool IsActive { get; set; }
        public int? FeeId { get; set; }
        public decimal FeeTotalAmount { get; set; }
        public decimal Amount { get; set; }
        public int DiscountId { get; set; }
        public int FeeTypeId { get; set; }
        public int DiscountTypeId { get; set; }
        public decimal DiscountAmount { get; set; }
        public string DiscountReason { get; set; }
    }
}
