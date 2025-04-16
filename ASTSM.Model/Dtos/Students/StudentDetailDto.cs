using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASTSM.Model.Dtos.Students
{
    public class StudentDetailDto
    {
        public int StudentId { get; set; }
        public string Rollno { get; set; }
        public string Name { get; set; }
        public bool IsStudentDiscount { get; set; }
        public bool IsActive { get; set; }
        public int DiscountId { get; set; }
        public int GradeId  { get; set; }
        public int FeeTypeId { get; set; }
        public int DiscountTypeId { get; set; }
        public decimal DiscountAmount { get; set; }
        public decimal Amount { get; set; }
    }
}
