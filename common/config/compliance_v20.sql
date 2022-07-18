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

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'media_group'
  AND table_name = 'kanmi_channels';

set @query = IF(@exist = 0, 'alter table kanmi_channels add media_group varchar(128) null after virtual_cid;',
                'select \'Column Exists\' status');

prepare add_media_group_to_channels from @query;
EXECUTE add_media_group_to_channels;

create table IF NOT EXISTS discord_users_extended
(
    id   varchar(128) not null,
    data json         null,
    constraint discord_users_extended_pk
        primary key (id)
);

CREATE TABLE IF NOT EXISTS `discord_users_extended` (
    `id` varchar(128) NOT NULL,
    `data` json DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `discord_users_extended_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `kanmi_records_extended` (
    `eid` int NOT NULL,
    `data` json DEFAULT NULL,
    PRIMARY KEY (`eid`),
    UNIQUE KEY `kanmi_records_extended_eid_uindex` (`eid`),
    CONSTRAINT `kanmi_records_extended_kanmi_records_eid_fk` FOREIGN KEY (`eid`) REFERENCES `kanmi_records` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `kongou_shows` (
                                              `show_id` int NOT NULL,
                                              `media_group` varchar(128) DEFAULT NULL,
                                              `name` text NOT NULL,
                                              `original_name` text,
                                              `nsfw` tinyint(1) DEFAULT '0',
                                              `genres` text,
                                              `data` json DEFAULT NULL,
                                              `background` varchar(255) DEFAULT NULL,
                                              `poster` varchar(255) DEFAULT NULL,
                                              PRIMARY KEY (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `kongou_shows_maps` (
                                                   `show_id` int NOT NULL,
                                                   `search` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `kongou_media_groups` (
                                                     `media_group` varchar(128) NOT NULL,
                                                     `type` int NOT NULL,
                                                     `name` text NOT NULL,
                                                     `description` text,
                                                     `icon` varchar(128) NOT NULL,
                                                     PRIMARY KEY (`media_group`),
                                                     UNIQUE KEY `kongou_media_groups_media_group_uindex` (`media_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `kongou_episodes` (
    `eid` int NOT NULL,
    `show_id` int NOT NULL,
    `episode_num` int DEFAULT NULL,
    `episode_name` text,
    `season_num` int DEFAULT NULL,
    `data` json DEFAULT NULL,
    `background` varchar(255) DEFAULT NULL,
    `still` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`eid`),
    UNIQUE KEY `kongou_episodes_eid_uindex` (`eid`),
    KEY `kongou_episodes_kongou_shows_show_id_fk` (`show_id`),
    CONSTRAINT `kongou_episodes_kanmi_records_eid_fk` FOREIGN KEY (`eid`) REFERENCES `kanmi_records` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `kongou_episodes_kongou_shows_show_id_fk` FOREIGN KEY (`show_id`) REFERENCES `kongou_shows` (`show_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS kongou_watch_history
(
    usereid varchar(255)           not null,
    user  varchar(128)           not null,
    eid   int                    not null,
    viewed float(6,5)    default 0 null,
    date  datetime default NOW() not null,
    constraint kongou_watch_history_pk
        primary key (`usereid`),
    constraint kongou_watch_history_discord_users_id_fk
        foreign key (user) references discord_users (id)
            on update cascade on delete cascade,
    constraint kongou_watch_history_kanmi_records_eid_fk
        foreign key (eid) references kanmi_records (eid)
            on update cascade on delete cascade
);
