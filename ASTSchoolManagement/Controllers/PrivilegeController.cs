using ASTSM.Model.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System;
using ASTSM.Service.Privileges;
using System.Threading.Tasks;

namespace ASTSM.Controllers
{
    [Authorize]
    [Route("api/privilege")]
    [ApiController]
    public class PrivilegeController : ControllerBase
    {
        private readonly IPrivilegeService _privilegeService;

        public PrivilegeController(IPrivilegeService privilegeService)
        {
            _privilegeService = privilegeService;
        }

        [HttpPost]
        [Route("add")]
        public async Task<IActionResult> Add(PrivilegeDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isSaved = await _privilegeService.AddAsync(request);

                    return Ok(ApiResponseModel.GetResponse("Privilege added successfully.", HttpStatusCode.OK, isSaved));
                }
                else
                    return BadRequest(ApiResponseModel.GetResponse("Model is Not Valid", HttpStatusCode.BadRequest, ModelState));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest, false));
            }
        }

        [HttpPost]
        [Route("update")]
        public async Task<IActionResult> Update(PrivilegeDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isUpdated = await _privilegeService.UpdateAsync(request);
                    if (isUpdated)
                        return Ok(ApiResponseModel.GetResponse("Privilege updated successfully.", HttpStatusCode.OK, isUpdated));
                    else
                        return Ok(ApiResponseModel.GetResponse("Failed to update. Privilege not found.", HttpStatusCode.NotModified, isUpdated));
                }
                else
                    return BadRequest(ApiResponseModel.GetResponse("Model is Not Valid", HttpStatusCode.BadRequest, ModelState));
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
                bool isDeleted = await _privilegeService.DeleteAsync(id);
                if (isDeleted)
                    return Ok(ApiResponseModel.GetResponse("Privilege deleted successfully.", HttpStatusCode.OK, isDeleted));
                else
                    return Ok(ApiResponseModel.GetResponse("Failed to delete. Privilege not found.", HttpStatusCode.NotModified, isDeleted));
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
                PrivilegeDto privilege = await _privilegeService.GetByIdAsync(id);
                return Ok(ApiResponseModel.GetResponse("Privilege Found.", HttpStatusCode.OK, privilege));
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
                var result = await _privilegeService.ListAsync();
                return Ok(ApiResponseModel.GetResponse("Privileges Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
    }
}
