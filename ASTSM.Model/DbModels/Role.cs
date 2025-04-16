using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class Role : BaseModel
{
    public string Name { get; set; } = null!;

    public bool? IsActive { get; set; }

    public virtual ICollection<RolePrivilege> RolePrivileges { get; set; } = new List<RolePrivilege>();

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
