using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class Grade : BaseModel
{
    public string Code { get; set; }

    public string Title { get; set; }

    public int? FeeId { get; set; }

    public bool? IsActive { get; set; }

    public virtual Fee Fee { get; set; }

    public virtual ICollection<StudentGrade> StudentGrades { get; set; } = new List<StudentGrade>();
}
