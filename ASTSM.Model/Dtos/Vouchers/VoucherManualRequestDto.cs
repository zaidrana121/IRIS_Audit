using ASTSM.Model.Dtos.Fees;
using System.ComponentModel.DataAnnotations;

namespace ASTSM.Model.Dtos.Grades
{
    public class VoucherManualRequestDto
    {
        public VoucherManualRequestDto()
        {
            Fee = new();
        }
        public int GradeId { get; set; }
        public int StudentId { get; set; }
        public DateTime VoucherDate { get; set; }
        public DateTime DueDate { get; set; }
        public FeeDto Fee { get; set; }

    }
}
