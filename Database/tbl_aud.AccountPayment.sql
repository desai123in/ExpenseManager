IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountPayment]') AND type in (N'U'))
DROP TABLE [aud].[AccountPayment]
GO

/****** Object:  Table [aud].[AccountPayment]    Script Date: 5/15/2016 11:28:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[AccountPayment]') AND type in (N'U'))
BEGIN
CREATE TABLE [aud].[AccountPayment](
	[Id] [int] NOT NULL,
	[AccountId] int not null,
	[Name] [varchar](100) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[UpdateAction] [char] (1) NOT NULL,
	[UpdatedOn] datetime not null,
	[UpdatedBy] [int] not null
) ON [PRIMARY]
END
GO