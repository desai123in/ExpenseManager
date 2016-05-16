USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertAccountUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertAccountUser]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertAccountUser] 
	@AccountId varchar(100)
	,@UserId varchar(100)
	,@UpdateUserId int
	
AS
BEGIN
	
	SET NOCOUNT ON;


	IF  exists (select Id from dbo.[AccountUser] where AccountId = @AccountId and UserId = @UserId)
    BEGIN
        RAISERROR ( N'User already associated with account!', 16, 1 )
        RETURN 1;
    END

	
	declare @rowId int
	
	
	insert into dbo.[AccountUser]
	select @AccountId,@UserId

	set @rowId = @@IDENTITY

	exec [aud].[InsertAudit] 'AccountUser',@rowId,'I',@UpdateUserId
	

END

GO


