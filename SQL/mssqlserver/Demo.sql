CREATE DATABASE Demo
GO
USE [Demo]
GO
/****** Object:  Table [dbo].[t_org]    Script Date: 2020/2/6 18:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_org](
	[IDENTIFICATION] [bigint] IDENTITY(1,1) NOT NULL,
	[ORGNAME] [varchar](50) NULL,
	[ORGCODE] [varchar](50) NULL,
	[PARENTCODE] [varchar](50) NULL,
	[DESCRIPTION] [varchar](50) NULL,
 CONSTRAINT [PK_t_org] PRIMARY KEY CLUSTERED 
(
	[IDENTIFICATION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_role]    Script Date: 2020/2/6 18:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_role](
	[Identification] [bigint] IDENTITY(1,1) NOT NULL,
	[Appellation] [varchar](50) NULL,
 CONSTRAINT [PK_T_ROLE] PRIMARY KEY CLUSTERED 
(
	[Identification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_umr]    Script Date: 2020/2/6 18:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_umr](
	[RID] [bigint] NULL,
	[UUID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 2020/2/6 18:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_user](
	[IDENTIFICATION] [bigint] IDENTITY(1,1) NOT NULL,
	[USERNAME] [varchar](50) NOT NULL,
	[USERPWD] [varchar](50) NULL,
	[EMPLOYEENAME] [varchar](50) NULL,
	[ORGCODE] [varchar](50) NULL,
	[ORGNAME] [varchar](50) NULL,
 CONSTRAINT [PK_t_user] PRIMARY KEY CLUSTERED 
(
	[IDENTIFICATION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_vacation]    Script Date: 2020/2/6 18:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vacation](
	[NID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Day] [int] NULL,
	[Reason] [text] NULL,
	[InstanceID] [varchar](50) NULL,
	[CateCode] [varchar](50) NULL,
	[CreateDateTime] [datetime] NULL,
	[VacationType] [varchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[NodeName] [varchar](50) NULL,
 CONSTRAINT [PK_t_vacation] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_vacation] ADD  CONSTRAINT [DF_t_vacation_NID]  DEFAULT (newid()) FOR [NID]
GO
ALTER TABLE [dbo].[t_vacation] ADD  CONSTRAINT [DF_t_vacation_NodeName]  DEFAULT ('开始') FOR [NodeName]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单精型编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_vacation', @level2type=N'COLUMN',@level2name=N'CateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_vacation', @level2type=N'COLUMN',@level2name=N'CreateDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请假类型（事假、病假、产假）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_vacation', @level2type=N'COLUMN',@level2name=N'VacationType'
GO
