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
