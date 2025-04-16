using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ASTSM.Model.Dtos;

public class RoleDto : BaseDtoModel
{
    [Display(Name = "Name")]
    [Required(ErrorMessage = "Name is required.")]
    [StringLength(200, ErrorMessage = "Name cannot exceed 200 characters.")]
    public string Name { get; set; }

    [Display(Name = "Is Active")]
    public bool? IsActive { get; set; }

}
