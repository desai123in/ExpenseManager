USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory] DROP CONSTRAINT [FK_SubCategory_Category]
GO

/****** Object:  Index [ClusteredIndex-20160430-201342]    Script Date: 5/14/2016 10:04:04 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND name = N'ClusteredIndex-20160430-201342')
DROP INDEX [ClusteredIndex-20160430-201342] ON [dbo].[SubCategory] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[SubCategory]    Script Date: 5/14/2016 10:04:04 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
DROP TABLE [dbo].[SubCategory]
GO

/****** Object:  Table [dbo].[SubCategory]    Script Date: 5/14/2016 10:04:04 PM ******/
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
	[Name] [varchar](500) NOT NULL,
	[CategoryId] [int] NOT NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160430-201342]    Script Date: 5/14/2016 10:04:04 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND name = N'ClusteredIndex-20160430-201342')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160430-201342] ON [dbo].[SubCategory]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO


