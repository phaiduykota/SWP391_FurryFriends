
CREATE DATABASE FurryFriends

USE FurryFriends

CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 11/16/2023 3:11:55 AM ******/
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
/****** Object:  Table [dbo].[configuration]    Script Date: 11/16/2023 3:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[configuration](
	[id] [int] NOT NULL,
	[logoPath] [ntext] NULL,
	[aboutUs] [ntext] NULL,
	[contact] [varchar](15) NULL,
 CONSTRAINT [PK_configuration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exchange]    Script Date: 11/16/2023 3:11:56 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[exchange_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterestPost]    Script Date: 11/16/2023 3:11:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterestPost](
	[IntersestPost] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PostId] [int] NULL,
 CONSTRAINT [PK_InterestPost] PRIMARY KEY CLUSTERED 
(
	[IntersestPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikePost]    Script Date: 11/16/2023 3:11:56 AM ******/
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
/****** Object:  Table [dbo].[post]    Script Date: 11/16/2023 3:11:56 AM ******/
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
/****** Object:  Table [dbo].[postStatus]    Script Date: 11/16/2023 3:11:56 AM ******/
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
/****** Object:  Table [dbo].[postType]    Script Date: 11/16/2023 3:11:56 AM ******/
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
/****** Object:  Table [dbo].[report]    Script Date: 11/16/2023 3:11:56 AM ******/
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
/****** Object:  Table [dbo].[ReportContent]    Script Date: 11/16/2023 3:11:56 AM ******/
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
/****** Object:  Table [dbo].[user_role]    Script Date: 11/16/2023 3:11:56 AM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 11/16/2023 3:11:56 AM ******/
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
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (1, 2, 3, N'Ảo thật đấy', CAST(N'2023-10-30' AS Date), 1, 1, NULL)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (2, 2, 3, N'hihihihi', CAST(N'2023-10-30' AS Date), 1, 1, NULL)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (5, 2, 3, N'ahaihai', CAST(N'2023-11-02' AS Date), 1, 0, 2)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (6, 2, 4, N'Check check', CAST(N'2023-11-04' AS Date), 1, 0, 2)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (7, 2, 3, N'hrlooooooooooooooooo', CAST(N'2023-11-16' AS Date), 1, 1, NULL)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (8, 2, 3, N'ahihih', CAST(N'2023-11-16' AS Date), 1, 1, NULL)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (10, 2, 3, N'oke', CAST(N'2023-11-16' AS Date), 1, 0, 1)
INSERT [dbo].[comment] ([comment_id], [post_id], [userID], [commentValue], [createdDate], [sta], [isParent], [parentId]) VALUES (11, 2, 3, N'check check', CAST(N'2023-11-16' AS Date), 1, 0, 1)
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[exchange] ON 

INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish]) VALUES (1, 2, 0, 100000.0000, N'Ha noi', 0)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish]) VALUES (2, 2, 0, 1090909.0000, N'Ha noi', 0)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish]) VALUES (3, 2, 0, 100000.0000, N'Ha noi', 0)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish]) VALUES (4, 2, 0, 100000.0000, N'Ha noi', 0)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish]) VALUES (5, 2, 0, 100000.0000, N'Ha noi', 0)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish]) VALUES (6, 8, 0, 1122.0000, N'Số 958 đường Điện Biên', 0)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish]) VALUES (7, 10, 0, 123000000000000.0000, N'Ha n', 0)
INSERT [dbo].[exchange] ([exchange_id], [post_id], [is_free], [price], [address], [isFinish]) VALUES (8, 14, 0, 234.0000, N'Số 958 đường Điện Biên', 0)
SET IDENTITY_INSERT [dbo].[exchange] OFF
GO
SET IDENTITY_INSERT [dbo].[InterestPost] ON 

INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (5, 1, 2)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (6, 2, 2)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (8, 4, 2)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (9, 5, 2)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (10, 3, 8)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (11, 4, 8)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (12, 2, 13)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (13, 5, 13)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (14, 2, 17)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (15, 1, 17)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (16, 5, 14)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (17, 4, 14)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (18, 1, 12)
INSERT [dbo].[InterestPost] ([IntersestPost], [UserId], [PostId]) VALUES (19, 2, 12)
SET IDENTITY_INSERT [dbo].[InterestPost] OFF
GO
SET IDENTITY_INSERT [dbo].[LikePost] ON 

INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (1, 2, 2)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (6, 1, 2)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (7, 4, 2)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (8, 5, 2)
INSERT [dbo].[LikePost] ([LikePostId], [UserId], [PostId]) VALUES (10, 3, 8)
SET IDENTITY_INSERT [dbo].[LikePost] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (2, 3, NULL, 3, N'sddgggggggggggggggggggggggggggggggggggggggg', N'2Dear Valued Visitors, We apologize for any inconvenience, but our website is currently undergoing maintenance to enhance your experience. We are working diligently to bring you a better, faster, and more user-friendly website. During this time, you may experience limited access to our content and features. We appreciate your patience and understanding as we strive to make improvements to better serve you. Rest assured that our dedicated team is working around the clock to ensure that the maintenance process is completed as quickly as possible. We anticipate that the website will be back up and running at its full potential in no time. In the meantime, you can stay connected with us on our social media channels for updates, news, and highlights: Please Visit Our Youtube Channel-', N'img/b7f873b1-22b3-4fe0-a28e-3861a8465814.png', 1, CAST(N'2023-10-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (8, 3, NULL, 1, N'Mẹo meo meo', N'8Dear Valued Visitors, We apologize for any inconvenience, but our website is currently undergoing maintenance to enhance your experience. We are working diligently to bring you a better, faster, and more user-friendly website. During this time, you may experience limited access to our content and features. We appreciate your patience and understanding as we strive to make improvements to better serve you. Rest assured that our dedicated team is working around the clock to ensure that the maintenance process is completed as quickly as possible. We anticipate that the website will be back up and running at its full potential in no time. In the meantime, you can stay connected with us on our social media channels for updates, news, and highlights: Please Visit Our Youtube Channel-', N'img/b7f873b1-22b3-4fe0-a28e-3861a8465814.png', 1, CAST(N'2023-10-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (10, 3, 2, 4, N'ahihi trao doi', N'Dear Valued Visitors, We apologize for any inconvenience, but our website is currently undergoing maintenance to enhance your experience. We are working diligently to bring you a better, faster, and more user-friendly website. During this time, you may experience limited access to our content and features. We appreciate your patience and understanding as we strive to make improvements to better serve you. Rest assured that our dedicated team is working around the clock to ensure that the maintenance process is completed as quickly as possible. We anticipate that the website will be back up and running at its full potential in no time. In the meantime, you can stay connected with us on our social media channels for updates, news, and highlights: Please Visit Our Youtube Channel-', N'img/b7f873b1-22b3-4fe0-a28e-3861a8465814.png', 1, CAST(N'2023-10-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (11, 3, NULL, 1, N'sddddddddddddddđf', N'Dear Valued Visitors, We apologize for any inconvenience, but our website is currently undergoing maintenance to enhance your experience. We are working diligently to bring you a better, faster, and more user-friendly website. During this time, you may experience limited access to our content and features. We appreciate your patience and understanding as we strive to make improvements to better serve you. Rest assured that our dedicated team is working around the clock to ensure that the maintenance process is completed as quickly as possible. We anticipate that the website will be back up and running at its full potential in no time. In the meantime, you can stay connected with us on our social media channels for updates, news, and highlights: Please Visit Our Youtube Channel-', N'img/b7f873b1-22b3-4fe0-a28e-3861a8465814.png', 1, CAST(N'2023-10-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (12, 3, NULL, 2, N'aaaaaaaaaaaaaaaaaaaaa', N'12Dear Valued Visitors, We apologize for any inconvenience, but our website is currently undergoing maintenance to enhance your experience. We are working diligently to bring you a better, faster, and more user-friendly website. During this time, you may experience limited access to our content and features. We appreciate your patience and understanding as we strive to make improvements to better serve you. Rest assured that our dedicated team is working around the clock to ensure that the maintenance process is completed as quickly as possible. We anticipate that the website will be back up and running at its full potential in no time. In the meantime, you can stay connected with us on our social media channels for updates, news, and highlights: Please Visit Our Youtube Channel-', N'img/b7f873b1-22b3-4fe0-a28e-3861a8465814.png', 1, CAST(N'2023-10-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (13, 3, NULL, 3, N'dfffffffffffffffffffffffffffffffff', N'Dear Valued Visitors, We apologize for any inconvenience, but our website is currently undergoing maintenance to enhance your experience. We are working diligently to bring you a better, faster, and more user-friendly website. During this time, you may experience limited access to our content and features. We appreciate your patience and understanding as we strive to make improvements to better serve you. Rest assured that our dedicated team is working around the clock to ensure that the maintenance process is completed as quickly as possible. We anticipate that the website will be back up and running at its full potential in no time. In the meantime, you can stay connected with us on our social media channels for updates, news, and highlights: Please Visit Our Youtube Channel-', N'img/b7f873b1-22b3-4fe0-a28e-3861a8465814.png', 1, CAST(N'2023-10-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (14, 3, 3, 4, N'sdfffffffffffff', N'Are you looking for an easy guide on how to start a blog?

The step-by-step guide on this page will show you how to create a blog in 20 minutes with just the most basic computer skills.

After completing this guide you will have a beautiful blog that is ready to share with the world.

This guide is made especially for beginners. I will walk you through each and every step, using plenty of pictures and videos to make it all perfectly clear.

If you get stuck or have questions at any point, simply send me a message and I will do my best to help you out.', N'img/b7f873b1-22b3-4fe0-a28e-3861a8465814.png', 1, CAST(N'2023-10-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [deleteFlag]) VALUES (17, 3, NULL, 2, N'123123123', N'Updated September 4th, 2023

Are you looking for an easy guide on how to start a blog?

The step-by-step guide on this page will show you how to create a blog in 20 minutes with just the most basic computer skills.

After completing this guide you will have a beautiful blog that is ready to share with the world.

This guide is made especially for beginners. I will walk you through each and every step, using plenty of pictures and videos to make it all perfectly clear.

If you get stuck or have questions at any point, simply send me a message and I will do my best to help you out.', N'img/b7f873b1-22b3-4fe0-a28e-3861a8465814.png', 1, CAST(N'2023-10-30T00:00:00.000' AS DateTime), NULL, 1, 0)
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
SET IDENTITY_INSERT [dbo].[user_role] ON 

INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (2, N'Staff')
INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[user_role] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (1, N'@@@@@@@@@@@@@@@@', N'@@@@@@@@@@@@@', N'@@@@@@@', NULL, N'09809890', 1, 1, N'@@@@@@@@@@', NULL, 100)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (2, N'jane_smith', N'securepass', N'jane@example.com', NULL, N'9876543210', 1, 2, N'456 Elm St, Town', NULL, 75)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (3, N'mary_jones', N'53e6086284353cb73d4979f08537d950', N'mary@example.co', NULL, N'55444444444', 1, 3, N'789 Oak St, Village', NULL, 50)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (4, N'robert_jackson', N'secretword', N'robert@example.com', NULL, N'3338884444', 0, 1, N'101 Pine St, Suburb', NULL, 25)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (5, N'susan_davis', N'susanpass', N'susan@example.com', NULL, N'7779995555', 1, 2, N'222 Cedar St, Hamlet', NULL, 150)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [emailId], [phone_num], [user_status], [role_id], [user_address], [avatar], [point]) VALUES (16, N'yT5WXLmpBm', NULL, NULL, N'100337919530334669808', NULL, 1, 3, NULL, NULL, 0)
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
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
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
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([comment_id])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([comment_id])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([exchange_id])
REFERENCES [dbo].[exchange] ([exchange_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([exchange_id])
REFERENCES [dbo].[exchange] ([exchange_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([exchange_id])
REFERENCES [dbo].[exchange] ([exchange_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([report_content_id])
REFERENCES [dbo].[ReportContent] ([ReportContentId])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([report_content_id])
REFERENCES [dbo].[ReportContent] ([ReportContentId])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD FOREIGN KEY([report_content_id])
REFERENCES [dbo].[ReportContent] ([ReportContentId])
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK__report__reporter__48CFD27E] FOREIGN KEY([reporter_id])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK__report__reporter__48CFD27E]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK__report__reporter__5DCAEF64] FOREIGN KEY([reporter_id])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK__report__reporter__5DCAEF64]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK__report__reporter__71D1E811] FOREIGN KEY([reporter_id])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK__report__reporter__71D1E811]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK__users__role_id__267ABA7A] FOREIGN KEY([role_id])
REFERENCES [dbo].[user_role] ([role_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK__users__role_id__267ABA7A]

