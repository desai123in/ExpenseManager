USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountUser_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountUser]'))
ALTER TABLE [dbo].[AccountUser] DROP CONSTRAINT [FK_AccountUser_User]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountUser_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountUser]'))
ALTER TABLE [dbo].[AccountUser] DROP CONSTRAINT [FK_AccountUser_Account]
GO

/****** Object:  Index [ClusteredIndex-20160514-203019]    Script Date: 5/14/2016 8:31:31 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountUser]') AND name = N'ClusteredIndex-20160514-203019')
DROP INDEX [ClusteredIndex-20160514-203019] ON [dbo].[AccountUser] WITH ( ONLINE = OFF )
GO

/****** Object:  Table [dbo].[AccountUser]    Script Date: 5/14/2016 8:31:31 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountUser]') AND type in (N'U'))
DROP TABLE [dbo].[AccountUser]
GO

/****** Object:  Table [dbo].[AccountUser]    Script Date: 5/14/2016 8:31:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[UserId] [int] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [ClusteredIndex-20160514-203019]    Script Date: 5/14/2016 8:31:31 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountUser]') AND name = N'ClusteredIndex-20160514-203019')
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20160514-203019] ON [dbo].[AccountUser]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountUser_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountUser]'))
ALTER TABLE [dbo].[AccountUser]  WITH CHECK ADD  CONSTRAINT [FK_AccountUser_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountUser_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountUser]'))
ALTER TABLE [dbo].[AccountUser] CHECK CONSTRAINT [FK_AccountUser_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountUser_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountUser]'))
ALTER TABLE [dbo].[AccountUser]  WITH CHECK ADD  CONSTRAINT [FK_AccountUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountUser_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountUser]'))
ALTER TABLE [dbo].[AccountUser] CHECK CONSTRAINT [FK_AccountUser_User]
GO


