using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class Student : BaseModel
{
    public string? Rollno { get; set; }

    public string? Name { get; set; }

	public bool IsStudentDiscount { get; set; }

	public bool? IsActive { get; set; }

	public virtual ICollection<StudentDiscountDetail> StudentDiscountDetails { get; set; } = new List<StudentDiscountDetail>();

	public virtual ICollection<StudentGrade> StudentGrades { get; set; } = new List<StudentGrade>();

}
