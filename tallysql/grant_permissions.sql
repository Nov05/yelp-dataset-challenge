REVOKE ALL ON SCHEMA public FROM tally_ds, tally_web;

-- for Django test database creation
-- ALTER USER tally_ds CREATEDB;
ALTER USER tally_ds NOCREATEDB;
ALTER USER tally_web NOCREATEDB;

GRANT USAGE ON SCHEMA tallyds, tallyweb, lab, django TO tally_ds;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES 
	IN SCHEMA tallyds, tallyweb, lab, django TO tally_ds;
GRANT ALL PRIVILEGES ON ALL TABLES 
	IN SCHEMA tallyds, tallyweb, lab, django TO tally_ds;
GRANT ALL ON SCHEMA tallyds, tallyweb, lab, django TO tally_ds;

GRANT USAGE ON SCHEMA tallyweb, lab TO tally_web;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA tallyweb, lab TO tally_web;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA tallyweb, lab TO tally_web;
GRANT ALL ON SCHEMA tallyweb, lab TO tally_web;

-- GRANT USAGE ON SCHEMA tallyjob TO tally_job;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA tallyjob TO tally_job;
-- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA tallyjob TO tally_job;
-- GRANT ALL ON SCHEMA tallyjob TO tally_job;

-- drop table 
-- auth_group, auth_group_permissions, auth_permission, auth_user,
-- auth_user_groups, auth_user_groups, auth_user_user_permissions, 
-- django_admin_log, django_content_type, django_migrations, django_session
-- CASCADE;
