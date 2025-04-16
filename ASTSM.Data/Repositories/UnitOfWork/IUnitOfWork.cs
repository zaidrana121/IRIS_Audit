
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

namespace ASTSM.Data.Repositories.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        IUserRepository UserRepository { get; }
        IRoleRepository RoleRepository { get; }
        IRolePrivilegeRepository RolePrivilegeRepository { get; }
        IPrivilegeRepository PrivilegeRepository { get; }
        IEmployeeRepository EmployeeRepository { get; }
        IDiscountTypeRepository DiscountTypeRepository{ get; }
        IDiscountRepository DiscountRepository { get; }
        IFeeRepository FeeRepository { get; }
        IFeeTypeRepository FeeTypeRepository { get; }
        IGradeRepository GradeRepository { get; }
        IStudentRepository StudentRepository { get; }
        IStudentGradeRepository StudentGradeRepository { get; }
        IVoucherRepository VoucherRepository { get; }
        IVoucherDetailRepository VoucherDetailRepository { get; }
        IFeeDetailRepository FeeDetailRepository { get; }
		IStudentDiscountDetailRepository StudentDiscountDetailRepository { get; }
		IStudentFeeTypeRepository StudentFeeTypeRepository { get; }
		IVoucherArrearsRepository VoucherArrearsRepository { get; }
        IProjectsRepository ProjectsRepository { get; }
    }
}
