USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertUser]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUser] 
	@UserName varchar(100)
	,@Email varchar(100)
	,@UpdateUserId int
	
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @UserName IS NULL
    BEGIN
        RAISERROR ( N'UserName cannot be NULL!', 16, 1 )
        RETURN 1;
    END

	IF @Email IS NULL
    BEGIN
        RAISERROR ( N'Email cannot be NULL!', 16, 1 )
        RETURN 1;
    END

	IF  exists (select Id from dbo.[User] where Email = @Email)
    BEGIN
        RAISERROR ( N'Email already exist!', 16, 1 )
        RETURN 1;
    END

	
	declare @rowId int
	
	
	insert into dbo.[User]
	select @UserName,@Email

	set @rowId = @@IDENTITY

	exec [aud].[InsertAudit] 'User',@rowId,'I',@UpdateUserId
	

END

GO


