using Microsoft.EntityFrameworkCore;
using ASTSM.Model.DbModels;
using Microsoft.Extensions.Configuration;
using System.IO;
using NLog;
using ASTSM.Data;

namespace ASTSM.Data.Context;

public partial class ASTSMDbContext : DbContext
{
    public ASTSMDbContext()
    {
    }

    public ASTSMDbContext(DbContextOptions<ASTSMDbContext> options)
        : base(options)
    {
    }
   
    
    public virtual DbSet<Discount> Discounts { get; set; }

    public virtual DbSet<DiscountType> DiscountTypes { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Fee> Fees { get; set; }

    public virtual DbSet<FeeDetail> FeeDetails { get; set; }

    public virtual DbSet<FeeType> FeeTypes { get; set; }

    public virtual DbSet<Grade> Grades { get; set; }

    public virtual DbSet<Privilege> Privileges { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<RolePrivilege> RolePrivileges { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<StudentDiscountDetail> StudentDiscountDetails { get; set; }

	public virtual DbSet<StudentFeeType> StudentFeeTypes { get; set; }

	public virtual DbSet<StudentGrade> StudentGrades { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Voucher> Vouchers { get; set; }

    public virtual DbSet<VoucherDetail> VoucherDetails { get; set; }

	public virtual DbSet<VoucherArrear> VoucherArrears { get; set; }
    public virtual DbSet<AstsProjects> AstsProjectss { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Discount>(entity =>
		{
			entity.HasKey(e => e.Id).HasName("PK_DiscountFee");

			entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");
			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.Reason).HasMaxLength(500);
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

			entity.HasOne(d => d.DiscountType).WithMany(p => p.Discounts)
				.HasForeignKey(d => d.DiscountTypeId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_DiscountFees_DiscountTypes");
		});

		modelBuilder.Entity<DiscountType>(entity =>
		{
			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.Description).HasMaxLength(500);
			entity.Property(e => e.Title)
				.IsRequired()
				.HasMaxLength(100);
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
		});

		modelBuilder.Entity<Employee>(entity =>
		{
			entity.Property(e => e.Address).HasMaxLength(700);
			entity.Property(e => e.Code)
				.IsRequired()
				.HasMaxLength(100);
			entity.Property(e => e.CreatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.CreatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.DesignationId).HasDefaultValueSql("((0))");
			entity.Property(e => e.Email)
				.IsRequired()
				.HasMaxLength(100)
				.HasDefaultValueSql("(N'emp@vms.com')");
			entity.Property(e => e.JoiningDate)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
			entity.Property(e => e.LeavingDate).HasColumnType("datetime");
			entity.Property(e => e.Name)
				.IsRequired()
				.HasMaxLength(200);
			entity.Property(e => e.NationalIdNumber)
				.IsRequired()
				.HasMaxLength(30);
			entity.Property(e => e.PhoneNo).HasMaxLength(15);
			entity.Property(e => e.TerminationDate).HasColumnType("datetime");
			entity.Property(e => e.UpdatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.UpdatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
		});

		modelBuilder.Entity<Fee>(entity =>
		{
			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 2)");
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
		});

		modelBuilder.Entity<FeeDetail>(entity =>
		{
			entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");
			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

			entity.HasOne(d => d.Fee).WithMany(p => p.FeeDetails)
				.HasForeignKey(d => d.FeeId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_FeeDetails_Fees");

			entity.HasOne(d => d.FeeType).WithMany(p => p.FeeDetails)
				.HasForeignKey(d => d.FeeTypeId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_FeeDetails_FeeTypes");
		});

		modelBuilder.Entity<FeeType>(entity =>
		{
			entity.HasKey(e => e.Id).HasName("PK_FeeType");

			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.Description).HasMaxLength(500);
			entity.Property(e => e.IsMonthly).HasColumnName("isMonthly");
			entity.Property(e => e.Title).HasMaxLength(100);
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
		});

		modelBuilder.Entity<Grade>(entity =>
		{
			entity.HasKey(e => e.Id).HasName("PK_Grade");

			entity.Property(e => e.Code).HasMaxLength(100);
			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.Title).HasMaxLength(100);
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

			entity.HasOne(d => d.Fee).WithMany(p => p.Grades)
				.HasForeignKey(d => d.FeeId)
				.HasConstraintName("FK_Fees_Grades");
		});

		modelBuilder.Entity<Privilege>(entity =>
		{
			entity.Property(e => e.Code).HasMaxLength(100);
			entity.Property(e => e.CreatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.CreatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.IsDeleted).HasDefaultValueSql("((0))");
			entity.Property(e => e.Name)
				.IsRequired()
				.HasMaxLength(200);
			entity.Property(e => e.UpdatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.UpdatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
		});

		modelBuilder.Entity<Role>(entity =>
		{
			entity.Property(e => e.CreatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.CreatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.IsDeleted).HasDefaultValueSql("((0))");
			entity.Property(e => e.Name)
				.IsRequired()
				.HasMaxLength(200);
			entity.Property(e => e.UpdatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.UpdatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
		});

		modelBuilder.Entity<RolePrivilege>(entity =>
		{
			entity.Property(e => e.CreatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.CreatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
			entity.Property(e => e.PrivilegeId).HasColumnName("PrivilegeID");
			entity.Property(e => e.RoleId).HasColumnName("RoleID");
			entity.Property(e => e.UpdatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.UpdatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");

			entity.HasOne(d => d.Privilege).WithMany(p => p.RolePrivileges)
				.HasForeignKey(d => d.PrivilegeId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_RolePrivileges_Privileges");

			entity.HasOne(d => d.Role).WithMany(p => p.RolePrivileges)
				.HasForeignKey(d => d.RoleId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_RolePrivileges_Roles");
		});

		modelBuilder.Entity<Student>(entity =>
		{
			entity.HasKey(e => e.Id).HasName("PK_Student");

			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.Name)
				.IsRequired()
				.HasMaxLength(200);
			entity.Property(e => e.Rollno)
				.IsRequired()
				.HasMaxLength(200);
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
		});

		modelBuilder.Entity<StudentDiscountDetail>(entity =>
		{
			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

			entity.HasOne(d => d.Student).WithMany(p => p.StudentDiscountDetails)
				.HasForeignKey(d => d.StudentId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_StudentDiscountDetails_Students");
		});

		modelBuilder.Entity<StudentFeeType>(entity =>
		{
			entity.HasKey(e => e.Id).HasName("PK_StudentFeeType");

			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
		});

		modelBuilder.Entity<StudentGrade>(entity =>
		{
			entity.Property(e => e.CreatedOn).HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

			entity.HasOne(d => d.Grade).WithMany(p => p.StudentGrades)
				.HasForeignKey(d => d.GradeId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_GradeId_StudentGrade");

			entity.HasOne(d => d.Student).WithMany(p => p.StudentGrades)
				.HasForeignKey(d => d.StudentId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_StudentId__StudentGrade");
		});

		modelBuilder.Entity<User>(entity =>
		{
			entity.HasKey(e => e.Id).HasName("PK_users");

			entity.Property(e => e.CreatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.CreatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.IsDeleted).HasDefaultValueSql("((0))");
			entity.Property(e => e.LoginName)
				.IsRequired()
				.HasMaxLength(50);
			entity.Property(e => e.Password)
				.IsRequired()
				.HasMaxLength(1000);
			entity.Property(e => e.UpdatedBy).HasDefaultValueSql("((1))");
			entity.Property(e => e.UpdatedOn)
				.HasDefaultValueSql("(getdate())")
				.HasColumnType("datetime");

			entity.HasOne(d => d.Employee).WithMany(p => p.Users)
				.HasForeignKey(d => d.EmployeeId)
				.HasConstraintName("FK_users_Employees");

			entity.HasOne(d => d.Role).WithMany(p => p.Users)
				.HasForeignKey(d => d.RoleId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_users_role");
		});

		modelBuilder.Entity<Voucher>(entity =>
		{
			entity.Property(e => e.DeletedOn).HasColumnType("datetime");
			entity.Property(e => e.DueDate).HasColumnType("datetime");
			entity.Property(e => e.FeesMonth).HasColumnType("datetime");
			entity.Property(e => e.GeneratedOn).HasColumnType("datetime");
			entity.Property(e => e.GradeTitle)
				.IsRequired()
				.HasMaxLength(100);
			entity.Property(e => e.IssueDate).HasColumnType("datetime");
			entity.Property(e => e.PaidOn).HasColumnType("datetime");
			entity.Property(e => e.Rollno)
				.IsRequired()
				.HasMaxLength(50);
			entity.Property(e => e.Status)
				.IsRequired()
				.HasMaxLength(20);
			entity.Property(e => e.StudentName)
				.IsRequired()
				.HasMaxLength(100);
			entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 2)");
			entity.Property(e => e.VoucherNo)
				.IsRequired()
				.HasMaxLength(10);
		});

		modelBuilder.Entity<VoucherArrear>(entity =>
		{
			entity.Property(e => e.CraetedOn).HasColumnType("datetime");
		});

		modelBuilder.Entity<VoucherDetail>(entity =>
		{
			entity.Property(e => e.DiscountAmount).HasColumnType("decimal(18, 2)");
			entity.Property(e => e.DiscountType)
				.IsRequired()
				.HasMaxLength(50);
			entity.Property(e => e.FeesAmount).HasColumnType("decimal(18, 2)");
			entity.Property(e => e.FeesType)
				.IsRequired()
				.HasMaxLength(100)
				.IsFixedLength();

			entity.HasOne(d => d.Voucher).WithMany(p => p.VoucherDetails)
				.HasForeignKey(d => d.VoucherId)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("FK_VoucherDetails_Vouchers");
		});

        modelBuilder.Entity<AstsProjects>(entity =>
        {
            entity.ToTable("ASTS_Projects");

            entity.Property(e => e.Project_name)
                .HasMaxLength(50)
                .HasColumnName("Project_name");
            entity.Property(e => e.project_type)
                .HasMaxLength(50)
                .HasColumnName("project_type");
        });

        OnModelCreatingPartial(modelBuilder);
	}

	partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
