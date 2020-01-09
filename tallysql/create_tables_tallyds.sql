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

create table tallyds.ds_trendyphrase (
	business_id VARCHAR,
	datetime TIMESTAMP WITHOUT TIME ZONE,
	rank float8,
	keywords varchar,
	primary key (business_id)
);