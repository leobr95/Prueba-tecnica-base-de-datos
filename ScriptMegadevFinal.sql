USE [master]
GO
/****** Object:  Database [BooksdbAPIMegaDev]    Script Date: 24/11/2021 10:56:08 ******/
CREATE DATABASE [BooksdbAPIMegaDev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BooksdbAPIMegaDev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BooksdbAPIMegaDev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BooksdbAPIMegaDev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BooksdbAPIMegaDev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BooksdbAPIMegaDev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET  MULTI_USER 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET QUERY_STORE = OFF
GO
USE [BooksdbAPIMegaDev]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 24/11/2021 10:56:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [int] NOT NULL,
	[Nombres] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[DireccionEnvio] [nvarchar](max) NOT NULL,
	[TelefonoFijo] [int] NOT NULL,
	[Celular] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 24/11/2021 10:56:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[CompraLibroId] [int] IDENTITY(1,1) NOT NULL,
	[LibroId] [int] NOT NULL,
	[ClienteId] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Valor] [int] NOT NULL,
	[EmpleadoId] [int] NOT NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[CompraLibroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 24/11/2021 10:56:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[EditorialId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Editoriales] PRIMARY KEY CLUSTERED 
(
	[EditorialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 24/11/2021 10:56:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[EmpleadoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[TelefonoFijo] [int] NOT NULL,
	[Celular] [int] NOT NULL,
	[Cargo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 24/11/2021 10:56:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[LibroId] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](max) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Costo] [int] NOT NULL,
	[PrecioSugerido] [int] NOT NULL,
	[Autor] [nvarchar](max) NULL,
	[EditorialId] [int] NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[LibroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Cliente_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Cliente_ClienteId]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Empleados_EmpleadoId] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleados] ([EmpleadoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Empleados_EmpleadoId]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Libros_LibroId] FOREIGN KEY([LibroId])
REFERENCES [dbo].[Libros] ([LibroId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Libros_LibroId]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Editoriales_EditorialId] FOREIGN KEY([EditorialId])
REFERENCES [dbo].[Editoriales] ([EditorialId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Editoriales_EditorialId]
GO
USE [master]
GO
ALTER DATABASE [BooksdbAPIMegaDev] SET  READ_WRITE 
GO
