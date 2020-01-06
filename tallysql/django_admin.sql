GRANT SELECT, INSERT, UPDATE, DELETE 
ON TABLE tallyds.auth_group, 
tallyds.auth_group_permissions,
tallyds.auth_permission,
tallyds.auth_user,
tallyds.auth_user_groups,
tallyds.auth_user_user_permissions,
tallyds.django_admin_log,
tallyds.django_content_type,
tallyds.django_migrations,
tallyds.django_session,
-- Tally
tallyds.yelp_url
TO spotifier;