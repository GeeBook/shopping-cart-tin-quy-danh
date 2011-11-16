USE [master]
GO
/****** Object:  Database [Website]    Script Date: 11/16/2011 22:10:35 ******/
CREATE DATABASE [Website] ON  PRIMARY 
( NAME = N'Website', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQKSERVER2008R2\MSSQL\DATA\Website.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Website_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQKSERVER2008R2\MSSQL\DATA\Website_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Website] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Website].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Website] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Website] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Website] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Website] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Website] SET ARITHABORT OFF
GO
ALTER DATABASE [Website] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Website] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Website] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Website] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Website] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Website] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Website] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Website] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Website] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Website] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Website] SET  DISABLE_BROKER
GO
ALTER DATABASE [Website] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Website] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Website] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Website] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Website] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Website] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Website] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Website] SET  READ_WRITE
GO
ALTER DATABASE [Website] SET RECOVERY FULL
GO
ALTER DATABASE [Website] SET  MULTI_USER
GO
ALTER DATABASE [Website] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Website] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Website', N'ON'
GO
USE [Website]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 11/16/2011 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[catID] [int] IDENTITY(1,1) NOT NULL,
	[catName] [nvarchar](50) NOT NULL,
	[dateAdded] [date] NOT NULL,
	[quantityInStore] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[xuat_xu] [nvarchar](50) NULL,
	[season] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 11/16/2011 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 11/16/2011 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 11/16/2011 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](32) NOT NULL,
	[customerID] [int] NOT NULL,
	[totalCost] [money] NOT NULL,
	[paidMoney] [money] NOT NULL,
	[unpaidMoney] [money] NOT NULL,
	[timeCheckOut] [datetime] NOT NULL,
	[dateDelivered] [date] NULL,
	[Address] [nvarchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 11/16/2011 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[cmtID] [int] IDENTITY(1,1) NOT NULL,
	[catID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[timeComment] [datetime] NOT NULL,
	[comment] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[cmtID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 11/16/2011 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderID] [varchar](32) NOT NULL,
	[catID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[cost] [money] NOT NULL,
	[isCheckedOut] [bit] NOT NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[catID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCommentRelative]    Script Date: 11/16/2011 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommentRelative](
	[parentCommentID] [int] NOT NULL,
	[childCommentID] [int] NOT NULL,
 CONSTRAINT [PK_tblCommentRelative] PRIMARY KEY CLUSTERED 
(
	[parentCommentID] ASC,
	[childCommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_tblOrder_tblCustomer]    Script Date: 11/16/2011 22:10:37 ******/
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblCustomer] FOREIGN KEY([customerID])
REFERENCES [dbo].[tblCustomer] ([customerID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblCustomer]
GO
/****** Object:  ForeignKey [FK_tblComment_tblCategories]    Script Date: 11/16/2011 22:10:37 ******/
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblCategories] FOREIGN KEY([catID])
REFERENCES [dbo].[tblCategories] ([catID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblCategories]
GO
/****** Object:  ForeignKey [FK_tblComment_tblCustomer]    Script Date: 11/16/2011 22:10:37 ******/
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblCustomer] FOREIGN KEY([customerID])
REFERENCES [dbo].[tblCustomer] ([customerID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblCustomer]
GO
/****** Object:  ForeignKey [FK_tblOrderDetails_tblCategories]    Script Date: 11/16/2011 22:10:37 ******/
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblCategories] FOREIGN KEY([catID])
REFERENCES [dbo].[tblCategories] ([catID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblCategories]
GO
/****** Object:  ForeignKey [FK_tblOrderDetails_tblOrder]    Script Date: 11/16/2011 22:10:37 ******/
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrder]
GO
/****** Object:  ForeignKey [FK_tblCommentRelative_tblComment]    Script Date: 11/16/2011 22:10:37 ******/
ALTER TABLE [dbo].[tblCommentRelative]  WITH CHECK ADD  CONSTRAINT [FK_tblCommentRelative_tblComment] FOREIGN KEY([parentCommentID])
REFERENCES [dbo].[tblComment] ([cmtID])
GO
ALTER TABLE [dbo].[tblCommentRelative] CHECK CONSTRAINT [FK_tblCommentRelative_tblComment]
GO
/****** Object:  ForeignKey [FK_tblCommentRelative_tblComment1]    Script Date: 11/16/2011 22:10:37 ******/
ALTER TABLE [dbo].[tblCommentRelative]  WITH CHECK ADD  CONSTRAINT [FK_tblCommentRelative_tblComment1] FOREIGN KEY([childCommentID])
REFERENCES [dbo].[tblComment] ([cmtID])
GO
ALTER TABLE [dbo].[tblCommentRelative] CHECK CONSTRAINT [FK_tblCommentRelative_tblComment1]
GO
