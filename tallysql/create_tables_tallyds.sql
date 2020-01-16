-- to simply this project, i didn't create any foreign key constraints.
-- i hope you will figure them out by yourself.

CREATE TABLE tallyds.business (
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
	data_source SMALLINT,
	PRIMARY KEY (business_id)
);

CREATE TABLE tallyds.review (
	uuid UUID DEFAULT uuid_generate_v4(),
	review_id VARCHAR,
	business_id VARCHAR,
	user_id VARCHAR,
	stars FLOAT8,
	datetime TIMESTAMP WITHOUT TIME ZONE,
	date DATE,
	time TIME WITHOUT TIME ZONE,
	text VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	data_source SMALLINT,
	PRIMARY KEY (uuid)
);

CREATE TABLE tallyds.yelp_scraping (
	uuid UUID DEFAULT uuid_generate_v4(),
	review_id VARCHAR,
	business_id VARCHAR,
	user_id VARCHAR,
	stars FLOAT8,
	datetime TIMESTAMP WITHOUT TIME ZONE,
	date DATE,
	time TIME WITHOUT TIME ZONE,
	text VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY (uuid)
);

CREATE TABLE tallyds.ds_vizstatus (
	business_id VARCHAR, -- primary key 
	viztype SMALLINT, -- primary key 
	timestamp TIMESTAMP WITH TIME ZONE,
	triggeredby SMALLINT, -- 0: user, 1: job
	PRIMARY KEY (business_id, viztype)
);

CREATE TABLE tallyds.ds_vizdata (
	uuid UUID DEFAULT uuid_generate_v4(), -- primary key
	business_id VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	viztype SMALLINT,
	vizdata VARCHAR,
	PRIMARY KEY (uuid)
);

CREATE TABLE tallyds.job_config (
	job_type SMALLINT, -- primary key
	job_type_desc VARCHAR,
	job_rate FLOAT8, -- day
	job_api VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY (job_type)
);

CREATE TABLE tallyds.job_logs (
	uuid UUID DEFAULT uuid_generate_v4(), -- primary key
	business_id VARCHAR,
	job_type SMALLINT,
	job_status SMALLINT, -- 0: failed, 1: succeeded
	timestamp TIMESTAMP WITH TIME ZONE
);

