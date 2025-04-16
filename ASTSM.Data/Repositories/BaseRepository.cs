using Microsoft.EntityFrameworkCore;
using ASTSM.Data.Context;
using System.Linq.Expressions;

namespace ASTSM.Data.Repositories
{
    public class BaseRepository<T> : IBaseRepository<T> where T : class
    {
        private readonly ASTSMDbContext _dbContext;

        public BaseRepository(ASTSMDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public virtual async Task<T> GetByIdAsync(int id)
        {
            return await _dbContext.Set<T>().FindAsync(id);
        }

        public virtual async Task<List<T>> GetAllAsync(Expression<Func<T, bool>> filter = null)
        {
            var result = _dbContext.Set<T>().AsQueryable();
            if (filter != null) result = result.Where(filter);
            return await result.ToListAsync();
        }

        public virtual async Task<T> AddAsync(T entity)
        {
            await _dbContext.Set<T>().AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<bool> AddRangeAsync(List<T> entities)
        {
            await _dbContext.Set<T>().AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return true;
        }

        public virtual async Task<T> UpdateAsync(T entity)
        {
            _dbContext.Set<T>().Update(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task DeleteAsync(int id, int loggedInUser)
        {

            var result = await _dbContext.Set<T>().FindAsync(id);
            
            if(result != null)
            { 
                var deleteProperty = result.GetType().GetProperty("IsDeleted");
                deleteProperty.SetValue(result, true);

                var deletedDateProperty = result.GetType().GetProperty("DeletedOn");
                deletedDateProperty.SetValue(result, DateTime.Now);

                var deletedByProperty = result.GetType().GetProperty("DeletedBy");
                deletedByProperty.SetValue(result, loggedInUser);

            }
            _dbContext.Set<T>().Update(result);
            await _dbContext.SaveChangesAsync();
        }

        public virtual void HardDeleteRange(List<T> entities)
        {
            _dbContext.RemoveRange(entities);
            _dbContext.SaveChanges();
        }

        public virtual void HardDelete(T entity)
        {
            _dbContext.Remove(entity);
            _dbContext.SaveChanges();
        }
    }

}
