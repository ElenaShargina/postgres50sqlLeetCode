DROP table if  exists Stocks;
drop type if exists operation_types;
create type operation_types as enum ('Sell', 'Buy');
Create Table If Not Exists Stocks (stock_name varchar(15), operation operation_types, operation_day int, price int);
Truncate table Stocks;
insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Buy', '1', '1000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '2', '10');
insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Sell', '5', '9000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Buy', '17', '30000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '3', '1010');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '4', '1000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '5', '500');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '6', '1000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Sell', '29', '7000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '10', '10000');

-- var 1
select distinct stock_name,
        sum(price)  filter (where operation='Sell') OVER (partition by stock_name)
		- sum(price)  filter (where operation='Buy') OVER (partition by stock_name)
from Stocks;

-- var 2
select distinct stock_name,
	sum(case when operation='Sell' then price else -price end ) over (partition by stock_name)	as capital_gain_loss
from Stocks
