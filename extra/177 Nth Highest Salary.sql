drop table if exists Employee;
Create table If Not Exists Employee (Id int, Salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

DROP FUNCTION if exists getNthHighestSalary;
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT AS $$
      select distinct salary
      from Employee
      order by salary desc
      limit 1
      offset N-1;
      
$$ LANGUAGE SQL;

SELECT getNthHighestSalary(2);