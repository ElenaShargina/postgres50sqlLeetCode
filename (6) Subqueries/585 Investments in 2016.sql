drop table if exists Insurance;
Create Table If Not Exists Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float);
Truncate table Insurance;
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40');

with unique_cities as(
    select lat, lon
    from Insurance
    group by lat, lon
    having count(*) = 1
)
select round(sum(tiv_2016)::numeric(10,3),2) as tiv_2016
from unique_cities
join Insurance using (lat,lon)
where tiv_2015 in(
        select tiv_2015
        from Insurance
        group by tiv_2015
        having count(*)>1
     ) 