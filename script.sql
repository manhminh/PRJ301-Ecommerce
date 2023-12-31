﻿USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 10/11/2023 9:40:04 AM ******/
CREATE DATABASE [Assignment]
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[cartItem_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[cart_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[cartItem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderDetails_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[date] [nvarchar](50) NULL,
	[status_id] [int] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_OrderDeails] PRIMARY KEY CLUSTERED 
(
	[orderDetails_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](255) NULL,
	[category_id] [int] NULL,
	[image] [nchar](255) NULL,
	[rating] [int] NULL,
	[discount] [float] NULL,
	[sale_id] [int] NULL,
	[soldout] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[content] [nvarchar](255) NULL,
	[date] [nvarchar](255) NULL,
	[rating] [int] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[shipping_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[time] [int] NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/11/2023 9:40:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nchar](255) NULL,
	[email] [nchar](255) NULL,
	[role] [int] NULL,
	[address] [nvarchar](255) NULL,
	[gender] [int] NULL,
	[avatar] [nchar](255) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cart_id], [user_id]) VALUES (1, 22)
INSERT [dbo].[Cart] ([cart_id], [user_id]) VALUES (2, 23)
INSERT [dbo].[Cart] ([cart_id], [user_id]) VALUES (3, 32)
INSERT [dbo].[Cart] ([cart_id], [user_id]) VALUES (4, 1)
INSERT [dbo].[Cart] ([cart_id], [user_id]) VALUES (5, 33)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItem] ON 

