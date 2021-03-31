/*
This T-SQL script creates a MS MSQL database with sample data

Tables:

-----------
| app_user |
-----------
------------
| category |
------------
    1|
     |
	M|
------------	 
| product  |
------------


*/

/****** Object:  Table [dbo].[app_user]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[app_user](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
	[category_description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[product_description] [nvarchar](255) NULL,
	[product_stock] [int] NOT NULL,
	[product_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [product_stock]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0.00)) FOR [product_price]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([_id])
GO

SET IDENTITY_INSERT [dbo].[app_user] ON 
GO
INSERT [dbo].[app_user] ([_id], [first_name], [last_name], [email], [password], [role]) VALUES (1, 'Alice', 'Admin', 'alice@web.com', 'password', 'admin')
GO
INSERT [dbo].[app_user] ([_id], [first_name], [last_name], [email], [password], [role]) VALUES (2, 'Bob', 'Manager', 'bob@web.com', 'password', 'manager')
GO
INSERT [dbo].[app_user] ([_id], [first_name], [last_name], [email], [password], [role]) VALUES (3, 'Eve', 'User', 'eve@web.com', 'password', 'user')
GO
SET IDENTITY_INSERT [dbo].[app_user] OFF
GO

SET IDENTITY_INSERT [dbo].[category] ON 
GO
INSERT [dbo].[category] ([_id], [category_name], [category_description]) VALUES (1, 'Books', 'Paper and hard cover, fiction and non-fiction')
GO
INSERT [dbo].[category] ([_id], [category_name], [category_description]) VALUES (2, 'Computer', 'Desktop, laptops, and accessories')
GO
INSERT [dbo].[category] ([_id], [category_name], [category_description]) VALUES (3, 'Entertainment', 'Home electronicsa, TV, HiFi, etc.')
GO
INSERT [dbo].[category] ([_id], [category_name], [category_description]) VALUES (4, 'Kitchen', 'Kitchen + cooking appliances')
GO
INSERT [dbo].[category] ([_id], [category_name], [category_description]) VALUES (5, 'Laundry', 'Clothes washers, dryers, and accesories')
GO
INSERT [dbo].[category] ([_id], [category_name], [category_description]) VALUES (6, 'Mobile Devices', 'Mobile phones, tablets, and accessories')
GO
INSERT [dbo].[category] ([_id], [category_name], [category_description]) VALUES (7, 'Furniture', 'Home and home office furniture')
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (1, 4, 'Kettle', 'Steel Electric Kettle', 100, CAST(55.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (2, 4, 'Fridge freezer', 'Fridge + freezer large', 45, CAST(799.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (3, 2, 'Microsoft Surface Laptop 2', '8GB ram, 512GB ssd', 5, CAST(1299.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (4, 2, '13inch Laptop', 'HP laptop,8GB RAM,250GB SSD', 45, CAST(799.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (5, 6, 'Samsung 10inch Tablet', 'Android6GB ram, 128GB storage, 10inch screen', 5, CAST(99.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (6, 3, '60inch TV', 'Sony 4K,OLED,Smart TV', 12, CAST(2799.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (7, 5, 'Clothes Washing Machine', '1600rpm spin,A+++ rated,10KG', 50, CAST(699.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (8, 6, 'iPhone XS', '128GB', 5, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (9, 1, 'Azure Web Apps', 'Paperback, January 2019, Cloud publishing', 50, CAST(19.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (10, 1, 'SQL and No SQL for beginners', 'Paperback, Oct 2018, Cloud publishing', 10, CAST(399.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (11, 7, 'Bed', 'Super King size,super comfort mattress', 5, CAST(899.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (12, 2, 'Learning JavaScript', 'Become a JavaScript expert in 2 hours!', 10, CAST(12.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([_id], [category_id], [product_name], [product_description], [product_stock], [product_price]) VALUES (13, 7, 'Desk', 'Small computer desk', 5, CAST(99.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO