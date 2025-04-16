using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASTSM.Model.Dtos
{
    public class BaseResponseDto
    {
        public BaseResponseDto()
        {
            message = "not-saved";
        }
        public object Data { get; set; }
        public string message { get; set; }
    }
}
