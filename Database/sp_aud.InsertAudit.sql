USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[aud].[InsertAudit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [aud].[InsertAudit]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [aud].[InsertAudit] 
	@TableName varchar(50)
	,@RowId int
	,@Action char(1)
	,@UpdateUserId int
	
AS
BEGIN
	
	SET NOCOUNT ON;

	if @TableName = 'Account' 
	begin		
		
		INSERT INTO [aud].[Account]([Id],[AccountName],[PrimaryUser],[UpdateAction],[UpdatedOn],[UpdatedBy])
		select [Id],[AccountName],[PrimaryUser],@Action ,getdate() ,@UpdateUserId
		from dbo.Account where Id = @RowId		
	end
	else if @TableName = 'User'
	begin
		INSERT INTO [aud].[User]  ([Id],[UserName],[Email],[UpdateAction],[UpdatedOn],[UpdatedBy])
		select [Id],[UserName],[Email],@Action ,getdate() ,@UpdateUserId
		from dbo.[User] where Id = @RowId		
	end
	else if @TableName = 'AccountUser'
	begin		
		
		INSERT INTO [aud].[AccountUser] ([Id],[AccountId],[UserId],[UpdateAction],[UpdatedOn],[UpdatedBy])
		select [Id],[AccountId],[UserId],@Action ,getdate() ,@UpdateUserId
		from dbo.AccountUser where Id = @RowId
	end

END

GO


