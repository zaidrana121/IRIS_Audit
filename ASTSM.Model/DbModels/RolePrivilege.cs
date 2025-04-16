using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class RolePrivilege 
{
    public int RoleId { get; set; }

    public int PrivilegeId { get; set; }

    public int Id { get; set; }

    public int CreatedBy { get; set; }

    public DateTime CreatedOn { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public virtual Privilege Privilege { get; set; }

    public virtual Role Role { get; set; }
}
