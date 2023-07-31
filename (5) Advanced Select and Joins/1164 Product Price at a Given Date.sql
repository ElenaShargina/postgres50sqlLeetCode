drop table if exists Products;
Create table If Not Exists Products (product_id int, new_price int, change_date date);
insert into Products (product_id, new_price, change_date) values ('1', '20', '2019-08-14');
insert into Products (product_id, new_price, change_date) values ('2', '50', '2019-08-14');
insert into Products (product_id, new_price, change_date) values ('1', '30', '2019-08-15');
insert into Products (product_id, new_price, change_date) values ('1', '35', '2019-08-16');
insert into Products (product_id, new_price, change_date) values ('2', '65', '2019-08-17');
insert into Products (product_id, new_price, change_date) values ('3', '20', '2019-08-18');
with last_changes as (
	select distinct product_id,
		max(change_date) filter (where change_date<='2019-08-16'::date) over (partition by product_id) as change_date
	from Products
)
select product_id, coalesce(new_price, 10) as price
from last_changes
left join Products using (product_id, change_date)