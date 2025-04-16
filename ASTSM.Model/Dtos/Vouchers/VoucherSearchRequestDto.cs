namespace ASTSM.Model.Dtos
{
    public class VoucherSearchRequestDto
    {
        public VoucherSearchRequestDto()
        {
        }

        public string VoucherNo { get; set; }
        public int GradeId { get; set; }
        public int StudentId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string Status { get; set; }
    }
}
