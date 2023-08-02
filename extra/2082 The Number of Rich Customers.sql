drop table if exists Store;
Create table If Not Exists Store (bill_id int, customer_id int, amount int);
Truncate table Store;
insert into Store (bill_id, customer_id, amount) values ('6', '1', '549');
insert into Store (bill_id, customer_id, amount) values ('8', '1', '834');
insert into Store (bill_id, customer_id, amount) values ('4', '2', '394');
insert into Store (bill_id, customer_id, amount) values ('11', '3', '657');
insert into Store (bill_id, customer_id, amount) values ('13', '3', '257');

select count(customer_id) as rich_count 
from (
    select customer_id, max(amount) as max_amount
    from Store
    group by customer_id
) t where max_amount > 500;