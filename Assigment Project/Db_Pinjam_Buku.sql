USE [master]
GO
/****** Object:  Database [Db_Pinjam_Buku]    Script Date: 26/05/2020 17:22:48 ******/
CREATE DATABASE [Db_Pinjam_Buku]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db_Pinjam_Buku', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Db_Pinjam_Buku.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Db_Pinjam_Buku_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Db_Pinjam_Buku_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Db_Pinjam_Buku] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db_Pinjam_Buku].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db_Pinjam_Buku] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET  MULTI_USER 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db_Pinjam_Buku] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Db_Pinjam_Buku] SET QUERY_STORE = OFF
GO
USE [Db_Pinjam_Buku]
GO
/****** Object:  Table [dbo].[x_biodata]    Script Date: 26/05/2020 17:22:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[x_biodata](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_by] [bigint] NOT NULL,
	[created_on] [datetime] NOT NULL,
	[modified_by] [bigint] NULL,
	[modified_on] [datetime] NULL,
	[delete_by] [bigint] NULL,
	[delete_on] [datetime] NULL,
	[is_delete] [bit] NOT NULL,
	[identity_number] [bigint] NOT NULL,
	[fullname] [varchar](255) NOT NULL,
	[pob] [varchar](100) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[religion] [varchar](50) NOT NULL,
	[email] [varchar](100) NULL,
	[phone_number1] [varchar](50) NULL,
	[faculty] [varchar](100) NOT NULL,
	[major] [varchar](100) NOT NULL,
 CONSTRAINT [PK_biodata] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[x_book]    Script Date: 26/05/2020 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[x_book](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_by] [bigint] NOT NULL,
	[created_on] [datetime] NOT NULL,
	[modified_by] [bigint] NULL,
	[modified_on] [datetime] NULL,
	[deleted_by] [bigint] NULL,
	[deleted_on] [datetime] NULL,
	[is_delete] [bit] NOT NULL,
	[category_id] [bigint] NOT NULL,
	[judul] [varchar](1000) NULL,
	[penerbit] [varchar](50) NULL,
	[pengarang] [varchar](50) NULL,
	[tahun] [varchar](4) NULL,
	[lokasi_rak] [varchar](50) NULL,
	[deskripsi] [varchar](1000) NULL,
 CONSTRAINT [PK_x_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[x_category]    Script Date: 26/05/2020 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[x_category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_by] [bigint] NOT NULL,
	[created_on] [datetime] NOT NULL,
	[modified_by] [bigint] NULL,
	[modified_on] [datetime] NULL,
	[delete_by] [bigint] NULL,
	[delete_on] [datetime] NULL,
	[is_delete] [bit] NOT NULL,
	[initial] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NULL,
 CONSTRAINT [PK_x_category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[x_peminjaman]    Script Date: 26/05/2020 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[x_peminjaman](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_by] [bigint] NOT NULL,
	[created_on] [datetime] NOT NULL,
	[modified_by] [bigint] NULL,
	[modified_on] [datetime] NULL,
	[deleted_by] [bigint] NULL,
	[deleted_on] [datetime] NULL,
	[is_delete] [bit] NOT NULL,
	[biodata_id] [bigint] NOT NULL,
	[pegawai] [varchar](100) NULL,
	[book_id] [bigint] NOT NULL,
	[tanggal_pinjam] [datetime] NOT NULL,
	[tanggal_kembali] [datetime] NOT NULL,
	[status] [varchar](20) NOT NULL,
	[tanggal_dikembalikan] [datetime] NULL,
 CONSTRAINT [PK_x_peminjaman] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Db_Pinjam_Buku] SET  READ_WRITE 
GO
