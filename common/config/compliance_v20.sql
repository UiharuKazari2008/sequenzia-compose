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
                                              `subtitled` tinyint(1) default '0',
                                              `genres` text,
                                              `data` json DEFAULT NULL,
                                              `background` varchar(255) DEFAULT NULL,
                                              `poster` varchar(255) DEFAULT NULL,
                                              `search` text null,
                                              PRIMARY KEY (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `kongou_shows_maps` (
                                                   `show_id` int NOT NULL,
                                                   `search` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `kongou_media_groups` (
                                                     `media_group` varchar(128) NOT NULL,
                                                     `type` int NOT NULL,
                                                     `adult` tinyint(1) default 0 null,
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
    constraint kongou_watch_history_kanmi_records_eid_fk
        foreign key (eid) references kanmi_records (eid)
            on update cascade on delete cascade
);


SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'subtitled'
  AND table_name = 'kongou_shows';

set @query = IF(@exist <= 0, 'ALTER TABLE kongou_shows add subtitled tinyint(1) default 0 null after nsfw;',
                'select \'Column Exists\' status');

prepare kongou_cc_add from @query;
EXECUTE kongou_cc_add;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'adult'
  AND table_name = 'kongou_media_groups';

set @query = IF(@exist <= 0, 'alter table kongou_media_groups add adult tinyint(1) default 0 null after type;',
                'select \'Column Exists\' status');

prepare kongou_mga_add from @query;
EXECUTE kongou_mga_add;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'search'
  AND table_name = 'kongou_shows';

set @query = IF(@exist <= 0, 'alter table kongou_shows add search text null;',
                'select \'Column Exists\' status');

prepare kongou_mss_add from @query;
EXECUTE kongou_mss_add;


SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'decision'
  AND table_name = 'twitter_tweets';

set @query = IF(@exist <= 0, 'alter table twitter_tweets add decision tinyint(1) null;',
                'select \'Column Exists\' status');

prepare twitter_tweets_decision_add from @query;
EXECUTE twitter_tweets_decision_add;


SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'rating'
  AND table_name = 'sequenzia_index_artists';

set @query = IF(@exist <= 0, 'alter table sequenzia_index_artists add rating float(6, 5) null;',
                'select \'Column Exists\' status');

prepare sequenzia_index_artists_rating_add from @query;
EXECUTE sequenzia_index_artists_rating_add;


SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'color'
  AND table_name = 'discord_permissons';

set @query = IF(@exist <= 0, 'alter table discord_permissons add color varchar(10) null after server;',
                'select \'Column Exists\' status');

prepare discord_permissons_color_add from @query;
EXECUTE discord_permissons_color_add;


SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'text'
  AND table_name = 'discord_permissons';

set @query = IF(@exist <= 0, 'alter table discord_permissons add text varchar(1024) null after color;',
                'select \'Column Exists\' status');

prepare discord_permissons_text_add from @query;
EXECUTE discord_permissons_text_add;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'color'
  AND table_name = 'discord_users_permissons';

set @query = IF(@exist <= 0, 'alter table discord_users_permissons add color varchar(10) null after serverid;',
                'select \'Column Exists\' status');

prepare discord_users_permissons_color_add from @query;
EXECUTE discord_users_permissons_color_add;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'text'
  AND table_name = 'discord_users_permissons';

set @query = IF(@exist <= 0, 'alter table discord_users_permissons add text varchar(1024) null after color;',
                'select \'Column Exists\' status');

prepare discord_users_permissons_text_add from @query;
EXECUTE discord_users_permissons_text_add;

CREATE TABLE IF NOT EXISTS `discord_permissons_reactions` (
    `index` int NOT NULL AUTO_INCREMENT,
    `server` varchar(255) NOT NULL,
    `message` varchar(255) NOT NULL,
    `emoji` varchar(255) NOT NULL,
    `role` varchar(255) DEFAULT NULL,
    `name` text,
    `approval` tinyint(1) DEFAULT '0',
    PRIMARY KEY (`index`)
);

create table if not exists sequenzia_user_cache
(
    userid varchar(255) not null,
    data   json         not null,
    constraint sequenzia_user_cache_pk
        primary key (userid)
);


SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'avatar_custom'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add avatar_custom varchar(512) null after id;',
                'select \'Column Exists\' status');

prepare discord_users_extended_avatar_custom from @query;
EXECUTE discord_users_extended_avatar_custom;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'nice_name'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add nice_name text null after id;',
                'select \'Column Exists\' status');

prepare discord_users_extended_nice_name from @query;
EXECUTE discord_users_extended_nice_name;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'banner_custom'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add banner_custom varchar(512) null after avatar_custom',
                'select \'Column Exists\' status');

prepare discord_users_extended_banner_custom from @query;
EXECUTE discord_users_extended_banner_custom;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'token'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add token varchar(1024) null after banner_custom;',
                'select \'Column Exists\' status');

prepare discord_users_extended_token from @query;
EXECUTE discord_users_extended_token;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'blind_token'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add blind_token varchar(512) default null null after token;',
                'select \'Column Exists\' status');

prepare discord_users_extended_blind_token from @query;
EXECUTE discord_users_extended_blind_token;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'token_static'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add token_static varchar(1024) default null null after blind_token;',
                'select \'Column Exists\' status');

prepare discord_users_extended_token_static from @query;
EXECUTE discord_users_extended_token_static;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'token_expires'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add token_expires datetime default CURRENT_TIMESTAMP null after token_static;',
                'select \'Column Exists\' status');

