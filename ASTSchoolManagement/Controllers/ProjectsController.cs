using ASTSM.Model.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System;
using ASTSM.Service.Fees;
using System.Threading.Tasks;
using ASTSM.Model.Dtos.Fees;
using ASTSM.Model.Dtos.Projects;
using ASTSM.Service.Projects;

namespace ASTSM.Controllers
{
   
    [Route("api/project")]
    [ApiController]
    public class ProjectsController : ControllerBase
    {
        private readonly IProjectsService _feeService;

        public ProjectsController(IProjectsService feeService)
        {
            _feeService = feeService;
        }

        [HttpPost]
        [Route("add")]
        public async Task<IActionResult> Add(ProjectsDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isSaved = await _feeService.AddAsync(request);

                    return Ok(ApiResponseModel.GetResponse("Fee added successfully.", HttpStatusCode.OK, isSaved));
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
        public async Task<IActionResult> Update(ProjectsDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isUpdated = await _feeService.UpdateAsync(request);
                    if (isUpdated)
                        return Ok(ApiResponseModel.GetResponse("Fee updated successfully.", HttpStatusCode.OK, isUpdated));
                    else
                        return Ok(ApiResponseModel.GetResponse("Failed to update. Fee not found.", HttpStatusCode.NotModified, isUpdated));
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
                bool isDeleted = await _feeService.DeleteAsync(id);
                if (isDeleted)
                    return Ok(ApiResponseModel.GetResponse("Fee deleted successfully.", HttpStatusCode.OK, isDeleted));
                else
                    return Ok(ApiResponseModel.GetResponse("Failed to delete. Fee not found.", HttpStatusCode.NotModified, isDeleted));
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
                ProjectsDto fee = await _feeService.GetByIdAsync(id);
                return Ok(ApiResponseModel.GetResponse("Fee Found.", HttpStatusCode.OK, fee));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }

        //[HttpGet]
        //[Route("list")]
        //public async Task<IActionResult> List()
        //{
        //    try
        //    {
        //        var result = await _feeService.ListAsync();
        //        return Ok(ApiResponseModel.GetResponse("Fees Found.", HttpStatusCode.OK, result));
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
        //    }
        //}
    }
}
