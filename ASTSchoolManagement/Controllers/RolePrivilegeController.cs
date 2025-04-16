using ASTSM.Model.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System;
using ASTSM.Service.RolePrivileges;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace ASTSM.Controllers
{
    [Authorize]
    [Route("api/role-privilege")]
    [ApiController]
    public class RolePrivilegeController : ControllerBase
    {
        private readonly IRolePrivilegeService _rolePrivilegeService;

        public RolePrivilegeController(IRolePrivilegeService rolePrivilegeService)
        {
            _rolePrivilegeService = rolePrivilegeService;
        }

        [HttpPost]
        [Route("save")]
        public async Task<IActionResult> Save(List<RolePrivilegeRequestDto> request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isSaved = await _rolePrivilegeService.AddAsync(request);

                    return Ok(ApiResponseModel.GetResponse("Role Privilege added successfully.", HttpStatusCode.OK, isSaved));
                }
                else
                    return BadRequest(ApiResponseModel.GetResponse("Model is Not Valid", HttpStatusCode.BadRequest, ModelState));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest, false));
            }
        }

        [HttpGet]
        [Route("list")]
        public async Task<IActionResult> List(int roleId)
        {
            try
            {
                var result = await _rolePrivilegeService.GetPrivilegeByRoleId(roleId);
                return Ok(ApiResponseModel.GetResponse("Role Privileges Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
    }
}
