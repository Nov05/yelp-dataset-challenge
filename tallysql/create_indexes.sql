-- CREATE INDEX idx_review ON tallyds.review (business_id, datetime);

select * from tallyds.review 
where business_id = 'Iq7NqQD-sESu3vr9iEGuTA'
and datetime <= '2018-11-30'
and datetime >= '2017-11-30';

-- select * from tallyds.review 
-- where business_id = 'aunt-jakes-new-york'
-- and datetime <= '2018-11-30'
-- and datetime >= '2017-11-30';
