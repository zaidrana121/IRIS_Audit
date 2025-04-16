namespace ASTSM.Model.Dtos.Vouchers
{
    public class VoucherGenerateDto
    {
        public VoucherGenerateDto()
        {
            StudentIds = new();
        }
        public int GradeId { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public List<int> StudentIds { get; set; }
        public DateTime DueDate { get; set; }
    }


}
