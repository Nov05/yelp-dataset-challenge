-- to simply this project, i didn't create any foreign key constraints.
-- i hope you will figure them out by yourself.

CREATE TABLE tallyds.yelp_business (
	business_id VARCHAR,
	alias VARCHAR,
	name VARCHAR,
	address VARCHAR,
	city VARCHAR,
	state VARCHAR,
	zip_code VARCHAR,
	latitude FLOAT8,
	longitude FLOAT8,
	stars FLOAT8,
	review_count INTEGER,
	is_closed BOOLEAN,
	is_claimed BOOLEAN,
	display_phone VARCHAR,
	price VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY (business_id)
);

CREATE TABLE tallyds.yelp_review (
	review_id VARCHAR,
	business_id VARCHAR,
	user_id VARCHAR,
	stars FLOAT8,
	datetime TIMESTAMP WITHOUT TIME ZONE,
	date DATE,
	time TIME WITHOUT TIME ZONE,
	text VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY (review_id)
);

-- idx_allreviewlog (business_id, data_source, timestamp desc)
create table tallyds.yelp_review_log (
	uuid UUID DEFAULT uuid_generate_v4(),
	business_id VARCHAR,
	date date,
	timestamp timestamp with time zone,
	primary key (uuid)
);

-- primary key index
-- index on (business_id, timestamp desc)
CREATE TABLE tallyds.tally_business (
	business_id VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY (business_id)
);

-- primary key index
-- index on (business_id, datetime)
CREATE TABLE tallyds.yelp_review (
	review_id VARCHAR,
	business_id VARCHAR,
	user_id VARCHAR,
	stars FLOAT8,
	datetime TIMESTAMP WITHOUT TIME ZONE,
	date DATE,
	time TIME WITHOUT TIME ZONE,
	text VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY (review_id)
);

-- index: business_id, viztype, timestamp desc
CREATE TABLE tallyds.ds_vizdata_log (
	uuid UUID DEFAULT uuid_generate_v4(), -- primary key
	business_id VARCHAR, 
	viztype SMALLINT, 
	timestamp TIMESTAMP WITH TIME ZONE,
	triggeredby SMALLINT, -- 0: user, 1: job
	PRIMARY KEY (uuid)
);

-- index: business_id, viztype, timestamp desc
CREATE TABLE tallyds.ds_vizdata (
	business_id VARCHAR, -- primary key
	viztype SMALLINT, -- primary key
	timestamp TIMESTAMP WITH TIME ZONE,
	vizdata VARCHAR,
	PRIMARY KEY (business_id, viztype)
);

CREATE TABLE tallyds.job_config (
	job_type SMALLINT, -- primary key
	job_type_desc VARCHAR,
	job_rate FLOAT8, -- day
	job_api VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY (job_type)
);

-- index on (business_id, job_type, job_status, timestamp)
CREATE TABLE tallyds.job_log (
	uuid UUID DEFAULT uuid_generate_v4(), -- primary key
	business_id VARCHAR,
	job_type SMALLINT,
	job_status SMALLINT, -- 0: failed, 1: succeeded
	timestamp TIMESTAMP WITH TIME ZONE,
	job_message VARCHAR,
	primary key (uuid)
);

