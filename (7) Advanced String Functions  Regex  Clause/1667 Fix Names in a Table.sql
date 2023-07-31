drop table if Exists Users;
Create table If Not Exists Users (user_id int, name varchar(40));
Truncate table Users;
insert into Users (user_id, name) values ('1', 'aLice');
insert into Users (user_id, name) values ('2', 'bOB');
select user_id, concat(upper(substring(name,1,1)),lower(substring(name,2))) as name
from Users
order by user_id;