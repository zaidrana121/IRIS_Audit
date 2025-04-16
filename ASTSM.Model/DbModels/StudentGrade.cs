using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class StudentGrade : BaseModel
{
    public int? StudentId { get; set; }

    public int? GradeId { get; set; }

    public int? LastGradeId { get; set; }

    public bool? IsCurrent { get; set; }

    public bool? IsActive { get; set; }

    public virtual Grade? Grade { get; set; }

    public virtual Student? Student { get; set; }
}
