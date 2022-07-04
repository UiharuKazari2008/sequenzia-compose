SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'google_id'
  AND table_name = 'discord_users';

set @query = IF(@exist <= 0, 'ALTER TABLE discord_users add column google_id varchar(512) NULL after apple_cid',
                'select \'Column Exists\' status');

prepare google_id_add from @query;

EXECUTE google_id_add;
