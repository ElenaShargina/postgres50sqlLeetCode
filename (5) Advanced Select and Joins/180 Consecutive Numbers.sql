drop table if exists Logs;
Create table If Not Exists Logs (id int, num int);
truncate table Logs;
insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');
insert into Logs (id, num) values ('8', '2');
insert into Logs (id, num) values ('9', '3');
insert into Logs (id, num) values ('10', '3');

select num from 
	(select 
		id, 
		num, 
		lag(id, 1) OVER (PArtition by num order by id) as previd, 
		lead(id,1) over (partition by num order by id) as nextid
	from Logs) worked_nums
where id-1=previd and id+1=nextid