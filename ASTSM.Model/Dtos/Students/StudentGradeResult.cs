
namespace ASTSM.Model.Dtos.Students
{
	public class StudentGradeResult
	{
		public int StudentId { get; set; }
		public string StudentName { get; set; }
        public int VoucherId { get; set; }
        public bool AlreadyHasVoucher { get; set; }
    }
	public class StudentVoucherByGradeRequestDto
	{
		public int GradeId { get; set; }
		public int? Month { get; set;}
		public int? Year { get; set;}
	}
}
