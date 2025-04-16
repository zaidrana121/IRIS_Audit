using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASTSM.Model.Dtos.Users
{
    public class UserResponseDto
    {
        public int UserId { get; set; }
        public int EmployeeId { get; set; }
        public int RoleId { get; set; }
        public string EmployeeName { get; set; }
        public string EmployeeCode { get; set; }
        public string RoleName { get; set; }
        public DateTime CreatedOn { get; set; }
        public bool? IsActive { get; set; }
    }

}
