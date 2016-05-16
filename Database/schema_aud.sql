use ExpenseManager
go

if (not exists (select * from sys.schemas where name='aud'))
begin
	exec('CREATE SCHEMA [aud] AUTHORIZATION [dbo]')
end

