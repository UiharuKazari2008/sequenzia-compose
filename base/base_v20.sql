-- create the databases
CREATE DATABASE IF NOT EXISTS kanmi_system;

-- create the users for each database
CREATE USER IF NOT EXISTS 'kanmi'@'%' IDENTIFIED WITH mysql_native_password BY '=9R3hxEhZ?9B8bf#+2d4';
GRANT ALL PRIVILEGES ON `kanmi_system`.* TO 'kanmi'@'%';

FLUSH PRIVILEGES;

-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: kanmi_system
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `discord_alarms`
--

DROP TABLE IF EXISTS `discord_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_alarms` (
`channel` varchar(128) DEFAULT NULL,
`id` int NOT NULL AUTO_INCREMENT,
`schedule` varchar(128) NOT NULL,
`mention` varchar(128) DEFAULT NULL,
`text` text,
`snooze` int DEFAULT NULL,
`expires` int DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `discord_alarms_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_archive_overide`
--

DROP TABLE IF EXISTS `discord_archive_overide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_archive_overide` (
   `fromch` varchar(128) NOT NULL,
   `archivech` varchar(128) NOT NULL,
   PRIMARY KEY (`fromch`),
   UNIQUE KEY `fromch_UNIQUE` (`fromch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_autoclean`
--

DROP TABLE IF EXISTS `discord_autoclean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_autoclean` (
`channelid` varchar(128) NOT NULL,
`time` double(3,1) NOT NULL,
`pintop` tinyint(1) DEFAULT '0',
`clearbtn` tinyint(1) DEFAULT '0',
PRIMARY KEY (`channelid`),
UNIQUE KEY `channelid_UNIQUE` (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_autothread`
--

DROP TABLE IF EXISTS `discord_autothread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_autothread` (
`id` int NOT NULL AUTO_INCREMENT,
`channelid` varchar(128) NOT NULL,
`prefix` text NOT NULL,
`pinbutton` tinyint(1) NOT NULL DEFAULT '1',
`addtc` tinyint(1) NOT NULL DEFAULT '1',
`tcparent` tinyint(1) NOT NULL DEFAULT '0',
`check_constantly` tinyint(1) NOT NULL DEFAULT '0',
`cycletime` int NOT NULL DEFAULT '24',
`update_table` text,
`update_field` text,
`update_where` text,
`lifetime` varchar(16) NOT NULL DEFAULT '1440',
`expire` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`lastthread` varchar(128) DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `discord_autothread_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_cache`
--

DROP TABLE IF EXISTS `discord_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_cache` (
`id` varchar(255) NOT NULL,
`cache` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `discord_cache_cache_uindex` (`cache`),
UNIQUE KEY `discord_cache_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_download`
--

DROP TABLE IF EXISTS `discord_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_download` (
`channelid` varchar(128) NOT NULL,
`channelto` varchar(128) NOT NULL,
`type` varchar(64) DEFAULT NULL,
PRIMARY KEY (`channelid`),
UNIQUE KEY `discord_download_channelid_uindex` (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_multipart_backups`
--

DROP TABLE IF EXISTS `discord_multipart_backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_multipart_backups` (
     `bid` varchar(156) NOT NULL,
     `messageid` varchar(128) NOT NULL,
     `system_name` varchar(128) NOT NULL,
     PRIMARY KEY (`bid`),
     UNIQUE KEY `discord_multipart_backups_bid_uindex` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_multipart_files`
--

DROP TABLE IF EXISTS `discord_multipart_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_multipart_files` (
   `messageid` varchar(128) NOT NULL,
   `channelid` varchar(128) DEFAULT NULL,
   `serverid` varchar(128) DEFAULT NULL,
   `fileid` varchar(128) NOT NULL,
   `url` varchar(255) DEFAULT NULL,
   `hash` varchar(128) DEFAULT NULL,
   `valid` tinyint(1) NOT NULL DEFAULT '1',
   PRIMARY KEY (`messageid`),
   UNIQUE KEY `messageid_UNIQUE` (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_permissons`
--

DROP TABLE IF EXISTS `discord_permissons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_permissons` (
`role` varchar(128) NOT NULL,
`server` varchar(128) NOT NULL,
`name` varchar(128) DEFAULT NULL,
PRIMARY KEY (`role`),
UNIQUE KEY `discord_permissons_role_uindex` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_reactions`
--

DROP TABLE IF EXISTS `discord_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_reactions` (
`serverid` varchar(128) DEFAULT NULL,
`position` int DEFAULT NULL,
`reaction_name` varchar(64) NOT NULL,
`reaction_emoji` varchar(128) NOT NULL,
`reaction_custom` varchar(128) DEFAULT NULL,
`readd` tinyint(1) NOT NULL DEFAULT '0',
`automove_channelid` varchar(128) DEFAULT NULL,
`download_channelid` varchar(128) DEFAULT NULL,
`download_listid` varchar(128) DEFAULT NULL,
`download_taccount` int DEFAULT NULL,
UNIQUE KEY `discord_reactions_custom` (`reaction_custom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_reactions_autoadd`
--

DROP TABLE IF EXISTS `discord_reactions_autoadd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_reactions_autoadd` (
     `index` int NOT NULL AUTO_INCREMENT,
     `channelid` varchar(128) NOT NULL,
     `emoji_name` varchar(128) NOT NULL,
     PRIMARY KEY (`index`),
     UNIQUE KEY `index_UNIQUE` (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_servers`
--

DROP TABLE IF EXISTS `discord_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_servers` (
`serverid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
`position` int DEFAULT NULL,
`avatar` varchar(255) DEFAULT NULL,
`name` text,
`nice_name` text,
`short_name` text,
`chid_system` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_systempub` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_filedata` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_filecache` varchar(128) DEFAULT NULL,
`chid_archive` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_archive_nsfw` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_download` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_download_video` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_msg_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_msg_warn` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_msg_err` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_msg_crit` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`chid_msg_notif` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`authware_enabled` tinyint DEFAULT '0',
PRIMARY KEY (`serverid`),
UNIQUE KEY `serverid_UNIQUE` (`serverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_status`
--

DROP TABLE IF EXISTS `discord_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_status` (
`channel` varchar(128) NOT NULL,
`name` varchar(128) DEFAULT NULL,
PRIMARY KEY (`channel`),
UNIQUE KEY `discord_status_channel_uindex` (`channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_status_records`
--

DROP TABLE IF EXISTS `discord_status_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_status_records` (
  `name` varchar(128) NOT NULL,
  `data` json NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_users`
--

DROP TABLE IF EXISTS `discord_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_users` (
`serveruserid` varchar(128) NOT NULL,
`id` varchar(128) NOT NULL,
`server` varchar(128) NOT NULL,
`roles` mediumtext,
`write_roles` mediumtext,
`manage_roles` mediumtext,
`manager` tinyint(1) DEFAULT NULL,
`nice_name` text,
`username` text,
`avatar` varchar(128) DEFAULT NULL,
`banner` varchar(128) DEFAULT NULL,
`color` varchar(16) DEFAULT NULL,
`apple_cid` varchar(128) DEFAULT NULL,
`2fa_key` varchar(128) DEFAULT NULL,
`token` varchar(1024) DEFAULT NULL,
`blind_token` varchar(512) DEFAULT NULL,
`token_static` varchar(1024) DEFAULT NULL,
`token_expires` datetime DEFAULT CURRENT_TIMESTAMP,
`telegram_id` varchar(128) DEFAULT NULL,
PRIMARY KEY (`serveruserid`),
UNIQUE KEY `discord_users_id_uindex` (`serveruserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discord_users_permissons`
--

DROP TABLE IF EXISTS `discord_users_permissons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord_users_permissons` (
    `userid` varchar(128) NOT NULL,
    `serverid` varchar(128) NOT NULL,
    `role` varchar(128) NOT NULL,
    `type` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flickr_history`
--

DROP TABLE IF EXISTS `flickr_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flickr_history` (
`photo_id` varchar(128) NOT NULL,
`username` varchar(128) NOT NULL,
`date` datetime NOT NULL,
PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flickr_watchlist`
--

DROP TABLE IF EXISTS `flickr_watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flickr_watchlist` (
`username` varchar(128) NOT NULL,
`flickr_account` int NOT NULL,
`save_ch` varchar(128) NOT NULL,
`approval_ch` varchar(128) DEFAULT NULL,
`backlog` tinyint(1) DEFAULT '0',
PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `global_parameters`
--

DROP TABLE IF EXISTS `global_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_parameters` (
`system_name` varchar(128) DEFAULT NULL,
`application` varchar(128) DEFAULT NULL,
`account` int DEFAULT NULL,
`serverid` varchar(128) DEFAULT NULL,
`param_key` varchar(128) NOT NULL,
`param_value` text,
`param_data` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kanmi_backups`
--

DROP TABLE IF EXISTS `kanmi_backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kanmi_backups` (
`bid` varchar(156) NOT NULL,
`eid` int NOT NULL,
`system_name` varchar(128) NOT NULL,
PRIMARY KEY (`bid`),
UNIQUE KEY `kanmi_backups_bid_uindex` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kanmi_channels`
--

DROP TABLE IF EXISTS `kanmi_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kanmi_channels` (
`cid` int NOT NULL AUTO_INCREMENT,
`nice_name` text,
`nice_title` text,
`image_hash` varchar(255) DEFAULT NULL,
`classification` varchar(128) DEFAULT NULL,
`uri` varchar(128) DEFAULT NULL,
`watch_folder` varchar(250) DEFAULT NULL,
`notify` varchar(128) DEFAULT NULL,
`backup` tinyint(1) NOT NULL DEFAULT '1',
`autofetch` tinyint(1) NOT NULL DEFAULT '0',
`role` varchar(128) DEFAULT NULL,
`role_write` varchar(128) DEFAULT NULL,
`role_manage` varchar(128) DEFAULT NULL,
`virtual_cid` int DEFAULT NULL,
`source` int DEFAULT '0',
`channelid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
`serverid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
`parent` varchar(128) DEFAULT NULL,
`position` int DEFAULT NULL,
`name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
`short_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
`description` text,
`nsfw` tinyint(1) NOT NULL DEFAULT '0',
`last_message` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
PRIMARY KEY (`cid`),
UNIQUE KEY `channelid_UNIQUE` (`channelid`),
KEY `fds_idx` (`serverid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kanmi_records`
--

DROP TABLE IF EXISTS `kanmi_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kanmi_records` (
`eid` int NOT NULL AUTO_INCREMENT,
`source` int DEFAULT '0',
`id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
`server` varchar(128) NOT NULL,
`channel` varchar(128) NOT NULL,
`user` varchar(128) NOT NULL,
`date` datetime DEFAULT NULL,
`content_full` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
`fileid` varchar(128) DEFAULT NULL,
`real_filename` varchar(255) DEFAULT NULL,
`paritycount` int DEFAULT NULL,
`filesize` double(10,2) DEFAULT NULL,
`attachment_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
`attachment_type` int DEFAULT NULL,
`attachment_hash` varchar(512) DEFAULT NULL,
`attachment_extra` mediumtext,
`filecached` tinyint NOT NULL DEFAULT '0',
`cache_proxy` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
`sizeH` int DEFAULT NULL,
`sizeW` int DEFAULT NULL,
`sizeR` double(8,5) DEFAULT NULL,
`colorR` int DEFAULT NULL,
`colorG` int DEFAULT NULL,
`colorB` int DEFAULT NULL,
`dark_color` tinyint(1) DEFAULT NULL,
`hash` varchar(128) DEFAULT NULL,
`flagged` tinyint DEFAULT '0',
PRIMARY KEY (`eid`),
UNIQUE KEY `discord_messages_id_index` (`id` DESC),
KEY `discord_messages_fileid_index` (`fileid`) /*!80000 INVISIBLE */,
KEY `discord_messages_date_index` (`date` DESC),
KEY `kanmi_records_kanmi_channels_channelid_fk` (`channel`),
KEY `kanmi_records_discord_servers_serverid_fk` (`server`),
CONSTRAINT `kanmi_records_kanmi_channels_channelid_fk` FOREIGN KEY (`channel`) REFERENCES `kanmi_channels` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kanmi_records_extended`
--

DROP TABLE IF EXISTS `kanmi_records_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kanmi_records_extended` (
  `eid` int NOT NULL,
  `data` json DEFAULT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `kanmi_records_extended_eid_uindex` (`eid`),
  CONSTRAINT `kanmi_records_extended_kanmi_records_eid_fk` FOREIGN KEY (`eid`) REFERENCES `kanmi_records` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kanmi_virtual_channels`
--

DROP TABLE IF EXISTS `kanmi_virtual_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kanmi_virtual_channels` (
  `virtual_cid` int NOT NULL,
  `name` text NOT NULL,
  `description` text,
  `uri` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`virtual_cid`),
  UNIQUE KEY `kanmi_virtual_channels_virtual_cid_uindex` (`virtual_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mixcloud_watchlist`
--

DROP TABLE IF EXISTS `mixcloud_watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mixcloud_watchlist` (
`username` varchar(128) NOT NULL,
`channelid` varchar(128) NOT NULL,
`search` varchar(128) DEFAULT NULL,
PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_history`
--

DROP TABLE IF EXISTS `news_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_history` (
`item_url` varchar(255) NOT NULL,
`feed` varchar(255) DEFAULT NULL,
`timestamp` datetime DEFAULT NULL,
PRIMARY KEY (`item_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_watchlist`
--

DROP TABLE IF EXISTS `news_watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_watchlist` (
`feed` varchar(255) NOT NULL,
`channelid` varchar(128) DEFAULT NULL,
PRIMARY KEY (`feed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pixiv_accounts`
--

DROP TABLE IF EXISTS `pixiv_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pixiv_accounts` (
`paccount` int NOT NULL,
`feed_channelid` varchar(128) DEFAULT NULL,
`feed_channelid_nsfw` varchar(128) DEFAULT NULL,
`recom_channelid` varchar(128) DEFAULT NULL,
`recom_channelid_nsfw` varchar(128) DEFAULT NULL,
`save_channelid` varchar(128) NOT NULL,
`save_channelid_nsfw` varchar(128) NOT NULL,
`download_channelid` varchar(128) NOT NULL,
`like_taccount` int DEFAULT NULL,
`like_taccount_nsfw` int DEFAULT NULL,
`authtoken` varchar(128) DEFAULT NULL,
`refreshtoken` varchar(128) DEFAULT NULL,
PRIMARY KEY (`paccount`),
UNIQUE KEY `paccount_UNIQUE` (`paccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pixiv_autodownload`
--

DROP TABLE IF EXISTS `pixiv_autodownload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pixiv_autodownload` (
`user_id` varchar(128) NOT NULL,
`channelid` varchar(128) DEFAULT NULL,
PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pixiv_history_illu`
--

DROP TABLE IF EXISTS `pixiv_history_illu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pixiv_history_illu` (
`illu_id` varchar(128) NOT NULL,
`user_id` varchar(128) NOT NULL,
`timestamp` datetime NOT NULL,
PRIMARY KEY (`illu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pixiv_recomm_illu`
--

DROP TABLE IF EXISTS `pixiv_recomm_illu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pixiv_recomm_illu` (
`paccount` int NOT NULL DEFAULT '0',
`id` varchar(128) NOT NULL,
`user` varchar(128) NOT NULL,
`data` json DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pixiv_tweets`
--

DROP TABLE IF EXISTS `pixiv_tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pixiv_tweets` (
`id` varchar(128) NOT NULL,
`date` datetime DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pixiv_watchlists`
--

DROP TABLE IF EXISTS `pixiv_watchlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pixiv_watchlists` (
`tag_name` varchar(128) NOT NULL,
`paccount` int DEFAULT NULL,
PRIMARY KEY (`tag_name`),
UNIQUE KEY `pixiv_user_UNIQUE` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `podcast_history`
--

DROP TABLE IF EXISTS `podcast_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `podcast_history` (
`url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`thash` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
`feed` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`date` datetime NOT NULL,
PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `podcast_watchlist`
--

DROP TABLE IF EXISTS `podcast_watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `podcast_watchlist` (
`index` int NOT NULL AUTO_INCREMENT,
`rssaccount` int NOT NULL DEFAULT '1',
`url` mediumtext NOT NULL,
`channelid` varchar(128) NOT NULL,
PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seqran_channels`
--

DROP TABLE IF EXISTS `seqran_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seqran_channels` (
`enabled` tinyint(1) DEFAULT '0',
`channel` varchar(128) DEFAULT NULL,
`search` text,
`schedule` varchar(50) DEFAULT NULL,
`message` text,
`updateOnly` tinyint NOT NULL DEFAULT '0',
`linked` tinyint NOT NULL DEFAULT '0',
`displayname` text,
`fav_userid` varchar(128) DEFAULT NULL,
`lastmessage` varchar(128) DEFAULT NULL,
`lasteid` int DEFAULT NULL,
`lastmodify` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seqran_quotes`
--

DROP TABLE IF EXISTS `seqran_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seqran_quotes` (
`text` text NOT NULL,
`tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_album_items`
--

DROP TABLE IF EXISTS `sequenzia_album_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_album_items` (
 `eid` int NOT NULL,
 `aid` int NOT NULL,
 `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_albums`
--

DROP TABLE IF EXISTS `sequenzia_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_albums` (
`aid` int NOT NULL AUTO_INCREMENT,
`name` text NOT NULL,
`uri` varchar(128) NOT NULL,
`owner` varchar(128) NOT NULL,
`privacy` tinyint(1) DEFAULT '1',
PRIMARY KEY (`aid`),
UNIQUE KEY `sequenzia_albums_aid_uindex` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_artists_favorites`
--

DROP TABLE IF EXISTS `sequenzia_artists_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_artists_favorites` (
       `id` varchar(255) NOT NULL,
       `userid` varchar(128) NOT NULL,
       `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_class`
--

DROP TABLE IF EXISTS `sequenzia_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_class` (
`class` varchar(128) NOT NULL,
`super` varchar(128) NOT NULL,
`uri` varchar(64) DEFAULT NULL,
`position` int DEFAULT NULL,
`name` varchar(128) NOT NULL,
`icon` varchar(128) DEFAULT NULL,
`filetypes` text,
PRIMARY KEY (`class`),
UNIQUE KEY `sequenzia_class_class_uindex` (`class`),
KEY `sequenzia_class_sequenzia_superclass_super_fk` (`super`),
CONSTRAINT `sequenzia_class_sequenzia_superclass_super_fk` FOREIGN KEY (`super`) REFERENCES `sequenzia_superclass` (`super`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_custom_channels`
--

DROP TABLE IF EXISTS `sequenzia_custom_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_custom_channels` (
     `search` text NOT NULL,
     `name` varchar(255) DEFAULT NULL,
     `class` varchar(255) DEFAULT NULL,
     `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_display_config`
--

DROP TABLE IF EXISTS `sequenzia_display_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_display_config` (
    `uid` varchar(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `user` varchar(128) NOT NULL,
    `nice_name` mediumtext,
    `requestOptions` text,
    `refreshTime` int NOT NULL DEFAULT '15',
    `imageFormat` varchar(5) NOT NULL DEFAULT 'webm',
    `location` text,
    `displaySysInfo` int NOT NULL DEFAULT '1',
    `displayImageInfo` tinyint(1) NOT NULL DEFAULT '1',
    `displayClock` int NOT NULL DEFAULT '1',
    `displayDate` tinyint(1) NOT NULL DEFAULT '1',
    `displayOverlay` int NOT NULL DEFAULT '1',
    `displayLogo` int NOT NULL DEFAULT '1',
    `enableScale` tinyint(1) NOT NULL DEFAULT '1',
    `displayAspectCorrect` tinyint(1) NOT NULL DEFAULT '1',
    `darkImages` tinyint(1) NOT NULL DEFAULT '0',
    `darkOverlay` int DEFAULT '0',
    `taskbarPosition` int NOT NULL DEFAULT '0',
    `weatherFeelLike` tinyint(1) NOT NULL DEFAULT '0',
    `weatherFormat` int NOT NULL DEFAULT '1',
    `weatherDisplay` int NOT NULL DEFAULT '0',
    `quoteEnable` tinyint(1) NOT NULL DEFAULT '0',
    `quoteTag` text,
    `showHistory` tinyint(1) NOT NULL DEFAULT '1',
    PRIMARY KEY (`uid`),
    UNIQUE KEY `sequenzia_display_config_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_display_history`
--

DROP TABLE IF EXISTS `sequenzia_display_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_display_history` (
     `eid` int DEFAULT NULL,
     `name` varchar(255) DEFAULT NULL,
     `screen` int DEFAULT NULL,
     `user` varchar(128) DEFAULT NULL,
     `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_favorites`
--

DROP TABLE IF EXISTS `sequenzia_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_favorites` (
`eid` int NOT NULL,
`userid` varchar(128) NOT NULL,
`date` datetime DEFAULT CURRENT_TIMESTAMP,
KEY `sequenzia_favorites_id_index` (`eid`),
KEY `sequenzia_favorites_userid_index` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_hidden_channels`
--

DROP TABLE IF EXISTS `sequenzia_hidden_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_hidden_channels` (
     `cid` int NOT NULL,
     `user` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_homelinks`
--

DROP TABLE IF EXISTS `sequenzia_homelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_homelinks` (
`position` int NOT NULL,
`name` text NOT NULL,
`icon` text,
`url` text NOT NULL,
PRIMARY KEY (`position`),
UNIQUE KEY `sequenzia_homelinks_position_uindex` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_index_artists`
--

DROP TABLE IF EXISTS `sequenzia_index_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_index_artists` (
   `id` varchar(255) NOT NULL,
   `source` int DEFAULT NULL,
   `confidence` int DEFAULT NULL,
   `channelid` varchar(128) NOT NULL,
   `artist` text,
   `name` text,
   `url` text,
   `search` text NOT NULL,
   `last` int DEFAULT NULL,
   `count` int DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `sequenzia_index_artists_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_index_custom`
--

DROP TABLE IF EXISTS `sequenzia_index_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_index_custom` (
  `search` text,
  `artist` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_login_codes`
--

DROP TABLE IF EXISTS `sequenzia_login_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_login_codes` (
 `code` varchar(8) NOT NULL,
 `session` varchar(128) NOT NULL,
 `expires` datetime NOT NULL,
 PRIMARY KEY (`code`),
 UNIQUE KEY `sequenzia_login_codes_code_uindex` (`code`),
 UNIQUE KEY `sequenzia_login_codes_session_uindex` (`session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_navigation_history`
--

DROP TABLE IF EXISTS `sequenzia_navigation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_navigation_history` (
        `index` varchar(256) NOT NULL,
        `uri` longtext NOT NULL,
        `title` text,
        `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `saved` tinyint(1) NOT NULL DEFAULT '0',
        `user` varchar(128) NOT NULL,
        PRIMARY KEY (`index`),
        UNIQUE KEY `sequenzia_navigation_history_index_uindex` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_quotes`
--

DROP TABLE IF EXISTS `sequenzia_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_quotes` (
`index` int NOT NULL AUTO_INCREMENT,
`quote` text,
`author` text,
`tags` varchar(255) DEFAULT NULL,
PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_sessions`
--

DROP TABLE IF EXISTS `sequenzia_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_sessions` (
`session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
`expires` int unsigned NOT NULL,
`data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_superclass`
--

DROP TABLE IF EXISTS `sequenzia_superclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_superclass` (
`super` varchar(128) NOT NULL,
`position` int DEFAULT NULL,
`name` varchar(128) NOT NULL,
`uri` varchar(128) NOT NULL,
`icon` varchar(128) DEFAULT NULL,
PRIMARY KEY (`super`),
UNIQUE KEY `sequenzia_superclass_super_uindex` (`super`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequenzia_user_config`
--

DROP TABLE IF EXISTS `sequenzia_user_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequenzia_user_config` (
 `id` varchar(128) NOT NULL,
 `token` varchar(128) DEFAULT NULL,
 `last_login` datetime DEFAULT NULL,
 `req_limit` int DEFAULT NULL,
 `nsfw_enable` tinyint DEFAULT NULL,
 `mention_req` tinyint DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `sequenzia_user_config_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telegram_accounts`
--

DROP TABLE IF EXISTS `telegram_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegram_accounts` (
`account` int NOT NULL,
`token` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telegram_groups`
--

DROP TABLE IF EXISTS `telegram_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegram_groups` (
`serverid` varchar(128) DEFAULT NULL,
`chid_log` varchar(128) DEFAULT NULL,
`chid_filedata` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeline_messages`
--

DROP TABLE IF EXISTS `timeline_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeline_messages` (
`id` varchar(128) NOT NULL,
`channel` varchar(128) DEFAULT NULL,
`server` varchar(128) DEFAULT NULL,
`user` varchar(128) DEFAULT NULL,
`date` datetime DEFAULT NULL,
`type` varchar(128) DEFAULT NULL,
`author` mediumtext,
`author_url` varchar(256) DEFAULT NULL,
`author_image` varchar(256) DEFAULT NULL,
`content` mediumtext,
`description` varchar(1024) DEFAULT NULL,
`url` varchar(256) DEFAULT NULL,
`color` varchar(10) DEFAULT NULL,
`embeds` mediumtext,
`cache_embeds` mediumtext,
`viewed` tinyint DEFAULT NULL,
UNIQUE KEY `timeline_messages_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_accounts`
--

DROP TABLE IF EXISTS `twitter_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_accounts` (
`taccount` int NOT NULL AUTO_INCREMENT,
`name` text,
`short_name` text,
`consumer_key` varchar(255) NOT NULL DEFAULT '0',
`consumer_secret` varchar(255) NOT NULL DEFAULT '0',
`access_token` varchar(255) NOT NULL DEFAULT '0',
`access_token_secret` varchar(255) NOT NULL DEFAULT '0',
`streamenv` varchar(45) DEFAULT 'dev',
`activitychannelid` varchar(128) DEFAULT NULL,
`activity_userid` varchar(128) DEFAULT NULL,
`flowcontrol` tinyint(1) DEFAULT '0',
`flowstatuschannel` varchar(128) DEFAULT NULL,
`flowcontrol_schedule` varchar(32) DEFAULT '*/2 * * * *',
PRIMARY KEY (`taccount`),
UNIQUE KEY `taccount_UNIQUE` (`taccount`),
UNIQUE KEY `consumer_key_UNIQUE` (`consumer_key`),
UNIQUE KEY `consumer_secret_UNIQUE` (`consumer_secret`),
UNIQUE KEY `access_token_UNIQUE` (`access_token`),
UNIQUE KEY `access_token_secret_UNIQUE` (`access_token_secret`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_autodownload`
--

DROP TABLE IF EXISTS `twitter_autodownload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_autodownload` (
`username` varchar(255) NOT NULL,
PRIMARY KEY (`username`),
UNIQUE KEY `twitter_autodownload_username_uindex` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_blockedwords`
--

DROP TABLE IF EXISTS `twitter_blockedwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_blockedwords` (
`word` varchar(128) NOT NULL,
`taccount` int NOT NULL,
PRIMARY KEY (`word`),
UNIQUE KEY `word_UNIQUE` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_flowpriority`
--

DROP TABLE IF EXISTS `twitter_flowpriority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_flowpriority` (
`username` varchar(255) NOT NULL,
PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_history_inbound`
--

DROP TABLE IF EXISTS `twitter_history_inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_history_inbound` (
   `tweetid` varchar(128) NOT NULL,
   `listid` varchar(128) DEFAULT NULL,
   `timestamp` datetime DEFAULT NULL,
   PRIMARY KEY (`tweetid`),
   UNIQUE KEY `tweetid_UNIQUE` (`tweetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_history_mention`
--

DROP TABLE IF EXISTS `twitter_history_mention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_history_mention` (
   `tweetid` varchar(128) NOT NULL,
   `taccount` int NOT NULL,
   `timestamp` datetime DEFAULT NULL,
   PRIMARY KEY (`tweetid`),
   UNIQUE KEY `tweetid_UNIQUE` (`tweetid`),
   KEY `twitter acctount_idx` (`taccount`),
   CONSTRAINT `twitter acctount` FOREIGN KEY (`taccount`) REFERENCES `twitter_accounts` (`taccount`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_list`
--

DROP TABLE IF EXISTS `twitter_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_list` (
`id` int NOT NULL,
`listid` varchar(128) NOT NULL DEFAULT '0',
`taccount` int NOT NULL DEFAULT '0',
`name` varchar(255) NOT NULL DEFAULT '0',
`channelid` varchar(128) DEFAULT '0',
`channelid_rt` varchar(128) DEFAULT NULL,
`saveid` varchar(128) NOT NULL DEFAULT '0',
`textallowed` tinyint(1) NOT NULL DEFAULT '1',
`getretweets` tinyint(1) NOT NULL DEFAULT '1',
`nsfw` tinyint(1) NOT NULL DEFAULT '0',
`replyenabled` tinyint(1) DEFAULT '1',
`blockselfrt` tinyint(1) DEFAULT '0',
`mergelike` tinyint(1) DEFAULT '0',
`disablelike` tinyint(1) DEFAULT '0',
`autolike` tinyint(1) DEFAULT '0',
`bypasscds` tinyint(1) DEFAULT '0',
`remotecds_onlike` tinyint(1) DEFAULT '0',
`flowcontrol` tinyint(1) DEFAULT '0',
`redirect_taccount` int DEFAULT '1',
`active_thread` varchar(128) DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `twitter_list_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_list_users`
--

DROP TABLE IF EXISTS `twitter_list_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_list_users` (
`index` int NOT NULL AUTO_INCREMENT,
`username` varchar(255) NOT NULL,
`listid` varchar(255) NOT NULL,
PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_sendoverides`
--

DROP TABLE IF EXISTS `twitter_sendoverides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_sendoverides` (
`channelid` varchar(128) NOT NULL,
`taccount` int DEFAULT NULL,
PRIMARY KEY (`channelid`),
UNIQUE KEY `twitter_sendoverides_channelid_uindex` (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_textoverides`
--

DROP TABLE IF EXISTS `twitter_textoverides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_textoverides` (
`channelid` varchar(128) NOT NULL,
`text` varchar(280) NOT NULL,
PRIMARY KEY (`channelid`),
UNIQUE KEY `channelid_UNIQUE` (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_tweet_queue`
--

DROP TABLE IF EXISTS `twitter_tweet_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_tweet_queue` (
`taccount` int NOT NULL,
`action` int NOT NULL,
`id` varchar(128) DEFAULT NULL,
`data` longblob,
`date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_tweets`
--

DROP TABLE IF EXISTS `twitter_tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_tweets` (
`messageid` varchar(128) NOT NULL,
`channelid` varchar(128) NOT NULL,
`listid` varchar(128) DEFAULT NULL,
`tweetid` varchar(128) NOT NULL,
`userid` varchar(128) NOT NULL,
PRIMARY KEY (`messageid`),
UNIQUE KEY `twitter_tweets_messageid_uindex` (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_user_redirect`
--

DROP TABLE IF EXISTS `twitter_user_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_user_redirect` (
 `twitter_username` varchar(128) NOT NULL,
 `channelid` varchar(128) NOT NULL,
 PRIMARY KEY (`twitter_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_visitedpages`
--

DROP TABLE IF EXISTS `web_visitedpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_visitedpages` (
`url` varchar(512) NOT NULL,
`date` datetime DEFAULT NULL,
PRIMARY KEY (`url`),
UNIQUE KEY `web_visitedpages_url_uindex` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `youtube_history_videos`
--

DROP TABLE IF EXISTS `youtube_history_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `youtube_history_videos` (
  `videoid` varchar(128) NOT NULL,
  `yuser` varchar(128) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`videoid`),
  UNIQUE KEY `videoid_UNIQUE` (`videoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `youtube_watchlist`
--

DROP TABLE IF EXISTS `youtube_watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `youtube_watchlist` (
`yuser` varchar(64) NOT NULL,
`yaccount` int NOT NULL DEFAULT '1',
`channelid` varchar(128) NOT NULL,
`name` varchar(255) DEFAULT NULL,
PRIMARY KEY (`yuser`),
UNIQUE KEY `channelid_UNIQUE` (`yuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2022-07-08  3:10:28
