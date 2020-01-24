CREATE INDEX idx_yelpreview ON tallyds.yelp_review (business_id, datetime DESC);
create index idx_yelpreviewlog on tallyds.yelp_review_log (business_id, timestamp desc);
create index idx_yelpreivew on tallyds.yelp_review (business_id, datetime desc);
create index idx_joblog on tallyds.job_log (business_id, job_type, job_status, timestamp desc);
create index idx_vizdata on tallyds.ds_vizdata (business_id, viztype, timestamp DESC);
create index idx_vizdatalog on tallyds.ds_vizdata_log (business_id, viztype, timestamp DESC);
create index idx_tallybusiness on tallyds.tally_business (business_id, timestamp desc);
