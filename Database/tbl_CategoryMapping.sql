USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMapping]'))
ALTER TABLE [dbo].[CategoryMapping] DROP CONSTRAINT [FK_CategoryMapping_SubCategory]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMapping]'))
ALTER TABLE [dbo].[CategoryMapping] DROP CONSTRAINT [FK_CategoryMapping_Category]
GO

/****** Object:  Index [NonClusteredIndex-20160515-121403]    Script Date: 5/15/2016 12:14:20 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMapping]') AND name = N'NonClusteredIndex-20160515-121403')
DROP INDEX [NonClusteredIndex-20160515-121403] ON [dbo].[CategoryMapping]
GO

/****** Object:  Index [ClusteredIndex-20160515-113631]    Script Date: 5/15/2016 12:14:20 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMapping]') AND name = N'ClusteredIndex-20160515-113631')
DROP INDEX [ClusteredIndex-20160515-113631] ON [dbo].[CategoryMapping] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[CategoryMapping]    Script Date: 5/15/2016 12:14:20 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMapping]') AND type in (N'U'))
DROP TABLE [dbo].[CategoryMapping]
GO

/****** Object:  Table [dbo].[CategoryMapping]    Script Date: 5/15/2016 12:14:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoryMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [ClusteredIndex-20160515-113631]    Script Date: 5/15/2016 12:14:20 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMapping]') AND name = N'ClusteredIndex-20160515-113631')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160515-113631] ON [dbo].[CategoryMapping]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [NonClusteredIndex-20160515-121403]    Script Date: 5/15/2016 12:14:20 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMapping]') AND name = N'NonClusteredIndex-20160515-121403')
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20160515-121403] ON [dbo].[CategoryMapping]
(
	[CategoryId] ASC,
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMapping]'))
ALTER TABLE [dbo].[CategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_CategoryMapping_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMapping]'))
ALTER TABLE [dbo].[CategoryMapping] CHECK CONSTRAINT [FK_CategoryMapping_Category]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMapping]'))
ALTER TABLE [dbo].[CategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_CategoryMapping_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMapping]'))
ALTER TABLE [dbo].[CategoryMapping] CHECK CONSTRAINT [FK_CategoryMapping_SubCategory]
GO


