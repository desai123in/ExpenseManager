USE [ExpenseManager]
GO

/****** Object:  Index [NonClusteredIndex-20160515-114622]    Script Date: 5/15/2016 11:47:01 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND name = N'NonClusteredIndex-20160515-114622')
DROP INDEX [NonClusteredIndex-20160515-114622] ON [dbo].[SubCategory]
GO

/****** Object:  Index [ClusteredIndex-20160430-201342]    Script Date: 5/15/2016 11:47:01 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND name = N'ClusteredIndex-20160430-201342')
DROP INDEX [ClusteredIndex-20160430-201342] ON [dbo].[SubCategory] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[SubCategory]    Script Date: 5/15/2016 11:47:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
DROP TABLE [dbo].[SubCategory]
GO

/****** Object:  Table [dbo].[SubCategory]    Script Date: 5/15/2016 11:47:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160430-201342]    Script Date: 5/15/2016 11:47:01 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND name = N'ClusteredIndex-20160430-201342')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160430-201342] ON [dbo].[SubCategory]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

SET ANSI_PADDING ON

GO

/****** Object:  Index [NonClusteredIndex-20160515-114622]    Script Date: 5/15/2016 11:47:01 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND name = N'NonClusteredIndex-20160515-114622')
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20160515-114622] ON [dbo].[SubCategory]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


