USE [ExpenseManager]
GO


EXEC [dbo].[InsertUser]	@UserName = N'Admin',@Email = N'ddesai.us@gmail.com',@UpdateUserId = 1
go

EXEC [dbo].[InsertUser]	@UserName = N'AvaniDesai',@Email = N'addesai5@yahoo.com',@UpdateUserId = 1
go

EXECUTE [dbo].[InsertAccount]    'DesaiAccount','AvaniDesai','addesai5@yahoo.com',1
GO



INSERT INTO [dbo].[Category]
           ([Name])

     select 'House' as Name
	 union all
	 select 'Food' as Name
	 union all
	 select 'Clothes' as Name
	 union all
	 select 'Social' as Name
	 union all
	 select 'Auto' as Name

GO


INSERT INTO [dbo].[ExpenseType]
           ([Name])

     select 'Mortgage' as Name
	 union all
	 select 'Utility-Electric' as Name
	 union all
	 select 'Utility-Gas' as Name
	 union all
	 select 'Utility-Oil' as Name
	 union all
	 select 'Cable' as Name
	 union all
	 select 'Internet' as Name
	 union all
	 select 'Phone' as Name
	 union all
	 select 'Security System' as Name
	 union all
	 select 'House-Maintenance' as Name
	 union all
	 select 'School Lunch' as Name
	 union all
	 select 'Gas' as Name
	 union all
	 select 'Auto Insurance' as Name
	 union all
	 select 'Auto Maintenance' as Name
	 union all
	 select 'Auto Loan Payment' as Name
	 
go

--insert into dbo.[User] (UserName,Email)

