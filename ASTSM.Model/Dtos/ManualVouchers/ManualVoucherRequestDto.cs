using ASTSM.Model.Dtos.Fees;
using ASTSM.Model.Dtos.Students;
using System.ComponentModel.DataAnnotations;

namespace ASTSM.Model.Dtos.ManualVouchers
{
	public class ManualVoucherRequestDto
	{
		public ManualVoucherRequestDto()
		{

		}
		public int GradeId { get; set; }
		public string GradeTitle { get; set; }

		public List<StudentSelectDto> StudentDetails { get; set; }

		public DateTime DueDate { get; set; }
		public DateTime VoucherDate { get; set; }

		public FeeDto Fee { get; set; }
	}

	

}
