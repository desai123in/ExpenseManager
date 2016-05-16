IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[Account]') AND type in (N'U'))
DROP TABLE [aud].[Account]
GO

/****** Object:  Table [aud].[Account]    Script Date: 5/15/2016 8:31:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[Account]') AND type in (N'U'))
BEGIN
CREATE TABLE [aud].[Account](
	[Id] [int]  NOT NULL,
	[AccountName] [varchar](100) NOT NULL,
	[PrimaryUser] [int] NOT NULL,
	[UpdateAction] [char] (1) NOT NULL,
	[UpdatedOn] datetime not null,
	[UpdatedBy] [int] not null
) ON [PRIMARY]
END
GO