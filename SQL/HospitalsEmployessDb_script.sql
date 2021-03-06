USE [master]
GO
/****** Object:  Database [HospitalsEmployees]    Script Date: 14.11.2018 21:04:07 ******/
CREATE DATABASE [HospitalsEmployees]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalsEmployees', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HospitalsEmployees.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalsEmployees_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HospitalsEmployees_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HospitalsEmployees] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalsEmployees].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalsEmployees] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalsEmployees] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalsEmployees] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalsEmployees] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalsEmployees] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalsEmployees] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalsEmployees] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalsEmployees] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalsEmployees] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalsEmployees] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalsEmployees] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalsEmployees] SET QUERY_STORE = OFF
GO
USE [HospitalsEmployees]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HospitalsEmployees]
GO
/****** Object:  Table [dbo].[tblDepartments]    Script Date: 14.11.2018 21:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 14.11.2018 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblDepartments] ON 

INSERT [dbo].[tblDepartments] ([Id], [Name]) VALUES (1, N'orto')
INSERT [dbo].[tblDepartments] ([Id], [Name]) VALUES (2, N'Neurology')
INSERT [dbo].[tblDepartments] ([Id], [Name]) VALUES (3, N'Cardiac')
SET IDENTITY_INSERT [dbo].[tblDepartments] OFF
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (1, N'Marian', N'Klakier', N'Upalna', N'546875142', N'marian@k.com', 4800, 2)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (2, N'Karolina', N'Maczek', N'Storczykowa', N'786534267', N'karolina@m.com', 5200, 1)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (3, N'Agata', N'Czarnecka', N'Poziomkowa', N'574879789', N'agata@c.com', 4900, 2)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (4, N'Waldemar', N'Wierzbicki', N'Rzeczna', N'745142325', N'waldemar@w.com', 3700, 3)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (5, N'Dorota', N'Piekutowska', N'Zagumienna', N'892738927', N'dorota@p.com', 5100, 1)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (6, N'Marta', N'Kownacka', N'Wiejska', N'764536834', N'marta@k.com', 4200, 3)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (7, N'Michał', N'Chomczyk', N'Krakowska', N'987364789', N'michal@c.com', 4500, 2)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (8, N'Adam', N'Adamik', N'Kopernika', N'675812817', N'adam@a.com', 3900, 1)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (9, N'Janusz', N'Polecki', N'Skrajna', N'519243746', N'janusz@p.com', 3400, 3)
INSERT [dbo].[tblEmployee] ([ID], [FirstName], [LastName], [Address], [Telephone], [Email], [Salary], [DepartmentID]) VALUES (13, N'Karol', N'Pilecki', N'Kryta', N'52637689', N'karol@p.com', 5100, NULL)
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [TideEmployee_TideDepartments_FK] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartments] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [TideEmployee_TideDepartments_FK]
GO
/****** Object:  StoredProcedure [dbo].[procAdress]    Script Date: 14.11.2018 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[procAdress]
@FirstName nvarchar(50),
@LastName nvarchar(50)

as
	Begin

		Select FirstName, LastName, Adress from TideEmployee
		Where FirstName = @FirstName and LastName = @LastName

	End
GO
/****** Object:  StoredProcedure [dbo].[procEmployeeDelete]    Script Date: 14.11.2018 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[procEmployeeDelete] @ID bigint
as

set nocount on;



			delete 
			from tblEmployee 
			where ID = @ID
					
GO
/****** Object:  StoredProcedure [dbo].[procEmployeeInsert]    Script Date: 14.11.2018 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[procEmployeeInsert] @FirstName nvarchar(50), @LastName nvarchar(50), @Address nvarchar(50), 
										@Telephone nvarchar(50), @Email nvarchar(50), @Salary int
as

set nocount on;



			insert into tblEmployee (FirstName, LastName, Address, Telephone, Email, Salary)
					
					values (@FirstName, @LastName, @Address, @Telephone, @Email, @Salary)
GO
/****** Object:  StoredProcedure [dbo].[procEmployeeList]    Script Date: 14.11.2018 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[procEmployeeList] 
as

set nocount on;


					Select e.LastName
from tblEmployee e with(nolock)
GO
USE [master]
GO
ALTER DATABASE [HospitalsEmployees] SET  READ_WRITE 
GO
