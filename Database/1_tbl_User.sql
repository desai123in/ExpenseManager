USE [ExpenseManager]
GO

/****** Object:  Index [ClusteredIndex-20160514-202005]    Script Date: 5/14/2016 8:32:23 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'ClusteredIndex-20160514-202005')
DROP INDEX [ClusteredIndex-20160514-202005] ON [dbo].[User] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[User]    Script Date: 5/14/2016 8:32:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO

/****** Object:  Table [dbo].[User]    Script Date: 5/14/2016 8:32:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160514-202005]    Script Date: 5/14/2016 8:32:23 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'ClusteredIndex-20160514-202005')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160514-202005] ON [dbo].[User]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


