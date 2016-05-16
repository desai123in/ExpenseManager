IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountExpense]') AND type in (N'U'))
DROP TABLE [aud].[AccountExpense]
GO

/****** Object:  Table [aud].[AccountExpense]    Script Date: 5/15/2016 5:20:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountExpense]') AND type in (N'U'))
BEGIN
CREATE TABLE [aud].[AccountExpense](
	[Id] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[ExpenseTypeId] [int] NULL,
	[PaymentId] [int]  NULL,
	[Amount] [numeric](18, 2) NOT NULL,
	[ExpenseDate] [datetime] NOT NULL,
	[Comment] [varchar](500) NULL,
	[UpdateAction] [char] (1) NOT NULL,
	[UpdatedOn] datetime not null,
	[UpdatedBy] [int] not null
	
) ON [PRIMARY]
END
GO