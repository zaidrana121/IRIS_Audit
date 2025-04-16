using ASTSM.Model.Dtos;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Threading.Tasks;
using System;
using ASTSM.Service.Vouchers;
using Microsoft.AspNetCore.Authorization;
using ASTSM.Model.Dtos.Vouchers;
using System.Collections.Generic;
using ASTSM.Model.Dtos.ManualVouchers;

namespace ASTSM.Controllers
{
    [Authorize]
    [Route("api/voucher")]
    [ApiController]
    public class VoucherController : ControllerBase
    {
        private readonly IVoucherService _voucherService;

        public VoucherController(IVoucherService voucherService)
        {
            _voucherService = voucherService;
        }


        [HttpPost]
        [Route("generate")]
        public async Task<IActionResult> Generate(VoucherGenerateDto voucherGenerateDto)
        {
            try
            {
                var voucherDetails = await _voucherService.GenerateVouchersAsync(voucherGenerateDto);
                return Ok(ApiResponseModel.GetResponse("Generated.", HttpStatusCode.OK, voucherDetails));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }

        [HttpPost]
        [Route("get")]
        public async Task<IActionResult> GetVouchers(List<int> voucherIds)
        {
            try
            {
                var voucherDetails = await _voucherService.GetVoucherbyIds(voucherIds);
                return Ok(ApiResponseModel.GetResponse("Success.", HttpStatusCode.OK, voucherDetails));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
        [HttpPost]
        [Route("update-duedate")]
        public async Task<IActionResult> updateDueDate(int voucherIds, DateTime dueDate)
        {
            try
            {
                var voucherDetails = await _voucherService.UpdateDueDate(voucherIds, dueDate);
                return Ok(ApiResponseModel.GetResponse("Updated.", HttpStatusCode.OK, voucherDetails));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
        [HttpPost]
        [Route("search")]
        public async Task<IActionResult> searchVouchers(VoucherSearchRequestDto  searchRequestDto)
        {
            try
            {
                var voucherDetails = await _voucherService.SearchVouchers(searchRequestDto);
                return Ok(ApiResponseModel.GetResponse("Success.", HttpStatusCode.OK, voucherDetails));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }

        [HttpPost]
        [Route("pay")]
        public async Task<IActionResult> PayVouchers(List<int> voucherIds)
        {
            try
            {
                var voucherDetails = await _voucherService.PayVoucherbyIds(voucherIds);
                return Ok(ApiResponseModel.GetResponse("Success.", HttpStatusCode.OK, voucherDetails));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }

		[HttpPost]
		[Route("manual")]
		public async Task<IActionResult> Manual(ManualVoucherRequestDto manualVoucherRequest)
		{
			try
			{
				var voucherDetails = await _voucherService.ManualVouchersAsync(manualVoucherRequest);
				return Ok(ApiResponseModel.GetResponse("Generated.", HttpStatusCode.OK, voucherDetails));
			}
			catch (Exception ex)
			{
				return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
			}
		}

        [HttpGet]
		[Route("dashboard-stats")]
		public async Task<IActionResult> VoucheDashboardStats()
		{
			try
			{
				var voucherStats = await _voucherService.GetVoucheDashboardStats();
				return Ok(ApiResponseModel.GetResponse("Success.", HttpStatusCode.OK, voucherStats));
			}
			catch (Exception ex)
			{
				return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
			}
		}

        [HttpPost]
        [Route("cancel")]
        public async Task<IActionResult> CancelVouchers(List<int> voucherIds)
        {
            try
            {
                var voucherDetails = await _voucherService.CancelVoucherbyIds(voucherIds);
                return Ok(ApiResponseModel.GetResponse("Success.", HttpStatusCode.OK, voucherDetails));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
    }
}
