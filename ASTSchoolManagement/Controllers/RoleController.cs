using ASTSM.Model.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Threading.Tasks;
using System;
using ASTSM.Service.Roles;

namespace ASTSM.Controllers
{
    [Authorize]
    [Route("api/role")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IRoleService _roleService;
        public RoleController(IRoleService roleService)
        {
            _roleService = roleService;
        }

        [HttpPost]
        [Route("add")]
        public async Task<IActionResult> Add(RoleDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isSaved = await _roleService.AddAsync(request);

                    return Ok(ApiResponseModel.GetResponse("Role added successfully.", HttpStatusCode.OK, isSaved));
                }
                else
                    return BadRequest(ApiResponseModel.GetResponse("Modal is Not Valid", HttpStatusCode.BadRequest, ModelState));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest, false));
            }
        }

        [HttpPost]
        [Route("update")]
        public async Task<IActionResult> Update(RoleDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isUpdated = await _roleService.UpdateAsync(request);
                    if (isUpdated)
                        return Ok(ApiResponseModel.GetResponse("Role updated successfully.", HttpStatusCode.OK, isUpdated));
                    else
                        return Ok(ApiResponseModel.GetResponse("Failed to update. Role not found.", HttpStatusCode.NotModified, isUpdated));
                }
                else
                    return BadRequest(ApiResponseModel.GetResponse("Modal is Not Valid", HttpStatusCode.BadRequest, ModelState));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest, false));
            }
        }

        [HttpDelete]
        [Route("delete")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                bool isDeleted = await _roleService.DeleteAsync(id);
                if (isDeleted)
                    return Ok(ApiResponseModel.GetResponse("Role deleted successfully.", HttpStatusCode.OK, isDeleted));
                else
                    return Ok(ApiResponseModel.GetResponse("Failed to delete. Role not found.", HttpStatusCode.NotModified, isDeleted));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest, false));
            }
        }

        [HttpGet]
        [Route("get")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                RoleDto role = await _roleService.GetByIdAsync(id);
                return Ok(ApiResponseModel.GetResponse("Role Found.", HttpStatusCode.OK, role));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
        [HttpGet]
        [Route("list")]
        public async Task<IActionResult> List()
        {
            try
            {
                var result = await _roleService.ListAsync();
                return Ok(ApiResponseModel.GetResponse("Role Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }

        [HttpGet]
        [Route("list/short")]
        public async Task<IActionResult> ShortList()
        {
            try
            {
                var result = await _roleService.ShortList();
                return Ok(ApiResponseModel.GetResponse("Role Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
    }
}
