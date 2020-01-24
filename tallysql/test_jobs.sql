-- delete from tallyds.ds_vizdata; commit;
-- delete from tallyds.ds_vizdata_log; commit;
-- delete from tallyds.job_log; commit;

-- select * from tallyds.ds_vizdata;
select count(*) from tallyds.ds_vizdata group by viztype;
-- select * from tallyds.ds_vizdata_log;
-- select * from tallyds.job_log;
-- select * from tallyds.job_log where job_type = 0 order by timestamp desc;

-- select * from tallyds.job_log where job_status = 1;
-- select * from tallyds.yelp_review where business_id = '_gnSt_cqn5XMmLuAhTdC4A'; 
-- select * from tallyds.job_log where business_id = '_gnSt_cqn5XMmLuAhTdC4A';
-- select * from tallyds.ds_vizdata where business_id = '_gnSt_cqn5XMmLuAhTdC4A';

-- select count(distinct(business_id)) from tallyds.yelp_review;

