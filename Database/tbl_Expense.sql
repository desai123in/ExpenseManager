USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense] DROP CONSTRAINT [FK_Expense_SubCategory]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_Payment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense] DROP CONSTRAINT [FK_Expense_Payment]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense] DROP CONSTRAINT [FK_Expense_Account]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Expenses_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Expense] DROP CONSTRAINT [DF_Expenses_UpdateDate]
END

GO

/****** Object:  Index [NonClusteredIndex-20160430-200934]    Script Date: 5/15/2016 11:32:31 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Expense]') AND name = N'NonClusteredIndex-20160430-200934')
DROP INDEX [NonClusteredIndex-20160430-200934] ON [dbo].[Expense]
GO

/****** Object:  Index [ClusteredIndex-20160430-200924]    Script Date: 5/15/2016 11:32:31 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Expense]') AND name = N'ClusteredIndex-20160430-200924')
DROP INDEX [ClusteredIndex-20160430-200924] ON [dbo].[Expense] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[Expense]    Script Date: 5/15/2016 11:32:31 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Expense]') AND type in (N'U'))
DROP TABLE [dbo].[Expense]
GO

/****** Object:  Table [dbo].[Expense]    Script Date: 5/15/2016 11:32:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Expense]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Expense](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[SubCategoryId] [int] NULL,
	[PaymentId] [int] NOT NULL,
	[Amount] [numeric](18, 2) NOT NULL,
	[ExpenseDate] [datetime] NOT NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[InsertUser] [varchar](100) NULL,
	[UpdateUser] [varchar](100) NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160430-200924]    Script Date: 5/15/2016 11:32:31 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Expense]') AND name = N'ClusteredIndex-20160430-200924')
CREATE CLUSTERED INDEX [ClusteredIndex-20160430-200924] ON [dbo].[Expense]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [NonClusteredIndex-20160430-200934]    Script Date: 5/15/2016 11:32:31 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Expense]') AND name = N'NonClusteredIndex-20160430-200934')
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160430-200934] ON [dbo].[Expense]
(
	[ExpenseDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Expenses_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Expense] ADD  CONSTRAINT [DF_Expenses_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_Payment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_Payment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_Payment]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Expense_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Expense]'))
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_SubCategory]
GO


