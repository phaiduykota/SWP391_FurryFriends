USE [master]
GO
/****** Object:  Database [FurryV3]    Script Date: 11/27/2023 7:06:31 AM ******/
CREATE DATABASE [FurryV3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FurryV3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\FurryV3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FurryV3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\FurryV3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FurryV3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FurryV3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FurryV3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FurryV3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FurryV3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FurryV3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FurryV3] SET ARITHABORT OFF 
GO
ALTER DATABASE [FurryV3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FurryV3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FurryV3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FurryV3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FurryV3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FurryV3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FurryV3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FurryV3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FurryV3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FurryV3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FurryV3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FurryV3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FurryV3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FurryV3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FurryV3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FurryV3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FurryV3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FurryV3] SET RECOVERY FULL 
GO
ALTER DATABASE [FurryV3] SET  MULTI_USER 
GO
ALTER DATABASE [FurryV3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FurryV3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FurryV3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FurryV3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FurryV3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FurryV3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FurryV3', N'ON'
GO
ALTER DATABASE [FurryV3] SET QUERY_STORE = OFF
GO
USE [FurryV3]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[commentValue] [ntext] NOT NULL,
	[createdDate] [date] NULL,
	[sta] [bit] NOT NULL,
	[isParent] [bit] NULL,
	[parentId] [int] NULL,
 CONSTRAINT [PK__comment__E7957687F6CDC0CF] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[configuration]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[configuration](
	[id] [int] NOT NULL,
	[logoPath] [ntext] NULL,
	[aboutUs] [ntext] NULL,
	[contact] [varchar](15) NULL,
	[notification] [ntext] NULL,
 CONSTRAINT [PK_configuration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exchange]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exchange](
	[exchange_id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[is_free] [bit] NULL,
	[price] [money] NULL,
	[address] [nvarchar](max) NULL,
	[isFinish] [bit] NULL,
	[isRated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[exchange_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExnchangeSatus]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExnchangeSatus](
	[ExchangeStatusId] [int] NOT NULL,
	[ExchangeStatusValue] [nvarchar](255) NULL,
 CONSTRAINT [PK_ExnchangeSatus] PRIMARY KEY CLUSTERED 
(
	[ExchangeStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterestPost]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterestPost](
	[IntersestPost] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PostId] [int] NULL,
	[DateTime] [datetime] NULL,
	[ExchangeStatus] [int] NULL,
	[isRated] [bit] NULL,
 CONSTRAINT [PK_InterestPost] PRIMARY KEY CLUSTERED 
(
	[IntersestPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikePost]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikePost](
	[LikePostId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PostId] [int] NULL,
 CONSTRAINT [PK_LikePost] PRIMARY KEY CLUSTERED 
(
	[LikePostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[category_id] [int] NULL,
	[post_type] [int] NULL,
	[title] [nvarchar](50) NOT NULL,
	[post_content] [ntext] NOT NULL,
	[post_img] [ntext] NOT NULL,
	[isPublic] [bit] NULL,
	[datePosted] [datetime] NOT NULL,
	[reason] [nvarchar](50) NULL,
	[status] [int] NULL,
	[deleteFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postStatus]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postStatus](
	[postStatusId] [int] NOT NULL,
	[postStatusValue] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[postStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postType]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postType](
	[postTypeID] [int] NOT NULL,
	[postTypeName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[postTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[report_id] [int] IDENTITY(1,1) NOT NULL,
	[reporter_id] [int] NOT NULL,
	[report_type] [varchar](15) NOT NULL,
	[post_id] [int] NULL,
	[comment_id] [int] NULL,
	[exchange_id] [int] NULL,
	[reason] [ntext] NULL,
	[report_date] [datetime] NOT NULL,
	[report_status] [bit] NOT NULL,
	[report_content_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportContent]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportContent](
	[ReportContentId] [int] NOT NULL,
	[ReportContent] [ntext] NOT NULL,
	[deleteFlag] [bit] NULL,
 CONSTRAINT [PK_ReportContent] PRIMARY KEY CLUSTERED 
(
	[ReportContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[savePost]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[savePost](
	[savePostId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[savePostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/27/2023 7:06:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[pwd] [nvarchar](max) NULL,
	[email] [varchar](40) NULL,
	[emailId] [ntext] NULL,
	[phone_num] [varchar](15) NULL,
	[user_status] [bit] NULL,
	[role_id] [int] NULL,
	[user_address] [nvarchar](100) NULL,
	[avatar] [ntext] NULL,
	[point] [int] NULL,
 CONSTRAINT [PK__users__CB9A1CDF8BCF21DD] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Chó')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'Mèo')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'Dịch vụ và dụng cụ')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'Chim cảnh')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (12, 20, 20, N'Cảm ơn thông tin bổ ích bạn đã chia sẽ . <3', CAST(N'2023-11-16' AS Date), 1, 1, NULL)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (13, 20, 18, N'Cảm ơn bạn nhé, hi vọng bạn sẽ thích những nội dung tiếp theo của mình !!!', CAST(N'2023-11-16' AS Date), 1, 0, 12)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (14, 29, 18, N'bai viet rat hay
', CAST(N'2023-11-16' AS Date), 1, 1, NULL)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (15, 29, 20, N'cam mon ban
', CAST(N'2023-11-16' AS Date), 1, 0, 14)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (16, 22, 20, N'Cảm ơn thông tin bổ ích mà bạn đã chia sẻ', CAST(N'2023-11-17' AS Date), 1, 1, NULL)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (17, 26, 18, N' Ghê dị shao', CAST(N'2023-11-17' AS Date), 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
INSERT [dbo].[configuration] ([id], [logoPath], [aboutUs], [contact], [notification]) VALUES (1, N'img/70175bf3-60a8-4fcc-88a9-5c8f3b91cb19.png', N'Chúng mình là FurryFriends', N'0123456789', N'Chào mừng ngày hoạt động của trang, 16/11/2023')
GO
SET IDENTITY_INSERT [dbo].[exchange] ON 

INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish], [isRated]) VALUES (9, 24, 0, 2000000.0000, N'Thành phố Hồ Chí Minh', 0, NULL)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish], [isRated]) VALUES (10, 25, 1, 0.0000, N'Thành phố Hồ Chí Minh, Thủ Đức', 0, NULL)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish], [isRated]) VALUES (11, 26, 0, 3000000.0000, N'Thành phố Hồ Chí Minh', 0, NULL)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish], [isRated]) VALUES (12, 27, 0, 150000.0000, N'Vũng Tàu, biển quê em', 0, NULL)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish], [isRated]) VALUES (13, 31, 0, 50000.0000, N'Ha Noi, Ho guom', 0, NULL)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish], [isRated]) VALUES (14, 35, 0, 1200.0000, N'Thành phố Hồ Chí Minh', 0, NULL)
SET IDENTITY_INSERT [dbo].[exchange] OFF
GO
INSERT [dbo].[ExnchangeSatus] ([ExchangeStatusId], [ExchangeStatusValue]) VALUES (1, N'Chờ giao dịch')
INSERT [dbo].[ExnchangeSatus] ([ExchangeStatusId], [ExchangeStatusValue]) VALUES (2, N'Đang giao dịch')
INSERT [dbo].[ExnchangeSatus] ([ExchangeStatusId], [ExchangeStatusValue]) VALUES (3, N'Giao dịch hoàn thành')
GO
SET IDENTITY_INSERT [dbo].[InterestPost] ON 

INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (26, 21, 20, CAST(N'2023-11-26T10:39:57.720' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (27, 21, 21, CAST(N'2023-11-26T10:59:30.553' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (28, 21, 22, CAST(N'2023-11-26T10:59:34.860' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (29, 18, 31, CAST(N'2023-11-26T23:19:03.807' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (30, 21, 25, CAST(N'2023-11-27T02:47:27.180' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (31, 21, 26, CAST(N'2023-11-27T02:47:35.470' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (32, 21, 31, CAST(N'2023-11-27T02:47:49.050' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (33, 21, 27, CAST(N'2023-11-27T02:47:57.247' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (34, 18, 26, CAST(N'2023-11-27T02:52:16.037' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (35, 18, 27, CAST(N'2023-11-27T02:52:20.133' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (36, 22, 26, CAST(N'2023-11-27T02:55:09.857' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (37, 22, 27, CAST(N'2023-11-27T02:55:16.137' AS DateTime), 1, 1)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (41, 20, 25, CAST(N'2023-11-27T05:46:22.347' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (45, 22, 25, CAST(N'2023-11-27T07:04:37.410' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (46, 22, 31, CAST(N'2023-11-27T07:04:51.477' AS DateTime), 1, 0)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId], [DateTime], [ExchangeStatus], [isRated]) VALUES (47, 22, 35, CAST(N'2023-11-27T07:05:37.273' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[InterestPost] OFF
GO
SET IDENTITY_INSERT [dbo].[LikePost] ON 

INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (13, 20, 21)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (15, 20, 23)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (19, 18, 20)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (21, 18, 21)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (22, 18, 24)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (24, 18, 29)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (25, 20, 31)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (26, 18, 26)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (30, 20, 26)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (31, 20, 22)
SET IDENTITY_INSERT [dbo].[LikePost] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (20, 18, 3, 2, N'Cho trẻ tiếp xúc với thú cưng', N'Hãy khơi gợi niềm hứng thú cho bé khi chăm sóc vật nuôi với việc cho ăn, tắm, vuốt ve. Từng hành động đều thể hiện niềm yêu thích, vật nuôi cũng cần được tôn trọng và đối xử bình đẳng. Khi dạy bảo thú cưng cũng chính là lúc bạn tương tác với bé, gợi ý cho bé làm theo bạn. Lúc bé đã có thể vui đùa, hòa nhập cùng thú cưng thì vẫn luôn đồng hành để sửa những hành động sai của con. Và cuối cùng là duy trì nó trong khoảng thời gian, ít nhất cho đến khi bạn nhận thấy bé đã phần nào hình thành nên sự quan tâm và yêu thương dành cho vật nuôi.', N'img/e9530c77-e79b-44d1-a656-dc6d71eeb701.webp', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (21, 18, 2, 1, N'Gây mê trong nha khoa cho thú cưng – Có cần thiết', N'Khoan cho bé ăn sáng nhé, BSTY sẽ kiểm tra và thực hiện vài xét nghiệm máu tổng quát, lẽ đương nhiên là bé khỏe sẽ chẳng có vôi răng, căn cứ vào kết quả và tiền sử bệnh, BSTY sẽ đưa ra phương án gây mê phù hợp cho mỗi bạn thú. Hầu hết thú cưng đều phục hồi sau giấc ngủ ngắn khá nhanh, có thể tỉnh táo và đứng được, chỉ khoảng 20 – 30 phút sau khi hoàn tất thủ thuật.

Cũng như con người, thú cưng có thể bị đau do sâu răng, bị nha chu, gãy răng. Việc gây mê trong nha khoa chính là đem lại sức khỏe, niềm vui cho thú cưng và chủ nuôi.', N'img/bf8fe854-703f-4bc4-bb59-8982f5cbdeeb.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (22, 18, 1, 1, N'Viêm tai ngoài trên chó mèo', N'Bệnh nào cũng mệt nhưng với viêm tai thì đặc biệt khó chịu. Thú bị viêm tai sẽ cảm thấy đau đớn, ngứa gãi nhiều, có mùi hôi và có biểu hiện khó chịu. Viêm tai được chia là viêm tai ngoài và viêm tai giữa/trong. Viêm tai ngoài là một bệnh lý thường gặp trên chó mèo. Một số giống chó có tai lớn, cụp rũ hoặc có lông mọc trong tai thường bị hơn như Cocker Spaniels, Miniature Poodle, Old English Sheepdogs…

Trên chó, nguyên nhân gây viêm tai ngoài thường do vi khuẩn hoặc nấm. Tuy nhiên, trên mèo, nguyên nhân thường gặp là do ghẻ tai.

Viêm tai thường gây đau cho thú. Bạn sẽ thấy các bạn nhỏ thường xuyên lắc đầu, gãi tai hoặc các vùng xung quanh tai. Tai thú thường viêm đỏ, có mùi khó chịu, có thể chảy dịch màu đen hoặc vàng. Trường hợp viêm mãn tính, vành tai dày lên và ống tai bị hẹp do niêm mạc viêm lâu ngày.', N'img/3f0874a2-a846-4b06-adc3-0378b7bd0295.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (23, 18, 2, 3, N'Những cách nuôi chó mèo trong nhà luôn sạch thơm', N'Thường xuyên dọn sạch chất thải thú cưng là một thói quen quan trọng để đảm bảo ngôi nhà luôn giữ được sự sạch sẽ và thoáng mát, ngay cả khi bạn nuôi thú cưng. Việc này không chỉ giúp ngăn ngừa mùi hôi không mong muốn mà còn đảm bảo môi trường sống chung được duy trì trong tình trạng sạch sẽ và vệ sinh.
Việc dọn sạch chất thải thú cưng không chỉ là biện pháp duy trì sự sạch sẽ trong ngôi nhà, mà còn là cách yêu thương và chăm sóc cho thú cưng của bạn, đảm bảo họ có môi trường sống lành mạnh và thoải mái.
Lau chùi các vật dụng và đồ chơi của chó mèo là một phần quan trọng của việc chăm sóc thú cưng và duy trì môi trường sống sạch sẽ cho cả gia đình. Bằng cách thực hiện quy trình này định kỳ, bạn không chỉ loại bỏ bụi bẩn và vi khuẩn tiềm ẩn mà còn ngăn ngừa sự lây truyền các bệnh và mùi hôi không mong muốn trong ngôi nhà. Đồng thời, việc giữ sạch các vật dụng và đồ chơi yêu quý của thú cưng cũng giúp thú cưng cảm thấy thoải mái và hạnh phúc. Đó là cách bạn thể hiện tình yêu và quan tâm đối với hội viên bốn chân trong gia đình, đồng thời đảm bảo chúng được sống trong một môi trường an toàn và lành mạnh.', N'img/68053751-f991-4b55-bebb-feaae4a1c552.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (24, 18, 4, 4, N'Chó Chihuahua màu vàng, nhà nuôi dễ thương', N'Chihuahua là giống chó được nuôi rất phổ biến ở Việt Nam. Lý do chúng được yêu thích như vậy là vì chúng có vóc dáng nhỏ, nhanh nhạy, cảnh giác và canh gác khá giỏi. Đầu nhỏ với đôi tai dựng đứng và mắt tròn to. Một em chó Chihuahua thường chỉ nặng từ 1-3kg, cao 16-20cm.

Mức giá của một em Chihuahua thuần chủng vào khoảng 3,5 - 5 triệu đồng còn em Chihuahua lai vào khoảng 1 - 2 triệu đồng.', N'img/9931db74-24d9-4c32-9828-e04ca1d797a3.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (25, 18, 1, 4, N'Tặng Chó Bắc Kinh, ai muốn rước em ấy về nhà ?', N'Do không có thời gian chăm sóc nên cần tìm nhà mới cho bé.
Chó Bắc Kinh là giống chó được nuôi khá phổ biến ở nước ta bởi ngoại hình đáng yêu, xinh xắn. Giống chó này gồm có 2 loại, đó là thuần chủng và lai Nhật. Đa phần chúng sở hữu bộ lông một màu, mõm ngắn, mũi hếch.

Giá của chó Bắc Kinh tương đương như các em Chihuahua.', N'img/d965c640-5fac-4f30-a4f8-5675c2c48d6b.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), N'Sử dụng hình ảnh từ trên mạng', 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (26, 20, 2, 4, N'Cần tìm chủ cho em Mèo Xiêm, mèo nguồn gốc từ Lào', N'Mèo Xiêm hay có tên gọi khác là Siamese Cat, có nguồn gốc từ TháI Lan. Có 2 dòng mèo chính là mèo hiện đại và mèo truyền thống. Trong khi mèo truyền thống có thân hình đầy đặn, khá mập, khuôn mặt to tròn thì mèo hiện đại có thân hình dài, thon gọn, mảnh mai với khuôn mặt đẹp và thon.
Lông mèo Xiêm ngắn, dày với những màu sắc độc đáo và lạ mắt. Mèo Xiêm được biết là giống mèo hiền lành, thân thiện, cực kỳ thông minh và nhanh nhẹn.', N'img/45c365eb-69ff-4bb2-b4e9-1c241f6cea96.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (27, 20, 3, 4, N'Khay đựng đồ ăn và nước cho mèo cưng', N'Thêm một vật dụng không thể thiếu chính là bát ăn, bát uống nước cho chó mèo. Những chiếc bát riêng, được đặt ở vị trí cố định sẽ tạo thói quen ăn uống tốt cho thú cưng. Bạn nên sắm ít nhất 2 chiếc bát để đựng đồ ăn và đựng nước. Bát hiện nay cũng có rất nhiều mẫu mã cho bạn lựa chọn. Việc giữ vệ sinh khi ăn uống chính là góp phần bảo vệ sức khỏe cho chó mèo của bạn một cách hiệu quả đó. ', N'img/7fd892dd-97bd-4708-91b7-cf05e5b62d84.webp', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (28, 20, 1, 1, N'Viêm tai giữa/ tai trong trên chó mèo', N'Viêm tai giữa và viêm tai trong là những vấn đề về tai thường gặp trên chó mèo. Nguyên nhân thường gặp là do nhiễm khuẩn. Nếu cún/mèo nhà bạn từng bị ghẻ tai một thời gian dài, hoặc có khối u trong tai, hoặc có ngoại vật lọt vào tai (hạt cỏ, côn trùng…) đều có thể tạo môi trường cho vi khuẩn ph

Chó có đôi tai dài và cụp rũ thường dễ bị viêm tai giữa/trong như Cocker Spaniel, Basset Hound, Bloodhound, Labrador Retriever, Springer Spaniel… Ngoài ra, cún/ mèo bị viêm tai giữa/trong có thể do sự bất thường trong cấu trúc tai hoặc có sự mất cân bằng miễn dịch, hoặc màng nhĩ bị tổn thương nên vi khuẩn có thể di chuyển xuống tai giữa/ tai trong. Việc làm sạch quá thô bạo khi thú bị viêm tai ngoài cũng là một tác nhân dẫn đến viêm tai sâu hơn.

Các dấu hiệu viêm tai giữa/trong tùy thuốc vào mức độ nghiêm trọng và mức độ nhiễm trùng. Một số thú không có dấu hiệu bên ngoài. Một số có biểu hiện nhai miễn cưỡng, đau khi mở miệng, lắc đầu, vuốt tai, nghiêng đầu, mất thăng bằng, giảm thính lực. Ngoài ra, thú còn có các biểu hiện khác chỉ thích nằm; tai sưng đỏ, tiết dịch và có mùi hôi; nôn và buồn nôn, chảy nước bọt ở một bên miệng, kéo mí mắt thứ ba…', N'img/e48a73e7-f8c3-4f2c-95a1-b23ac284ca09.jpg', 0, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (29, 20, 2, 3, N'Mẹo nuôi chó Pug không có mùi hôi?', N'Những nếp da trên người chó Pug chính là thứ khiến chúng trở nên dễ thương và đáng yêu. Tuy nhiên, đây cũng có thể là một trong những lý do chính khiến bạn ngửi thấy mùi hôi tỏa ra từ chúng.

Chó Pug có nếp nhăn quanh cổ và mặt. Bụi, thức ăn và cặn bẩn rất dễ mắc kẹt bên trong các nếp gấp của da. Do đó, mùi hôi có thể bắt nguồn từ những thứ mắc kẹt trong nếp da của chó Pug.

Các nếp da cũng là môi trường nuôi dưỡng lý tưởng cho đám vi khuẩn, phổ biến nhất là nấm men vì chúng thích nơi tối và ấm áp. Tình trạng vi khuẩn phát triển trên các nếp da của chó Pug có thể là lý do khiến chúng bốc mùi và gãi không kiểm soát.

Hôi miệng
Con người cũng vậy, khi chúng ta không đánh răng thì hơi thở của chúng ta có thể bốc mùi. Vì vậy, nếu bạn không đánh răng cho chó Pug, hơi thở của chúng sẽ bắt đầu bốc mùi. Do đó, bạn cần chăm sóc răng thường xuyên cho thú cưng của mình.

Nếu chó Pug nhà bạn bị halitosis, đó có thể là một vấn đề sức khỏe lớn hơn như sâu răng hoặc bệnh do vi khuẩn trong miệng hoặc bệnh thận.

Nếu đúng như vậy, bạn cần liên hệ với bác sĩ thú y đáng tin cậy để tìm hiểu những vấn đề sức khỏe tiềm ẩn nào đang gây ra chứng hôi miệng cho thú cưng.

Các giống chó đầu ngắn dễ mắc bệnh nha chu và các bệnh về răng miệng khác vì răng của chúng thực sự mọc rất gần nhau.', N'img/e8cabd74-65a9-4a3c-843e-f58d66934429.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (30, 20, 3, 2, N'Giới thiệu về giống chó Doberman, xuất xứ Đức', N'Doberman là một giống chó có thể nuôi để giữ nhà, canh gác hoặc làm nghiệp vụ. Tên gọi đầy đủ và chính xác của nó là Dobermann Pinscher. Dobermann là một trong số ít những loại chó được đặt theo tên người. Đây là một giống chó hung dữ, nhưng nếu được đào tạo tốt, nó có thể là những con chó tuyệt vời của gia đình', N'img/521e6062-c5d9-46df-8d43-9b3fe1127561.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), N'Sai chuyên mục', 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (31, 20, 1, 4, N'Toi muon traao doi con cho', N'Cả hai giống chó này đều có nguồn gốc từ Trung Quốc và điểm khác nhau nổi bật nhất chính là bộ lông của chúng. Chó Bắc Kinh thì bộ lông thường chỉ có một màu, mũi hếch, giữa mũi và trán có phần bị gãy, mõm ngắn, nặng tầm 3 – 5kg và cao khoảng 14 – 26cm.Còn chó Bắc Kinh lai Nhật thì bộ lông thường sẽ được xen lẫn 2 màu, mũi không hếch, phần gãy giữa mũi và trán không rõ như chó Bắc Kinh, mõm dài, nặng khoảng 3 – 7kg và cao tầm 15 – 20cm.', N'img/4739742e-1e1c-41cb-9037-b88d2ce2f646.jpg', 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (32, 21, 1, 3, N'okeokeokeoekeokeok', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'img/08036854-692f-49bf-a6a6-e0e9714d4e75.png', 0, CAST(N'2023-11-26T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (33, 18, NULL, 1, N'ahiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', N'asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
v
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
asdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdfsdfadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', N'img/b948a945-52e8-4144-9495-70424b87e994.png', 1, CAST(N'2023-11-27T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (34, 18, 2, 2, N'                    + "           ,?\n"', N'                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
', N'img/7b2e0087-218b-494c-8da9-f7b461a2d33c.png', 1, CAST(N'2023-11-27T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (35, 20, 2, 4, N'meo meo dsdsadasdasdasd', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'img/5c6af6a3-3b26-492c-ab86-f1bcf2f58c04.png', 1, CAST(N'2023-11-27T00:00:00.000' AS DateTime), NULL, 2, 0)
SET IDENTITY_INSERT [dbo].[post] OFF
GO
INSERT [dbo].[postStatus] ([postStatusId], [postStatusValue]) VALUES (1, N'Chờ phê duyệt')
INSERT [dbo].[postStatus] ([postStatusId], [postStatusValue]) VALUES (2, N'Chấp nhận')
INSERT [dbo].[postStatus] ([postStatusId], [postStatusValue]) VALUES (3, N'Từ chối')
GO
INSERT [dbo].[postType] ([postTypeID], [postTypeName]) VALUES (1, N'Sức khỏe thú cưng')
INSERT [dbo].[postType] ([postTypeID], [postTypeName]) VALUES (2, N'Cung cấp thông tin thú cưng')
INSERT [dbo].[postType] ([postTypeID], [postTypeName]) VALUES (3, N'Mẹo nuôi chó mèo')
INSERT [dbo].[postType] ([postTypeID], [postTypeName]) VALUES (4, N'Bài viết trao đổi')
GO
INSERT [dbo].[ReportContent] ([ReportContentId], [ReportContent], [deleteFlag]) VALUES (1, N'Bài viết lạm dụng', 1)
INSERT [dbo].[ReportContent] ([ReportContentId], [ReportContent], [deleteFlag]) VALUES (2, N'Bài viết này spam', 1)
INSERT [dbo].[ReportContent] ([ReportContentId], [ReportContent], [deleteFlag]) VALUES (3, N'Bài viết chứa nội dung sai lệch', 1)
INSERT [dbo].[ReportContent] ([ReportContentId], [ReportContent], [deleteFlag]) VALUES (4, N'Bài viết gây bạo loạn', 1)
GO
SET IDENTITY_INSERT [dbo].[savePost] ON 

INSERT [dbo].[savePost] ([savePostId], [PostId], [UserId]) VALUES (6, 20, 20)
INSERT [dbo].[savePost] ([savePostId], [PostId], [UserId]) VALUES (7, 22, 20)
INSERT [dbo].[savePost] ([savePostId], [PostId], [UserId]) VALUES (8, 23, 20)
INSERT [dbo].[savePost] ([savePostId], [PostId], [UserId]) VALUES (9, 20, 21)
INSERT [dbo].[savePost] ([savePostId], [PostId], [UserId]) VALUES (10, 31, 18)
SET IDENTITY_INSERT [dbo].[savePost] OFF
GO
SET IDENTITY_INSERT [dbo].[user_role] ON 

INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (2, N'Staff')
INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[user_role] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (17, N'lamnqse173266', N'53e6086284353cb73d4979f08537d950', N'lamnqse173266@fpt.edu.vn', NULL, N'0367455797', 1, 2, N'Vinhome Grand Park', NULL, 0)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (18, N'quangbmse171655', N'53e6086284353cb73d4979f08537d950', N'quangbmse171655@fpt.edu.vn', NULL, N'0353110527', 1, 3, N'Thành phố Hồ Chí Minh, Huyện Bình Chánh', NULL, 8)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (19, N'duynhkse160409', N'53e6086284353cb73d4979f08537d950', N'duynhkse160409@fpt.edu.vn', NULL, N'0835844947', 1, 1, N'Đà Lạt, Thành phố ngàn hoa, ngàn sao', NULL, 0)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (20, N'anhdtse160765', N'53e6086284353cb73d4979f08537d950', N'anhdtse160765@fpt.edu.vn', NULL, N'0367455797', 1, 3, N'Bà Rịa - Vũng Tàu', NULL, 4)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (21, N'test', N'53e6086284353cb73d4979f08537d950', N'test@gmail.com', NULL, N'0979878978', 1, 3, N'HCM', NULL, 0)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (22, N'abc', N'53e6086284353cb73d4979f08537d950', N'abc@gmail.com', NULL, N'0367455797', 1, 3, N'HCM', NULL, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__post_id__36B12243] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK__comment__post_id__36B12243]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__userID__37A5467C] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK__comment__userID__37A5467C]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_comment] FOREIGN KEY([parentId])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_comment]
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD  CONSTRAINT [FK_exchange_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[exchange] CHECK CONSTRAINT [FK_exchange_post]
GO
ALTER TABLE [dbo].[InterestPost]  WITH CHECK ADD  CONSTRAINT [FK_InterestPost_ExnchangeSatus] FOREIGN KEY([ExchangeStatus])
REFERENCES [dbo].[ExnchangeSatus] ([ExchangeStatusId])
GO
ALTER TABLE [dbo].[InterestPost] CHECK CONSTRAINT [FK_InterestPost_ExnchangeSatus]
GO
ALTER TABLE [dbo].[InterestPost]  WITH CHECK ADD  CONSTRAINT [FK_InterestPost_post] FOREIGN KEY([PostId])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[InterestPost] CHECK CONSTRAINT [FK_InterestPost_post]
GO
ALTER TABLE [dbo].[InterestPost]  WITH CHECK ADD  CONSTRAINT [FK_InterestPost_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[InterestPost] CHECK CONSTRAINT [FK_InterestPost_users]
GO
ALTER TABLE [dbo].[LikePost]  WITH CHECK ADD  CONSTRAINT [FK_LikePost_post] FOREIGN KEY([PostId])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[LikePost] CHECK CONSTRAINT [FK_LikePost_post]
GO
ALTER TABLE [dbo].[LikePost]  WITH CHECK ADD  CONSTRAINT [FK_LikePost_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[LikePost] CHECK CONSTRAINT [FK_LikePost_users]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([post_type])
REFERENCES [dbo].[postType] ([postTypeID])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([post_type])
REFERENCES [dbo].[postType] ([postTypeID])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([post_type])
REFERENCES [dbo].[postType] ([postTypeID])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK__post__userID__2F10007B] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK__post__userID__2F10007B]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_postStatus] FOREIGN KEY([status])
REFERENCES [dbo].[postStatus] ([postStatusId])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_postStatus]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([comment_id])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([exchange_id])
REFERENCES [dbo].[exchange] ([exchange_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([report_content_id])
REFERENCES [dbo].[ReportContent] ([ReportContentId])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK__report__reporter__48CFD27E] FOREIGN KEY([reporter_id])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK__report__reporter__48CFD27E]
GO
ALTER TABLE [dbo].[savePost]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[savePost]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK__users__role_id__267ABA7A] FOREIGN KEY([role_id])
REFERENCES [dbo].[user_role] ([role_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK__users__role_id__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [FurryV3] SET  READ_WRITE 
GO
