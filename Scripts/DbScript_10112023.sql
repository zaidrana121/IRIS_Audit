USE [ASTSchoolManagement_Prod]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 11/10/2023 5:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DiscountTypeId] [int] NOT NULL,
	[Reason] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[DiscountTypes]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[FeeDetails]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[Fees]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[FeeTypes]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[Grades]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[Privileges]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[RolePrivileges]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[StudentDiscountDetails]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[StudentFeeTypes]    Script Date: 11/10/2023 5:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFeeTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[FeeTypeId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentFeeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGrades]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[VoucherArrears]    Script Date: 11/10/2023 5:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoucherArrears](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VoucherId] [int] NOT NULL,
	[VoucherArrearId] [int] NOT NULL,
	[IsPaid] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CraetedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_VoucherArrears] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoucherDetails]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  Table [dbo].[Vouchers]    Script Date: 11/10/2023 5:30:06 PM ******/
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
	[IsPaid] [bit] NULL,
	[PaidBy] [int] NULL,
	[PaidOn] [datetime] NULL,
	[GeneratedBy] [int] NOT NULL,
	[GeneratedOn] [datetime] NOT NULL,
	[IsMonthly] [bit] NOT NULL,
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
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (6, CAST(4078.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-10-31T02:30:22.937' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (7, CAST(5200.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-03T00:40:13.117' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (8, CAST(100.00 AS Decimal(18, 2)), 1, N'', 1, CAST(N'2023-11-03T00:40:13.173' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (9, CAST(100.00 AS Decimal(18, 2)), 1, N'', 1, CAST(N'2023-11-03T00:40:13.180' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (10, CAST(100.00 AS Decimal(18, 2)), 1, N'', 1, CAST(N'2023-11-03T00:40:13.183' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (11, CAST(4078.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-03T00:58:11.440' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (12, CAST(100.00 AS Decimal(18, 2)), 1, N'', 1, CAST(N'2023-11-03T00:58:11.457' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (13, CAST(100.00 AS Decimal(18, 2)), 1, N'', 1, CAST(N'2023-11-03T00:58:11.463' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (14, CAST(100.00 AS Decimal(18, 2)), 1, N'', 1, CAST(N'2023-11-03T00:58:11.463' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (15, CAST(4672.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-03T01:19:01.047' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (17, CAST(3700.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-03T02:37:07.823' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (19, CAST(4130.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-03T02:57:37.110' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (20, CAST(4720.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-03T02:58:09.750' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (21, CAST(4780.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-03T03:00:36.613' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (22, CAST(4240.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T21:57:30.523' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (23, CAST(2890.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T22:36:38.430' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (24, CAST(3700.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T22:40:17.827' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (25, CAST(3700.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T22:46:13.227' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (26, CAST(5320.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T22:54:12.520' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (27, CAST(2950.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T22:55:40.683' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (28, CAST(5300.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T22:58:27.040' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (29, CAST(4130.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T23:00:07.407' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (30, CAST(4780.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T23:05:38.587' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discounts] ([Id], [Amount], [DiscountTypeId], [Reason], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (31, CAST(2950.00 AS Decimal(18, 2)), 2, N'', 1, CAST(N'2023-11-05T23:07:16.880' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
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
INSERT [dbo].[Employees] ([Id], [Code], [Name], [DesignationId], [NationalIdNumber], [PhoneNo], [Address], [Email], [JoiningDate], [LeavingDate], [TerminationDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'E112', N'Admin', 0, N'11111-1111111-1', N'122112', N'abc12', N'Admin@gmail.com', CAST(N'2023-10-04T00:00:00.000' AS DateTime), CAST(N'2023-10-04T00:00:00.000' AS DateTime), CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1, 1, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-11-03T01:49:40.380' AS DateTime), 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[FeeDetails] ON 
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 3, CAST(11800.00 AS Decimal(18, 2)), 2, 0, 1, CAST(N'2023-10-31T02:27:08.627' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 7, CAST(6000.00 AS Decimal(18, 2)), 2, 0, 1, CAST(N'2023-10-31T02:27:08.630' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 3, CAST(11800.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 4, CAST(11000.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, 5, CAST(600.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (15, 7, CAST(6000.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (16, 8, CAST(0.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (17, 2, CAST(0.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (18, 6, CAST(0.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (19, 9, CAST(0.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (20, 10, CAST(0.00 AS Decimal(18, 2)), 3, 0, 1, CAST(N'2023-11-03T00:30:50.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (21, 4, CAST(11000.00 AS Decimal(18, 2)), 4, 0, 1, CAST(N'2023-11-05T21:55:28.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (22, 8, CAST(950.00 AS Decimal(18, 2)), 4, 0, 1, CAST(N'2023-11-05T21:55:28.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (23, 3, CAST(11800.00 AS Decimal(18, 2)), 4, 0, 1, CAST(N'2023-11-05T21:55:28.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (24, 5, CAST(600.00 AS Decimal(18, 2)), 4, 0, 1, CAST(N'2023-11-05T21:55:28.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (25, 7, CAST(6000.00 AS Decimal(18, 2)), 4, 0, 1, CAST(N'2023-11-05T21:55:28.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (26, 10, CAST(0.00 AS Decimal(18, 2)), 4, 0, 1, CAST(N'2023-11-05T21:55:28.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (27, 9, CAST(0.00 AS Decimal(18, 2)), 4, 0, 1, CAST(N'2023-11-05T21:55:28.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (28, 6, CAST(0.00 AS Decimal(18, 2)), 4, 0, 1, CAST(N'2023-11-05T21:55:28.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (29, 3, CAST(11800.00 AS Decimal(18, 2)), 5, 0, 1, CAST(N'2023-11-07T19:47:39.710' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (30, 4, CAST(11000.00 AS Decimal(18, 2)), 5, 0, 1, CAST(N'2023-11-07T19:47:39.710' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (31, 5, CAST(600.00 AS Decimal(18, 2)), 5, 0, 1, CAST(N'2023-11-07T19:47:39.710' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (32, 7, CAST(6000.00 AS Decimal(18, 2)), 5, 0, 1, CAST(N'2023-11-07T19:47:39.710' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (33, 8, CAST(950.00 AS Decimal(18, 2)), 5, 0, 1, CAST(N'2023-11-07T19:47:39.710' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (34, 10, CAST(0.00 AS Decimal(18, 2)), 5, 0, 1, CAST(N'2023-11-07T19:47:39.710' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (35, 6, CAST(0.00 AS Decimal(18, 2)), 5, 0, 1, CAST(N'2023-11-07T19:47:39.710' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FeeDetails] ([Id], [FeeTypeId], [Amount], [FeeId], [DiscountId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (36, 9, CAST(0.00 AS Decimal(18, 2)), 5, 0, 1, CAST(N'2023-11-07T19:47:39.710' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FeeDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Fees] ON 
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, CAST(30260.00 AS Decimal(18, 2)), 1, CAST(N'2023-10-30T06:04:43.060' AS DateTime), NULL, 1, NULL, 1, CAST(N'2023-10-31T02:22:44.350' AS DateTime), 1)
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, CAST(17800.00 AS Decimal(18, 2)), 1, CAST(N'2023-10-31T02:27:08.613' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (3, CAST(29400.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-03T00:30:48.543' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (4, CAST(30350.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-05T21:51:37.007' AS DateTime), CAST(N'2023-11-05T21:55:28.283' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Fees] ([Id], [TotalAmount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (5, CAST(30350.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-07T19:47:39.463' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Fees] OFF
GO
SET IDENTITY_INSERT [dbo].[FeeTypes] ON 
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'Bus Fee', N'', 1, 1, CAST(N'2023-10-30T05:56:35.397' AS DateTime), NULL, 1, NULL, 1, CAST(N'2023-10-30T06:04:50.813' AS DateTime), 1)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, N'Monthly Test Fee', N'', 1, 1, CAST(N'2023-10-30T05:56:47.280' AS DateTime), CAST(N'2023-10-30T05:56:55.890' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (3, N'Tuition Fee', N'', 1, 1, CAST(N'2023-10-30T05:57:26.197' AS DateTime), CAST(N'2023-10-31T01:12:46.713' AS DateTime), 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (4, N'Admission Fees', N'', 1, 1, CAST(N'2023-10-30T05:59:21.073' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (5, N'Process Fee', N'', 1, 1, CAST(N'2023-10-30T06:00:16.697' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (6, N'School Trip', N'', 1, 1, CAST(N'2023-10-30T06:00:42.827' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (7, N'Van fee', N'', 1, 1, CAST(N'2023-10-30T06:01:14.717' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (8, N'HRCA Fee', N'', 1, 1, CAST(N'2023-10-30T06:01:31.573' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (9, N'Sports Fees', N'', 1, 1, CAST(N'2023-10-30T06:01:44.250' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FeeTypes] ([Id], [Title], [Description], [isMonthly], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (10, N'Miscellaneous', N'', 1, 1, CAST(N'2023-10-30T06:02:06.913' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FeeTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'G-1', N'Grade-1', 1, 1, CAST(N'2023-10-30T06:04:43.270' AS DateTime), NULL, 1, NULL, 1, CAST(N'2023-10-31T02:22:44.363' AS DateTime), 1)
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, N'FS-1', N'FS-1', 2, 1, CAST(N'2023-10-31T02:27:08.667' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (3, N'Step 7', N'Step 7', 3, 1, CAST(N'2023-11-03T00:30:50.820' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (4, N'Step 6', N'Step 6', 4, 1, CAST(N'2023-11-05T21:51:37.343' AS DateTime), CAST(N'2023-11-05T21:55:28.423' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Grades] ([Id], [Code], [Title], [FeeId], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (5, N'Step 5', N'Step 5', 5, 1, CAST(N'2023-11-07T19:47:39.820' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
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
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (40, N'VIEW_MONTHLYFEE', N'View Monthly Fee', 1, 1, CAST(N'2023-10-30T10:43:18.127' AS DateTime), 1, CAST(N'2023-10-30T10:43:18.320' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[Privileges] ([Id], [Code], [Name], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (41, N'VIEW_MANUALVOUCHER', N'View Manual Voucher', 1, 1, CAST(N'2023-10-31T15:22:25.910' AS DateTime), 1, CAST(N'2023-11-10T02:14:41.270' AS DateTime), 0, NULL, NULL)
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
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1311, 1, 1, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1312, 1, 2, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1313, 1, 3, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1314, 1, 4, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1315, 1, 5, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1316, 1, 6, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1317, 1, 7, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1318, 1, 8, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1319, 1, 9, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1320, 1, 10, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1321, 1, 11, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1322, 1, 12, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1323, 1, 13, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1324, 1, 14, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1325, 1, 15, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1326, 1, 16, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1327, 1, 17, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1328, 1, 18, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1329, 1, 19, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1330, 1, 20, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1331, 1, 29, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1332, 1, 30, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1333, 1, 31, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1334, 1, 32, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1335, 1, 33, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1336, 1, 34, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1337, 1, 35, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1338, 1, 36, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1339, 1, 37, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1340, 1, 38, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1341, 1, 39, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
GO
INSERT [dbo].[RolePrivileges] ([Id], [RoleID], [PrivilegeID], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1342, 1, 40, 1, CAST(N'2023-10-30T10:43:29.027' AS DateTime), 1, CAST(N'2023-10-30T10:43:29.060' AS DateTime))
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
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (6, 3, 3, 6, CAST(N'2023-10-31T02:30:22.933' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (7, 4, 3, 7, CAST(N'2023-11-03T00:40:13.113' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (8, 4, 4, 8, CAST(N'2023-11-03T00:40:13.173' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (9, 4, 5, 9, CAST(N'2023-11-03T00:40:13.180' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (10, 4, 7, 10, CAST(N'2023-11-03T00:40:13.183' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (11, 5, 3, 11, CAST(N'2023-11-03T00:58:11.440' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (12, 5, 4, 12, CAST(N'2023-11-03T00:58:11.457' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (13, 5, 5, 13, CAST(N'2023-11-03T00:58:11.463' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (14, 5, 7, 14, CAST(N'2023-11-03T00:58:11.463' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (15, 6, 3, 15, CAST(N'2023-11-03T01:19:01.047' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (17, 7, 3, 17, CAST(N'2023-11-03T02:37:07.820' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (19, 9, 3, 19, CAST(N'2023-11-03T02:57:37.110' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (20, 8, 3, 20, CAST(N'2023-11-03T02:58:09.750' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (21, 10, 3, 21, CAST(N'2023-11-03T03:00:36.613' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (22, 11, 3, 22, CAST(N'2023-11-05T21:57:30.520' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (23, 12, 3, 23, CAST(N'2023-11-05T22:36:38.427' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (24, 13, 3, 24, CAST(N'2023-11-05T22:40:17.827' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (25, 14, 3, 25, CAST(N'2023-11-05T22:46:13.227' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (26, 15, 3, 26, CAST(N'2023-11-05T22:54:12.520' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (27, 16, 3, 27, CAST(N'2023-11-05T22:55:40.683' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (28, 17, 3, 28, CAST(N'2023-11-05T22:58:27.040' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (29, 18, 3, 29, CAST(N'2023-11-05T23:00:07.407' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (30, 19, 3, 30, CAST(N'2023-11-05T23:05:38.587' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[StudentDiscountDetails] ([Id], [StudentId], [FeeTypeId], [DiscountId], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy]) VALUES (31, 20, 3, 31, CAST(N'2023-11-05T23:07:16.880' AS DateTime), NULL, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentDiscountDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentFeeTypes] ON 
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (1, 1, 2, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (2, 1, 3, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (3, 1, 4, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (4, 1, 5, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (5, 1, 6, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (6, 1, 7, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (7, 1, 9, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (8, 1, 8, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (9, 1, 10, 1, CAST(N'2023-10-30T06:06:11.457' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (18, 2, 2, 1, CAST(N'2023-10-31T01:04:46.443' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (19, 2, 3, 1, CAST(N'2023-10-31T01:04:46.443' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (20, 2, 4, 1, CAST(N'2023-10-31T01:04:46.443' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (21, 2, 5, 1, CAST(N'2023-10-31T01:04:46.443' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (22, 2, 6, 1, CAST(N'2023-10-31T01:04:46.443' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (23, 2, 7, 1, CAST(N'2023-10-31T01:04:46.443' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (24, 2, 9, 1, CAST(N'2023-10-31T01:04:46.443' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (25, 2, 8, 1, CAST(N'2023-10-31T01:04:46.443' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (27, 3, 3, 1, CAST(N'2023-10-31T02:30:22.917' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (28, 4, 3, 1, CAST(N'2023-11-03T00:40:13.070' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (29, 4, 4, 1, CAST(N'2023-11-03T00:40:13.070' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (30, 4, 5, 1, CAST(N'2023-11-03T00:40:13.070' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (31, 4, 7, 1, CAST(N'2023-11-03T00:40:13.070' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (32, 5, 3, 0, CAST(N'2023-11-03T00:58:11.420' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (33, 5, 4, 0, CAST(N'2023-11-03T00:58:11.420' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (34, 5, 5, 0, CAST(N'2023-11-03T00:58:11.420' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (35, 5, 7, 0, CAST(N'2023-11-03T00:58:11.420' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (36, 6, 3, 1, CAST(N'2023-11-03T01:19:01.037' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (38, 7, 3, 1, CAST(N'2023-11-03T02:37:07.750' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (40, 9, 3, 1, CAST(N'2023-11-03T02:57:37.103' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (41, 8, 3, 1, CAST(N'2023-11-03T02:58:09.750' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (42, 10, 3, 1, CAST(N'2023-11-03T03:00:36.603' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (43, 11, 3, 1, CAST(N'2023-11-05T21:57:30.473' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (44, 12, 3, 1, CAST(N'2023-11-05T22:36:38.400' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (45, 13, 3, 1, CAST(N'2023-11-05T22:40:17.813' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (46, 14, 3, 1, CAST(N'2023-11-05T22:46:13.200' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (47, 15, 3, 1, CAST(N'2023-11-05T22:54:12.513' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (48, 16, 3, 1, CAST(N'2023-11-05T22:55:40.680' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (49, 17, 3, 1, CAST(N'2023-11-05T22:58:27.033' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (50, 18, 3, 1, CAST(N'2023-11-05T23:00:07.383' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (51, 19, 3, 1, CAST(N'2023-11-05T23:05:38.580' AS DateTime))
GO
INSERT [dbo].[StudentFeeTypes] ([Id], [StudentId], [FeeTypeId], [CreatedBy], [CreatedOn]) VALUES (52, 20, 3, 1, CAST(N'2023-11-05T23:07:16.877' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[StudentFeeTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentGrades] ON 
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, 1, 1, NULL, 1, 1, CAST(N'2023-10-30T06:05:30.960' AS DateTime), NULL, 1, NULL, 1, CAST(N'2023-11-01T06:00:34.927' AS DateTime), 1)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, 2, 1, NULL, 1, 1, CAST(N'2023-10-31T01:04:24.993' AS DateTime), NULL, 1, NULL, 1, CAST(N'2023-11-01T06:00:40.930' AS DateTime), 1)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (3, 3, 2, NULL, 1, 1, CAST(N'2023-10-31T02:29:07.157' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (4, 4, 3, NULL, 1, 1, CAST(N'2023-11-03T00:40:13.250' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (5, 5, 3, NULL, 1, 1, CAST(N'2023-11-03T00:58:11.483' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (6, 6, 3, NULL, 1, 1, CAST(N'2023-11-03T01:19:01.067' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (7, 7, 3, NULL, 1, 1, CAST(N'2023-11-03T01:21:08.843' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (8, 8, 3, NULL, 1, 1, CAST(N'2023-11-03T02:54:46.697' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (9, 9, 3, NULL, 1, 1, CAST(N'2023-11-03T02:55:41.443' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (10, 10, 3, NULL, 1, 1, CAST(N'2023-11-03T03:00:36.633' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (11, 11, 4, NULL, 1, 1, CAST(N'2023-11-05T21:57:30.607' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (12, 12, 4, NULL, 1, 1, CAST(N'2023-11-05T22:36:38.523' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (13, 13, 4, NULL, 1, 1, CAST(N'2023-11-05T22:40:17.867' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (14, 14, 4, NULL, 1, 1, CAST(N'2023-11-05T22:46:13.277' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (15, 15, 4, NULL, 1, 1, CAST(N'2023-11-05T22:54:12.537' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (16, 16, 4, NULL, 1, 1, CAST(N'2023-11-05T22:55:40.697' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (17, 17, 4, NULL, 1, 1, CAST(N'2023-11-05T22:58:27.070' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (18, 18, 4, NULL, 1, 1, CAST(N'2023-11-05T23:00:07.450' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (19, 19, 4, NULL, 1, 1, CAST(N'2023-11-05T23:05:38.600' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentGrades] ([Id], [StudentId], [GradeId], [LastGradeId], [IsCurrent], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (20, 20, 4, NULL, 1, 1, CAST(N'2023-11-05T23:06:29.520' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentGrades] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'ST#61101', N'Hurain Fatima', 1, 1, CAST(N'2023-10-30T06:05:30.917' AS DateTime), CAST(N'2023-10-30T06:06:11.447' AS DateTime), 1, 1, 1, CAST(N'2023-11-01T06:00:34.997' AS DateTime), 1)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (2, N'ST#65', N'Urwa', 1, 1, CAST(N'2023-10-31T01:04:24.833' AS DateTime), CAST(N'2023-10-31T01:04:46.437' AS DateTime), 1, 1, 1, CAST(N'2023-11-01T06:00:40.940' AS DateTime), 1)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (3, N'ST#6101', N'Aiza Malik', 1, 1, CAST(N'2023-10-31T02:29:07.127' AS DateTime), CAST(N'2023-10-31T02:30:22.907' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (4, N'ST#61166', N'Dawood Hassan', 1, 1, CAST(N'2023-11-03T00:40:13.003' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (5, N'ST#61167', N'Saad Ali Rashid ', 1, 1, CAST(N'2023-11-03T00:58:11.373' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (6, N'ST#61168', N'Areeb Ameen', 1, 1, CAST(N'2023-11-03T01:19:01.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (7, N'ST#61169', N'Syed Ahmad', 1, 1, CAST(N'2023-11-03T01:21:08.790' AS DateTime), CAST(N'2023-11-03T02:37:07.697' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (8, N'ST#61170', N'Maham Rehman ', 1, 1, CAST(N'2023-11-03T02:54:46.610' AS DateTime), CAST(N'2023-11-03T02:58:09.747' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (9, N'ST#61171', N'Noor Zahra ', 1, 1, CAST(N'2023-11-03T02:55:41.423' AS DateTime), CAST(N'2023-11-03T02:57:37.093' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (10, N'ST#61173', N'Tehreem Fatima ', 1, 1, CAST(N'2023-11-03T03:00:36.573' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (11, N'ST#61158', N'Zainab Zohaib ', 1, 1, CAST(N'2023-11-05T21:57:30.443' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (12, N'ST#61159', N'M . Salah Faisal', 1, 1, CAST(N'2023-11-05T22:36:38.177' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (13, N'ST#61160', N'Fatima Zahra', 1, 1, CAST(N'2023-11-05T22:40:17.790' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (14, N'ST#61161', N'Muhammad Yousaf ', 1, 1, CAST(N'2023-11-05T22:46:13.187' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (15, N'ST#61162', N'Muhammad Ayan', 1, 1, CAST(N'2023-11-05T22:54:12.487' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (16, N'ST#61163', N'Muhammad Zeeshan', 1, 1, CAST(N'2023-11-05T22:55:40.663' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (17, N'ST#61164', N'Fatima Shahzad', 1, 1, CAST(N'2023-11-05T22:58:27.013' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (18, N'ST#61165', N'Sameer Kausar ', 1, 1, CAST(N'2023-11-05T23:00:07.197' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (19, N'ST#61174', N'Ayesha', 1, 1, CAST(N'2023-11-05T23:05:38.550' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Students] ([Id], [Rollno], [Name], [IsStudentDiscount], [IsActive], [CreatedOn], [UpdatedOn], [CreatedBy], [UpdatedBy], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (20, N'ST#61175', N'Muhammad Abu Baker', 1, 1, CAST(N'2023-11-05T23:06:29.487' AS DateTime), CAST(N'2023-11-05T23:07:16.853' AS DateTime), 1, 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [LoginName], [Password], [EmployeeId], [RoleId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [DeletedOn], [DeletedBy]) VALUES (1, N'umer', N'rFwtwE++/tR58+/0mJIhhg==', 1, 1, 1, 1, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-10-06T16:36:40.860' AS DateTime), 0, CAST(N'2023-10-03T14:45:20.273' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[VoucherDetails] ON 
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (1, 11, N'Monthly Test Fee                                                                                    ', CAST(1000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (2, 11, N'Tuition Fee                                                                                         ', CAST(7560.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (3, 11, N'Admission Fees                                                                                      ', CAST(10000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (4, 11, N'Process Fee                                                                                         ', CAST(1000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (5, 11, N'School Trip                                                                                         ', CAST(2500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (6, 11, N'Van fee                                                                                             ', CAST(3500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (7, 11, N'Sports Fees                                                                                         ', CAST(1500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (8, 11, N'HRCA Fee                                                                                            ', CAST(3200.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (9, 11, N'Miscellaneous                                                                                       ', CAST(0.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (10, 12, N'Monthly Test Fee                                                                                    ', CAST(1000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (11, 12, N'Tuition Fee                                                                                         ', CAST(7560.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (12, 12, N'Admission Fees                                                                                      ', CAST(10000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (13, 12, N'Process Fee                                                                                         ', CAST(1000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (14, 12, N'School Trip                                                                                         ', CAST(2500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (15, 12, N'Van fee                                                                                             ', CAST(3500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (16, 12, N'Sports Fees                                                                                         ', CAST(1500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (17, 12, N'HRCA Fee                                                                                            ', CAST(3200.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (18, 13, N'Monthly Test Fee                                                                                    ', CAST(1000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (19, 13, N'Tuition Fee                                                                                         ', CAST(7560.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (20, 13, N'Admission Fees                                                                                      ', CAST(10000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (21, 13, N'Process Fee                                                                                         ', CAST(1000.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (22, 13, N'School Trip                                                                                         ', CAST(2500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (23, 13, N'Van fee                                                                                             ', CAST(3500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (24, 13, N'Sports Fees                                                                                         ', CAST(1500.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (25, 13, N'HRCA Fee                                                                                            ', CAST(3200.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (26, 13, N'Miscellaneous                                                                                       ', CAST(0.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[VoucherDetails] ([Id], [VoucherId], [FeesType], [FeesAmount], [DiscountType], [DiscountValue], [DiscountAmount], [IsDiscounted]) VALUES (27, 14, N'Tuition Fee                                                                                         ', CAST(11800.00 AS Decimal(18, 2)), N'', 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[VoucherDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Vouchers] ON 
GO
INSERT [dbo].[Vouchers] ([Id], [VoucherNo], [IssueDate], [DueDate], [FeesMonth], [GradeId], [GradeTitle], [StudentId], [StudentName], [Rollno], [TotalAmount], [ImageId], [Status], [IsPaid], [PaidBy], [PaidOn], [GeneratedBy], [GeneratedOn], [IsMonthly], [DeletedBy], [DeletedOn]) VALUES (11, N'00011', CAST(N'2023-10-31T02:15:50.030' AS DateTime), CAST(N'2023-11-11T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, N'Grade-1', 1, N'Hurain Fatima', N'ST#61101', CAST(30260.00 AS Decimal(18, 2)), NULL, N'initiated', 0, NULL, NULL, 1, CAST(N'2023-10-31T02:15:50.030' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Vouchers] ([Id], [VoucherNo], [IssueDate], [DueDate], [FeesMonth], [GradeId], [GradeTitle], [StudentId], [StudentName], [Rollno], [TotalAmount], [ImageId], [Status], [IsPaid], [PaidBy], [PaidOn], [GeneratedBy], [GeneratedOn], [IsMonthly], [DeletedBy], [DeletedOn]) VALUES (12, N'00012', CAST(N'2023-10-31T02:15:50.303' AS DateTime), CAST(N'2023-11-11T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, N'Grade-1', 2, N'Urwa', N'ST#65', CAST(30260.00 AS Decimal(18, 2)), NULL, N'initiated', 0, NULL, NULL, 1, CAST(N'2023-10-31T02:15:50.303' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Vouchers] ([Id], [VoucherNo], [IssueDate], [DueDate], [FeesMonth], [GradeId], [GradeTitle], [StudentId], [StudentName], [Rollno], [TotalAmount], [ImageId], [Status], [IsPaid], [PaidBy], [PaidOn], [GeneratedBy], [GeneratedOn], [IsMonthly], [DeletedBy], [DeletedOn]) VALUES (13, N'00013', CAST(N'2023-10-31T02:17:12.447' AS DateTime), CAST(N'2023-11-03T00:00:00.000' AS DateTime), CAST(N'2022-02-01T00:00:00.000' AS DateTime), 1, N'Grade-1', 1, N'Hurain Fatima', N'ST#61101', CAST(30260.00 AS Decimal(18, 2)), NULL, N'initiated', 0, NULL, NULL, 1, CAST(N'2023-10-31T02:17:12.447' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Vouchers] ([Id], [VoucherNo], [IssueDate], [DueDate], [FeesMonth], [GradeId], [GradeTitle], [StudentId], [StudentName], [Rollno], [TotalAmount], [ImageId], [Status], [IsPaid], [PaidBy], [PaidOn], [GeneratedBy], [GeneratedOn], [IsMonthly], [DeletedBy], [DeletedOn]) VALUES (14, N'00014', CAST(N'2023-10-31T02:31:16.747' AS DateTime), CAST(N'2023-11-11T00:00:00.000' AS DateTime), CAST(N'2023-11-01T00:00:00.000' AS DateTime), 2, N'FS-1', 3, N'Aiza Malik', N'ST#6101', CAST(17800.00 AS Decimal(18, 2)), NULL, N'initiated', 0, NULL, NULL, 1, CAST(N'2023-10-31T02:31:16.747' AS DateTime), 1, NULL, NULL)
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
/****** Object:  StoredProcedure [dbo].[SP_GenerateVouchers]    Script Date: 11/10/2023 5:30:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetStudentVoucherResults]    Script Date: 11/10/2023 5:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_GetStudentVoucherResults]
    @GradeId INT,
	@FeeMonth INT,
	@FeeYear INT
AS
BEGIN
    SELECT 
        s.[Name] as StudentName,
        s.Id as StudentId,
        ISNULL(v.Id, 0) as VoucherId,
        CASE WHEN ISNULL(v.Id, 0) > 0 THEN 1 ELSE 0 END as AlreadyHasVoucher 
    FROM 
        Students s
    INNER JOIN 
        StudentGrades sg ON s.Id = sg.StudentId
    LEFT JOIN 
        Vouchers v ON v.StudentId = s.Id 
                    AND MONTH(v.FeesMonth) = @FeeMonth 
                    AND YEAR(v.FeesMonth) = @FeeYear
    WHERE 
        sg.GradeId = @GradeId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserLogin]    Script Date: 11/10/2023 5:30:06 PM ******/
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
