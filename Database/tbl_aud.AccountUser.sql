IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountUser]') AND type in (N'U'))
DROP TABLE [aud].[AccountUser]
GO

/****** Object:  Table [aud].[AccountUser]    Script Date: 5/14/2016 8:31:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [aud].[AccountUser](
	[Id] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UpdateAction] [char] (1) NOT NULL,
	[UpdatedOn] datetime not null,
	[UpdatedBy] [int] not null
) ON [PRIMARY]
END
GO