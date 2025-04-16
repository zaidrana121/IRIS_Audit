USE [master]
GO
/****** Object:  Database [ASTSchoolManagement_V2]    Script Date: 10/23/2023 3:47:50 PM ******/
CREATE DATABASE [ASTSchoolManagement_V2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASTSchoolManagement_V2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASTSchoolManagement_V2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASTSchoolManagement_V2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASTSchoolManagement_V2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASTSchoolManagement_V2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET RECOVERY FULL 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET  MULTI_USER 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASTSchoolManagement_V2', N'ON'
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET QUERY_STORE = OFF
GO
USE [ASTSchoolManagement_V2]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DiscountTypeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_DiscountFee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountTypes]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_DiscountTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DesignationId] [int] NULL,
	[NationalIdNumber] [nvarchar](30) NOT NULL,
	[PhoneNo] [nvarchar](15) NULL,
	[Address] [nvarchar](700) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[LeavingDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeeDetails]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeeTypeId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[FeeId] [int] NOT NULL,
	[DiscountId] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_FeeDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fees]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Fees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeeTypes]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[isMonthly] [bit] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_FeeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](100) NULL,
	[Title] [nvarchar](100) NULL,
	[FeeId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privileges]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](100) NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Privileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePrivileges]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePrivileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[PrivilegeID] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_RolePrivileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentDiscountDetails]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDiscountDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[FeeTypeId] [int] NOT NULL,
	[DiscountId] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_StudentDiscountDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGrades]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGrades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[LastGradeId] [int] NULL,
	[IsCurrent] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_StudentGrades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rollno] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsStudentDiscount] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[EmployeeId] [int] NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoucherDetails]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoucherDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VoucherId] [int] NOT NULL,
	[FeesType] [nchar](100) NOT NULL,
	[FeesAmount] [decimal](18, 2) NOT NULL,
	[DiscountType] [nvarchar](50) NOT NULL,
	[DiscountValue] [int] NOT NULL,
	[DiscountAmount] [decimal](18, 2) NOT NULL,
	[IsDiscounted] [bit] NOT NULL,
 CONSTRAINT [PK_VoucherDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNo] [nvarchar](10) NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[FeesMonth] [datetime] NOT NULL,
	[GradeId] [int] NOT NULL,
	[GradeTitle] [nvarchar](100) NOT NULL,
	[StudentId] [int] NOT NULL,
	[StudentName] [nvarchar](100) NOT NULL,
	[Rollno] [nvarchar](50) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[ImageId] [int] NULL,
	[Status] [nvarchar](20) NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[PaidBy] [int] NULL,
	[PaidOn] [nchar](10) NULL,
	[GeneratedBy] [int] NOT NULL,
	[GeneratedOn] [datetime] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, CAST(40.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-10-19T11:07:21.523' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (10, CAST(20.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-10-19T15:15:15.320' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (11, CAST(11.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-10-19T15:38:23.813' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscountTypes] ON 
GO
INSERT [dbo].[DiscountTypes] ([Id], [Title], [Description], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'Percentage', N'Percentage', 1, CAST(N'2023-11-10T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DiscountTypes] ([Id], [Title], [Description], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, N'Amount', N'Amount', 1, CAST(N'2023-11-10T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[DiscountTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Id], [Code], [Name], [DesignationId], [NationalIdNumber], [PhoneNo], [Address], [Email], [JoiningDate], [LeavingDate], [TerminationDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'E112', N'UMER', 0, N'12221', N'122112', N'abc12', N'Umer@gmail.com', CAST(N'2023-10-04T16:03:00.000' AS DateTime), CAST(N'2023-10-04T16:46:00.000' AS DateTime), CAST(N'2023-10-13T17:50:00.000' AS DateTime), 1, 1, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-06T16:37:05.893' AS DateTime), 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[FeeDetails] ON 
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 16, CAST(2000.00 AS Decimal(18, 2)), 23, 2, 1, CAST(N'2023-10-19T11:07:21.523' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 16, CAST(10000.00 AS Decimal(18, 2)), 22, 10, 1, CAST(N'2023-10-19T15:15:15.320' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 17, CAST(5000.00 AS Decimal(18, 2)), 22, 0, 1, CAST(N'2023-10-19T15:15:15.320' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FeeDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Fees] ON 
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (22, CAST(13000.00 AS Decimal(18, 2)), 1, CAST(N'2023-10-19T10:48:15.810' AS DateTime), CAST(N'2023-10-19T15:15:15.317' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (23, CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2023-10-19T10:48:45.653' AS DateTime), CAST(N'2023-10-19T11:07:21.460' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (24, CAST(1608.76 AS Decimal(18, 2)), 1, CAST(N'2023-10-19T12:05:24.640' AS DateTime), CAST(N'2023-10-19T12:07:06.563' AS DateTime), 1, 1, 1, CAST(N'2023-10-19T12:41:23.573' AS DateTime), 1)
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (25, CAST(33300.00 AS Decimal(18, 2)), 1, CAST(N'2023-10-19T12:42:29.130' AS DateTime), CAST(N'2023-10-19T12:47:55.720' AS DateTime), 1, 1, 1, CAST(N'2023-10-19T12:48:03.203' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Fees] OFF
GO
SET IDENTITY_INSERT [dbo].[FeeTypes] ON 
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (16, N'exam', N'exam', 1, 1, CAST(N'2023-10-19T10:47:34.397' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (17, N'test', N'test', 1, 1, CAST(N'2023-10-19T12:06:42.557' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FeeTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (11, N'Grade1', N'Grade 1', 22, 1, CAST(N'2023-10-19T10:48:16.010' AS DateTime), CAST(N'2023-10-19T15:15:15.327' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (12, N'grade2', N'Graade 2', 23, 1, CAST(N'2023-10-19T10:48:45.667' AS DateTime), CAST(N'2023-10-19T11:07:21.743' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (13, N'test', N'test', 24, 1, CAST(N'2023-10-19T12:05:25.013' AS DateTime), CAST(N'2023-10-19T12:07:06.643' AS DateTime), 1, 1, 1, CAST(N'2023-10-19T12:41:24.807' AS DateTime), 1)
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (14, N'test', N'test', 25, 1, CAST(N'2023-10-19T12:42:29.223' AS DateTime), CAST(N'2023-10-19T12:47:55.733' AS DateTime), 1, 1, 1, CAST(N'2023-10-19T12:48:03.207' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
SET IDENTITY_INSERT [dbo].[Privileges] ON 
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'ADD_PRIVILEGE', N'Add Privilege', 1, 1, CAST(N'2023-10-06T11:09:38.563' AS DateTime), 1, CAST(N'2023-10-06T18:21:10.333' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, N'EDIT_PRIVILEGE', N'Edit Privilege', 1, 1, CAST(N'2023-10-06T11:09:54.580' AS DateTime), 1, CAST(N'2023-10-06T18:27:49.117' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (3, N'DELETE_PRIVILEGE', N'Delete Privilege', 1, 1, CAST(N'2023-10-06T11:10:18.397' AS DateTime), 1, CAST(N'2023-10-06T18:29:52.143' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (4, N'VIEW_PRIVILEGE', N'View Privilege', 1, 1, CAST(N'2023-10-06T11:10:48.877' AS DateTime), 1, CAST(N'2023-10-06T18:23:54.837' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (5, N'ADD_USER', N'Add User', 1, 1, CAST(N'2023-10-06T11:11:20.667' AS DateTime), 1, CAST(N'2023-10-06T18:22:59.017' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (6, N'EDIT_USER', N'Edit User', 1, 1, CAST(N'2023-10-06T11:11:43.640' AS DateTime), 1, CAST(N'2023-10-06T18:28:15.290' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (7, N'DELETE_USER', N'Delete User', 1, 1, CAST(N'2023-10-06T11:12:11.987' AS DateTime), 1, CAST(N'2023-10-06T18:30:21.263' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (8, N'VIEW_USER', N'View User', 1, 1, CAST(N'2023-10-06T11:12:48.537' AS DateTime), 1, CAST(N'2023-10-06T18:21:35.500' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (9, N'ADD_ROLE', N'Add Role', 1, 1, CAST(N'2023-10-06T11:13:17.477' AS DateTime), 1, CAST(N'2023-10-06T18:21:21.377' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (10, N'EDIT_ROLE', N'Edit Role', 1, 1, CAST(N'2023-10-06T11:13:30.217' AS DateTime), 1, CAST(N'2023-10-06T18:28:02.277' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (11, N'DELETE_ROLE', N'Delete Role', 1, 1, CAST(N'2023-10-06T11:13:43.647' AS DateTime), 1, CAST(N'2023-10-06T18:30:08.570' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (12, N'VIEW_ROLE', N'View Role', 1, 1, CAST(N'2023-10-06T11:13:58.813' AS DateTime), 1, CAST(N'2023-10-06T18:23:12.583' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (13, N'ADD_EMPLOYEE', N'Add Employee', 1, 1, CAST(N'2023-10-06T11:14:28.333' AS DateTime), 1, CAST(N'2023-10-06T18:20:21.423' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (14, N'EDIT_EMPLOYEE', N'Edit Employee', 1, 1, CAST(N'2023-10-06T11:14:41.707' AS DateTime), 1, CAST(N'2023-10-06T18:26:58.203' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (15, N'DELETE_EMPLOYEE', N'Delete Employee', 1, 1, CAST(N'2023-10-06T11:15:17.237' AS DateTime), 1, CAST(N'2023-10-06T18:25:17.517' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (16, N'VIEW_EMPLOYEE', N'View Employee', 1, 1, CAST(N'2023-10-06T11:15:33.883' AS DateTime), 1, CAST(N'2023-10-06T18:31:28.503' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (17, N'ADD_FEETYPE', N'Add Fee Type', 1, 1, CAST(N'2023-10-06T11:16:08.767' AS DateTime), 1, CAST(N'2023-10-11T11:09:55.970' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (18, N'EDIT_FEETYPE', N'Edit Fee Type', 1, 1, CAST(N'2023-10-06T11:16:21.633' AS DateTime), 1, CAST(N'2023-10-11T11:11:41.047' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (19, N'VIEW_FEETYPE', N'View Fee Type', 1, 1, CAST(N'2023-10-06T11:16:42.540' AS DateTime), 1, CAST(N'2023-10-11T11:10:41.920' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (20, N'DELETE_FEETYPE', N'Delete Fee Type', 1, 1, CAST(N'2023-10-06T11:16:56.673' AS DateTime), 1, CAST(N'2023-10-11T11:11:18.777' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (21, N'ADD_DISCOUNTTYPE', N'Add Discount Type', 1, 1, CAST(N'2023-10-06T11:17:23.327' AS DateTime), 1, CAST(N'2023-10-11T11:09:49.720' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (22, N'EDIT_DISCOUNTTYPE', N'Edit Discount Type', 1, 1, CAST(N'2023-10-06T11:17:46.930' AS DateTime), 1, CAST(N'2023-10-11T11:11:48.417' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (23, N'DELETE_DISCOUNTTYPE', N'Delete Discount Type', 1, 1, CAST(N'2023-10-06T11:18:00.193' AS DateTime), 1, CAST(N'2023-10-11T11:10:20.203' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (24, N'VIEW_DISCOUNTTYPE', N'View Discount Type', 1, 1, CAST(N'2023-10-06T11:18:11.113' AS DateTime), 1, CAST(N'2023-10-11T11:11:32.963' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (25, N'ADD_DISCOUNTFEE', N'Add Discount Fee', 1, 1, CAST(N'2023-10-06T11:19:00.450' AS DateTime), 2, CAST(N'2023-10-11T11:26:01.537' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (26, N'EDIT_DISCOUNTFEE', N'Edit Discount Fee', 1, 1, CAST(N'2023-10-06T11:19:18.443' AS DateTime), 1, CAST(N'2023-10-11T11:11:07.547' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (27, N'DELETE_DISCOUNTFEE', N'Delete Discount Fee', 1, 1, CAST(N'2023-10-06T11:20:25.737' AS DateTime), 1, CAST(N'2023-10-11T11:10:11.897' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (28, N'VIEW_DISCOUNTFEE', N'View Discount Fee', 1, 1, CAST(N'2023-10-06T11:20:42.297' AS DateTime), 1, CAST(N'2023-10-11T11:11:26.687' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (29, N'VIEW_ROLEPRIVILEGE', N'View Role Privilege', 1, 1, CAST(N'2023-10-06T11:23:22.997' AS DateTime), 1, CAST(N'2023-10-11T11:10:30.447' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (30, N'ADD_ROLEPRIVILEGE', N'Add Role Privilege', 1, 1, CAST(N'2023-10-06T11:24:35.603' AS DateTime), 1, CAST(N'2023-10-11T11:10:01.470' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (31, N'VIEW_STUDENT', N'View Student', 1, 1, CAST(N'2023-10-10T17:18:31.583' AS DateTime), 1, CAST(N'2023-10-10T17:18:31.830' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (32, N'ADD_STUDENT', N'Add Student', 1, 1, CAST(N'2023-10-10T17:18:47.213' AS DateTime), 1, CAST(N'2023-10-10T17:18:47.217' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (33, N'EDIT_STUDENT', N'Edit Student', 1, 1, CAST(N'2023-10-10T17:19:47.453' AS DateTime), 1, CAST(N'2023-10-10T17:19:47.450' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (34, N'DELETE_STUDENT', N'Delete Student', 1, 1, CAST(N'2023-10-10T17:20:12.640' AS DateTime), 1, CAST(N'2023-10-10T17:20:12.640' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (35, N'ADD_GRADE', N'Add Grade', 1, 1, CAST(N'2023-10-10T17:20:43.087' AS DateTime), 1, CAST(N'2023-10-10T17:20:43.087' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (36, N'VIEW_GRADE', N'View Grade', 1, 1, CAST(N'2023-10-10T17:21:00.290' AS DateTime), 1, CAST(N'2023-10-10T17:21:00.290' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (37, N'EDIT_GRADE', N'Edit Grade', 1, 1, CAST(N'2023-10-10T17:21:23.490' AS DateTime), 1, CAST(N'2023-10-10T17:21:23.490' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (38, N'DELETE_GRADE', N'Delete Grade', 1, 1, CAST(N'2023-10-10T17:21:43.953' AS DateTime), 1, CAST(N'2023-10-10T17:21:43.950' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (39, N'Dashboard', N'Dashboard', 1, 1, CAST(N'2023-10-19T16:05:02.550' AS DateTime), 1, CAST(N'2023-10-19T16:05:02.563' AS DateTime), 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Privileges] OFF
GO
SET IDENTITY_INSERT [dbo].[RolePrivileges] ON 
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1125, 2, 1, 1, CAST(N'2023-10-11T11:14:39.103' AS DateTime), 1, CAST(N'2023-10-11T11:14:39.177' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1126, 2, 2, 1, CAST(N'2023-10-11T11:14:39.103' AS DateTime), 1, CAST(N'2023-10-11T11:14:39.177' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1127, 2, 4, 1, CAST(N'2023-10-11T11:14:39.103' AS DateTime), 1, CAST(N'2023-10-11T11:14:39.177' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1280, 1, 1, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1281, 1, 2, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1282, 1, 3, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1283, 1, 4, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1284, 1, 5, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1285, 1, 6, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1286, 1, 7, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1287, 1, 8, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1288, 1, 9, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1289, 1, 10, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1290, 1, 11, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1291, 1, 12, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1292, 1, 13, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1293, 1, 14, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1294, 1, 15, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1295, 1, 16, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1296, 1, 17, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1297, 1, 18, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1298, 1, 19, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1299, 1, 20, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1300, 1, 29, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1301, 1, 30, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1302, 1, 31, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1303, 1, 32, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1304, 1, 33, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1305, 1, 34, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1306, 1, 35, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1307, 1, 36, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1308, 1, 37, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1309, 1, 38, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1310, 1, 39, 1, CAST(N'2023-10-19T16:34:36.497' AS DateTime), 1, CAST(N'2023-10-19T16:34:36.510' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[RolePrivileges] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'admin', 1, 1, CAST(N'2023-10-02T18:56:07.587' AS DateTime), 1, CAST(N'2023-10-02T18:56:07.687' AS DateTime), 0, CAST(N'2023-10-03T14:37:25.503' AS DateTime), NULL)
GO
INSERT [dbo].[Roles] ([Id], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, N'Super Admin', 1, 1, CAST(N'2023-10-02T19:08:43.623' AS DateTime), 1, CAST(N'2023-10-02T19:08:58.997' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Roles] ([Id], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (3, N'test', 1, 1, CAST(N'2023-10-02T19:10:44.343' AS DateTime), 1, CAST(N'2023-10-02T19:10:44.350' AS DateTime), 0, CAST(N'2023-10-02T19:10:47.303' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentDiscountDetails] ON 
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (5, 25, 16, 11, CAST(N'2023-10-19T15:38:23.813' AS DateTime), NULL, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentDiscountDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentGrades] ON 
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, 24, 11, NULL, 1, 1, CAST(N'2023-10-19T10:49:02.947' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, 25, 12, NULL, 1, 1, CAST(N'2023-10-19T11:01:39.047' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (3, 26, 11, NULL, 1, 1, CAST(N'2023-10-19T12:45:02.400' AS DateTime), NULL, 1, NULL, 1, CAST(N'2023-10-19T12:49:45.467' AS DateTime), 1)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (4, 27, 11, NULL, 1, 1, CAST(N'2023-10-19T13:18:02.427' AS DateTime), NULL, 1, NULL, 1, CAST(N'2023-10-19T13:18:12.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[StudentGrades] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (24, N'11', N'Ali', 0, 1, CAST(N'2023-10-19T10:49:02.897' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (25, N'12', N'ahmad ali', 1, 1, CAST(N'2023-10-19T11:01:38.783' AS DateTime), CAST(N'2023-10-19T15:38:23.807' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (26, N'd', N'd', 1, 1, CAST(N'2023-10-19T12:45:02.377' AS DateTime), CAST(N'2023-10-19T12:48:36.260' AS DateTime), 1, 1, 1, CAST(N'2023-10-19T12:49:48.310' AS DateTime), 1)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (27, N'qqq', N'qqqq', 0, 1, CAST(N'2023-10-19T13:18:02.177' AS DateTime), NULL, 1, NULL, 1, CAST(N'2023-10-19T13:18:12.020' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [LoginName], [Password], [EmployeeId], [RoleId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'umer', N'9UvKX6WDsYE6WGCMzrgARWKV13QhRiO/RXYMVYY8G1E=', 1, 1, 1, 1, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-06T16:36:40.860' AS DateTime), 0, CAST(N'2023-10-03T14:45:20.273' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[VoucherDetails] ON 
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (27, 12, N'exam                                                                                                ', CAST(10000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (28, 12, N'test                                                                                                ', CAST(5000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (29, 13, N'exam                                                                                                ', CAST(10000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (30, 13, N'test                                                                                                ', CAST(5000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[VoucherDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Vouchers] ON 
GO
INSERT [dbo].[Vouchers] ([Id], [VoucherNo], [IssueDate], [DueDate], [FeesMonth], [GradeId], [GradeTitle], [StudentId], [StudentName], [Rollno], [TotalAmount], [ImageId], [Status], [IsPaid], [PaidBy], [PaidOn], [GeneratedBy], [GeneratedOn], [DeletedBy], [DeletedOn]) VALUES (12, N'00012', CAST(N'2023-10-23T15:22:09.500' AS DateTime), CAST(N'2023-11-02T15:22:09.500' AS DateTime), CAST(N'2023-10-23T15:22:09.500' AS DateTime), 11, N'Grade 1', 24, N'Ali', N'11', CAST(13000.00 AS Decimal(18, 2)), NULL, N'initiated', 0, NULL, NULL, 1, CAST(N'2023-10-23T15:22:09.500' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vouchers] ([Id], [VoucherNo], [IssueDate], [DueDate], [FeesMonth], [GradeId], [GradeTitle], [StudentId], [StudentName], [Rollno], [TotalAmount], [ImageId], [Status], [IsPaid], [PaidBy], [PaidOn], [GeneratedBy], [GeneratedOn], [DeletedBy], [DeletedOn]) VALUES (13, N'00013', CAST(N'2023-10-23T15:22:22.897' AS DateTime), CAST(N'2023-11-02T15:22:22.897' AS DateTime), CAST(N'2023-10-23T15:22:22.897' AS DateTime), 11, N'Grade 1', 26, N'd', N'd', CAST(13000.00 AS Decimal(18, 2)), NULL, N'initiated', 0, NULL, NULL, 1, CAST(N'2023-10-23T15:22:22.897' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Vouchers] OFF
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_Emp_departmentID]  DEFAULT ((0)) FOR [DesignationId]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_Emp_Email]  DEFAULT (N'emp@vms.com') FOR [Email]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_Emp_ActiveFrom]  DEFAULT (getdate()) FOR [JoiningDate]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_UpdatedBy]  DEFAULT ((1)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_UpdateOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_Emp_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Privileges] ADD  CONSTRAINT [DF_Privileges_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Privileges] ADD  CONSTRAINT [DF_Privileges_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Privileges] ADD  CONSTRAINT [DF_Privileges_UpdatedBy]  DEFAULT ((1)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Privileges] ADD  CONSTRAINT [DF_Privileges_UpdateOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Privileges] ADD  CONSTRAINT [DF_Privileges_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RolePrivileges] ADD  CONSTRAINT [DF_RolePrivileges_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[RolePrivileges] ADD  CONSTRAINT [DF_RolePrivileges_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[RolePrivileges] ADD  CONSTRAINT [DF_RolePrivileges_UpdatedBy]  DEFAULT ((1)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[RolePrivileges] ADD  CONSTRAINT [DF_RolePrivileges_UpdateOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_RoleCreatedID]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_RoleCreatedDate]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_RoleUpdatedID]  DEFAULT ((1)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_RoleUpdatedDate]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_RoleIsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_users_userCreatedID]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_users_userCreatedDate]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_users_userUpdatedID]  DEFAULT ((1)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_users_userUpdateDate]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_users_userIsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_DiscountFees_DiscountTypes] FOREIGN KEY([DiscountTypeId])
REFERENCES [dbo].[DiscountTypes] ([Id])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_DiscountFees_DiscountTypes]
GO
ALTER TABLE [dbo].[FeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_FeeDetails_Fees] FOREIGN KEY([FeeId])
REFERENCES [dbo].[Fees] ([Id])
GO
ALTER TABLE [dbo].[FeeDetails] CHECK CONSTRAINT [FK_FeeDetails_Fees]
GO
ALTER TABLE [dbo].[FeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_FeeDetails_FeeTypes] FOREIGN KEY([FeeTypeId])
REFERENCES [dbo].[FeeTypes] ([Id])
GO
ALTER TABLE [dbo].[FeeDetails] CHECK CONSTRAINT [FK_FeeDetails_FeeTypes]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Fees_Grades] FOREIGN KEY([FeeId])
REFERENCES [dbo].[Fees] ([Id])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Fees_Grades]
GO
ALTER TABLE [dbo].[RolePrivileges]  WITH CHECK ADD  CONSTRAINT [FK_RolePrivileges_Privileges] FOREIGN KEY([PrivilegeID])
REFERENCES [dbo].[Privileges] ([Id])
GO
ALTER TABLE [dbo].[RolePrivileges] CHECK CONSTRAINT [FK_RolePrivileges_Privileges]
GO
ALTER TABLE [dbo].[RolePrivileges]  WITH CHECK ADD  CONSTRAINT [FK_RolePrivileges_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RolePrivileges] CHECK CONSTRAINT [FK_RolePrivileges_Roles]
GO
ALTER TABLE [dbo].[StudentDiscountDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentDiscountDetails_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[StudentDiscountDetails] CHECK CONSTRAINT [FK_StudentDiscountDetails_Students]
GO
ALTER TABLE [dbo].[StudentGrades]  WITH CHECK ADD  CONSTRAINT [FK_GradeId_StudentGrade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grades] ([Id])
GO
ALTER TABLE [dbo].[StudentGrades] CHECK CONSTRAINT [FK_GradeId_StudentGrade]
GO
ALTER TABLE [dbo].[StudentGrades]  WITH CHECK ADD  CONSTRAINT [FK_StudentId__StudentGrade] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[StudentGrades] CHECK CONSTRAINT [FK_StudentId__StudentGrade]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_Employees]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_role]
GO
ALTER TABLE [dbo].[VoucherDetails]  WITH CHECK ADD  CONSTRAINT [FK_VoucherDetails_Vouchers] FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Vouchers] ([Id])
GO
ALTER TABLE [dbo].[VoucherDetails] CHECK CONSTRAINT [FK_VoucherDetails_Vouchers]
GO
ALTER TABLE [dbo].[Vouchers]  WITH CHECK ADD  CONSTRAINT [FK_Vouchers_Vouchers] FOREIGN KEY([Id])
REFERENCES [dbo].[Vouchers] ([Id])
GO
ALTER TABLE [dbo].[Vouchers] CHECK CONSTRAINT [FK_Vouchers_Vouchers]
GO
/****** Object:  StoredProcedure [dbo].[SP_GenerateVouchers]    Script Date: 10/23/2023 3:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_GenerateVouchers]
AS
BEGIN
Select '00001' VoucherNo, '2023-10-02' IssueDate,'Muhammad Umer' StudentName,'FS1-A' ClassSection,'2023-10-10' DueDate

DECLARE @CalculatedFees TABLE 
( 
    FeeTypeId INT, 
    FeeAmount decimal(10,2)
);

Insert INTO @CalculatedFees  
Select FeeTypeId,Fee as FeeAmount FROM (
Select 1 as FeeTypeId,1000 as Fee
UNION ALL
Select 2 as FeeTypeId,5000 as Fee
UNION ALL
Select 4 as FeeTypeId,1000 as Fee
UNION ALL
Select 5 as FeeTypeId,4000 as Fee
) as temp


SELECT ft.Id as FeeTypeId,ISNULL(FeeAmount,0) as FeeAmount,Title as FeeTypeTitle from @CalculatedFees cf
right join FeeTypes ft on  cf.FeeTypeId  = ft.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserLogin]    Script Date: 10/23/2023 3:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UserLogin]
(
@Username nvarchar(100),
@Password nvarchar(100)
)
AS
BEGIN
SELECT 
    u.Id as UserId,
    u.RoleId as RoleId,
    e.Email as Email,
    e.Name as FullName,
    u.LoginName as Username,
    STRING_AGG(p.Code, ',') as PrivilegeCodes
FROM 
    Users u
INNER JOIN 
    Employees e ON u.EmployeeId = e.Id
INNER JOIN 
    RolePrivileges rp ON rp.RoleID = u.RoleId
INNER JOIN 
    Privileges p ON rp.PrivilegeID = p.Id
WHERE 
    u.LoginName = @Username
    AND u.[Password] = @Password
GROUP BY 
    u.Id, u.RoleId, e.Email, e.Name, u.LoginName
END
GO
USE [master]
GO
ALTER DATABASE [ASTSchoolManagement_V2] SET  READ_WRITE 
GO
