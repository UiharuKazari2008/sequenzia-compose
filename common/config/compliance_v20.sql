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

CREATE TABLE IF NOT EXISTS `kanmi_records_extended` (
  `eid` int NOT NULL,
  `data` json DEFAULT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `kanmi_records_extended_eid_uindex` (`eid`),
  CONSTRAINT `kanmi_records_extended_kanmi_records_eid_fk` FOREIGN KEY (`eid`) REFERENCES `kanmi_records` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
);


SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'roles'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'ALTER TABLE discord_users drop column roles',
                'select \'Column Exists\' status');

prepare drop_old_roles from @query;
EXECUTE drop_old_roles;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'write_roles'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'ALTER TABLE discord_users drop column write_roles',
                'select \'Column Exists\' status');

prepare drop_old_write_roles from @query;
EXECUTE drop_old_write_roles;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'manage_roles'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'ALTER TABLE discord_users drop column manage_roles',
                'select \'Column Exists\' status');

prepare drop_old_manage_roles from @query;
EXECUTE drop_old_manage_roles;


SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'manager'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'ALTER TABLE discord_users drop column manager',
                'select \'Column Exists\' status');

prepare drop_old_manager_roles from @query;
EXECUTE drop_old_manager_roles;

create table discord_users_extended
(
    id   varchar(128) not null,
    data json         null,
    constraint discord_users_extended_pk
        primary key (id)
);
