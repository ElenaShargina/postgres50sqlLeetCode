drop table if exists Person;
Create table If Not Exists Person (Id int, Email varchar(255));
Truncate table Person;
insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');

DELETE
FROM PERSON
WHERE ID NOT IN
		(SELECT MIN(ID) AS ID
			FROM PERSON
			GROUP BY EMAIL);
	
select * from Person;