drop table if exists Triangle;
Create table If Not Exists Triangle (x int, y int, z int);
insert into Triangle (x, y, z) values ('13', '15', '30');
insert into Triangle (x, y, z) values ('10', '20', '15');
select x,y,z, (case when (x+y>z and x+z>y and z+y>x) then 'Yes' else 'No' end)
from Triangle;