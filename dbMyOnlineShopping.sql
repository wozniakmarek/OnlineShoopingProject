USE [master]
GO
/****** Object:  Database [dbMyOnlineShopping]    Script Date: 28.01.2022 18:52:54 ******/
CREATE DATABASE [dbMyOnlineShopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbMyOnlineShopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbMyOnlineShopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbMyOnlineShopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbMyOnlineShopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbMyOnlineShopping] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbMyOnlineShopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbMyOnlineShopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbMyOnlineShopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbMyOnlineShopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbMyOnlineShopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbMyOnlineShopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbMyOnlineShopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbMyOnlineShopping] SET  MULTI_USER 
GO
ALTER DATABASE [dbMyOnlineShopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbMyOnlineShopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbMyOnlineShopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbMyOnlineShopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbMyOnlineShopping] SET QUERY_STORE = OFF
GO
USE [dbMyOnlineShopping]
GO
/****** Object:  Table [dbo].[Company_Users]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Encryptedpassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_TblUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Cart]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CartStatus]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CartStatus](
	[CartStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CartStatus] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MemberRole]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MemberRole](
	[MemberRoleID] [int] IDENTITY(1,1) NOT NULL,
	[memberId] [int] NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[FristName] [varchar](200) NULL,
	[LastName] [varchar](200) NULL,
	[EmailId] [varchar](200) NULL,
	[Password] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](500) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ProductImage] [varchar](max) NULL,
	[IsFeatured] [bit] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK__Tbl_Prod__B40CC6CD66180B37] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ShippingDetails]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[Adress] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[State] [varchar](500) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[OrderId] [int] NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SlideImage]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SlideImage](
	[SlideId] [int] IDENTITY(1,1) NOT NULL,
	[SlideTitle] [varchar](500) NULL,
	[SlideImage] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company_Users] ON 

INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (1, N'ab', N'ab@gmail.com', N'ab', N'MTIzNDU2Nzg5')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (2, N'ak', N'ak@gmail.com', N'ak', N'MTIzNDU2')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (3, N'test', N'test@t.com', N'test', N'MTIzNDU2')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (4, N'sania', N'sania@gmail.com', N'UK', N'MTIzNDU2')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (5, N'kr', N'k@kgmail.com', N'uk', N'MTIzNDU2')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (6, N'az', N'az@gmail.com', N'az', N'MTIzNDU2')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (7, N'alex', N'alex1@gmail.com', N'usa', N'MTIzNDU2Nzg5')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (8, N'bob1122', N'bob@gmail.com', N'usa', N'MTIzNDU2Nzg=')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (9, N'a', N'a@gmail.com', N'us', N'MTIzNDU2Nw==')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (10, N'123', N'marek.wozniak@nm.com.pl', N'dasd32', N'UXdlcnR5')
INSERT [dbo].[Company_Users] ([Id], [Name], [Email], [Address], [Encryptedpassword]) VALUES (11, N'fdsf', N'andrzej.rosek@logan.com.pl', N'fds', N'YXNkYXNk')
SET IDENTITY_INSERT [dbo].[Company_Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Category] ON 

INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (1, N'Lightship', 1, 0)
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (2, N'CoastalCruising', 1, 0)
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (3, N'FishingBoats', 1, 0)
SET IDENTITY_INSERT [dbo].[Tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] ON 

INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (2, N'lightship Barnegat (LV-79) ', 1, 1, 0, CAST(N'2021-11-06T00:00:00.000' AS DateTime), CAST(N'2021-11-07T02:14:41.000' AS DateTime), NULL, 1, 6, CAST(6000 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (3, N' lightship Swiftsure (LV-83)', 1, 1, 0, CAST(N'2021-11-06T00:00:00.000' AS DateTime), CAST(N'2021-11-06T22:35:18.600' AS DateTime), N'6.png', 0, 7, CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (4, N'lightship Ambrose (LV-87) ', 1, 1, 0, CAST(N'2021-11-06T17:09:41.000' AS DateTime), CAST(N'2021-11-06T22:35:30.847' AS DateTime), N'8.png', 1, 5, CAST(45000 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (5, N' lightship Portsmouth (LV-101)', 1, 1, NULL, CAST(N'2021-11-06T22:29:49.417' AS DateTime), NULL, N'4.png', 1, 5, CAST(8000 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (6, N' lightship Huron (LV-103) ', 1, 1, NULL, CAST(N'2021-11-06T22:44:05.813' AS DateTime), NULL, N'2.png', 1, 5, CAST(7000 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (7, N'lightship Nantucket (LV-112) ', 1, 1, NULL, CAST(N'2021-11-06T22:44:46.380' AS DateTime), NULL, N'7.png', 1, 4, CAST(9000 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (8, N' lightship Frying Pan (LV-115) ', 1, 1, NULL, CAST(N'2021-11-06T22:45:34.607' AS DateTime), NULL, N'8.png', 1, 6, CAST(8000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName], [Password], [IsActive]) VALUES (1, N'Marek', N'Marek1234', 1)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Password], [IsActive]) VALUES (2, N'Marco', N'Marco1234', 1)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Password], [IsActive]) VALUES (3, N'Userr', N'Password1234', 1)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Cate__8517B2E067D75540]    Script Date: 28.01.2022 18:52:54 ******/
ALTER TABLE [dbo].[Tbl_Category] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Memb__7449F399C22FA4C2]    Script Date: 28.01.2022 18:52:54 ******/
ALTER TABLE [dbo].[Tbl_Members] ADD UNIQUE NONCLUSTERED 
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Memb__7ED91ACEC8C05FE4]    Script Date: 28.01.2022 18:52:54 ******/
ALTER TABLE [dbo].[Tbl_Members] ADD UNIQUE NONCLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Prod__DD5A978AF48D7C4D]    Script Date: 28.01.2022 18:52:54 ******/
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [UQ__Tbl_Prod__DD5A978AF48D7C4D] UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Role__8A2B616028867B4D]    Script Date: 28.01.2022 18:52:54 ******/
ALTER TABLE [dbo].[Tbl_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Cart__Produc__37A5467C] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Tbl_Cart] CHECK CONSTRAINT [FK__Tbl_Cart__Produc__37A5467C]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Produ__Categ__38996AB5] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK__Tbl_Produ__Categ__38996AB5]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Tbl_Members] ([MemberId])
GO
/****** Object:  StoredProcedure [dbo].[GetBySearch]    Script Date: 28.01.2022 18:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBySearch]
	@search nvarchar(max)=null
AS
BEGIN
	SELECT *from [dbo].[Tbl_Product] P
	left join [dbo].[Tbl_Category] C on p.CategoryId=c.CategoryId
	where
	P.ProductName LIKE CASE WHEN @search is not null then  '%'+@search+'%' else P.ProductName end
	OR
	C.CategoryName LIKE CASE WHEN @search is not null then  '%'+@search+'%' else C.CategoryName end
END
GO
USE [master]
GO
ALTER DATABASE [dbMyOnlineShopping] SET  READ_WRITE 
GO
