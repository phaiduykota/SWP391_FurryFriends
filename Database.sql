
CREATE DATABASE [SWP391_FurryFriends]
 
USE [SWP391_FurryFriends]

CREATE TABLE [dbo].[announcement](
	[userID] [int] NOT NULL,
	[announcement_value] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/19/2023 12:43:22 PM ******/
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
/****** Object:  Table [dbo].[comment]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[commentValue] [nvarchar](50) NOT NULL,
	[sta] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exchange]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exchange](
	[exchange_id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[detail] [nvarchar](1000) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[img] [ntext] NOT NULL,
	[is_free] [bit] NOT NULL,
	[price] [float] NOT NULL,
	[datePosted] [datetime] NOT NULL,
	[exchange_status] [nvarchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[exchange_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interest_list]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interest_list](
	[exchange_id] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[result] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[likes]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[likes](
	[like_id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[userID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[like_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[post_type] [int] NULL,
	[title] [nvarchar](50) NOT NULL,
	[post_content] [ntext] NOT NULL,
	[post_img] [ntext] NOT NULL,
	[isPublic] [bit] NOT NULL,
	[datePosted] [datetime] NOT NULL,
	[reason] [nvarchar](50) NULL,
	[status] [int] NULL,
	[address] [nvarchar](max) NULL,
 CONSTRAINT [PK__post__3ED7876631D6F204] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postStatus]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postStatus](
	[postStatusId] [int] NOT NULL,
	[postStatusValue] [nvarchar](255) NULL,
 CONSTRAINT [PK_postStatus] PRIMARY KEY CLUSTERED 
(
	[postStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postType]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postType](
	[postTypeId] [int] NOT NULL,
	[postTypeName] [nvarchar](255) NULL,
 CONSTRAINT [PK_postType] PRIMARY KEY CLUSTERED 
(
	[postTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[report_id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[post_id] [int] NOT NULL,
	[detail] [nvarchar](100) NOT NULL,
	[reportDate] [datetime] NOT NULL,
	[status] [bit] NULL,
	[staffId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 10/19/2023 12:43:22 PM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 10/19/2023 12:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[pwd] [varchar](20) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[phone_num] [varchar](15) NOT NULL,
	[user_status] [bit] NOT NULL,
	[role_id] [int] NOT NULL,
	[user_address] [nvarchar](100) NOT NULL,
	[point] [int] NOT NULL,
 CONSTRAINT [PK__users__CB9A1CDF449DF59B] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Chó')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'Mèo')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [address]) VALUES (7, 1, 2, 2, N'Project 2', N'Lưu ý là bảng bên dưới chỉ bao gồm các màu sắc chủ đạo của icon chứ không liệt kê tất cả mã màu , chẳng hạn như mã màu của icon Facebook bao gồm 2 màu chính là #ffffff và #3b5998.

Tuy nhiên, trong lĩnh vực thiết kế đồ hoạ, hình ảnh hiện nay thì các sản phẩm có thể sử dụng một tập hợp nhiều màu sắc, trong trường hợp này gọi là màu Gradient – Màu sắc sẽ trải dài trong khoảng màu đã chọn trước đó.', N'/img/3f961556-e0fa-4cd0-92cf-3826c3c84535.jpg', 1, CAST(N'2023-10-08T00:00:00.000' AS DateTime), NULL, 2, NULL)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [address]) VALUES (8, 3, 2, 1, N'Cần bán lại mèo', N'GS.TS Nguyễn Trọng Hoài - phó hiệu trưởng Trường ĐH Kinh tế TP.HCM - cho biết chính sách khuyến khích cũng phần nào giúp gia tăng bài báo quốc tế của trường bên cạnh các quy định về nghiên cứu khoa học bắt buộc đối với giảng viên, số tiến sĩ tăng, thành lập các nhóm nghiên cứu mạnh. Kinh phí thưởng tối đa mỗi năm khoảng 2 tỉ đồng.

Trong khi đó, số bài báo công bố quốc tế của Trường ĐH Mở TP.HCM tăng từ 16 bài năm 2017 lên 62 bài năm 2018. PGS.TS Nguyễn Minh Hà, hiệu trưởng nhà trường, cho biết trường bắt đầu chính sách thưởng công bố quốc tế từ năm 2017 và có điều chỉnh mức thưởng theo hướng tăng lên. Mức thưởng dao động từ 40-100 triệu đồng/bài tùy loại tạp chí.

Theo ông Hà, số bài báo quốc tế tăng lên có tác động rất lớn từ chính sách khuyến khích của trường.

"Nếu không tự chủ, trường sẽ khó có thể đưa ra chính sách khuyến khích với mức thưởng như vậy do tài chính và các quy định liên quan. Việc thưởng tuy chưa nhiều nhưng đã tạo động lực cho giảng viên, nghiên cứu sinh chú ý hơn đến việc công bố. Giảng viên cũng chú ý kết nối với các giáo sư ở các trường nước ngoài".', N'/img/f1cd7cb1-4e80-4e42-8c7c-2d120ce093d1.png', 1, CAST(N'2023-10-19T00:00:00.000' AS DateTime), NULL, 2, NULL)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [address]) VALUES (9, 3, 2, 2, N'HIHIHIHIHIHIHIHIHIHI', N'𝐏𝐓 𝐏𝐞𝐭 𝐒𝐡𝐨𝐩 - 𝐒𝐢𝐞̂𝐮 𝐭𝐡𝐢̣ 𝐭𝐡𝐮́ 𝐜𝐮̛𝐧𝐠 𝐭𝐚̣𝐢 𝐤𝐡𝐮 𝐯𝐮̛̣𝐜 𝐐𝐮𝐨̂́𝐜 𝐎𝐚𝐢, 𝐓𝐡𝐚̣𝐜𝐡 𝐓𝐡𝐚̂́𝐭, 𝐇𝐨𝐚̀𝐢 Đ𝐮̛́𝐜..
👉 Chuyên phối giống Chó Mèo cảnh
👉 Cung cấp Chó Mèo cảnh
👉 Siêu thị phụ kiện, thức ăn, nhu yếu phẩm cho cún mèo
👉 Tắm, cắt tỉa, nhuộm lông Cún Mèo
👉 Dịch vụ tiêm chủng, tẩy giun
👉 Dịch vụ triệt sản
‼️  Dịch vụ đưa đón thú cưng tận nơi 🛵🚚
✔️ Khách hàng chỉ cần nhấc máy lên hoặc inbox shop để được tư vấn nhanh nhất.', N'/img/24f495d3-4474-49be-aef8-e06feac78a6d.jpg', 1, CAST(N'2023-10-19T00:00:00.000' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[post] ([post_id], [userID], [category_id], [post_type], [title], [post_content], [post_img], [isPublic], [datePosted], [reason], [status], [address]) VALUES (10, 3, 1, 3, N'Mẹo vặt', N'Em mới tập nuôi mèo 🤔🤔 Hôm qua em mới đi thiến của bé. BÉ đực, khi thiến về bé nằm từ hôm qua đến hôm nay chả thèm ăn uống gì? Anh chị cô bác cho em xin tip chăm sóc méo sao khi thiến đi ạ 😞 em cảm ơn nhiều lắm
- Em edit lại tí nhé : Lý do tại sao em phải thiến bé, ko phải vì sự ích kỉ của bản thân. Mà là khu vực em và mèo sinh sống rất ít ng việt, và em cũng ko rành tiếng bản địa của nước họ. 2th em vì thương bé ko dám thiến vì sợ bé đau. Nhưng quá trình 2th bé tè bậy lên giường, ẻ lung tung, gào 24/24. Em stress mất ngủ để canh bé. thêm vị trí ở ko có tiệm phối giống hay chữa trị cho mèo. Và có 1 tiệm cách xa 1 2 tiếng đi xe, thiến 1 lần 300$. em ko về Vnam được nên đành thiến bé. Nên anh chị em đừng có suy bụng ta ra bụng ng ạ. chân thành cảm ơn !', N'/img/8cdf4a4f-20ae-497b-906e-37b57f1e1ef6.png', 1, CAST(N'2023-10-19T00:00:00.000' AS DateTime), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[post] OFF
GO
INSERT [dbo].[postStatus] ([postStatusId], [postStatusValue]) VALUES (1, N'Chờ phê duyệt')
INSERT [dbo].[postStatus] ([postStatusId], [postStatusValue]) VALUES (2, N'Chấp nhận')
INSERT [dbo].[postStatus] ([postStatusId], [postStatusValue]) VALUES (3, N'Từ chối')
GO
INSERT [dbo].[postType] ([postTypeId], [postTypeName]) VALUES (1, N'Bài viết trao đổi thú cưng')
INSERT [dbo].[postType] ([postTypeId], [postTypeName]) VALUES (2, N'Cung cấp thông tin thú cưng')
INSERT [dbo].[postType] ([postTypeId], [postTypeName]) VALUES (3, N'Mẹo nuôi chó mèo')
GO
SET IDENTITY_INSERT [dbo].[user_role] ON 

INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (2, N'Staff')
INSERT [dbo].[user_role] ([role_id], [role_name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[user_role] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [username], [pwd], [email], [phone_num], [user_status], [role_id], [user_address], [point]) VALUES (1, N'john_doe', N'password123', N'john@example.com', N'1234567890', 1, 1, N'123 Main St, City', 100)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [phone_num], [user_status], [role_id], [user_address], [point]) VALUES (2, N'jane_smith', N'securepass', N'jane@example.com', N'9876543210', 1, 2, N'456 Elm St, Town', 75)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [phone_num], [user_status], [role_id], [user_address], [point]) VALUES (3, N'mary_jones', N'pass123', N'mary@example.com', N'5551237890', 0, 3, N'789 Oak St, Village', 50)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [phone_num], [user_status], [role_id], [user_address], [point]) VALUES (4, N'robert_jackson', N'secretword', N'robert@example.com', N'3338884444', 1, 1, N'101 Pine St, Suburb', 25)
INSERT [dbo].[users] ([userID], [username], [pwd], [email], [phone_num], [user_status], [role_id], [user_address], [point]) VALUES (5, N'susan_davis', N'susanpass', N'susan@example.com', N'7779995555', 1, 2, N'222 Cedar St, Hamlet', 150)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[announcement]  WITH CHECK ADD  CONSTRAINT [FK__announcem__userI__403A8C7D] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[announcement] CHECK CONSTRAINT [FK__announcem__userI__403A8C7D]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__post_id__3D5E1FD2] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK__comment__post_id__3D5E1FD2]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__userID__3E52440B] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK__comment__userID__3E52440B]
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD  CONSTRAINT [FK__exchange__userID__2B3F6F97] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[exchange] CHECK CONSTRAINT [FK__exchange__userID__2B3F6F97]
GO
ALTER TABLE [dbo].[interest_list]  WITH CHECK ADD FOREIGN KEY([exchange_id])
REFERENCES [dbo].[exchange] ([exchange_id])
GO
ALTER TABLE [dbo].[interest_list]  WITH CHECK ADD  CONSTRAINT [FK__interest___userI__2F10007B] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[interest_list] CHECK CONSTRAINT [FK__interest___userI__2F10007B]
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD  CONSTRAINT [FK__likes__post_id__398D8EEE] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[likes] CHECK CONSTRAINT [FK__likes__post_id__398D8EEE]
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD  CONSTRAINT [FK__likes__userID__3A81B327] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[likes] CHECK CONSTRAINT [FK__likes__userID__3A81B327]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK__post__userID__31EC6D26] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK__post__userID__31EC6D26]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_category]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_postStatus] FOREIGN KEY([status])
REFERENCES [dbo].[postStatus] ([postStatusId])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_postStatus]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_postType] FOREIGN KEY([post_type])
REFERENCES [dbo].[postType] ([postTypeId])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_postType]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK__report__post_id__36B12243] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK__report__post_id__36B12243]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK__report__userID__35BCFE0A] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK__report__userID__35BCFE0A]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_report_users] FOREIGN KEY([staffId])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_report_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK__users__role_id__267ABA7A] FOREIGN KEY([role_id])
REFERENCES [dbo].[user_role] ([role_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK__users__role_id__267ABA7A]

