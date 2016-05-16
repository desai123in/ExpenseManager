IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[User]') AND type in (N'U'))
DROP TABLE [aud].[User]
GO

/****** Object:  Table [aud].[User]    Script Date: 5/15/2016 8:08:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [aud].[User](
	[Id] [int] NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[UpdateAction] [char] (1) NOT NULL,
	[UpdatedOn] datetime not null,
	[UpdatedBy] [int] not null
) ON [PRIMARY]
END
GO