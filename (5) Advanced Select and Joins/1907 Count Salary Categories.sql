drop table if exists Accounts;
Create table If Not Exists Accounts (account_id int, income int);
Truncate table Accounts;
insert into Accounts (account_id, income) values ('3', '108939');
insert into Accounts (account_id, income) values ('2', '12747');
insert into Accounts (account_id, income) values ('8', '87709');
insert into Accounts (account_id, income) values ('6', '91796');
select 'Low' as category,
	count(*) filter (where income<20000) as accounts
from Accounts
UNION
select 'Average' as category,
	count(*) filter (where income>=20000 and income<=50000)
from Accounts
UNION
select 'High' as category,
	count(*) filter (where income>50000)
	from Accounts;


 