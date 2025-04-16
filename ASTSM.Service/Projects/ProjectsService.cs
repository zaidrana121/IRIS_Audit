using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos.Fees;
using ASTSM.Model.Dtos.Projects;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Users;
using AutoMapper;

namespace ASTSM.Service.Projects
{
    public class ProjectsService : IProjectsService
    {
        private readonly IUnitOfWork _uow;
        private readonly IMapper _mapper;
        private readonly UserIdentity _loggedInUser;

        public ProjectsService(IUnitOfWork uow, IMapper mapper, UserSessionService userSessionService)
        {
            _uow = uow;
            _mapper = mapper;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<bool> AddAsync(ProjectsDto projectRequest)
        {
            try
            {
                if (projectRequest != null)
                {
                    AstsProjects fee = _mapper.Map<AstsProjects>(projectRequest);                    
                    fee.CreatedBy = _loggedInUser.Id;
                    fee.CreatedOn = DateTime.Now;
                    await _uow.ProjectsRepository.AddAsync(fee);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return true;
        }

        public async Task<bool> UpdateAsync(ProjectsDto feeRequest)
        {
            bool isUpdated = false;
            try
            {
                if (feeRequest != null && feeRequest.Id > 0)
                {
                    AstsProjects feeFromDb = await _uow.ProjectsRepository.GetByIdAsync(feeRequest.Id);

                    if (feeFromDb != null && feeFromDb.Id > 0)
                    {
                        feeFromDb.Project_name = feeRequest.Project_name;
                        feeFromDb.project_type = feeRequest.project_type;
                        //feeFromDb.IsActive = feeRequest.IsActive;
                        feeFromDb.UpdatedBy = _loggedInUser.Id;
                        feeFromDb.UpdatedOn = DateTime.Now;
                        await _uow.ProjectsRepository.UpdateAsync(feeFromDb);
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
                Fee feeFromDb = await _uow.FeeRepository.GetByIdAsync(id);
                if (feeFromDb != null)
                {
                    await _uow.FeeRepository.DeleteAsync(id, _loggedInUser.Id);
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

        public async Task<ProjectsDto> GetByIdAsync(int id)
        {
            AstsProjects feeFromDb = await _uow.ProjectsRepository.GetByIdAsync(id);
            ProjectsDto feeDto = _mapper.Map<ProjectsDto>(feeFromDb);
            return feeDto;
        }

        //public async Task<List<FeeDto>> ListAsync()
        //{
        //    var result = await _uow.FeeRepository.GetAllAsync(entity => (entity.IsDeleted == null || (Boolean)!entity.IsDeleted));
        //    List<FeeDto> fees = _mapper.Map<List<FeeDto>>(result);
        //    return fees;
        //}
    }
}
