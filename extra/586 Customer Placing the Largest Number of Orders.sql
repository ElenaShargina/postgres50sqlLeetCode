drop table if exists orders;
Create table If Not Exists orders (order_number int, customer_number int);
Truncate table orders;
insert into orders (order_number, customer_number) values ('1', '1');
insert into orders (order_number, customer_number) values ('2', '2');
insert into orders (order_number, customer_number) values ('3', '3');
insert into orders (order_number, customer_number) values ('4', '3');

SELECT CUSTOMER_NUMBER
FROM
	(SELECT CUSTOMER_NUMBER,
			COUNT(*) AS CNT
		FROM ORDERS
		GROUP BY CUSTOMER_NUMBER) T
ORDER BY CNT DESC
LIMIT 1