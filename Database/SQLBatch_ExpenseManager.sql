:setvar path "C:\Users\Dharmesh\Source\Repos\ExpenseManager\Database\"
:r $(path)\00_Database_DropCreate_ExpenseManager.sql

:r $(path)\tbl_User.sql
:r $(path)\tbl_Account.sql
:r $(path)\tbl_AccountUser.sql
:r $(path)\tbl_Category.sql
:r $(path)\tbl_AccountCategory.sql
:r $(path)\tbl_ExpenseType.sql
:r $(path)\tbl_AccountExpenseType.sql
:r $(path)\tbl_AccountCategoryMapping.sql
:r $(path)\tbl_PaymentType.sql
:r $(path)\tbl_AccountPayment.sql
:r $(path)\tbl_AccountExpense.sql

:r $(path)\schema_aud.sql
:r $(path)\tbl_aud.Account.sql
:r $(path)\tbl_aud.User.sql
:r $(path)\tbl_aud.AccountCategory.sql
:r $(path)\tbl_aud.AccountCategoryMapping.sql
:r $(path)\tbl_aud.AccountExpense.sql
:r $(path)\tbl_aud.AccountExpenseType.sql
:r $(path)\tbl_aud.AccountPayment.sql
:r $(path)\tbl_aud.AccountUser.sql
:r $(path)\sp_aud.InsertAudit.sql

:r $(path)\sp_GetAccountExpenses.sql
:r $(path)\sp_InsertAccount.sql
:r $(path)\sp_InsertUser.sql
:r $(path)\sp_InsertAccountUser.sql

:r $(path)\100_InitializeData.sql
