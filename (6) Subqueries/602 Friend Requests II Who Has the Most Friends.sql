drop table if exists RequestAccepted;
Create table If Not Exists RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null);
Truncate table RequestAccepted;
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09');

with all_users as(
        select requester_id as user_id from RequestAccepted
        UNION
        select accepter_id from RequestAccepted
    )
select user_id as id, num 
from(
    select user_id, coalesce(s.send,0)+ coalesce(a.accept,0) as num
    from 
        (select distinct user_id from all_users) u
        left join
        (
        select requester_id as user_id, coalesce(count(*),0) as send  
        from RequestAccepted
        group by requester_id
        ) s
        using (user_id)
        left join
        (
        select accepter_id as user_id, coalesce(count(*),0) as accept
         from RequestAccepted
         group by accepter_id
        ) a
        using (user_id)    
    ) friends
order by num desc
limit 1