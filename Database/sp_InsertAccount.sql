USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertAccount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertAccount]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertAccount] 
	@AccountName varchar(100)
	,@PrimaryUserName varchar(100)
	,@PrimaryUserEmail varchar(100)
	,@UpdateUserId int
	
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @AccountName IS NULL
    BEGIN
        RAISERROR ( N'AccountName cannot be NULL!', 16, 1 )
        RETURN 1;
    END

	IF  exists (select Id from Account where AccountName = @AccountName)
    BEGIN
        RAISERROR ( N'AccountName already exist!', 16, 1 )
        RETURN 1;
    END

	declare @primaryUserId int
	select @primaryUserId = id from dbo.[User] where UserName = @PrimaryUserName and Email = @PrimaryUserEmail
	

	IF  @primaryUserId is null
    BEGIN
        RAISERROR ( N'Primary User not found!', 16, 1 )
        RETURN 1;
    END

	declare @rowId int
	
	
	insert into dbo.Account
	select @AccountName,@primaryUserId

	set @rowId = @@IDENTITY

	exec [aud].[InsertAudit] 'Account',@rowId,'I',@UpdateUserId
	
	insert into dbo.AccountUser
	select @rowId,@primaryUserId

	set @rowId = @@IDENTITY

	exec [aud].[InsertAudit] 'AccountUser',@rowId,'I',@UpdateUserId

END

GO


