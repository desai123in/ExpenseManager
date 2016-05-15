USE [ExpenseManager]
GO

/****** Object:  Index [ClusteredIndex-20160515-112421]    Script Date: 5/15/2016 11:24:41 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND name = N'ClusteredIndex-20160515-112421')
DROP INDEX [ClusteredIndex-20160515-112421] ON [dbo].[PaymentType] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[PaymentType]    Script Date: 5/15/2016 11:24:41 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND type in (N'U'))
DROP TABLE [dbo].[PaymentType]
GO

/****** Object:  Table [dbo].[PaymentType]    Script Date: 5/15/2016 11:24:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160515-112421]    Script Date: 5/15/2016 11:24:41 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND name = N'ClusteredIndex-20160515-112421')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160515-112421] ON [dbo].[PaymentType]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


