USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_AccountExpenseType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]'))
ALTER TABLE [dbo].[AccountCategoryMapping] DROP CONSTRAINT [FK_CategoryMapping_AccountExpenseType]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_AccountCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]'))
ALTER TABLE [dbo].[AccountCategoryMapping] DROP CONSTRAINT [FK_CategoryMapping_AccountCategory]
GO

/****** Object:  Index [ClusteredIndex-20160515-170306]    Script Date: 5/15/2016 5:04:51 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]') AND name = N'ClusteredIndex-20160515-170306')
DROP INDEX [ClusteredIndex-20160515-170306] ON [dbo].[AccountCategoryMapping] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[AccountCategoryMapping]    Script Date: 5/15/2016 5:04:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]') AND type in (N'U'))
DROP TABLE [dbo].[AccountCategoryMapping]
GO

/****** Object:  Table [dbo].[AccountCategoryMapping]    Script Date: 5/15/2016 5:04:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountCategoryMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountCategoryId] [int] NOT NULL,
	[AccountExpenseTypeId] [int] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [ClusteredIndex-20160515-170306]    Script Date: 5/15/2016 5:04:51 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]') AND name = N'ClusteredIndex-20160515-170306')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160515-170306] ON [dbo].[AccountCategoryMapping]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_AccountCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]'))
ALTER TABLE [dbo].[AccountCategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_CategoryMapping_AccountCategory] FOREIGN KEY([AccountCategoryId])
REFERENCES [dbo].[AccountCategory] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_AccountCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]'))
ALTER TABLE [dbo].[AccountCategoryMapping] CHECK CONSTRAINT [FK_CategoryMapping_AccountCategory]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_AccountExpenseType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]'))
ALTER TABLE [dbo].[AccountCategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_CategoryMapping_AccountExpenseType] FOREIGN KEY([AccountExpenseTypeId])
REFERENCES [dbo].[AccountExpenseType] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryMapping_AccountExpenseType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCategoryMapping]'))
ALTER TABLE [dbo].[AccountCategoryMapping] CHECK CONSTRAINT [FK_CategoryMapping_AccountExpenseType]
GO


