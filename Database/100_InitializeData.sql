USE [ExpenseManager]
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


INSERT INTO [dbo].[SubCategory]
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

INSERT INTO [dbo].[CategoryMapping] (CategoryId,SubCategoryId)

select c.id as CategoryId, sc.id as SubCategoryId
from Category c,SubCategory sc
where c.Name = 'House' and sc.Name = 'Mortgage'