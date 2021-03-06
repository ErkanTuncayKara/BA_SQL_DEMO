USE [master]
GO
/****** Object:  Database [FilmlerOrnekDB]    Script Date: 24.01.2021 18:53:58 ******/
CREATE DATABASE [FilmlerOrnekDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FilmlerOrnekDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FilmlerOrnekDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FilmlerOrnekDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FilmlerOrnekDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FilmlerOrnekDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FilmlerOrnekDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FilmlerOrnekDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FilmlerOrnekDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FilmlerOrnekDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FilmlerOrnekDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FilmlerOrnekDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FilmlerOrnekDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FilmlerOrnekDB] SET  MULTI_USER 
GO
ALTER DATABASE [FilmlerOrnekDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FilmlerOrnekDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FilmlerOrnekDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FilmlerOrnekDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FilmlerOrnekDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FilmlerOrnekDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FilmlerOrnekDB] SET QUERY_STORE = OFF
GO
USE [FilmlerOrnekDB]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 24.01.2021 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NOT NULL,
	[YapimYili] [char](4) NULL,
	[Gisesi] [money] NULL,
	[Yonetmen_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oyuncu]    Script Date: 24.01.2021 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](30) NOT NULL,
	[Soyadi] [varchar](30) NOT NULL,
	[DogumTarihi] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Karakter]    Script Date: 24.01.2021 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Karakter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdiSoyadi] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmOyuncuKarakter]    Script Date: 24.01.2021 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmOyuncuKarakter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Film_id] [int] NOT NULL,
	[Oyuncu_id] [int] NOT NULL,
	[Karakter_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwFilmOyuncuKarakter]    Script Date: 24.01.2021 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwFilmOyuncuKarakter] as select f.Adi as [Film Adı], f.YapimYili as [Yapım Yılı], f.Gisesi as [Film Gişesi], o.Adi +' '+ o.Soyadi as [Oyuncu Adı Soyadı],
