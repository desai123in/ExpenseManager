USE [ExpenseManager]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAccountExpenses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAccountExpenses]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAccountExpenses] 
	@AccountName varchar(100)
	,@StartDate datetime = '1/1/2016'
	,@EndDate datetime = getdate
	
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @AccountName IS NULL
    BEGIN
        RAISERROR ( N'AccountName cannot be NULL!', 16, 1 )
        RETURN 1;
    END

	IF not exists (select Id from Account where AccountName = @AccountName)
    BEGIN
        RAISERROR ( N'AccountName not found!', 16, 1 )
        RETURN 1;
    END

	select a.AccountName, e.Id ExpenseId,et.Name as ExpenseTypeName,p.Name as PaymentName,e.ExpenseDate 
	from AccountExpense e
	inner join AccountExpenseType et on e.ExpenseTypeId = et.Id
	inner join Account a on e.AccountId = a.Id
	inner join AccountPayment p on e.PaymentId = p.Id
	where a.AccountName = @AccountName
	and e.ExpenseDate >= @StartDate and e.ExpenseDate <= @EndDate

END

GO


