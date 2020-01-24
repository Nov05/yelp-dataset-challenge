insert into tallyds.job_log
values (uuid_generate_v4(), 
		'2020-01-15',
	    'jga_2HO_j4I7tSYf5cCEnQ',
		'0',
		'0',
		'2020-01-15'
	   );

update tallyds.job_log
set  business_id = 'jga_2HO_j4I7tSYf5cCEnQ',
     job_type = '0',
     job_status = '0',
     job_message = 'updated'
where uuid = '57413c5d-582f-4c0c-be0b-6708701d82e9'; 
commit;
		
insert into tallyds.job_log
values ('57413c5d-582f-4c0c-be0b-6708701d82e9', 
		'2020-01-15',
	    'jga_2HO_j4I7tSYf5cCEnQ',
		'0',
		'0',
		'upsert'
	   )
on conflict on constraint job_log_pkey
do nothing;

select * from tallyds.job_log
where business_id = 'jga_2HO_j4I7tSYf5cCEnQ'
order by timestamp
limit 100;

insert into tallyds.job_log
values ('832de9bc-8495-4eac-bdba-c009939e8c60',
		 '2020-01-20',
		'jga_2HO_j4I7tSYf5cCEnQ',
		'0',
		'0',
		'upsert'
	   ),
		('57413c5d-582f-4c0c-be0b-6708701d82e9', 
        '2020-01-20',
	    'jga_2HO_j4I7tSYf5cCEnQ',
		'0',
		'0',
		'upsert'
	   )
on conflict on constraint job_log_pkey
do update set
	business_id = excluded.business_id,
	job_type = excluded.job_type,
	job_status = excluded.job_status,
	timestamp = excluded.timestamp,
	job_message = job_log.log_message || '; ' || excluded.log_message
;