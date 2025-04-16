using ASTSM.Model.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System;
using ASTSM.Service.FeeTypes;
using System.Threading.Tasks;

namespace ASTSM.Controllers
{
    [Authorize]
    [Route("api/fee-type")]
    [ApiController]
    public class FeeTypeController : ControllerBase
    {
        private readonly IFeeTypeService _feeTypeService;

        public FeeTypeController(IFeeTypeService feeTypeService)
        {
            _feeTypeService = feeTypeService;
        }

        [HttpPost]
        [Route("add")]
        public async Task<IActionResult> Add(FeeTypeDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isSaved = await _feeTypeService.AddAsync(request);

                    return Ok(ApiResponseModel.GetResponse("Fee Type added successfully.", HttpStatusCode.OK, isSaved));
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
        public async Task<IActionResult> Update(FeeTypeDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isUpdated = await _feeTypeService.UpdateAsync(request);
                    if (isUpdated)
                        return Ok(ApiResponseModel.GetResponse("Fee Type updated successfully.", HttpStatusCode.OK, isUpdated));
                    else
                        return Ok(ApiResponseModel.GetResponse("Failed to update. Fee Type not found.", HttpStatusCode.NotModified, isUpdated));
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
                bool isDeleted = await _feeTypeService.DeleteAsync(id);
                if (isDeleted)
                    return Ok(ApiResponseModel.GetResponse("Fee Type deleted successfully.", HttpStatusCode.OK, isDeleted));
                else
                    return Ok(ApiResponseModel.GetResponse("Failed to delete. Fee Type not found.", HttpStatusCode.NotModified, isDeleted));
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
                FeeTypeDto feeType = await _feeTypeService.GetByIdAsync(id);
                return Ok(ApiResponseModel.GetResponse("Fee Type Found.", HttpStatusCode.OK, feeType));
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
                var result = await _feeTypeService.ListAsync();
                return Ok(ApiResponseModel.GetResponse("Fee Types Found.", HttpStatusCode.OK, result));
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
                var result = await _feeTypeService.ShortList();
                return Ok(ApiResponseModel.GetResponse("Fee Types Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
    }
}
