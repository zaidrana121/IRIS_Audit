using System.ComponentModel.DataAnnotations;

namespace ASTSM.Model.Dtos.Projects;

public class ProjectsDto : BaseDtoModel
{
    [Display(Name = "Project Name")]
    [StringLength(50, ErrorMessage = "Roll No cannot exceed 50 characters.")]
    public string? Project_name { get; set; }

    [Display(Name = "Project Type")]
    [StringLength(50, ErrorMessage = "Name cannot exceed 50 characters.")]
    public string? project_type { get; set; }


}