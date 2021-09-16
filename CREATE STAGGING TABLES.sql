USE [BikesDW]
GO

/****** Object:  Table [dbo].[Addresses]    Script Date: 9/11/2021 3:09:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_Addresses](
	[ADDRESS_ID] [int] NOT NULL,
	[CITY] [nvarchar](50) NOT NULL,
	[POSTALCODE] [nvarchar](50) NOT NULL,
	[STREET] [nvarchar](50) NOT NULL,
	[BUILDING] [int] NULL,
	[COUNTRY] [nvarchar](50) NOT NULL,
	[REGION] [nvarchar](50) NOT NULL,
	[ADDRESS_TYPE] [nvarchar](50) NOT NULL,
	[VALIDITY_STARTDATE] [int] NULL,
	[VALIDITY_ENDDATE] [int] NULL,
	[LATITUDE] [float] NULL,
	[LONGITUDE] [float] NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[BusinessPartners]    Script Date: 9/11/2021 3:15:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_BusinessPartners](
	[PARTNER_ID] [int] NOT NULL,
	[PARTNERROLE] [nvarchar](50) NOT NULL,
	[EMAILADDRESS] [nvarchar](50) NULL,
	[PHONENUMBER] [float] NULL,
	[FAXNUMBER] [nvarchar](1) NULL,
	[WEBADDRESS] [nvarchar](50) NULL,
	[ADDRESS_ID] [int] NOT NULL,
	[COMPANYNAME] [nvarchar](50) NOT NULL,
	[LEGALFORM] [nvarchar](50) NULL,
	[CREATEDBY] [nvarchar](50) NULL,
	[CREATEDAT] [int] NULL,
	[CHANGEDBY] [nvarchar](50) NULL,
	[CHANGEDAT] [int] NULL,
	[CURRENCY] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Employees]    Script Date: 9/11/2021 3:16:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_Employees](
	[EMPLOYEE_ID] [nvarchar](50) NOT NULL,
	[NAME_FIRST] [nvarchar](50) NOT NULL,
	[NAME_MIDDLE] [nvarchar](50) NULL,
	[NAME_LAST] [nvarchar](50) NOT NULL,
	[NAME_INITIALS] [nvarchar](1) NULL,
	[SEX] [nvarchar](50) NOT NULL,
	[LANGUAGE] [nvarchar](50) NOT NULL,
	[PHONENUMBER] [nvarchar](50) NOT NULL,
	[EMAILADDRESS] [nvarchar](50) NOT NULL,
	[LOGINNAME] [nvarchar](50) NOT NULL,
	[ADDRESSID] [int] NOT NULL,
	[VALIDITY_STARTDATE] [int] NOT NULL,
	[VALIDITY_ENDDATE] [int] NOT NULL,
	[column14] [nvarchar](1) NULL,
	[column15] [nvarchar](1) NULL,
	[column16] [nvarchar](1) NULL,
	[column17] [nvarchar](1) NULL,
	[column18] [nvarchar](1) NULL,
	[column19] [nvarchar](1) NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[SalesOrderItems]    Script Date: 9/11/2021 3:17:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_SalesOrderItems](
	[SALESORDER_ID] [int] NOT NULL,
	[SALESORDERITEM] [int] NOT NULL,
	[PRODUCT_ID] [nvarchar](50) NOT NULL,
	[NOTE_ID] [nvarchar](1) NULL,
	[CURRENCY] [nvarchar](50) NOT NULL,
	[GROSSAMOUNT] [int] NOT NULL,
	[NETAMOUNT] [float] NOT NULL,
	[TAXAMOUNT] [float] NOT NULL,
	[ITEMATPSTATUS] [nvarchar](50) NOT NULL,
	[OPITEMPOS] [nvarchar](1) NULL,
	[QUANTITY] [nvarchar](50) NOT NULL,
	[QUANTITYUNIT] [nvarchar](50) NOT NULL,
	[DELIVERYDATE] [int] NOT NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[SalesOrders]    Script Date: 9/11/2021 3:18:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_SalesOrders](
	[SALESORDER_ID] [int] NOT NULL,
	[CREATEDBY] [nvarchar](50) NOT NULL,
	[CREATEDAT] [int] NOT NULL,
	[CHANGEDBY] [nvarchar](50) NOT NULL,
	[CHANGEDAT] [int] NOT NULL,
	[FISCVARIANT] [nvarchar](50) NOT NULL,
	[FISCALYEARPERIOD] [int] NOT NULL,
	[NOTE_ID] [nvarchar](1) NULL,
	[PARTNER_ID] [int] NOT NULL,
	[SALESORG] [nvarchar](50) NOT NULL,
	[CURRENCY] [nvarchar](50) NOT NULL,
	[GROSSAMOUNT] [int] NOT NULL,
	[NETAMOUNT] [float] NOT NULL,
	[TAXAMOUNT] [float] NOT NULL,
	[LIFECYCLESTATUS] [nvarchar](50) NOT NULL,
	[BILLINGSTATUS] [nvarchar](50) NOT NULL,
	[DELIVERYSTATUS] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[ProductCategories]    Script Date: 9/11/2021 3:19:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_ProductCategories](
	[PRODCATEGORY_ID] [nvarchar](50) NOT NULL,
	[CREATEDBY] [int] NOT NULL,
	[CREATEDAT] [int] NOT NULL
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[ProductCategoryText]    Script Date: 9/11/2021 3:19:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_ProductCategoryText](
	[PRODCATEGORY_ID] [nvarchar](50) NOT NULL,
	[LANGUAGE] [nvarchar](50) NOT NULL,
	[SHORT_DESCR] [nvarchar](50) NOT NULL,
	[MEDIUM_DESCR] [nvarchar](1) NULL,
	[LONG_DESCR] [nvarchar](1) NULL
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Products]    Script Date: 9/11/2021 3:20:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_Products](
	[PRODUCT_ID] [nvarchar](50) NOT NULL,
	[TYPECODE] [nvarchar](50) NOT NULL,
	[PRODCATEGORY_ID] [nvarchar](50) NOT NULL,
	[CREATEDBY] [nvarchar](50) NOT NULL,
	[CREATEDAT] [int] NOT NULL,
	[CHANGEDBY] [nvarchar](50) NOT NULL,
	[CHANGEDAT] [int] NOT NULL,
	[SUPPLIER_PARTNER_ID] [int] NOT NULL,
	[TAXTARIFFCODE] [nvarchar](50) NOT NULL,
	[QUANTITYUNIT] [nvarchar](50) NOT NULL,
	[WEIGHTMEASURE] [float] NOT NULL,
	[WEIGHTUNIT] [nvarchar](50) NOT NULL,
	[CURRENCY] [nvarchar](50) NOT NULL,
	[PRICE] [int] NOT NULL,
	[WIDTH] [nvarchar](1) NULL,
	[DEPTH] [nvarchar](1) NULL,
	[HEIGHT] [nvarchar](1) NULL,
	[DIMENSIONUNIT] [nvarchar](1) NULL,
	[PRODUCTPICURL] [nvarchar](1) NULL
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[ProductTexts]    Script Date: 9/11/2021 3:21:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stagging_ProductTexts](
	[PRODUCT_ID] [nvarchar](50) NOT NULL,
	[LANGUAGE] [nvarchar](50) NOT NULL,
	[SHORT_DESCR] [nvarchar](50) NOT NULL,
	[MEDIUM_DESCR] [nvarchar](50) NULL,
	[LONG_DESCR] [nvarchar](1) NULL
) ON [PRIMARY]
GO

