USE [ExpenseManager]
GO

/****** Object:  Index [NonClusteredIndex-20160515-114601]    Script Date: 5/15/2016 11:46:35 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategory]') AND name = N'NonClusteredIndex-20160515-114601')
DROP INDEX [NonClusteredIndex-20160515-114601] ON [dbo].[AccountCategory]
GO

/****** Object:  Index [ClusteredIndex-20160430-201325]    Script Date: 5/15/2016 11:46:35 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategory]') AND name = N'ClusteredIndex-20160430-201325')
DROP INDEX [ClusteredIndex-20160430-201325] ON [dbo].[AccountCategory] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[AccountCategory]    Script Date: 5/15/2016 11:46:35 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategory]') AND type in (N'U'))
DROP TABLE [dbo].[AccountCategory]
GO

/****** Object:  Table [dbo].[AccountCategory]    Script Date: 5/15/2016 11:46:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] int not null,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160430-201325]    Script Date: 5/15/2016 11:46:35 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategory]') AND name = N'ClusteredIndex-20160430-201325')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160430-201325] ON [dbo].[AccountCategory]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

SET ANSI_PADDING ON

GO

/****** Object:  Index [NonClusteredIndex-20160515-114601]    Script Date: 5/15/2016 11:46:35 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategory]') AND name = N'NonClusteredIndex-20160515-114601')
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20160515-114601] ON [dbo].[AccountCategory]
(
	[AccountId],[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


