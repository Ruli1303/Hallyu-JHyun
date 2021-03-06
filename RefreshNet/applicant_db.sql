USE [master]
GO
/****** Object:  Database [applicant_db]    Script Date: 08/07/2020 15:51:17 ******/
CREATE DATABASE [applicant_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'applicant_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\applicant_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'applicant_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\applicant_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [applicant_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [applicant_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [applicant_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [applicant_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [applicant_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [applicant_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [applicant_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [applicant_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [applicant_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [applicant_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [applicant_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [applicant_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [applicant_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [applicant_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [applicant_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [applicant_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [applicant_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [applicant_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [applicant_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [applicant_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [applicant_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [applicant_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [applicant_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [applicant_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [applicant_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [applicant_db] SET  MULTI_USER 
GO
ALTER DATABASE [applicant_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [applicant_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [applicant_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [applicant_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [applicant_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [applicant_db] SET QUERY_STORE = OFF
GO
USE [applicant_db]
GO
/****** Object:  Table [dbo].[tb_peserta]    Script Date: 08/07/2020 15:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_peserta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nama] [varchar](50) NOT NULL,
	[No_hp] [varchar](13) NOT NULL,
	[Email] [varchar](30) NULL,
	[Tanggal_lahir] [datetime] NOT NULL,
	[Alamat] [varchar](100) NOT NULL,
	[Jurusan] [varchar](10) NOT NULL,
	[Pertanyaan] [varchar](1000) NULL,
	[Create_by] [varchar](10) NOT NULL,
	[Create_on] [datetime] NOT NULL,
	[Modified_by] [varchar](10) NULL,
	[Modified_on] [datetime] NULL,
	[Delete_by] [varchar](10) NULL,
	[Delete_on] [datetime] NULL,
	[Is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_tb_peserta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_peserta] ON 

INSERT [dbo].[tb_peserta] ([Id], [Nama], [No_hp], [Email], [Tanggal_lahir], [Alamat], [Jurusan], [Pertanyaan], [Create_by], [Create_on], [Modified_by], [Modified_on], [Delete_by], [Delete_on], [Is_delete]) VALUES (1, N'Nurul Hayati', N'081211495023', N'cupidd.cipudd@gmail.com', CAST(N'1993-07-16T00:00:00.000' AS DateTime), N'Depok', N'IT', NULL, N'Admin', CAST(N'2020-07-08T14:03:11.360' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[tb_peserta] ([Id], [Nama], [No_hp], [Email], [Tanggal_lahir], [Alamat], [Jurusan], [Pertanyaan], [Create_by], [Create_on], [Modified_by], [Modified_on], [Delete_by], [Delete_on], [Is_delete]) VALUES (2, N'M Fajar', N'0812131411', N'sidiqfajar@gmail.com', CAST(N'1997-06-19T00:00:00.000' AS DateTime), N'Jakarta', N'Non IT', NULL, N'Admin', CAST(N'2020-07-08T14:28:37.947' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[tb_peserta] ([Id], [Nama], [No_hp], [Email], [Tanggal_lahir], [Alamat], [Jurusan], [Pertanyaan], [Create_by], [Create_on], [Modified_by], [Modified_on], [Delete_by], [Delete_on], [Is_delete]) VALUES (3, N'Lukman Hakim', N'081235567811', N'lukmanhakim@gmail.com', CAST(N'1998-03-11T00:00:00.000' AS DateTime), N'Depok', N'IT', NULL, N'Admin', CAST(N'2020-07-08T14:54:08.167' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[tb_peserta] ([Id], [Nama], [No_hp], [Email], [Tanggal_lahir], [Alamat], [Jurusan], [Pertanyaan], [Create_by], [Create_on], [Modified_by], [Modified_on], [Delete_by], [Delete_on], [Is_delete]) VALUES (4, N'Neta Noviana', N'098798282828', N'neta99@yahoo.com', CAST(N'1997-06-28T00:00:00.000' AS DateTime), N'Jakarta', N'IT', NULL, N'Admin', CAST(N'2020-07-08T15:03:57.163' AS DateTime), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[tb_peserta] OFF
USE [master]
GO
ALTER DATABASE [applicant_db] SET  READ_WRITE 
GO
