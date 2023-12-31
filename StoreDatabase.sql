USE [master]

CREATE DATABASE [StoreManagement] 

USE [StoreManagement]
GO

delete tblUsers  where 1=1
go


CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoa', N'Hong Hoa', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'ĐE', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'PhucHH', N'Hoang Hoa Phuc', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Mine', N'Nguyen An', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'PPT', N'Phan Tri', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Anhkhongbt', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'we888', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'hoaha', N'Hoa Thien', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'minhphuc123', N'Minh Phuc', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Lamsao7', N'LE MINH KHOA', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'10điem', N'Thanh Ton', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'445ot', N'Ong Tine', N'1', N'US', 1)

USE [StoreManagement]
GO

-- Tạo bảng Products
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](100) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Thêm dữ liệu mẫu vào bảng Products
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P001', N'Apple', 20000, 100)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P002', N'Banana', 15000, 50)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P003', N'Orange', 23000, 80)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P004', N'Grapes', 25000, 30)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P005', N'Mango', 21000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P006', N'Dragonfruit', 30000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P007', N'Watermelon', 32000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P008', N'Kiwi', 75000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P009', N'Cherry', 70000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P010', N'Starfruit', 17000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P011', N'Durian', 42000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P012', N'Avocado', 21000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P013', N'Canary Melon', 60000, 40)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'P014', N'Soursop', 29000, 40)


USE [StoreManagement]
GO




CREATE TABLE [dbo].[tblOrder](
	order_id int identity(1,1) primary key,
	order_date date,
	total money,
	customer_name nvarchar(50),
	customer_address nvarchar(100),
	customer_phone varchar(12),
	order_status varchar(15) default 'processing'
)

GO

create table Order_Detail (
	order_detail_id int identity(1,1) primary key,
	quantity int,
	price money,
	product_id  varchar(10),
	order_id int, 
)