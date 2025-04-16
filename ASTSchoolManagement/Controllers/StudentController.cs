using ASTSM.Model.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System;
using ASTSM.Service.Students;
using System.Threading.Tasks;
using ASTSM.Model.Dtos.Students;
using ASTSM.Model.DbModels;
using System.Drawing;

namespace ASTSM.Controllers
{
    //[Authorize]
    [Route("api/student")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly IStudentService _studentService;

        public StudentController(IStudentService studentService)
        {
            _studentService = studentService;
        }

        [HttpPost]
        [Route("save")]
        public async Task<IActionResult> Save(StudentRequestDto request)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isSaved = await _studentService.SaveAsync(request);

                    return Ok(ApiResponseModel.GetResponse("Student saved successfully.", HttpStatusCode.OK, isSaved));
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
                bool isDeleted = await _studentService.DeleteAsync(id);
                if (isDeleted)
                    return Ok(ApiResponseModel.GetResponse("Student deleted successfully.", HttpStatusCode.OK, isDeleted));
                else
                    return Ok(ApiResponseModel.GetResponse("Failed to delete. Student not found.", HttpStatusCode.NotModified, isDeleted));
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
                StudentRequestDto student = await _studentService.GetByIdAsync(id);
                return Ok(ApiResponseModel.GetResponse("Student Found.", HttpStatusCode.OK, student));
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
                var result = await _studentService.ListAsync();
                return Ok(ApiResponseModel.GetResponse("Students Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }

        [HttpGet]
        [Route("getByGrade")]
        public async Task<IActionResult> GetStudentByGradeId(int gradeId)
        {
            try
            {
                var result = await _studentService.GetByGrade(gradeId);
                return Ok(ApiResponseModel.GetResponse("Students Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }

        [HttpPost]
        [Route("voucher/grade")]
        public  IActionResult GetStudentVoucherResults(StudentVoucherByGradeRequestDto studentGrade)
        {
            try
            {
                var result = _studentService.GetStudentVoucherResults(studentGrade);
                return Ok(ApiResponseModel.GetResponse("Student Found.", HttpStatusCode.OK, result));
            }
            catch (Exception ex)
            {
                return BadRequest(ApiResponseModel.GetResponse($"Request Failed. Error: {ex.Message}", HttpStatusCode.BadRequest));
            }
        }
    }
}
