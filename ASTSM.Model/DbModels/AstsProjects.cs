namespace ASTSM.Model.DbModels;

public partial class AstsProjects : BaseModel
{

    public int Id { get; set; }

    public string? Project_name { get; set; }

    public string? project_type { get; set; }

}