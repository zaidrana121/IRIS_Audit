using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class User : BaseModel
{
    public string LoginName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int? EmployeeId { get; set; }

    public int RoleId { get; set; }

    public bool? IsActive { get; set; }

    public virtual Employee? Employee { get; set; }

    public virtual Role Role { get; set; } = null!;
}
