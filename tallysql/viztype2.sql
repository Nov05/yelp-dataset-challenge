
-- CREATE INDEX idx_review ON tallyds.review (business_id, datetime DESC);

-- -- the latest review 2018-11-08 23:00:39
-- -- 389 msec without index on business_id
-- select datetime
-- from tallyds.review
-- where business_id = 'R67i1c41zZZ3QMYDPmNClw'
-- limit 1;

-- select count(*) 
-- from tallyds.review
-- where business_id = 'R67i1c41zZZ3QMYDPmNClw'
-- and datetime < '2018-10-01'
-- and datetime >= '2018-09-01';

-- 200+ mscs
select extract(year from date)::INTEGER as year,
--        to_char(date, 'Mon') as month,
       extract(month from date)::INTEGER as month,
       count(*) as count
from tallyds.review
where business_id = 'R67i1c41zZZ3QMYDPmNClw'
group by 1, 2
order by 1 desc, 2 desc
limit 12;





