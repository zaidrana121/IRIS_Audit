using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class FeeType : BaseModel
{
    public string Title { get; set; }
    
    public string? Description { get; set; }

    public bool IsMonthly { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<FeeDetail> FeeDetails { get; set; } = new List<FeeDetail>();
}