prepare discord_users_extended_token_expires from @query;
EXECUTE discord_users_extended_token_expires;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'user_data'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add user_data json null;',
                'select \'Column Exists\' status');

prepare discord_users_extended_user_data from @query;
EXECUTE discord_users_extended_user_data;

CREATE TABLE IF NOT EXISTS `sequenzia_index_matches` (
   `tag_pair` varchar(512) NOT NULL,
   `eid` int NOT NULL,
   `tag` int NOT NULL,
   `rating` double(4,3) DEFAULT NULL,
   PRIMARY KEY (`tag_pair`),
   UNIQUE KEY `sequenzia_index_matches_tag_pair_uindex` (`tag_pair`)
);

CREATE TABLE IF NOT EXISTS `sequenzia_index_tags` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` text NOT NULL,
    `type` int NOT NULL,
    PRIMARY KEY (`id`)
);

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'tags'
  AND table_name = 'kanmi_records';

set @query = IF(@exist <= 0, 'alter table kanmi_records add tags longtext null;',
                'select \'Column Exists\' status');

prepare records_cache_tags from @query;
EXECUTE records_cache_tags;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'tags_pending'
  AND table_name = 'kanmi_records';

set @query = IF(@exist <= 0, 'alter table kanmi_records add tags_pending longtext null;',
                'select \'Column Exists\' status');

prepare records_cache2_tags from @query;
EXECUTE records_cache2_tags;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'm_rating'
  AND table_name = 'kanmi_records';

set @query = IF(@exist <= 0, 'alter table kanmi_records add m_rating double(4,3) null;',
                'select \'Column Exists\' status');

prepare records_rating_tags from @query;
EXECUTE records_rating_tags;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'tags_ver'
  AND table_name = 'kanmi_records';

set @query = IF(@exist <= 0, 'alter table kanmi_records add tags_ver longtext null;',
                'select \'Column Exists\' status');

prepare records_version_tags from @query;
EXECUTE records_version_tags;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'tags_custom'
  AND table_name = 'kanmi_records';

set @query = IF(@exist <= 0, 'alter table kanmi_records add tags_custom longtext null;',
                'select \'Column Exists\' status');

prepare records_rating_tags_custom from @query;
EXECUTE records_rating_tags_custom;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'times'
  AND table_name = 'sequenzia_navigation_history';

set @query = IF(@exist <= 0, 'alter table sequenzia_navigation_history add times JSON null;',
                'select \'Column Exists\' status');

prepare navi_history_times from @query;
EXECUTE navi_history_times;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'nice_name'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'alter table discord_users drop column nice_name;',
                'select \'Column Exists\' status');

prepare remove_user_nice_name from @query;
EXECUTE remove_user_nice_name;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'token'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'alter table discord_users drop column token;',
                'select \'Column Exists\' status');

prepare remove_user_token from @query;
EXECUTE remove_user_token;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'blind_token'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'alter table discord_users drop column blind_token;',
                'select \'Column Exists\' status');

prepare remove_blind_token from @query;
EXECUTE remove_blind_token;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'token_static'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'alter table discord_users drop column token_static;',
                'select \'Column Exists\' status');

prepare remove_token_static from @query;
EXECUTE remove_token_static;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'token_expires'
  AND table_name = 'discord_users';

set @query = IF(@exist > 0, 'alter table discord_users drop column token_expires;',
                'select \'Column Exists\' status');

prepare remove_token_expires from @query;
EXECUTE remove_token_expires;

create table if not exists sequenzia_login_history
(
    `key`      varchar(126)                         not null,
    session    varchar(128)                         not null,
    id         varchar(255)                         not null,
    ip_address varchar(128)                         not null,
    geo        text                                 null,
    meathod    int                                  not null,
    user_agent text                                 null,
    reauth_count int      default 0                 not null,
    reauth_time datetime  default CURRENT_TIMESTAMP null,
    is_juneos  tinyint(1) default 0                 not null,
    time       datetime   default CURRENT_TIMESTAMP not null,
    PRIMARY KEY (`key`),
    UNIQUE KEY `sequenzia_login_history_session_uindex` (`key`)
);

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'locked'
  AND table_name = 'discord_users_extended';

set @query = IF(@exist <= 0, 'alter table discord_users_extended add locked tinyint(1) default 0 not null;',
                'select \'Column Exists\' status');

prepare records_rating_tags_custom from @query;
EXECUTE records_rating_tags_custom;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'approval_ch'
  AND table_name = 'discord_permissons_reactions';

set @query = IF(@exist <= 0, 'alter table discord_permissons_reactions add approval_ch varchar(255) null;',
                'select \'Column Exists\' status');

prepare discord_permissons_reactions_approval_ch from @query;
EXECUTE discord_permissons_reactions_approval_ch;

SELECT count(*)
INTO @exist
FROM information_schema.columns
WHERE table_schema = database()
  and COLUMN_NAME = 'remote_saveid'
  AND table_name = 'twitter_list';

set @query = IF(@exist <= 0, 'alter table twitter_list add remote_saveid varchar(128) null after saveid;',
                'select \'Column Exists\' status');

prepare twitter_list_remote_saveid from @query;
EXECUTE twitter_list_remote_saveid;

create table if not exists sequenzia_cds_audit
(
    esm_id varchar(126)                       not null,
    fileid varchar(256)                       not null,
    time   DATETIME default CURRENT_TIMESTAMP not null
);
