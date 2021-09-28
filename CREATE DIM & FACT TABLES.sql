USE [BikesDW]
GO


/****** Object:  Table [dbo].[Dim_Addresses]    Script Date: 9/11/2021 3:50:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAddresses](
	[ADDRESS_KEY] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
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
) ON [PRIMARY];
GO


/****** Object:  Table [dbo].[DimBusinessPartners]    Script Date: 9/11/2021 4:01:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimBusinessPartners](
	[PARTNER_KEY] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
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
) ON [PRIMARY];
GO




/****** Object:  Table [dbo].[DimEmployees]    Script Date: 9/11/2021 4:03:06 PM ******/
-- REMOVED COLUMNS NAME INITIALS AND 14 THROUGH 19--

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimEmployees](
	[EMPLOYEE_KEY] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
	[EMPLOYEE_ID] [nvarchar](50) NOT NULL,
	[NAME_FIRST] [nvarchar](50) NOT NULL,
	[NAME_MIDDLE] [nvarchar](50) NULL,
	[NAME_LAST] [nvarchar](50) NOT NULL,
	[SEX] [nvarchar](50) NOT NULL,
	[LANGUAGE] [nvarchar](50) NOT NULL,
	[PHONENUMBER] [nvarchar](50) NOT NULL,
	[EMAILADDRESS] [nvarchar](50) NOT NULL,
	[LOGINNAME] [nvarchar](50) NOT NULL,
	[ADDRESSID] [int] NOT NULL,
	[VALIDITY_STARTDATE] [int] NOT NULL,
	[VALIDITY_ENDDATE] [int] NOT NULL
) ON [PRIMARY];
GO



/**CREATE TWO NEW COMBINED TABLES **/


/****** Object:  Table [dbo].[DimProductCat_EXT]    Script Date: 9/13/2021 9:24:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProductCat_EXT](
	[PRODCATEGORY_KEY] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
	[PRODCATEGORY_ID] [nvarchar](50) NOT NULL,
	[CREATEDBY] [int] NOT NULL,
	[CREATEDAT] [int] NOT NULL,
	[LANGUAGE] [nvarchar](50) NOT NULL,
	[SHORT_DESCR] [nvarchar](50) NOT NULL,
	[MEDIUM_DESCR] [nvarchar](1) NULL,
	[LONG_DESCR] [nvarchar](1) NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimProducts_EXT]    Script Date: 9/11/2021 3:20:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProducts_EXT](
	[PRODUCT_KEY] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
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
	[LANGUAGE] [nvarchar](50) NOT NULL,
	[SHORT_DESCR] [nvarchar](50) NOT NULL,
	[MEDIUM_DESCR] [nvarchar](50) NULL,
	[LONG_DESCR] [nvarchar](1) NULL
) ON [PRIMARY];
GO



/****** Object:  Table [dbo].[FactSalesOrderItems]    Script Date: 9/11/2021 3:17:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactSalesOrderItems](
	[ORDERITEM_KEY] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[SALESORDER_ID] [int] NOT NULL,
	[SALESORDERITEM] [int] NOT NULL,
	[PRODUCT_KEY] [int] NOT NULL,
	[PRODUCT_ID] [nvarchar](50) NOT NULL,
	[CURRENCY] [nvarchar](50) NOT NULL,
	[GROSSAMOUNT] [int] NOT NULL,
	[NETAMOUNT] [float] NOT NULL,
	[TAXAMOUNT] [float] NOT NULL,
	[ITEMATPSTATUS] [nvarchar](50) NOT NULL,
	[QUANTITY] [nvarchar](50) NOT NULL,
	[QUANTITYUNIT] [nvarchar](50) NOT NULL,
	[DELIVERYDATE] [int] NOT NULL
) ON [PRIMARY];
GO



/****** Object:  Table [dbo].[FactSalesOrders]    Script Date: 9/11/2021 3:18:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactSalesOrders](
	[SALESORDER_ID] [int] NOT NULL PRIMARY KEY,
	[CREATEDBY] [nvarchar](50) NOT NULL,
	[CREATEDAT] [int] NOT NULL,
	[CHANGEDBY] [nvarchar](50) NOT NULL,
	[CHANGEDAT] [int] NOT NULL,
	[FISCVARIANT] [nvarchar](50) NOT NULL,
	[FISCALYEARPERIOD] [int] NOT NULL,
	[PARTNER_KEY] [int] NOT NULL,
	[PARTNER_ID] [int] NOT NULL,
	[SALESORG] [nvarchar](50) NOT NULL,
	[CURRENCY] [nvarchar](50) NOT NULL,
	[GROSSAMOUNT] [int] NOT NULL,
	[NETAMOUNT] [float] NOT NULL,
	[TAXAMOUNT] [float] NOT NULL,
	[LIFECYCLESTATUS] [nvarchar](50) NOT NULL,
	[BILLINGSTATUS] [nvarchar](50) NOT NULL,
	[DELIVERYSTATUS] [nvarchar](50) NOT NULL
) ON [PRIMARY];
GO


-------------------------------------------------------------------------------------------------------------------
/** CREATE FORIEGN KEYS **/
-------------------------------------------------------------------------------------------------------------------

-- adding to FactSalesOrderItems
ALTER TABLE [dbo].[FactSalesOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_Prod_SOI] FOREIGN KEY([PRODUCT_KEY])
REFERENCES [dbo].[DimProducts_EXT] ([PRODUCT_KEY])

ALTER TABLE [dbo].[FactSalesOrderItems] CHECK CONSTRAINT [FK_Prod_SOI];
GO


-- adding to FactSalesOrders
ALTER TABLE [dbo].[FactSalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_Part_SOI] FOREIGN KEY([PARTNER_KEY])
REFERENCES [dbo].[DimBusinessPartners] ([PARTNER_KEY])

ALTER TABLE [dbo].[FactSalesOrders] CHECK CONSTRAINT [FK_Part_SOI];
GO