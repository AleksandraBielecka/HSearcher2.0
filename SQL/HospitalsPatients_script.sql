USE [master]
GO
/****** Object:  Database [HospitalsPatients]    Script Date: 14.04.2019 20:23:04 ******/
CREATE DATABASE [HospitalsPatients]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalsPatients', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HospitalsPatients.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalsPatients_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HospitalsPatients_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HospitalsPatients] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalsPatients].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalsPatients] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalsPatients] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalsPatients] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalsPatients] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalsPatients] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalsPatients] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalsPatients] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalsPatients] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalsPatients] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalsPatients] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalsPatients] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalsPatients] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalsPatients] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalsPatients] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalsPatients] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalsPatients] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalsPatients] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalsPatients] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalsPatients] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalsPatients] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalsPatients] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalsPatients] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalsPatients] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalsPatients] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalsPatients] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalsPatients] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalsPatients] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalsPatients] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalsPatients] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalsPatients] SET QUERY_STORE = OFF
GO
USE [HospitalsPatients]
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
USE [HospitalsPatients]
GO
/****** Object:  Table [dbo].[tblPatients]    Script Date: 14.04.2019 20:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPatients](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Physician] [nvarchar](50) NULL,
	[Diagnosis] [nvarchar](max) NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblPatients] ON 

INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (2, N'Joanna', N'Kaminska', N'Rumiankowa', N'987876762', N'Ortopedia', N'j@j.c0m', N'Piekutowska', N'', CAST(N'2019-03-24' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (3, N'Kamil', N'Minerski', N'Brukowa', N'645827534', N'Ortopedia', N'k@k.c0m', N'Adamik', N'', CAST(N'2019-01-04' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (4, N'Katarzyna', N'Chajko', N'Cicha', N'645736576', N'Kardiologia', N'k@k.c0m', N'Piekutowska', N'', CAST(N'2019-04-05' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (5, N'Michał', N'Branowski', N'Bitewna', N'987345708', N'Kardiologia', N'i@i.c0m', N'Polecki', N'', CAST(N'2019-04-17' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (6, N'Dawid', N'Wakowicz', N'Lubecka', N'656376287', N'Kardiologia', N'm@m.c0m', N'Wolińska', N'', CAST(N'2019-03-13' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (7, N'Milena', N'Lelusz', N'Poleska', N'625473652', N'Ortopedia', N'd@d.c0m', N'Piekutowska', N'', CAST(N'2019-03-19' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (8, N'Patrycja', N'Klepacka', N'Kukulskiego', N'754098024', N'Ortopedia', N'j@j.c0m', N'Piekutowska', N'', CAST(N'2019-02-28' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (9, N'Anna', N'Romanowska', N'Liliowa', N'765345288', N'Neurologia', N'a@r.com', N'Klakier', N'', CAST(N'2019-03-17' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (10, N'Dawid', N'Trocki', N'Leśna', N'845446575', N'Neurologia', N'd@t.c0m', N'Wolińska', N'', CAST(N'2019-04-01' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (11, N'Maciej', N'Poskrobko', N'Wiejska', N'589447987', N'Kardiologia', N'm@p.com', N'Skoczek', N'', CAST(N'2019-03-26' AS Date))
INSERT [dbo].[tblPatients] ([ID], [FirstName], [LastName], [Address], [Telephone], [Department], [Email], [Physician], [Diagnosis], [Date]) VALUES (12, N'Wiktoria', N'Małyszko', N'Krańcowa', N'667243119', N'Kardiologia', N'w@m.com', N'Skoczek', N'', CAST(N'2019-03-28' AS Date))
SET IDENTITY_INSERT [dbo].[tblPatients] OFF
/****** Object:  StoredProcedure [dbo].[procPatientsDelete]    Script Date: 14.04.2019 20:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procPatientsDelete] @ID bigint
as

set nocount on;

delete 
from tblPatients
where ID = @ID
					
GO
/****** Object:  StoredProcedure [dbo].[procPatientsInsert]    Script Date: 14.04.2019 20:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[procPatientsInsert] @FirstName nvarchar(50), @LastName nvarchar(50), @Address nvarchar(50), 
										@Telephone nvarchar(50), @Department nvarchar(50), @Email nvarchar(50), 
										@Physician nvarchar(50), @Diagnosis nvarchar(50), @Date date
as

set nocount on;

insert into tblPatients(FirstName, LastName, Address, Telephone, Department, Email, Physician, Diagnosis, [Date])
values (@FirstName, @LastName, @Address, @Telephone, @Department, @Email, @Physician, @Diagnosis, @Date)
GO
/****** Object:  StoredProcedure [dbo].[procPatientsList]    Script Date: 14.04.2019 20:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[procPatientsList] 
as

set nocount on;


Select LastName
from tblPatients with(nolock)
GO
USE [master]
GO
ALTER DATABASE [HospitalsPatients] SET  READ_WRITE 
GO
