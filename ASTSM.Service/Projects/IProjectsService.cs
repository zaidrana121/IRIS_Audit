using ASTSM.Model.Dtos.Projects;
using ASTSM.Model.Dtos.Students;

namespace ASTSM.Service.Projects
{
    public interface IProjectsService
    {
        Task<bool> AddAsync(ProjectsDto feeRequest);
        Task<bool> UpdateAsync(ProjectsDto feeRequest);
        Task<ProjectsDto> GetByIdAsync(int id);
        Task<bool> DeleteAsync(int id);
       
    }
}