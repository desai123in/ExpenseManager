IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountCategory]') AND type in (N'U'))
DROP TABLE [aud].[AccountCategory]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [aud].[AccountCategory](
	[Id] [int]  NOT NULL,
	[AccountId] int not null,
	[Name] [varchar](50) NOT NULL,
	[UpdateAction] [char] (1) NOT NULL,
	[UpdatedOn] datetime not null,
	[UpdatedBy] [int] not null

) ON [PRIMARY]
END
GO