o.DogumTarihi as [Oyuncu Doğum Tarihi], k.AdiSoyadi as [Karakter Adı Soyadı] 
from Film as f inner join FilmOyuncuKarakter as fok on fok.Film_id=f.Id
inner join Oyuncu as o on fok.Oyuncu_id=o.Id
inner join Karakter as k on fok.Karakter_id=k.Id
GO
/****** Object:  Table [dbo].[FilmTur]    Script Date: 24.01.2021 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmTur](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Film_id] [int] NOT NULL,
	[Tur_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tur]    Script Date: 24.01.2021 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tur](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yonetmen]    Script Date: 24.01.2021 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetmen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](30) NOT NULL,
	[Soyadi] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Yonetmen__3214EC0799D4C644] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_id]) VALUES (1, N'Esaretin Bedeli', N'1994', 58000000.0000, 1)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_id]) VALUES (2, N'Baba', N'1972', 245000000.0000, 2)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_id]) VALUES (3, N'Baba 2', N'1974', 193000000.0000, 2)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_id]) VALUES (4, N'Kara Şövalye', N'2008', 1005000000.0000, 4)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_id]) VALUES (5, N'12 Öfkeli Adam', N'1957', 700000.0000, 3)
SET IDENTITY_INSERT [dbo].[Film] OFF
GO
SET IDENTITY_INSERT [dbo].[FilmOyuncuKarakter] ON 

INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (2, 1, 2, 2)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (3, 2, 3, 3)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (4, 2, 4, 4)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (5, 2, 5, 5)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (6, 3, 4, 4)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (7, 3, 6, 6)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (8, 3, 7, 7)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (9, 4, 8, 8)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (10, 4, 9, 9)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (11, 5, 10, 10)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_id], [Oyuncu_id], [Karakter_id]) VALUES (12, 5, 11, 11)
SET IDENTITY_INSERT [dbo].[FilmOyuncuKarakter] OFF
GO
SET IDENTITY_INSERT [dbo].[FilmTur] ON 

INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (1, 1, 3)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (2, 2, 2)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (3, 2, 3)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (4, 3, 2)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (5, 3, 3)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (6, 4, 1)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (7, 4, 2)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (8, 4, 3)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (9, 5, 2)
INSERT [dbo].[FilmTur] ([Id], [Film_id], [Tur_id]) VALUES (10, 5, 3)
SET IDENTITY_INSERT [dbo].[FilmTur] OFF
GO
SET IDENTITY_INSERT [dbo].[Karakter] ON 

INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (1, N'Andy Dufresne')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (2, N'Ellis Boyd Redding')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (3, N'Don Vito Corleone')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (4, N'Michael Corleone')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (5, N'Sonny Corleone')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (6, N'Tom Hagen')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (7, N'Kay')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (8, N'Bruce Wayne')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (9, N'Joker')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (10, N'Jüri Üyesi 1')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (11, N'Jüri Üyesi 2')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (12, N'Andy Dufresne')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (13, N'Ellis Boyd Redding')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (14, N'Don Vito Corleone')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (15, N'Michael Corleone')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (16, N'Sonny Corleone')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (17, N'Tom Hagen')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (18, N'Kay')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (19, N'Bruce Wayne')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (20, N'Joker')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (21, N'Jüri Üyesi 1')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (22, N'Jüri Üyesi 2')
SET IDENTITY_INSERT [dbo].[Karakter] OFF
GO
SET IDENTITY_INSERT [dbo].[Oyuncu] ON 

INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (1, N'Tim', N'Robbins', CAST(N'1958-10-16' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (2, N'Morgan', N'Freeman', CAST(N'1937-06-01' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (3, N'Marlon', N'Brando', CAST(N'1924-04-03' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (4, N'Al', N'Pacino', CAST(N'1940-04-25' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (5, N'James', N'Caan', CAST(N'1940-03-26' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (6, N'Robert', N'Duvall', CAST(N'1931-01-05' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (7, N'Diane', N'Keaton', CAST(N'1946-01-05' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (8, N'Christian', N'Bale', CAST(N'1974-01-30' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (9, N'Heath', N'Ledger', CAST(N'1979-04-04' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (10, N'Martin', N'Balsam', CAST(N'1919-11-04' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (11, N'John', N'Fiedler', CAST(N'1925-02-03' AS Date))
SET IDENTITY_INSERT [dbo].[Oyuncu] OFF
GO
SET IDENTITY_INSERT [dbo].[Tur] ON 

INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (1, N'Aksiyon')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (2, N'Suç')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (3, N'Dram')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (4, N'Aksiyon')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (5, N'Suç')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (6, N'Dram')
SET IDENTITY_INSERT [dbo].[Tur] OFF
GO
SET IDENTITY_INSERT [dbo].[Yonetmen] ON 

INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (1, N'Frank', N'Darabont')
INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (2, N'Francis Ford', N'Coppola')
INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (3, N'Sidney', N'Lumet')
INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (4, N'Christopher', N'Nolan')
SET IDENTITY_INSERT [dbo].[Yonetmen] OFF
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_Yonetmen] FOREIGN KEY([Yonetmen_id])
REFERENCES [dbo].[Yonetmen] ([Id])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Yonetmen]
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter]  WITH CHECK ADD  CONSTRAINT [FK_FilmOyuncuKarakter_Film] FOREIGN KEY([Film_id])
REFERENCES [dbo].[Film] ([Id])
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter] CHECK CONSTRAINT [FK_FilmOyuncuKarakter_Film]
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter]  WITH CHECK ADD  CONSTRAINT [FK_FilmOyuncuKarakter_Karakter] FOREIGN KEY([Karakter_id])
REFERENCES [dbo].[Karakter] ([Id])
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter] CHECK CONSTRAINT [FK_FilmOyuncuKarakter_Karakter]
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter]  WITH CHECK ADD  CONSTRAINT [FK_FilmOyuncuKarakter_Oyuncu] FOREIGN KEY([Oyuncu_id])
REFERENCES [dbo].[Oyuncu] ([Id])
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter] CHECK CONSTRAINT [FK_FilmOyuncuKarakter_Oyuncu]
GO
ALTER TABLE [dbo].[FilmTur]  WITH CHECK ADD  CONSTRAINT [FK_FilmTur_Film] FOREIGN KEY([Film_id])
REFERENCES [dbo].[Film] ([Id])
GO
ALTER TABLE [dbo].[FilmTur] CHECK CONSTRAINT [FK_FilmTur_Film]
GO
ALTER TABLE [dbo].[FilmTur]  WITH CHECK ADD  CONSTRAINT [FK_FilmTur_Tur] FOREIGN KEY([Tur_id])
REFERENCES [dbo].[Tur] ([Id])
GO
ALTER TABLE [dbo].[FilmTur] CHECK CONSTRAINT [FK_FilmTur_Tur]
GO
USE [master]
GO
ALTER DATABASE [FilmlerOrnekDB] SET  READ_WRITE 
GO
