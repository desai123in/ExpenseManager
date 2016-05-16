USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Payment_PaymentType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountPayment]'))
ALTER TABLE [dbo].[AccountPayment] DROP CONSTRAINT [FK_Payment_PaymentType]
GO

/****** Object:  Index [ClusteredIndex-20160515-112705]    Script Date: 5/15/2016 11:28:46 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountPayment]') AND name = N'ClusteredIndex-20160515-112705')
DROP INDEX [ClusteredIndex-20160515-112705] ON [dbo].[AccountPayment] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[AccountPayment]    Script Date: 5/15/2016 11:28:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountPayment]') AND type in (N'U'))
DROP TABLE [dbo].[AccountPayment]
GO

/****** Object:  Table [dbo].[AccountPayment]    Script Date: 5/15/2016 11:28:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountPayment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] int not null,
	[Name] [varchar](100) NOT NULL,
	[PaymentTypeId] [int] NOT NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [ClusteredIndex-20160515-112705]    Script Date: 5/15/2016 11:28:46 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountPayment]') AND name = N'ClusteredIndex-20160515-112705')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160515-112705] ON [dbo].[AccountPayment]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Payment_PaymentType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountPayment]'))
ALTER TABLE [dbo].[AccountPayment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Payment_PaymentType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountPayment]'))
ALTER TABLE [dbo].[AccountPayment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO


