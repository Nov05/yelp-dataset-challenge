-- GRANT SELECT, INSERT, UPDATE, DELETE 
-- ON TABLE tallyds.auth_group, 
-- tallyds.auth_group_permissions,
-- tallyds.auth_permission,
-- tallyds.auth_user,
-- tallyds.auth_user_groups,
-- tallyds.auth_user_user_permissions,
-- tallyds.django_admin_log,
-- tallyds.django_content_type,
-- tallyds.django_migrations,
-- tallyds.django_session
-- TO spotifier;

-- grant all on all tables 
-- in schema tallyds, tallyweb, tallyjob, lab, django
-- to spotifier;

GRANT ALL PRIVILEGES ON DATABASE test_tally to spotifier;
-- grant all on all tables in schema tallyds to spotifier;
grant all on all tables in schema django to spotifier;
-- grant all on all tables in schema lab to spotifier;

grant all on table lab.ds_vizdata, lab.review, lab.yelp_scraping to spotifier;



