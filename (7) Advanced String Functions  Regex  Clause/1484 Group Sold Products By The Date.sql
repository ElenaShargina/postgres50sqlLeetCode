-- https://leetcode.com/problems/group-sold-products-by-the-date/
drop table if exists Activities;
Create table If Not Exists Activities (sell_date date, product varchar(20));
Truncate table Activities;
insert into Activities (sell_date, product) values ('2020-05-30', 'Headphone');
insert into Activities (sell_date, product) values ('2020-06-01', 'Pencil');
insert into Activities (sell_date, product) values ('2020-06-02', 'Mask');
insert into Activities (sell_date, product) values ('2020-05-30', 'Basketball');
insert into Activities (sell_date, product) values ('2020-06-01', 'Bible');
insert into Activities (sell_date, product) values ('2020-06-02', 'Mask');
insert into Activities (sell_date, product) values ('2020-05-30', 'T-Shirt');
select 
    sell_date, 
    count( DISTINCT product ) as num_sold ,
    string_agg(DISTINCT product, ',' order by product ASC ) as products
FROM Activities GROUP BY sell_date order by sell_date ASC;