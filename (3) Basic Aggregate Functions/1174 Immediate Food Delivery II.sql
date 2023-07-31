drop table if exists Delivery;
Create table If Not Exists Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', '2019-08-01', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '2', '2019-08-02', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', '2019-08-11', '2019-08-12');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', '2019-08-24', '2019-08-24');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '3', '2019-08-21', '2019-08-22');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', '2019-08-11', '2019-08-13');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('7', '4', '2019-08-09', '2019-08-09');
--var 1
select round(avg(case when order_date=customer_pref_delivery_date then 1 else 0 end)*100,2)
FROM Delivery
WHERE (customer_id, order_date) IN
(
	select customer_id, min(order_date) as order_date 
	from Delivery
	group by customer_id
);
--var 2
with first_order_date as (
	select customer_id, min(order_date) as order_date
	from Delivery
	group by customer_id
)
select round(avg(case when order_date=customer_pref_delivery_date then 1 else 0 end)*100, 2)
from Delivery
Where (customer_id, order_date) in (select customer_id, order_date from first_order_date)