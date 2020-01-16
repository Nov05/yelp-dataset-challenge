-- insert into tallyds.job_logs 
-- values (uuid_generate_v4(), 
-- 	    'jga_2HO_j4I7tSYf5cCEnQ',
-- 		'0',
-- 		'0',
-- 		'2020-01-15'
-- 	   );

select * from tallyds.job_logs
where business_id = 'jga_2HO_j4I7tSYf5cCEnQ'
order by timestamp
limit 100;