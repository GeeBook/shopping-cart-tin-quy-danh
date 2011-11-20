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
	[imagePath] [varchar] 50 null,
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
	[timeComment] [timestamp] NOT NULL,
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
