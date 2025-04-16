using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.Employees
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public EmployeeService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(EmployeeDto employeeRequest)
        {
            try
            {
                if (employeeRequest != null)
                {
                    Employee employee = _mapper.Map<Employee>(employeeRequest);
                    employee.IsDeleted = false;
                    employee.CreatedBy = _loggedInUser.Id;
                    employee.CreatedOn = DateTime.Now;
                    await _uow.EmployeeRepository.AddAsync(employee);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(EmployeeDto employeeRequest)
        {
            bool isUpdated = false;
            try
            {
                if (employeeRequest != null && employeeRequest.Id > 0)
                {
                    Employee employeeFromDb = await _uow.EmployeeRepository.GetByIdAsync(employeeRequest.Id);

                    if (employeeFromDb != null && employeeFromDb.Id > 0)
                    {
                        employeeFromDb.Code = employeeRequest.Code;
                        employeeFromDb.Name = employeeRequest.Name;
                        employeeFromDb.DesignationId = employeeRequest.DesignationId;
                        employeeFromDb.PhoneNo = employeeRequest.PhoneNo;
                        employeeFromDb.Email = employeeRequest.Email;
                        employeeFromDb.JoiningDate = employeeRequest.JoiningDate;
                        employeeFromDb.LeavingDate = employeeRequest.LeavingDate;
                        employeeFromDb.TerminationDate = employeeRequest.TerminationDate;
                        employeeFromDb.Address = employeeRequest.Address;
                        employeeFromDb.NationalIdNumber = employeeRequest.NationalIdNumber;
                        employeeFromDb.IsActive = employeeRequest.IsActive;
                        employeeFromDb.UpdatedBy = _loggedInUser.Id;
                        employeeFromDb .UpdatedOn = DateTime.Now;
                        await _uow.EmployeeRepository.UpdateAsync(employeeFromDb);
                        isUpdated = true;
                    }
                }
                else
                    isUpdated = false;
            }
            catch (Exception ex)
            {
                throw;
            }
            return isUpdated;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            bool isDeleted = false;
            try
            {
                Employee employeeFromDb = await _uow.EmployeeRepository.GetByIdAsync(id);
                if (employeeFromDb != null)
                {
                    await _uow.EmployeeRepository.DeleteAsync(id, _loggedInUser.Id);
                    isDeleted = true;
                }
                else
                    isDeleted = false;
            }
            catch (Exception ex)
            {
                throw;
            }
            return isDeleted;
        }

        public async Task<EmployeeDto> GetByIdAsync(int id)
        {
            Employee employeeFromDb = await _uow.EmployeeRepository.GetByIdAsync(id);
            EmployeeDto employeeDto = _mapper.Map<EmployeeDto>(employeeFromDb);
            return employeeDto;
        }

        public async Task<List<EmployeeDto>> ListAsync()
        {
            var result = await _uow.EmployeeRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
            List<EmployeeDto> employees = _mapper.Map<List<EmployeeDto>>(result);
            return employees;
        }

        public async Task<List<ShortListDto>> ShortList()
        {
            var result = await _uow.EmployeeRepository.GetAllAsync(entity => ((entity.IsDeleted == null || (Boolean)!entity.IsDeleted) && (Boolean)entity.IsActive));
            if (result != null && result.Any())
            {
                List<ShortListDto> storyList = _mapper.Map<List<ShortListDto>>(result);
                return storyList;
            }
            else
            {
                return new List<ShortListDto>();
            }

        }
    }
}
