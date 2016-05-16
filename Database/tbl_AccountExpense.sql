USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_AccountPayment]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense] DROP CONSTRAINT [FK_AccountExpense_AccountPayment]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_AccountExpenseType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense] DROP CONSTRAINT [FK_AccountExpense_AccountExpenseType]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense] DROP CONSTRAINT [FK_AccountExpense_Account]
GO

/****** Object:  Index [NonClusteredIndex-20160515-171721]    Script Date: 5/15/2016 5:20:45 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountExpense]') AND name = N'NonClusteredIndex-20160515-171721')
DROP INDEX [NonClusteredIndex-20160515-171721] ON [dbo].[AccountExpense]
GO

/****** Object:  Index [NonClusteredIndex-20160515-171657]    Script Date: 5/15/2016 5:20:45 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountExpense]') AND name = N'NonClusteredIndex-20160515-171657')
DROP INDEX [NonClusteredIndex-20160515-171657] ON [dbo].[AccountExpense]
GO

/****** Object:  Index [ClusteredIndex-20160515-171635]    Script Date: 5/15/2016 5:20:45 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountExpense]') AND name = N'ClusteredIndex-20160515-171635')
DROP INDEX [ClusteredIndex-20160515-171635] ON [dbo].[AccountExpense] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[AccountExpense]    Script Date: 5/15/2016 5:20:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountExpense]') AND type in (N'U'))
DROP TABLE [dbo].[AccountExpense]
GO

/****** Object:  Table [dbo].[AccountExpense]    Script Date: 5/15/2016 5:20:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountExpense]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountExpense](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ExpenseTypeId] [int] NULL,
	[PaymentId] [int]  NULL,
	[Amount] [numeric](18, 2) NOT NULL,
	[ExpenseDate] [datetime] NOT NULL,
	[Comment] [varchar](500) NULL
	
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160515-171635]    Script Date: 5/15/2016 5:20:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountExpense]') AND name = N'ClusteredIndex-20160515-171635')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160515-171635] ON [dbo].[AccountExpense]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [NonClusteredIndex-20160515-171657]    Script Date: 5/15/2016 5:20:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountExpense]') AND name = N'NonClusteredIndex-20160515-171657')
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160515-171657] ON [dbo].[AccountExpense]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [NonClusteredIndex-20160515-171721]    Script Date: 5/15/2016 5:20:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountExpense]') AND name = N'NonClusteredIndex-20160515-171721')
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160515-171721] ON [dbo].[AccountExpense]
(
	[AccountId] ASC,
	[ExpenseDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense]  WITH CHECK ADD  CONSTRAINT [FK_AccountExpense_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense] CHECK CONSTRAINT [FK_AccountExpense_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_AccountExpenseType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense]  WITH CHECK ADD  CONSTRAINT [FK_AccountExpense_AccountExpenseType] FOREIGN KEY([ExpenseTypeId])
REFERENCES [dbo].[AccountExpenseType] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_AccountExpenseType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense] CHECK CONSTRAINT [FK_AccountExpense_AccountExpenseType]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_AccountPayment]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense]  WITH CHECK ADD  CONSTRAINT [FK_AccountExpense_AccountPayment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[AccountPayment] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountExpense_AccountPayment]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountExpense]'))
ALTER TABLE [dbo].[AccountExpense] CHECK CONSTRAINT [FK_AccountExpense_AccountPayment]
GO


