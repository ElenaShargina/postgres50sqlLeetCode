drop table if exists Employee;
drop table if exists Department;
Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department (id int, name varchar(255));
Truncate table Employee;
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1');
Truncate table Department;
insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

select d.name as Department, e.name as Employee, e.salary
from (
    select  departmentId,
            name,
            salary,
            dense_rank() over (partition by departmentId order by salary Desc) as salary_rank
    from Employee
    ) e
left join Department d
on (d.id=e.departmentId)
where e.salary_rank=1;