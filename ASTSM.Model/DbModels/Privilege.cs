namespace ASTSM.Model.DbModels;

public partial class Privilege : BaseModel
{
    public string? Code { get; set; }

    public string Name { get; set; } = null!;

    public bool? IsActive { get; set; }

    public virtual ICollection<RolePrivilege> RolePrivileges { get; set; } = new List<RolePrivilege>();

}
