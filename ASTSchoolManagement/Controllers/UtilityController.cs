using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ASTSM.Data.Context;
using ASTSM.Service.LoggerManager;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Data;

namespace ASTSM.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UtilityController : Controller
    {
        private readonly ASTSMDbContext _context;
        private readonly IDbConnection _dbConnection;
        private readonly ILoggerManager _logger;

        public UtilityController(ASTSMDbContext context, ILoggerManager logger, IDbConnection dbConnection)
        {
            _context = context;
            _logger = logger;
            _dbConnection = dbConnection;
        }

        [HttpGet]
        [Route("check-ef-db-connection")]
        public async Task<IActionResult> EfDbConnection()
        {
            try
            {
                _context.Database.OpenConnection();
                _context.Database.CloseConnection();
                return Ok("EF Database connection successful.");
            }
            catch (Exception ex)
            {
                return BadRequest($"Error: {ex.Message}");
            }
        }

        [HttpGet]
        [Route("check-db-connection")]
        public async Task<IActionResult> DbConnection()
        {
            try
            {
                _dbConnection.Open();
                _dbConnection.Close();
                return Ok("Database connection successful.");
            }
            catch (Exception ex)
            {
                return BadRequest($"Error: {ex.Message}");
            }
        }

        [HttpGet]
        public IEnumerable<string> Get()
        {
            _logger.LogInfo("Here is info message from the controller.");
            _logger.LogDebug("Here is debug message from the controller.");
            _logger.LogWarn("Here is warn message from the controller.");
            _logger.LogError("Here is error message from the controller.");
            return new string[] { "value1", "value2" };
        }
    }
}
