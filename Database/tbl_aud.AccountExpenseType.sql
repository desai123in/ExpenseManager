IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountExpenseType]') AND type in (N'U'))
DROP TABLE [aud].[AccountExpenseType]
GO

/****** Object:  Table [aud].[AccountExpenseType]    Script Date: 5/15/2016 5:05:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountExpenseType]') AND type in (N'U'))
BEGIN
CREATE TABLE [aud].[AccountExpenseType](
	[Id] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[UpdateAction] [char] (1) NOT NULL,
	[UpdatedOn] datetime not null,
	[UpdatedBy] [int] not null
) ON [PRIMARY]
END
GO