INSERT [dbo].[CartItem] ([cartItem_id], [product_id], [cart_id], [quantity], [price]) VALUES (15, 2, 3, 1, 319.99)
INSERT [dbo].[CartItem] ([cartItem_id], [product_id], [cart_id], [quantity], [price]) VALUES (16, 3, 3, 2, 269.99)
INSERT [dbo].[CartItem] ([cartItem_id], [product_id], [cart_id], [quantity], [price]) VALUES (120, 3, 1, 1, 209.99)
INSERT [dbo].[CartItem] ([cartItem_id], [product_id], [cart_id], [quantity], [price]) VALUES (122, 3, 1, 1, 209.99)
INSERT [dbo].[CartItem] ([cartItem_id], [product_id], [cart_id], [quantity], [price]) VALUES (123, 3, 1, 1, 209.99)
SET IDENTITY_INSERT [dbo].[CartItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [name], [description]) VALUES (1, N'Adidas', N'Adidas AG is a German athletic apparel and footwear corporation headquartered in Herzogenaurach, Bavaria, Germany.')
INSERT [dbo].[Category] ([category_id], [name], [description]) VALUES (2, N'Nike', N'Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States')
INSERT [dbo].[Category] ([category_id], [name], [description]) VALUES (3, N'Uniqlo', N'Uniqlo Co., Ltd. is a Japanese casual wear designer, manufacturer and retailer.')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [user_id]) VALUES (1, 22)
INSERT [dbo].[Order] ([order_id], [user_id]) VALUES (3, 33)
INSERT [dbo].[Order] ([order_id], [user_id]) VALUES (4, 32)
INSERT [dbo].[Order] ([order_id], [user_id]) VALUES (16, 23)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (25, 3, 1, 4, 413.99, N'2023-10-18', 1, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (32, 3, 1, 2, 413.99, N'2023-10-20', 1, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (33, 16, 2, 1, 319.99, N'2023-10-20', 5, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (53, 1, 3, 1, 269.99, N'2023-10-24', 1, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (54, 3, 2, 4, 319.99, N'2023-10-24', 4, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (55, 3, 1, 1, 413.99, N'2023-10-24', 1, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (56, 3, 4, 1, 70, N'2023-10-24', 1, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (57, 3, 3, 2, 269.99, N'2023-10-24', 3, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (58, 1, 5, 2, 120, N'2023-10-25', 3, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (59, 1, 3, 2, 269.99, N'2023-10-26', 1, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (60, 1, 1, 2, 413.99, N'2023-10-27', 2, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (61, 1, 1, 2, 413.99, N'2023-10-27', 4, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (62, 1, 2, 1, 319.99, N'2023-10-28', 3, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (63, 1, 7, 2, 209.99, N'2023-10-28', 1, 3)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (64, 1, 25, 2, 400, N'2023-10-28', 5, 2)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (66, 3, 1, 83, 413.99, N'2023-10-29', 4, 3)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (67, 1, 2, 3, 319.99, N'2023-10-31', 5, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (68, 1, 2, 1, 319.99, N'2023-10-31', 5, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (69, 1, 8, 2, 279.99, N'2023-10-31', 5, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (70, 1, 3, 1, 209.99, N'2023-10-31', 4, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (71, 1, 2, 1, 319.99, N'2023-10-31', 5, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (72, 1, 2, 1, 319.99, N'2023-10-31', 1, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (73, 1, 3, 2, 209.99, N'2023-10-31', 1, 2)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (74, 16, 2, 2, 319.99, N'2023-11-03', 1, 2)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (75, 16, 2, 2, 319.99, N'2023-11-03', 5, 2)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (76, 1, 2, 1, 319.99, N'2023-11-03', 1, 2)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (77, 1, 2, 1, 319.99, N'2023-11-03', 4, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (78, 3, 4, 1, 70, N'2023-11-08', 4, 1)
INSERT [dbo].[OrderDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [date], [status_id], [shipping_id]) VALUES (79, 3, 2, 1, 319.99, N'2023-11-08', 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (1, N'Denim shirt', 0, 459.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 3, N'denimShirt.jpg                                                                                                                                                                                                                                                 ', 3, 0.10000000149011612, 22, 88)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (2, N'Sweatshirt', 105, 399.99, N'83% Cotton, 17% Polyester, Full-zip closure and hood for adjustable coverage—and warmth', 2, N'sweatShirt.jpg                                                                                                                                                                                                                                                 ', 4, 0.20000000298023224, 22, 9)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (3, N'Grey blouse', 105, 299.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 1, N'greyBlouse.jpg                                                                                                                                                                                                                                                 ', 3, 0.30000001192092896, 22, 12)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (4, N'Black jacket', 138, 349.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 1, N'denimShirt.jpg                                                                                                                                                                                                                                                 ', 2, 0.800000011920929, 22, 2)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (5, N'Black jacket', 78, 300, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 3, N'blackJacket.jpg                                                                                                                                                                                                                                                ', 5, 0.60000002384185791, 22, 2)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (7, N'Grey blouse', 97, 299.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 1, N'greyBlouse.jpg                                                                                                                                                                                                                                                 ', 0, 0.30000001192092896, 22, 2)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (8, N'Sweatshirt', 92, 399.99, N'83% Cotton, 17% Polyester, Full-zip closure and hood for adjustable coverage—and warmth', 2, N'sweatShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.30000001192092896, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (9, N'Sweatshirt', 99, 399.99, N'83% Cotton, 17% Polyester, Full-zip closure and hood for adjustable coverage—and warmth', 2, N'sweatShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.10000000149011612, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (10, N'Black jacket', 99, 349.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 3, N'blackJacket.jpg                                                                                                                                                                                                                                                ', 0, 0.10000000149011612, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (11, N'Denim shirt', 92, 459.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 3, N'denimShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.10000000149011612, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (12, N'Denim shirt', 89, 459.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 3, N'denimShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.10000000149011612, 22, 3)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (13, N'Denim shirt', 99, 459.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 3, N'denimShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.10000000149011612, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (14, N'Black jacket', 92, 349.99, N'A great classic shirt in a slim fit for a sharp look. Convenient for use as an outer or inner layer.', 3, N'blackJacket.jpg                                                                                                                                                                                                                                                ', 0, 0.10000000149011612, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (15, N'Sweatshirt', 88, 399.99, N'83% Cotton, 17% Polyester, Full-zip closure and hood for adjustable coverage—and warmth', 2, N'sweatShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.30000001192092896, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (16, N'Sweatshirt', 99, 399.99, N'83% Cotton, 17% Polyester, Full-zip closure and hood for adjustable coverage—and warmth', 2, N'sweatShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.30000001192092896, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (20, N'Grey blouse', 92, 100, N'zvxzv', 1, N'greyBlouse.jpg                                                                                                                                                                                                                                                 ', 0, 0.10000000149011612, 22, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (21, N'Denim shirt', 92, 212, N'123', 2, N'denimShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.30000001192092896, 23, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (23, N'Grey blouse', 99, 1000, N'goood', 2, N'greyBlouse.jpg                                                                                                                                                                                                                                                 ', 0, 0.40000000596046448, 23, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (24, N'Denim shirt', 99, 230, N'goood', 2, N'denimShirt.jpg                                                                                                                                                                                                                                                 ', 0, 0.5, 23, 0)
INSERT [dbo].[Product] ([product_id], [name], [quantity], [price], [description], [category_id], [image], [rating], [discount], [sale_id], [soldout]) VALUES (25, N'Grey blouse', 14, 1000, N'goood', 1, N'greyBlouse.jpg                                                                                                                                                                                                                                                 ', 0, 0.60000002384185791, 22, -4)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (4, 22, 4, N'abc', N'2023/10/21 18:34:52', 2)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (5, 22, 1, N'nice123', N'2023/10/21 19:45:47', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (6, 22, 1, N'greate product', N'2023/10/21 19:59:56', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (7, 22, 1, N'nice', N'2023/10/21 20:00:58', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (10, 22, 1, N'so bad', N'2023/10/21 20:21:53', 1)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (11, 22, 3, N'tuyet voi
', N'2023/10/21 20:34:10', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (12, 22, 1, N'aassa', N'2023/10/21 21:36:36', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (14, 33, 1, N'nhu cc', N'2023/10/23 22:18:35', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (15, 22, 3, N'ngu', N'2023/10/24 10:04:53', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (16, 22, 1, N'abc', N'2023/10/24 11:17:23', 1)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (17, 22, 3, N'safa', N'2023/10/24 13:38:11', 2)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (18, 33, 2, N'', N'2023/10/24 14:52:11', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (20, 22, 5, N'good', N'2023/10/25 15:27:46', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (21, 22, 3, N'g', N'2023/10/27 08:44:45', 3)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (22, 22, 2, N'zxvxz', N'2023/10/28 15:36:23', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (23, 33, 1, N'gg', N'2023/10/31 20:46:39', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (26, 33, 1, N'aas', N'2023/10/31 21:03:32', 2)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (27, 33, 1, N'af', N'2023/11/08 20:22:51', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (28, 33, 1, N'asd', N'2023/11/08 20:23:09', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (29, 33, 1, N'', N'2023/11/08 20:27:50', 2)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (30, 33, 1, N'asf', N'2023/11/08 20:28:10', 3)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (31, 33, 1, N'123', N'2023/11/08 20:47:28', 3)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (32, 33, 1, N'', N'2023/11/08 20:48:23', 3)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (33, 33, 1, N'', N'2023/11/08 21:00:44', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (34, 33, 1, N'', N'2023/11/08 21:00:55', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (35, 33, 1, N'1', N'2023/11/08 21:03:05', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (36, 33, 1, N'', N'2023/11/08 21:08:22', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (37, 33, 1, N'123', N'2023/11/08 21:11:27', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (38, 33, 1, N'123', N'2023/11/08 21:11:36', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (39, 33, 1, N'123', N'2023/11/08 21:14:33', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (40, 33, 1, N'123', N'2023/11/08 21:14:52', 3)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (41, 33, 1, N'123', N'2023/11/08 21:17:19', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (42, 33, 1, N'', N'2023/11/08 21:25:02', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (43, 33, 1, N'asf', N'2023/11/08 21:25:35', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (44, 33, 1, N'asf', N'2023/11/08 21:26:42', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (45, 33, 1, N'', N'2023/11/08 21:30:19', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (46, 33, 1, N'', N'2023/11/08 21:31:20', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (47, 33, 1, N'', N'2023/11/08 21:32:39', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (51, 22, 1, N'', N'2023/11/08 21:41:56', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (52, 22, 1, N'', N'2023/11/08 21:43:31', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (53, 22, 1, N'123', N'2023/11/08 21:43:57', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (54, 22, 1, N'123', N'2023/11/08 21:45:03', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (90, 33, 2, N'cbxcc', N'2023/11/08 23:54:29', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (91, 22, 2, N'abc', N'2023/11/10 07:12:57', 4)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (92, 22, 2, N'goodxncx', N'2023/11/10 07:13:20', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (93, 22, 2, N'good', N'2023/11/10 07:33:19', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (94, 22, 2, N'good', N'2023/11/10 07:34:23', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (95, 22, 2, N'ggg', N'2023/11/10 08:39:24', 5)
INSERT [dbo].[Review] ([review_id], [user_id], [product_id], [content], [date], [rating]) VALUES (96, 22, 2, N'ggg', N'2023/11/10 08:40:05', 5)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([shipping_id], [name], [price], [time]) VALUES (1, N'Normal', 50, 5)
INSERT [dbo].[Shipping] ([shipping_id], [name], [price], [time]) VALUES (2, N'Fast', 100, 3)
INSERT [dbo].[Shipping] ([shipping_id], [name], [price], [time]) VALUES (3, N'Express', 200, 1)
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([status_id], [name]) VALUES (1, N'Pending')
INSERT [dbo].[Status] ([status_id], [name]) VALUES (2, N'Approved')
INSERT [dbo].[Status] ([status_id], [name]) VALUES (3, N'Shipping')
INSERT [dbo].[Status] ([status_id], [name]) VALUES (4, N'Received')
INSERT [dbo].[Status] ([status_id], [name]) VALUES (5, N'Canceled')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (1, N'admin', N'123                                                                                                                                                                                                                                                            ', N'admin@gmail.com                                                                                                                                                                                                                                                ', 0, N'HP', 0, N'avatarAdmin.jpg                                                                                                                                                                                                                                                ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (22, N'minhmanh', N'123                                                                                                                                                                                                                                                            ', N'manhminh2601@gmail.com                                                                                                                                                                                                                                         ', 0, N'Tinh Ha Giang, , ', 0, N'avatarAdmin.jpg                                                                                                                                                                                                                                                ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (23, N'policehpam123', N'123                                                                                                                                                                                                                                                            ', N'policehpa@gmail.com                                                                                                                                                                                                                                            ', 2, N'Tinh Vinh Phuc, Huyen Yen Lac, Xa Dai Tu', 2, N'avatarAdmin.jpg                                                                                                                                                                                                                                                ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (25, N'1234', N'1234                                                                                                                                                                                                                                                           ', N'qqh60022@nezid.com                                                                                                                                                                                                                                             ', 2, N'1234', 1, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (27, N'user1', N'123                                                                                                                                                                                                                                                            ', N'm@gmail.com                                                                                                                                                                                                                                                    ', 1, N'cụm 2, Điềm Niêm', 0, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (30, NULL, N'123                                                                                                                                                                                                                                                            ', N'a@gmail.com                                                                                                                                                                                                                                                    ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (31, NULL, N'1223                                                                                                                                                                                                                                                           ', N'b@gmail.com                                                                                                                                                                                                                                                    ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (32, NULL, N'123                                                                                                                                                                                                                                                            ', N'tester@gmail.com                                                                                                                                                                                                                                               ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (33, NULL, N'123                                                                                                                                                                                                                                                            ', N'test@gmail.com                                                                                                                                                                                                                                                 ', 1, N'Tinh Yen Bai, Thanh pho Yen Bai, Phuong Yen Thinh', NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (34, NULL, N'123                                                                                                                                                                                                                                                            ', N'tester1@gmail.com                                                                                                                                                                                                                                              ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (35, N'tester', N'123                                                                                                                                                                                                                                                            ', N'test1@gmail.com                                                                                                                                                                                                                                                ', 1, N'', 2, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (36, NULL, N'123                                                                                                                                                                                                                                                            ', N'tester@gmail.com2                                                                                                                                                                                                                                              ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (37, NULL, N'123                                                                                                                                                                                                                                                            ', N'tester2@gmail.com                                                                                                                                                                                                                                              ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (40, NULL, N'123                                                                                                                                                                                                                                                            ', N'tester@12gmail.com                                                                                                                                                                                                                                             ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (41, N'123456', N'user                                                                                                                                                                                                                                                           ', N'manhminh26013456@gmail.com                                                                                                                                                                                                                                     ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([user_id], [username], [password], [email], [role], [address], [gender], [avatar]) VALUES (42, N'123456', N'user                                                                                                                                                                                                                                                           ', N'vxbsd@gmail.com                                                                                                                                                                                                                                                ', 1, NULL, NULL, N'avatarUser.jpg                                                                                                                                                                                                                                                 ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
