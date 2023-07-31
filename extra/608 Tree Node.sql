drop table if exists Tree;
Create table If Not Exists Tree (id int, p_id int);
Truncate table Tree;
insert into Tree (id, p_id) values ('1', null);
insert into Tree (id, p_id) values ('2', '1');
insert into Tree (id, p_id) values ('3', '1');
insert into Tree (id, p_id) values ('4', '2');
insert into Tree (id, p_id) values ('5', '2');

select id,
        case
            when p_id is null
                then 'Root'
            when id in (select distinct p_id from Tree)
                then 'Inner'
            else 'Leaf'
        end as type                
from Tree