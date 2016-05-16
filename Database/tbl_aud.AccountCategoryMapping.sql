IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountCategoryMapping]') AND type in (N'U'))
DROP TABLE [aud].[AccountCategoryMapping]
GO

/****** Object:  Table [aud].[AccountCategoryMapping]    Script Date: 5/15/2016 5:04:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountCategoryMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [aud].[AccountCategoryMapping](
	[Id] [int] NOT NULL,
	[AccountCategoryId] [int] NOT NULL,
	[AccountExpenseTypeId] [int] NOT NULL,
	[UpdateAction] [char] (1) NOT NULL,
	[UpdatedOn] datetime not null,
	[UpdatedBy] [int] not null
) ON [PRIMARY]
END
GO