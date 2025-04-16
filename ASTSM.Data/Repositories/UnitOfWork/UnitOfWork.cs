using ASTSM.Data.Context;
using ASTSM.Data.Repositories.DiscountFees;
using ASTSM.Data.Repositories.DiscountTypes;
using ASTSM.Data.Repositories.Employees;
using ASTSM.Data.Repositories.FeeDetails;
using ASTSM.Data.Repositories.Fees;
using ASTSM.Data.Repositories.FeeTypes;
using ASTSM.Data.Repositories.Grades;
using ASTSM.Data.Repositories.Privileges;
using ASTSM.Data.Repositories.RolePrivileges;
using ASTSM.Data.Repositories.Roles;
using ASTSM.Data.Repositories.StudentDiscountDetails;
using ASTSM.Data.Repositories.StudentGrades;
using ASTSM.Data.Repositories.Students;
using ASTSM.Data.Repositories.Users;
using ASTSM.Data.Repositories.Vouchers;
using ASTSM.Data.Repositories.Projects;
using System.Data;

namespace ASTSM.Data.Repositories.UnitOfWork
{
    public class UnitOfWork : IDisposable, IUnitOfWork
    {
        private readonly ASTSMDbContext _dbContext;
        private readonly IDbConnection _dbConnection;

        public UnitOfWork(ASTSMDbContext dbContext, IDbConnection dbConnection)
        {
            _dbContext = dbContext;
            _dbConnection = dbConnection;
        }
        private IUserRepository _userRepository;
        private IRolePrivilegeRepository _rolePrivilegeRepository;
        private IPrivilegeRepository _privilegeRepository;
        private IRoleRepository _roleRepository;
        private IFeeRepository _feeRepository;
        private IFeeTypeRepository _feeTypeRepository;
        private IDiscountRepository _discountFeeRepository;
        private IDiscountTypeRepository _discountTypeRepository;
        private IEmployeeRepository _employeeRepository;
        private IGradeRepository _gradeRepository;
        private IStudentRepository _studentRepository;
        private IStudentGradeRepository _studentGradeRepository;
        private IVoucherRepository _voucherRepository;
        private IVoucherDetailRepository _voucherDetailRepository;
        private IFeeDetailRepository _feeDetailRepository;
        private IStudentDiscountDetailRepository _studentDiscountDetailRepository;
        private IStudentFeeTypeRepository _studentFeeTypeRepository;
        private IVoucherArrearsRepository _voucherArrearsRepository;
        private IProjectsRepository _projectsRepository;


        public IUserRepository UserRepository
        {
            get
            {
                return _userRepository ??= new UserRepository(_dbContext, _dbConnection);
            }
        }

        public IRoleRepository RoleRepository
        {
            get
            {
                return _roleRepository ??= new RoleRepository(_dbContext);
            }
        }

        public IPrivilegeRepository PrivilegeRepository
        {
            get
            {
                return _privilegeRepository ??= new PrivilegeRepository(_dbContext);
            }
        }

        public IRolePrivilegeRepository RolePrivilegeRepository
        {
            get
            {
                return _rolePrivilegeRepository ??= new RolePrivilegeRepository(_dbContext);
            }
        }

        public IDiscountRepository DiscountRepository
        {
            get
            {
                return _discountFeeRepository ??= new DiscountRepository(_dbContext);
            }
        }

        public IDiscountTypeRepository DiscountTypeRepository
        {
            get
            {
                return _discountTypeRepository ??= new DiscountTypeRepository(_dbContext);
            }
        }

        public IEmployeeRepository EmployeeRepository
        {
            get
            {
                return _employeeRepository ??= new EmployeeRepository(_dbContext);
            }
        }

        public IFeeRepository FeeRepository
        {
            get
            {
                return _feeRepository ??= new FeeRepository(_dbContext);
            }
        }

        public IFeeTypeRepository FeeTypeRepository
        {
            get
            {
                return _feeTypeRepository ??= new FeeTypeRepository(_dbContext);
            }
        }

        public IGradeRepository GradeRepository
        {
            get
            {
                return _gradeRepository ??= new GradeRepository(_dbContext);
            }
        }

        public IStudentRepository StudentRepository
        {
            get
            {
                return _studentRepository ??= new StudentRepository(_dbContext, _dbConnection);
            }
        }

        public IStudentGradeRepository StudentGradeRepository
        {
            get
            {
                return _studentGradeRepository ??= new StudentGradeRepository(_dbContext);
            }
        }

        public IVoucherRepository VoucherRepository
        {
            get
            {
                return _voucherRepository ??= new VoucherRepository(_dbConnection, _dbContext);
            }
        }

        public IVoucherDetailRepository VoucherDetailRepository
        {
            get
            {
                return _voucherDetailRepository ??= new VouchersDetailRepository(_dbContext);
            }
        }

        public IFeeDetailRepository FeeDetailRepository
        {
            get
            {
                return _feeDetailRepository ??= new FeeDetailRepository(_dbContext);
            }
        }
        
        public IStudentDiscountDetailRepository StudentDiscountDetailRepository
		{
            get
            {
                return _studentDiscountDetailRepository ??= new StudentDiscountDetailRepository(_dbContext);
            }
        }
        
        public IStudentFeeTypeRepository StudentFeeTypeRepository
		{
            get
            {
                return _studentFeeTypeRepository ??= new StudentFeeTypeRepository(_dbContext);
            }
        }   

        public IVoucherArrearsRepository VoucherArrearsRepository
		{
            get
            {
                return _voucherArrearsRepository ??= new VoucherArrearsRepository(_dbContext);
            }
        }

        public IProjectsRepository ProjectsRepository
        {
            get
            {
                return _projectsRepository ??= new ProjectsRepository(_dbContext);
            }
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    // _context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }

}
