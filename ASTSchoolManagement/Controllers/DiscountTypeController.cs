using ASTSM.Model.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System;
using ASTSM.Service.DiscountTypes;
using System.Threading.Tasks;

namespace ASTSM.Controllers
{
    [Authorize]
    [Route("api/discount-type")]
    [ApiController]
    public class DiscountTypeController : ControllerBase
    {
        private readonly IDiscountTypeService _discountTypeService;

        public DiscountTypeController(IDiscountTypeService discountTypeService)
        {
            _discountTypeService = discountTypeService;
        }

        [HttpPost]
        [Route("add")]
        public async Task<IActionResult> Add(DiscountTypeDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isSaved = await _discountTypeService.AddAsync(request);

                    return Ok(ApiResponseModel.GetResponse("Discount Type added successfully.", HttpStatusCode.OK, isSaved));
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
        public async Task<IActionResult> Update(DiscountTypeDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isUpdated = await _discountTypeService.UpdateAsync(request);
                    if (isUpdated)
                        return Ok(ApiResponseModel.GetResponse("Discount Type updated successfully.", HttpStatusCode.OK, isUpdated));
                    else
                        return Ok(ApiResponseModel.GetResponse("Failed to update. Discount Type not found.", HttpStatusCode.NotModified, isUpdated));
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
                bool isDeleted = await _discountTypeService.DeleteAsync(id);
                if (isDeleted)
                    return Ok(ApiResponseModel.GetResponse("Discount Type deleted successfully.", HttpStatusCode.OK, isDeleted));
                else
                    return Ok(ApiResponseModel.GetResponse("Failed to delete. Discount Type not found.", HttpStatusCode.NotModified, isDeleted));
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
                DiscountTypeDto discountType = await _discountTypeService.GetByIdAsync(id);
                return Ok(ApiResponseModel.GetResponse("Discount Type Found.", HttpStatusCode.OK, discountType));
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
                var result = await _discountTypeService.ListAsync();
                return Ok(ApiResponseModel.GetResponse("Discount Types Found.", HttpStatusCode.OK, result));
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
                var result = await _discountTypeService.ShortList();
                return Ok(ApiResponseModel.GetResponse("Grades Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
    }
}
