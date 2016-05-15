USE [ExpenseManager]
GO

/****** Object:  Index [ClusteredIndex-20160430-201325]    Script Date: 5/14/2016 10:00:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND name = N'ClusteredIndex-20160430-201325')
DROP INDEX [ClusteredIndex-20160430-201325] ON [dbo].[Category] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[Category]    Script Date: 5/14/2016 10:00:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 5/14/2016 10:00:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160430-201325]    Script Date: 5/14/2016 10:00:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND name = N'ClusteredIndex-20160430-201325')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160430-201325] ON [dbo].[Category]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


