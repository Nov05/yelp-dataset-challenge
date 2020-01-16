CREATE TABLE tallyds.tallyuser_business (
	uuid UUID DEFAULT uuid_generate_v4(),
	tallyuser_id VARCHAR,
	business_id VARCHAR,
	timestamp TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY (uuid)
);
commit;
CREATE INDEX idx_tallyuser_id ON tallyds.tallyuser_business (tallyuser_id, timestamp);
