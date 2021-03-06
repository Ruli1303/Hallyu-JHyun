USE [master]
GO
/****** Object:  Database [Db_Pinjam_Buku]    Script Date: 26/05/2020 17:35:04 ******/
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
/****** Object:  Table [dbo].[x_biodata]    Script Date: 26/05/2020 17:35:04 ******/
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
/****** Object:  Table [dbo].[x_book]    Script Date: 26/05/2020 17:35:04 ******/
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
/****** Object:  Table [dbo].[x_category]    Script Date: 26/05/2020 17:35:04 ******/
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
/****** Object:  Table [dbo].[x_peminjaman]    Script Date: 26/05/2020 17:35:04 ******/
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
SET IDENTITY_INSERT [dbo].[x_biodata] ON 

INSERT [dbo].[x_biodata] ([id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [identity_number], [fullname], [pob], [dob], [gender], [religion], [email], [phone_number1], [faculty], [major]) VALUES (1, 1, CAST(N'2020-05-23T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 201543500402, N'Nurul Hayati', N'Jakarta', CAST(N'1993-07-16' AS Date), 0, N'Islam', N'cupidd.cipudd@gmail.com', N'081211495023', N'FTIK', N'Informatika')
INSERT [dbo].[x_biodata] ([id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [identity_number], [fullname], [pob], [dob], [gender], [religion], [email], [phone_number1], [faculty], [major]) VALUES (2, 1, CAST(N'2020-05-23T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 201543500405, N'Citra Damayanti', N'Cileungsi', CAST(N'1996-08-05' AS Date), 0, N'Islam', N'Citradama@gmail.com', N'085699778980', N'FTIK', N'Informatika')
INSERT [dbo].[x_biodata] ([id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [identity_number], [fullname], [pob], [dob], [gender], [religion], [email], [phone_number1], [faculty], [major]) VALUES (3, 1, CAST(N'2020-05-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 201543500398, N'Eka Savhira', N'Jakarta', CAST(N'1998-08-21' AS Date), 0, N'Islam', N'Bstrayu@gmail.com', N'08788878990', N'FTIK', N'Informatika')
INSERT [dbo].[x_biodata] ([id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [identity_number], [fullname], [pob], [dob], [gender], [religion], [email], [phone_number1], [faculty], [major]) VALUES (4, 1, CAST(N'2020-05-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 201543502007, N'Karimah', N'Jakarta', CAST(N'1997-04-21' AS Date), 0, N'Islam', N'Karimah97@gmail.com', N'085678890998', N'FTIK', N'Informatika')
INSERT [dbo].[x_biodata] ([id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [identity_number], [fullname], [pob], [dob], [gender], [religion], [email], [phone_number1], [faculty], [major]) VALUES (5, 1, CAST(N'2020-05-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 201543500399, N'Firna Nafisa S', N'Ambon', CAST(N'1996-05-28' AS Date), 0, N'Islam', N'Firnarnia@gmail.com', N'087788909978', N'FTIK', N'Informatika')
INSERT [dbo].[x_biodata] ([id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [identity_number], [fullname], [pob], [dob], [gender], [religion], [email], [phone_number1], [faculty], [major]) VALUES (6, 1, CAST(N'2020-05-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 201543500202, N'Bimo Ismaya', N'Jakarta', CAST(N'1997-09-08' AS Date), 1, N'Islam', N'IsmayaBim8@gmail.com', N'081345667290', N'FBS', N'Bahasa Inggris')
SET IDENTITY_INSERT [dbo].[x_biodata] OFF
SET IDENTITY_INSERT [dbo].[x_book] ON 

INSERT [dbo].[x_book] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [category_id], [judul], [penerbit], [pengarang], [tahun], [lokasi_rak], [deskripsi]) VALUES (1, 1, CAST(N'2020-05-25T09:21:31.757' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, N'Miss Pesimis', N'PT Gramedia Pustaka Utama', N'Alia Azalea', N'2010', N'R-N1001', N'Bertahun-tahun Adriana Amandira memendam cinta pada Baron tanpa berani memperlihatkannya, karena mengira dia bukan tipe wanita yang disukai lelaki itu. Sepuluh tahun kemudian, ketika sudah sama-sama dewasa dan sukses, kenyataan berkata lain dan kesempatan terbuka untuknya untuk memiliki kebersamaan mereka.

Namun ketika Baron melamarnya, Adriana bimbang. Jika ia menerima pinangan lelaki itu, berarti dia akan melukai hati Oli, tunangan Baron yang juga teman mereka.

Adriana merasa frustrasi, patah hati. Untuk melupakan Baron, dia lalu memutuskan untuk melakukan perbuatan gila-gilaan yang belum pernah dilakukannya selama hidup, dan bukan khas dirinya. Salah satunya, dia ingin sekali berkencan dengan seseorang, sembarang lelaki, siapa pun dia. Dan Adriana tak mengira, bahwa yang datang menyambut tawarannya adalah sahabatnya sendiri....


')
INSERT [dbo].[x_book] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [category_id], [judul], [penerbit], [pengarang], [tahun], [lokasi_rak], [deskripsi]) VALUES (2, 1, CAST(N'2020-05-25T09:25:15.430' AS DateTime), 1, CAST(N'2020-05-25T23:30:09.970' AS DateTime), NULL, NULL, 0, 9, N'Fairish', N'PT Gramedia Pustaka Utama', N'Esti Kinasih', N'2002', N'R-N0801', N' "Lo pura-pura jadi pacar gue ya, Rish? Biar gue nggak dikerubutin cewek-cewek centil itu." pinta Davi. "Tapi... konsekuensinya. Dav." ujar Irish pelan. "Elo punya cowok?" Kali ini ganti Davi yang tersentak kaget. "Atau... lagi ada yang elo suka?" Irish buru-buru geleng kepala. "Bukan gitu. Kalo mereka nyangka kita beneran..." "Biarin aja. Bagus malah!" Davi menggenggam kedua tangan Irish. Akhirnya Irish menerima permintaan Davi meskipun dengan setengah hati. Tapi setelah dijalani. Irish senang kok menjadi satu-satunya cewek yang paling dekat dengan Davi, walau cuma untuk sementara dan tanpa ada ikatan apa-apa. Irish emang nggak secantik Penelope Cruz. Dia cuma cewek biasa, yang disekolah pun sama sekali nggak ngetop. Karena itu Davi merasa aman, soalnya dia merasa nggak bakalan naksir Irish. Tapi saat muncul cowok lain yang bikin Irish terpikat, kok Davi jadi nggak rela kehilangan Irish, ya?

')
INSERT [dbo].[x_book] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [category_id], [judul], [penerbit], [pengarang], [tahun], [lokasi_rak], [deskripsi]) VALUES (3, 1, CAST(N'2020-05-25T09:43:13.567' AS DateTime), NULL, NULL, NULL, NULL, 0, 3, N'Hello Jadoo', N'Bhuana Ilmu Populer', N'Lee Vin', N'1998', N'R-K1200', N'Hello Jadoo adalah sebuah serial televisi animasi Korea Selatan. Serial animasi Hello Jadoo bercerita tentang anak tomboy yang lucu dan sayang keluarganya bernama Choi Jadoo.')
INSERT [dbo].[x_book] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [category_id], [judul], [penerbit], [pengarang], [tahun], [lokasi_rak], [deskripsi]) VALUES (4, 1, CAST(N'2020-05-25T09:50:30.130' AS DateTime), 1, CAST(N'2020-05-25T10:46:22.997' AS DateTime), NULL, NULL, 0, 6, N'Sejarah Kelam Majapahit', N'Solusi Buku', N'Peri Mardiyono', N'2012', N'R-BS1001', N'Buku ini menguak sejarah kelam Kerajaan Majapahit untuk mengungkap fakta-fakta historis yang jarang disadari oleh masyarakat. Disajikan konflik-konflik kekuasaan yang pernah terjadi dalam perjalanan Majapahit. Juga tumbal-tumbal asmara yang mewarnai konflik tersebut. ')
INSERT [dbo].[x_book] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [category_id], [judul], [penerbit], [pengarang], [tahun], [lokasi_rak], [deskripsi]) VALUES (5, 1, CAST(N'2020-05-25T11:06:07.667' AS DateTime), NULL, NULL, 1, CAST(N'2020-05-25T11:10:29.797' AS DateTime), 1, 1, N'bhbub', N'ikoliii', N'kkkk', N'9099', N'R-N1001', N'hahaha')
INSERT [dbo].[x_book] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [category_id], [judul], [penerbit], [pengarang], [tahun], [lokasi_rak], [deskripsi]) VALUES (6, 1, CAST(N'2020-05-25T23:29:45.247' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, N'Boy Toy', N'PT Gramedia Pustaka Utama', N'Alia Azalea', N'2019', N'R-N1003', N'Seri Boy')
INSERT [dbo].[x_book] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [category_id], [judul], [penerbit], [pengarang], [tahun], [lokasi_rak], [deskripsi]) VALUES (7, 1, CAST(N'2020-05-26T08:39:44.807' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, N'The Wanker', N'PT Gramedia Pustaka Utama', N'Alia Azalea', N'2019', N'R-N1004', N'Boy Series')
SET IDENTITY_INSERT [dbo].[x_book] OFF
SET IDENTITY_INSERT [dbo].[x_category] ON 

INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (1, 1, CAST(N'2020-05-23T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, N'Nv', N'Novel', N'Fiksi')
INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (2, 1, CAST(N'2020-05-23T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, N'Km', N'Kamus', N'Non-Fiksi')
INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (3, 1, CAST(N'2020-05-23T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, N'Kmk', N'Komik', N'Fiksi')
INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (4, 1, CAST(N'2020-05-23T22:39:39.307' AS DateTime), NULL, NULL, NULL, NULL, 0, N'Cp', N'Cerpen', N'Fiksi')
INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (5, 1, CAST(N'2020-05-23T23:21:36.173' AS DateTime), NULL, NULL, NULL, NULL, 0, N'Ck', N'Cerita Anak ', N'Fiksi')
INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (6, 1, CAST(N'2020-05-23T23:35:45.063' AS DateTime), NULL, NULL, NULL, NULL, 0, N'Bs', N'Buku Sejarah', N'Non-Fiksi')
INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (7, 1, CAST(N'2020-05-23T23:40:55.040' AS DateTime), NULL, NULL, NULL, NULL, 0, N'Mj', N'Majalah', N'Non-Fiksi')
INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (8, 1, CAST(N'2020-05-24T00:00:26.260' AS DateTime), 1, CAST(N'2020-05-24T00:00:46.123' AS DateTime), 1, CAST(N'2020-05-24T00:13:08.907' AS DateTime), 1, N'Eks', N'Ensiklopedia', N'Non-Fiksi')
INSERT [dbo].[x_category] ([Id], [created_by], [created_on], [modified_by], [modified_on], [delete_by], [delete_on], [is_delete], [initial], [name], [description]) VALUES (9, 1, CAST(N'2020-05-25T09:28:44.080' AS DateTime), NULL, NULL, NULL, NULL, 0, N'Tn', N'Teeenlit', N'Fiksi')
SET IDENTITY_INSERT [dbo].[x_category] OFF
SET IDENTITY_INSERT [dbo].[x_peminjaman] ON 

INSERT [dbo].[x_peminjaman] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [biodata_id], [pegawai], [book_id], [tanggal_pinjam], [tanggal_kembali], [status], [tanggal_dikembalikan]) VALUES (1, 1, CAST(N'2020-05-26T12:08:19.867' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, N'Ginanjar', 1, CAST(N'2020-05-26T00:00:00.000' AS DateTime), CAST(N'2020-06-09T00:00:00.000' AS DateTime), N'Dipinjam', NULL)
INSERT [dbo].[x_peminjaman] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [biodata_id], [pegawai], [book_id], [tanggal_pinjam], [tanggal_kembali], [status], [tanggal_dikembalikan]) VALUES (2, 1, CAST(N'2020-05-26T13:04:35.007' AS DateTime), 1, CAST(N'2020-05-26T14:05:59.277' AS DateTime), NULL, NULL, 0, 2, N'Belinda', 4, CAST(N'2020-05-19T00:00:00.000' AS DateTime), CAST(N'2020-06-02T00:00:00.000' AS DateTime), N'Dikembalikan', CAST(N'2020-05-26T14:05:59.277' AS DateTime))
INSERT [dbo].[x_peminjaman] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [biodata_id], [pegawai], [book_id], [tanggal_pinjam], [tanggal_kembali], [status], [tanggal_dikembalikan]) VALUES (3, 1, CAST(N'2020-05-26T13:05:40.943' AS DateTime), NULL, NULL, 1, CAST(N'2020-05-26T13:05:50.267' AS DateTime), 1, 3, N'Bagaskara', 3, CAST(N'2020-05-12T00:00:00.000' AS DateTime), CAST(N'2020-05-26T00:00:00.000' AS DateTime), N'Dipinjam', NULL)
INSERT [dbo].[x_peminjaman] ([id], [created_by], [created_on], [modified_by], [modified_on], [deleted_by], [deleted_on], [is_delete], [biodata_id], [pegawai], [book_id], [tanggal_pinjam], [tanggal_kembali], [status], [tanggal_dikembalikan]) VALUES (4, 1, CAST(N'2020-05-26T16:30:30.637' AS DateTime), NULL, NULL, NULL, NULL, 0, 5, N'Harun', 4, CAST(N'2020-05-26T00:00:00.000' AS DateTime), CAST(N'2020-06-09T00:00:00.000' AS DateTime), N'Dipinjam', NULL)
SET IDENTITY_INSERT [dbo].[x_peminjaman] OFF
USE [master]
GO
ALTER DATABASE [Db_Pinjam_Buku] SET  READ_WRITE 
GO
