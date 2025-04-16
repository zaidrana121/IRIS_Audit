using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class Employee : BaseModel
{
    public string Code { get; set; }

    public string Name { get; set; }

    public int? DesignationId { get; set; }

    public string NationalIdNumber { get; set; }

    public string PhoneNo { get; set; }

    public string Address { get; set; }

    public string Email { get; set; }

    public DateTime JoiningDate { get; set; }

    public DateTime? LeavingDate { get; set; }

    public DateTime? TerminationDate { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}

