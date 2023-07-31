drop table if exists Products;
drop type if exists yes_no;
create type yes_no as ENUM ('Y', 'N');
Create table If Not Exists Products (product_id int, low_fats yes_no, recyclable yes_no);
Truncate table Products;
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N');
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N');

select product_id from Products where low_fats='Y' and recyclable='Y';