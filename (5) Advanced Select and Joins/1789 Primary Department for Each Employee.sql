drop table if exists Employees;
Create table If Not Exists Employees(employee_id int, name varchar(20), reports_to int, age int);
Truncate table Employees;
insert into Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', null, '43');
insert into Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41');
insert into Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36');
insert into Employees (employee_id, name, reports_to, age) values ('2', 'Winston', null, '37');

with managers as(
	select reports_to as employee_id,
	round(avg(age),0) as average_age,
	count(*) as reports_count
	from Employees
	group by reports_to
	having reports_to is not null
)
select employee_id, name, reports_count, average_age
from managers left join Employees using (employee_id);