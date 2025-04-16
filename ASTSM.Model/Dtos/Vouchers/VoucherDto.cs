namespace ASTSM.Model.Dtos
{
    public  class VoucherDto
    {
        public VoucherDto() 
        {
            VoucherDetails = new();
        }
        public string VoucherNo { get; set; }
        public string VoucherStatus { get; set; }
        public bool IsPaid { get; set; }
        public string StudentName { get; set; }
        public string RollNo { get; set; }
        public string ClassSection { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime IssueDate { get; set; }
        public DateTime FeesMonth { get; set; }
        public DateTime DueDate { get; set; }
        public List<VoucherDetailDto> VoucherDetails { get; set; }
        public bool IsMonthly { get; set; }
    }

    public class VoucherDetailDto 
    {
        public int FeeTypeId { get; set; }
        public string FeeTypeTitle { get; set; }
        public decimal FeeAmount { get; set; }
        public string DiscountType { get; set; }
        public decimal DiscountAmount { get; set; }
        public int DiscountValue { get; set; }
    }
}
