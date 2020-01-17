delete from django.django_apscheduler_djangojobexecution
where job_id in
(
	select id from django.django_apscheduler_djangojob
);
delete from django.django_apscheduler_djangojob;

select * from django.django_apscheduler_djangojob;
select * from django.django_apscheduler_djangojobexecution;
select * from django.django_apscheduler_djangojobexecution
	where job_id = '0fa377e47045452d8fc2b60a20278e5c';