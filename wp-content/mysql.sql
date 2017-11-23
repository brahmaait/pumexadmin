-- MySQL dump 10.13  Distrib 5.7.19-17, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wp_pumexadmin
-- ------------------------------------------------------
-- Server version	5.7.19-17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wpengine.com/','','2017-06-20 20:39:42','2017-06-20 20:39:42','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `wpe_autoload_options_index` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://pumexadmin.wpengine.com','yes'),(2,'home','http://pumexadmin.wpengine.com','yes'),(3,'blogname','Christopher Scirpoli Blog','yes'),(4,'blogdescription','Your SUPER-powered WP Engine Blog','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','admin@pumexcomputing.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','0','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','','yes'),(29,'rewrite_rules','','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:2:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:2;s:25:\"user_roles/user_roles.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','','no'),(40,'template','twentyseventeen','yes'),(41,'stylesheet','twentyseventeen','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','38590','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','0','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','posts','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','none','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:0:{}','yes'),(80,'widget_rss','a:0:{}','yes'),(81,'uninstall_plugins','a:1:{s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:22:\"swpsmtp_send_uninstall\";}','no'),(82,'timezone_string','','yes'),(83,'page_for_posts','0','yes'),(84,'page_on_front','0','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'initial_db_version','38590','yes'),(92,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:0;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'fresh_site','0','yes'),(94,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(95,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(98,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(99,'sidebars_widgets','a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}','yes'),(100,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(101,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'cron','a:4:{i:1511426383;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1511434305;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1511442670;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(109,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(110,'widget_wpe_powered_by_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(120,'theme_mods_twentyseventeen','a:1:{s:18:\"custom_css_post_id\";i:-1;}','yes'),(127,'wpe_notices','a:1:{s:4:\"read\";s:0:\"\";}','yes'),(128,'wpe_notices_ttl','1511354505','yes'),(132,'can_compress_scripts','0','no'),(217,'recently_activated','a:1:{s:29:\"easy-wp-smtp/easy-wp-smtp.php\";i:1511154571;}','yes'),(218,'acf_version','4.4.12','yes'),(224,'swpsmtp_options','a:7:{s:15:\"allowed_domains\";s:32:\"cHVtZXhhZG1pbi53cGVuZ2luZS5jb20=\";s:15:\"from_name_field\";s:6:\"Sariga\";s:16:\"from_email_field\";s:26:\"sariga.brahmaait@gmail.com\";s:14:\"reply_to_email\";s:26:\"sariga.brahmaait@gmail.com\";s:17:\"email_ignore_list\";s:0:\"\";s:13:\"smtp_settings\";a:7:{s:4:\"host\";s:14:\"smtp.gmail.com\";s:15:\"type_encryption\";s:3:\"ssl\";s:13:\"autentication\";s:3:\"yes\";s:8:\"username\";s:26:\"sariga.brahmaait@gmail.com\";s:12:\"enable_debug\";b:0;s:4:\"port\";s:3:\"465\";s:8:\"password\";s:12:\"R2htdGJ0IzE=\";}s:19:\"enable_domain_check\";b:0;}','yes'),(257,'_site_transient_timeout_browser_64f5519026e11fcaa264d756233b04a7','1511431133','no'),(258,'_site_transient_browser_64f5519026e11fcaa264d756233b04a7','a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"56.0\";s:8:\"platform\";s:5:\"Linux\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(276,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.9.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.9.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.9-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.9-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.9\";s:7:\"version\";s:3:\"4.9\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.9.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.9.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.9-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.9-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.9\";s:7:\"version\";s:3:\"4.9\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1511411417;s:15:\"version_checked\";s:5:\"4.8.3\";s:12:\"translations\";a:0:{}}','no'),(298,'_site_transient_timeout_browser_80dda98b563707acd927181032f1d9fb','1511510621','no'),(299,'_site_transient_browser_80dda98b563707acd927181032f1d9fb','a:10:{s:4:\"name\";s:6:\"Safari\";s:7:\"version\";s:4:\"10.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.apple.com/safari/\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/safari.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/safari.png?1\";s:15:\"current_version\";s:2:\"11\";s:7:\"upgrade\";b:1;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(308,'_site_transient_timeout_browser_15f0d9de6d31d9485f3d016a271a86ca','1511514819','no'),(309,'_site_transient_browser_15f0d9de6d31d9485f3d016a271a86ca','a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"56.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(312,'_site_transient_timeout_browser_6cb4190df8a04f544813832f9935539f','1511515343','no'),(313,'_site_transient_browser_6cb4190df8a04f544813832f9935539f','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"62.0.3202.94\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(328,'_site_transient_timeout_browser_c16a69dc6cdbaa7f191ce46667ef720c','1511528663','no'),(329,'_site_transient_browser_c16a69dc6cdbaa7f191ce46667ef720c','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"62.0.3202.89\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(356,'smtp_test_mail','a:3:{s:10:\"swpsmtp_to\";s:20:\"sarigar111@gmail.com\";s:15:\"swpsmtp_subject\";s:9:\"test mail\";s:15:\"swpsmtp_message\";s:10:\"test mail.\";}','yes'),(397,'_transient_is_multi_author','1','yes'),(408,'_site_transient_timeout_browser_e58c80ebeb5814fceecec84ab3b0a3d2','1511861873','no'),(409,'_site_transient_browser_e58c80ebeb5814fceecec84ab3b0a3d2','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"59.0.3071.25\";s:8:\"platform\";s:5:\"Linux\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(448,'_site_transient_timeout_theme_roots','1511413218','no'),(449,'_site_transient_theme_roots','a:3:{s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','no'),(450,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1511411420;s:7:\"checked\";a:3:{s:13:\"twentyfifteen\";s:3:\"1.8\";s:15:\"twentyseventeen\";s:3:\"1.3\";s:13:\"twentysixteen\";s:3:\"1.3\";}s:8:\"response\";a:3:{s:13:\"twentyfifteen\";a:4:{s:5:\"theme\";s:13:\"twentyfifteen\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentyfifteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentyfifteen.1.9.zip\";}s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.1.4.zip\";}s:13:\"twentysixteen\";a:4:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.1.4.zip\";}}s:12:\"translations\";a:0:{}}','no'),(451,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1511411419;s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.1.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:7:\"default\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";s:7:\"default\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"4.9\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:29:\"easy-wp-smtp/easy-wp-smtp.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:26:\"w.org/plugins/easy-wp-smtp\";s:4:\"slug\";s:12:\"easy-wp-smtp\";s:6:\"plugin\";s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:11:\"new_version\";s:5:\"1.3.1\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/easy-wp-smtp/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/easy-wp-smtp.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:65:\"https://ps.w.org/easy-wp-smtp/assets/icon-128x128.png?rev=1242044\";s:7:\"default\";s:65:\"https://ps.w.org/easy-wp-smtp/assets/icon-128x128.png?rev=1242044\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:67:\"https://ps.w.org/easy-wp-smtp/assets/banner-772x250.png?rev=1650323\";s:7:\"default\";s:67:\"https://ps.w.org/easy-wp-smtp/assets/banner-772x250.png?rev=1650323\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"4.9\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:6:\"4.4.12\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.4.4.12.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:7:\"default\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";}s:7:\"banners\";a:3:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:7:\"default\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:11:\"banners_rtl\";a:0:{}}}}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,4,'_edit_lock','1511154288:2'),(3,4,'_edit_last','2'),(4,4,'field_5a0c1c4d1a2be','a:14:{s:3:\"key\";s:19:\"field_5a0c1c4d1a2be\";s:5:\"label\";s:19:\"Supervisor\'s Email \";s:4:\"name\";s:20:\"supervisors_email_id\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"1\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:5:\"Email\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),(6,4,'position','side'),(7,4,'layout','default'),(8,4,'hide_on_screen',''),(10,6,'_edit_lock','1510744459:2'),(11,6,'_edit_last','2'),(13,6,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(14,6,'_supervisors_email_id','field_5a0c1c4d1a2be'),(15,7,'_edit_lock','1510825062:2'),(16,7,'_edit_last','2'),(18,7,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(19,7,'_supervisors_email_id','field_5a0c1c4d1a2be'),(20,8,'_edit_lock','1510820840:3'),(21,8,'_edit_last','2'),(23,8,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(24,8,'_supervisors_email_id','field_5a0c1c4d1a2be'),(31,1,'_edit_lock','1510820848:3'),(32,13,'_edit_lock','1510748705:3'),(33,14,'_edit_lock','1510749087:3'),(34,15,'_edit_lock','1510749472:2'),(35,16,'_edit_lock','1510749873:3'),(36,17,'_edit_lock','1510825232:2'),(37,17,'_edit_last','2'),(39,18,'_edit_last','3'),(40,18,'_edit_lock','1510825543:3'),(41,18,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(42,18,'_supervisors_email_id','field_5a0c1c4d1a2be'),(43,19,'_edit_lock','1510825710:2'),(44,20,'_edit_lock','1510825931:3'),(45,21,'_edit_lock','1510825889:3'),(46,21,'_edit_last','3'),(47,21,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(48,21,'_supervisors_email_id','field_5a0c1c4d1a2be'),(49,22,'_edit_last','3'),(50,22,'supervisors_email_id','nimmi.alampatt@brahmaait.com'),(51,22,'_supervisors_email_id','field_5a0c1c4d1a2be'),(52,22,'_edit_lock','1510826065:3'),(53,23,'_edit_lock','1510826210:2'),(54,24,'_edit_lock','1510826760:2'),(55,24,'_edit_last','2'),(57,25,'_edit_lock','1510828956:2'),(58,25,'_edit_last','3'),(59,25,'supervisors_email_id','hari.swaminathan@brahmaait.com'),(60,25,'_supervisors_email_id','field_5a0c1c4d1a2be'),(61,26,'_edit_lock','1510828132:2'),(62,26,'_edit_last','2'),(64,27,'_edit_lock','1510828295:2'),(65,28,'_edit_lock','1510828675:2'),(66,28,'_edit_last','2'),(68,29,'_edit_last','2'),(70,29,'_edit_lock','1510829908:2'),(71,31,'_edit_lock','1510830044:3'),(72,31,'_edit_last','3'),(73,31,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(74,31,'_supervisors_email_id','field_5a0c1c4d1a2be'),(75,32,'_edit_lock','1510830101:3'),(76,32,'_edit_last','3'),(77,32,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(78,32,'_supervisors_email_id','field_5a0c1c4d1a2be'),(79,33,'_edit_lock','1510830232:3'),(80,33,'_edit_last','3'),(81,33,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(82,33,'_supervisors_email_id','field_5a0c1c4d1a2be'),(83,34,'_edit_lock','1510833335:3'),(84,34,'_edit_last','3'),(85,34,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(86,34,'_supervisors_email_id','field_5a0c1c4d1a2be'),(87,35,'_edit_lock','1510832029:3'),(88,35,'_edit_last','3'),(89,35,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(90,35,'_supervisors_email_id','field_5a0c1c4d1a2be'),(91,36,'_edit_lock','1510833287:3'),(92,36,'_edit_last','3'),(93,36,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(94,36,'_supervisors_email_id','field_5a0c1c4d1a2be'),(95,37,'_edit_lock','1510832814:3'),(96,37,'_edit_last','3'),(97,37,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(98,37,'_supervisors_email_id','field_5a0c1c4d1a2be'),(99,38,'_edit_lock','1510833542:3'),(100,38,'_edit_last','3'),(101,38,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(102,38,'_supervisors_email_id','field_5a0c1c4d1a2be'),(103,39,'_edit_lock','1510834656:3'),(104,39,'_edit_last','3'),(105,39,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(106,39,'_supervisors_email_id','field_5a0c1c4d1a2be'),(107,40,'_edit_lock','1510833670:3'),(108,40,'_edit_last','3'),(109,40,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(110,40,'_supervisors_email_id','field_5a0c1c4d1a2be'),(111,41,'_edit_lock','1510834184:2'),(112,41,'_edit_last','3'),(113,41,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(114,41,'_supervisors_email_id','field_5a0c1c4d1a2be'),(115,42,'_edit_lock','1510837735:3'),(116,42,'_edit_last','3'),(117,42,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(118,42,'_supervisors_email_id','field_5a0c1c4d1a2be'),(119,44,'_edit_lock','1510835030:3'),(120,44,'_edit_last','3'),(121,44,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(122,44,'_supervisors_email_id','field_5a0c1c4d1a2be'),(123,45,'_edit_lock','1510835030:3'),(124,45,'_edit_last','3'),(125,45,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(126,45,'_supervisors_email_id','field_5a0c1c4d1a2be'),(127,46,'_edit_lock','1510837735:3'),(128,46,'_edit_last','3'),(129,46,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(130,46,'_supervisors_email_id','field_5a0c1c4d1a2be'),(131,48,'_edit_lock','1511154500:3'),(132,48,'_edit_last','3'),(133,48,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(134,48,'_supervisors_email_id','field_5a0c1c4d1a2be'),(135,50,'_edit_lock','1511154478:3'),(136,50,'_edit_last','3'),(137,50,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(138,50,'_supervisors_email_id','field_5a0c1c4d1a2be'),(139,51,'_edit_lock','1510837736:3'),(140,51,'_edit_last','3'),(141,51,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(142,51,'_supervisors_email_id','field_5a0c1c4d1a2be'),(143,54,'_edit_last','4'),(144,54,'_edit_lock','1510836063:4'),(145,56,'_edit_lock','1510836319:4'),(146,56,'_edit_last','4'),(148,56,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(149,56,'_supervisors_email_id','field_5a0c1c4d1a2be'),(150,57,'_edit_lock','1510838557:2'),(151,57,'_edit_last','3'),(152,57,'supervisors_email_id','hari.swaminathan@brahmaait.com'),(153,57,'_supervisors_email_id','field_5a0c1c4d1a2be'),(154,53,'_wp_trash_meta_status','auto-draft'),(155,53,'_wp_trash_meta_time','1510836447'),(156,53,'_wp_desired_post_slug',''),(157,54,'_wp_trash_meta_status','auto-draft'),(158,54,'_wp_trash_meta_time','1510836447'),(159,54,'_wp_desired_post_slug',''),(160,56,'_wp_trash_meta_status','publish'),(161,56,'_wp_trash_meta_time','1510836447'),(162,56,'_wp_desired_post_slug','newposts'),(163,59,'_edit_lock','1510838237:3'),(164,59,'_edit_last','3'),(165,59,'supervisors_email_id','hari.swaminathan@brahmaait.com'),(166,59,'_supervisors_email_id','field_5a0c1c4d1a2be'),(167,60,'_edit_lock','1510839027:3'),(168,60,'_edit_last','3'),(169,60,'supervisors_email_id','hari.swaminathan@brahmaait.com'),(170,60,'_supervisors_email_id','field_5a0c1c4d1a2be'),(171,61,'_edit_lock','1510889420:3'),(174,63,'_edit_lock','1510913902:2'),(175,64,'_edit_lock','1510891380:2'),(176,64,'_edit_last','3'),(177,64,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(178,64,'_supervisors_email_id','field_5a0c1c4d1a2be'),(179,65,'_edit_lock','1510895283:3'),(180,65,'_edit_last','3'),(181,65,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(182,65,'_supervisors_email_id','field_5a0c1c4d1a2be'),(183,67,'_edit_lock','1510921941:2'),(184,67,'_edit_last','5'),(185,67,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(186,67,'_supervisors_email_id','field_5a0c1c4d1a2be'),(187,70,'_edit_lock','1510982725:2'),(188,70,'_edit_last','2'),(190,71,'_edit_lock','1510982873:2'),(191,71,'_edit_last','2'),(192,71,'supervisors_email_id','bijoy@pumexcomputing.com'),(193,71,'_supervisors_email_id','field_5a0c1c4d1a2be'),(195,74,'_edit_lock','1510923922:3'),(198,76,'_edit_lock','1510981174:3'),(201,78,'_edit_lock','1510982029:2'),(204,81,'_edit_lock','1510985028:2'),(205,81,'_edit_last','3'),(206,81,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(207,81,'_supervisors_email_id','field_5a0c1c4d1a2be'),(208,83,'_edit_lock','1510982458:3'),(213,85,'_edit_lock','1510985149:2'),(214,85,'_edit_last','2'),(215,85,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(216,85,'_supervisors_email_id','field_5a0c1c4d1a2be'),(218,86,'_edit_lock','1510989916:3'),(219,86,'_edit_last','3'),(220,86,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(221,86,'_supervisors_email_id','field_5a0c1c4d1a2be'),(222,87,'_edit_lock','1510984873:3'),(225,88,'_edit_lock','1510985088:3'),(226,89,'_edit_lock','1510987256:3'),(227,90,'_edit_lock','1511000020:3'),(228,92,'_edit_lock','1511004819:2'),(229,92,'_edit_last','3'),(230,92,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(231,92,'_supervisors_email_id','field_5a0c1c4d1a2be'),(234,95,'_edit_lock','1511149742:3'),(235,96,'_edit_last','3'),(236,96,'_edit_lock','1511149974:3'),(237,96,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(238,96,'_supervisors_email_id','field_5a0c1c4d1a2be'),(239,97,'_edit_lock','1511150066:3'),(240,97,'_edit_last','3'),(241,97,'supervisors_email_id','nimmi.alampatt@brahmaait.com'),(242,97,'_supervisors_email_id','field_5a0c1c4d1a2be'),(243,98,'_edit_lock','1511150286:3'),(244,98,'_edit_last','3'),(245,98,'supervisors_email_id','arun.suresh@brahmaait.com'),(246,98,'_supervisors_email_id','field_5a0c1c4d1a2be'),(247,99,'_edit_lock','1511150378:3'),(248,99,'_edit_last','3'),(249,99,'supervisors_email_id','nimmi.alampatt@brahmaait.com'),(250,99,'_supervisors_email_id','field_5a0c1c4d1a2be'),(251,100,'_edit_lock','1511150648:3'),(252,100,'_edit_last','3'),(253,100,'supervisors_email_id','arun.suresh@brahmaait.com'),(254,100,'_supervisors_email_id','field_5a0c1c4d1a2be'),(255,102,'_edit_lock','1511150742:3'),(256,102,'_edit_last','3'),(257,102,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(258,102,'_supervisors_email_id','field_5a0c1c4d1a2be'),(259,103,'_edit_lock','1511154155:3'),(260,103,'_edit_last','3'),(261,103,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(262,103,'_supervisors_email_id','field_5a0c1c4d1a2be'),(263,104,'_edit_lock','1511154929:3'),(264,4,'rule','a:5:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),(265,4,'rule','a:5:{s:5:\"param\";s:9:\"user_type\";s:8:\"operator\";s:2:\"!=\";s:5:\"value\";s:13:\"administrator\";s:8:\"order_no\";i:1;s:8:\"group_no\";i:0;}'),(266,105,'_edit_lock','1511154404:3'),(267,105,'_edit_last','3'),(268,105,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(269,105,'_supervisors_email_id','field_5a0c1c4d1a2be'),(270,50,'_wp_trash_meta_status','pending'),(271,50,'_wp_trash_meta_time','1511154631'),(272,50,'_wp_desired_post_slug',''),(273,48,'_wp_trash_meta_status','pending'),(274,48,'_wp_trash_meta_time','1511154648'),(275,48,'_wp_desired_post_slug',''),(276,106,'_edit_lock','1511181861:2'),(277,106,'_edit_last','3'),(278,106,'supervisors_email_id','sariga.raghunath@brahmaait.com'),(279,106,'_supervisors_email_id','field_5a0c1c4d1a2be'),(280,108,'_edit_lock','1511155492:3'),(281,109,'_edit_lock','1511182383:3');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2017-06-20 20:39:42','2017-06-20 20:39:42','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','publish','open','open','','hello-world','','','2017-06-20 20:39:42','2017-06-20 20:39:42','',0,'http://wpengine.com8/?p=1',0,'post','',1),(2,1,'2017-06-20 20:39:42','2017-06-20 20:39:42','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://wpengine.com8/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2017-06-20 20:39:42','2017-06-20 20:39:42','',0,'http://wpengine.com8/?page_id=2',0,'page','',0),(4,2,'2017-11-15 10:53:43','2017-11-15 10:53:43','','Post Review','','publish','closed','closed','','acf_post-review','','','2017-11-20 05:04:45','2017-11-20 05:04:45','',0,'http://pumexadmin.wpengine.com/?post_type=acf&#038;p=4',0,'acf','',0),(6,2,'2017-11-15 11:16:02','2017-11-15 11:16:02','','test post','','publish','open','open','','test-post','','','2017-11-15 11:16:02','2017-11-15 11:16:02','',0,'http://pumexadmin.wpengine.com/?p=6',0,'post','',0),(7,2,'2017-11-15 11:16:56','2017-11-15 11:16:56','','new post','','publish','open','open','','new-post','','','2017-11-15 11:16:56','2017-11-15 11:16:56','',0,'http://pumexadmin.wpengine.com/?p=7',0,'post','',0),(8,2,'2017-11-15 11:18:29','2017-11-15 11:18:29','','testpost1','','publish','open','open','','testpost1','','','2017-11-15 11:18:29','2017-11-15 11:18:29','',0,'http://pumexadmin.wpengine.com/?p=8',0,'post','',0),(9,2,'2017-11-15 11:33:20','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-15 11:33:20','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=9',0,'post','',0),(10,3,'2017-11-15 12:12:49','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-15 12:12:49','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=10',0,'post','',0),(11,3,'2017-11-15 12:13:13','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-15 12:13:13','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=11',0,'post','',0),(12,2,'2017-11-15 12:13:50','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-15 12:13:50','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=12',0,'post','',0),(13,3,'2017-11-15 12:15:14','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-15 12:15:14','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=13',0,'post','',0),(14,3,'2017-11-15 12:25:06','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-15 12:25:06','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=14',0,'post','',0),(15,2,'2017-11-15 12:37:34','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-15 12:37:34','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=15',0,'post','',0),(16,3,'2017-11-15 12:38:07','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-15 12:38:07','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=16',0,'post','',0),(17,2,'2017-11-16 09:40:31','2017-11-16 09:40:31','','testtpost','','publish','open','open','','testtpost','','','2017-11-16 09:40:31','2017-11-16 09:40:31','',0,'http://pumexadmin.wpengine.com/?p=17',0,'post','',0),(18,3,'2017-11-16 09:43:25','0000-00-00 00:00:00','','Post8','','pending','open','open','','','','','2017-11-16 09:43:25','2017-11-16 09:43:25','',0,'http://pumexadmin.wpengine.com/?p=18',0,'post','',0),(19,2,'2017-11-16 09:46:47','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 09:46:47','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=19',0,'post','',0),(20,3,'2017-11-16 09:48:43','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 09:48:43','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=20',0,'post','',0),(21,3,'2017-11-16 09:52:34','0000-00-00 00:00:00','','Mynewpost','','pending','open','open','','','','','2017-11-16 09:52:34','2017-11-16 09:52:34','',0,'http://pumexadmin.wpengine.com/?p=21',0,'post','',0),(22,3,'2017-11-16 09:54:07','0000-00-00 00:00:00','','my post','','pending','open','open','','','','','2017-11-16 09:54:07','2017-11-16 09:54:07','',0,'http://pumexadmin.wpengine.com/?p=22',0,'post','',0),(23,2,'2017-11-16 09:55:06','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 09:55:06','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=23',0,'post','',0),(24,2,'2017-11-16 09:58:20','2017-11-16 09:58:20','<h3>What is PHP?</h3>\r\nPHP (Hypertext Preprocessor) is a general purpose scripting language that quickly became the de facto server-side language of choice for <a href=\"https://www.upwork.com/hire/web-developers/\">web developers</a> after its initial release in 1995. Today, a majority of sites on the web run on PHP, due in large part to its popularity as the language of choice for content management systems (CMS) like WordPress, Drupal, and Joomla and a number of modern frameworks like Laravel, Symfony, and CakePHP that have accelerated development with this mature language.\r\n<h3>WHAT IS NODE.JS?</h3>\r\nJavaScript is a scripting language that typically runs in the browser and makes web pages dynamic and interactive, but ever since the release of <a href=\"https://www.upwork.com/hiring/development/what-is-node-js/\">Node.js</a> in 2009, it became possible to perform asynchronous coding with JavaScript on the back end. Node.js is a development and runtime environment with a <a href=\"https://www.upwork.com/hiring/development/15-node-js-frameworks-to-know/\">multitude of available frameworks</a> that run on top of it.\r\n<h3>PHP VS NODE.JS: MAJOR SIMILARITIES</h3>\r\nThere are some top-level similarities to consider when deciding which back-end technology is best for you.\r\n<ul>\r\n 	<li><strong>Interpreted languages.</strong> Both PHP and JavaScript, the language behind Node.js, are what you call interpreted languages, or “scripts”—the code can be run as-is in their respective runtime environments (browser for JavaScript; server for PHP). Both PHP and JavaScript are <strong>great for beginners and veterans alike</strong>.</li>\r\n</ul>','PHP vs. Node.js','','publish','open','open','','php-vs-node-js','','','2017-11-16 09:58:20','2017-11-16 09:58:20','',0,'http://pumexadmin.wpengine.com/?p=24',0,'post','',0),(25,3,'2017-11-16 10:00:01','0000-00-00 00:00:00','<h2><strong>SQL vs MySQL</strong></h2>\r\n<strong>SQL</strong> stands for <strong>S</strong>tructured <strong>Q</strong>uery <strong>L</strong>anguage. It’s a standard language for accessing and manipulating databases. MySQL is a database management system, like SQL Server, Oracle, Informix, Postgres, etc. MySQL is a RDMS (Relational Database Management System).\r\n\r\nWhen considering a utility for data management the two most popular choices are MySQL and SQL Server. Both are efficient at keeping your data organized and readily available through a user interface. Both technologies have the concept of schema (that is table storage) for data storage.\r\n\r\nSQL is a language.  Specifically, the “Structured Query Language” Now it would be better if we start differentiating the topic as <strong>difference between SQL server and MySQL </strong>and take them point by point.\r\n<h3><strong>SQL Server and MySQL Vendors:</strong></h3>\r\nThe MySQL development project has made its source code available under the terms of the GNU General Public License, as well as under a variety of proprietary agreements. MySQL was owned and sponsored by a single for-profit firm, the Swedish company MySQL AB, now owned by <strong>Oracle Corporation</strong>.\r\n\r\nSQL server is owned by Microsoft and is typically referred as <strong>Microsoft SQL Server</strong>. It has a long history of releases and it is updated often adding all latest trends and technologies to it thus making it one of the trusted data base applications today. At the 2011 PASS summit on October 11, Microsoft announced that the next major version of SQL Server, codenamed <a title=\"SQL Server 2012 Denali\" href=\"http://www.thewindowsclub.com/sql-server-2012-denali-features\" target=\"_blank\" rel=\"noopener\">Denali</a>, would be SQL Server 2012. The release date is set to the first half of 2012.','Difference between SQL and MySQL','','pending','open','open','','','','','2017-11-16 10:00:01','2017-11-16 10:00:01','',0,'http://pumexadmin.wpengine.com/?p=25',0,'post','',0),(26,2,'2017-11-16 10:11:30','2017-11-16 10:11:30','','mynewpost1','','publish','open','open','','mynewpost1','','','2017-11-16 10:11:30','2017-11-16 10:11:30','',0,'http://pumexadmin.wpengine.com/?p=26',0,'post','',0),(27,2,'2017-11-16 10:31:16','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 10:31:16','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=27',0,'post','',0),(28,2,'2017-11-16 10:32:12','2017-11-16 10:32:12','','post_test_post','','publish','open','open','','post_test_post','','','2017-11-16 10:32:12','2017-11-16 10:32:12','',0,'http://pumexadmin.wpengine.com/?p=28',0,'post','',0),(29,2,'2017-11-16 11:00:36','2017-11-16 11:00:36','','test post','','publish','open','open','','test-post-2','','','2017-11-16 11:00:36','2017-11-16 11:00:36','',0,'http://pumexadmin.wpengine.com/?p=29',0,'post','',0),(30,2,'2017-11-16 11:00:52','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 11:00:52','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=30',0,'post','',0),(31,3,'2017-11-16 11:01:20','0000-00-00 00:00:00','','test6post','','pending','open','open','','','','','2017-11-16 11:01:20','2017-11-16 11:01:20','',0,'http://pumexadmin.wpengine.com/?p=31',0,'post','',0),(32,3,'2017-11-16 11:03:20','0000-00-00 00:00:00','','newtestpost','','pending','open','open','','','','','2017-11-16 11:03:20','2017-11-16 11:03:20','',0,'http://pumexadmin.wpengine.com/?p=32',0,'post','',0),(33,3,'2017-11-16 11:04:18','0000-00-00 00:00:00','','my new post','','pending','open','open','','','','','2017-11-16 11:04:18','2017-11-16 11:04:18','',0,'http://pumexadmin.wpengine.com/?p=33',0,'post','',0),(34,3,'2017-11-16 11:06:33','0000-00-00 00:00:00','','newpost5','','pending','open','open','','','','','2017-11-16 11:06:33','2017-11-16 11:06:33','',0,'http://pumexadmin.wpengine.com/?p=34',0,'post','',0),(35,3,'2017-11-16 11:07:48','0000-00-00 00:00:00','','myposts','','pending','open','open','','','','','2017-11-16 11:07:48','2017-11-16 11:07:48','',0,'http://pumexadmin.wpengine.com/?p=35',0,'post','',0),(36,3,'2017-11-16 11:36:24','0000-00-00 00:00:00','','newtest','','pending','open','open','','','','','2017-11-16 11:36:24','2017-11-16 11:36:24','',0,'http://pumexadmin.wpengine.com/?p=36',0,'post','',0),(37,3,'2017-11-16 11:49:12','0000-00-00 00:00:00','','testpost6','','pending','open','open','','','','','2017-11-16 11:49:12','2017-11-16 11:49:12','',0,'http://pumexadmin.wpengine.com/?p=37',0,'post','',0),(38,3,'2017-11-16 11:51:10','0000-00-00 00:00:00','','post8','','pending','open','open','','','','','2017-11-16 11:51:10','2017-11-16 11:51:10','',0,'http://pumexadmin.wpengine.com/?p=38',0,'post','',0),(39,3,'2017-11-16 11:57:25','0000-00-00 00:00:00','','mytestpost5','','pending','open','open','','','','','2017-11-16 11:57:25','2017-11-16 11:57:25','',0,'http://pumexadmin.wpengine.com/?p=39',0,'post','',0),(40,3,'2017-11-16 12:01:41','0000-00-00 00:00:00','','postspost','','pending','open','open','','','','','2017-11-16 12:01:41','2017-11-16 12:01:41','',0,'http://pumexadmin.wpengine.com/?p=40',0,'post','',0),(41,3,'2017-11-16 12:03:50','0000-00-00 00:00:00','','firstpost','','pending','open','open','','','','','2017-11-16 12:03:50','2017-11-16 12:03:50','',0,'http://pumexadmin.wpengine.com/?p=41',0,'post','',0),(42,3,'2017-11-16 12:06:02','0000-00-00 00:00:00','','post post','','pending','open','open','','','','','2017-11-16 12:06:02','2017-11-16 12:06:02','',0,'http://pumexadmin.wpengine.com/?p=42',0,'post','',0),(43,2,'2017-11-16 12:12:09','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 12:12:09','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=43',0,'post','',0),(44,3,'2017-11-16 12:12:59','0000-00-00 00:00:00','This is my post','test post 9','','pending','open','open','','','','','2017-11-16 12:12:59','2017-11-16 12:12:59','',0,'http://pumexadmin.wpengine.com/?p=44',0,'post','',0),(45,3,'2017-11-16 12:20:11','0000-00-00 00:00:00','','mytestposts','','pending','open','open','','','','','2017-11-16 12:20:11','2017-11-16 12:20:11','',0,'http://pumexadmin.wpengine.com/?p=45',0,'post','',0),(46,3,'2017-11-16 12:31:56','0000-00-00 00:00:00','','myypost','','pending','open','open','','','','','2017-11-16 12:31:56','2017-11-16 12:31:56','',0,'http://pumexadmin.wpengine.com/?p=46',0,'post','',0),(47,3,'2017-11-16 12:34:02','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 12:34:02','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=47',0,'post','',0),(48,3,'2017-11-16 12:34:15','2017-11-16 12:34:15','','mypost7','','trash','open','open','','__trashed-4','','','2017-11-20 05:10:48','2017-11-20 05:10:48','',0,'http://pumexadmin.wpengine.com/?p=48',0,'post','',0),(50,3,'2017-11-16 12:36:12','2017-11-16 12:36:12','','mymypost','','trash','open','open','','__trashed-3','','','2017-11-20 05:10:31','2017-11-20 05:10:31','',0,'http://pumexadmin.wpengine.com/?p=50',0,'post','',0),(51,3,'2017-11-16 12:37:43','0000-00-00 00:00:00','','newpost5','','pending','open','open','','','','','2017-11-16 12:37:43','2017-11-16 12:37:43','',0,'http://pumexadmin.wpengine.com/?p=51',0,'post','',0),(52,2,'2017-11-16 12:39:07','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 12:39:07','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=52',0,'post','',0),(53,4,'2017-11-16 12:40:29','2017-11-16 12:40:29','','Auto Draft','','trash','open','open','','__trashed','','','2017-11-16 12:47:27','2017-11-16 12:47:27','',0,'http://pumexadmin.wpengine.com/?p=53',0,'post','',0),(54,4,'2017-11-16 12:40:38','2017-11-16 12:40:38','','Auto Draft','','trash','open','open','','__trashed-2','','','2017-11-16 12:47:27','2017-11-16 12:47:27','',0,'http://pumexadmin.wpengine.com/?p=54',0,'post','',0),(55,2,'2017-11-16 12:42:29','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 12:42:29','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=55',0,'post','',0),(56,4,'2017-11-16 12:43:39','2017-11-16 12:43:39','','newposts','','trash','open','open','','newposts__trashed','','','2017-11-16 12:47:27','2017-11-16 12:47:27','',0,'http://pumexadmin.wpengine.com/?p=56',0,'post','',0),(57,3,'2017-11-16 12:46:49','0000-00-00 00:00:00','To use Git Push integration with WP Engine, you need to add your SSH Public Key. After generating your SSH Public Key, the next step is to <a href=\"https://wpengine.com/support/set-git-push-user-portal/\">add it to the install of your choice in the User Portal</a> by navigating to the Git Push tab and submitting your developer name and public key in the form. If you need help generating an SSH public key – check out <a href=\"https://help.github.com/articles/generating-ssh-keys\">GitHub Help: Generating SSH Keys</a>\r\n\r\nOnce you have added your public SSH key in your User Portal, you’ll need to obtain a snapshot of your application to work with. You can download a backup of your production or staging site in the user portal. If you are already using Git for your application’s source control but just need the details to deploy your application, feel free to skip ahead to <a href=\"https://wpengine.com/git/#production\">Deploying to Production</a>.\r\n<h4>Not sure what GIT is? We’ve made a free <a href=\"https://wpengine.com/blog/git-white-paper/\">white paper</a> exactly for you!</h4>\r\n<h4>Don’t want to read? Here’s one of our <a href=\"https://wpengine.com/blog/icymi-git-in-motion-webinar-video/\" target=\"_blank\" rel=\"noopener\">webinars</a> all about GIT!</h4>','Set up Git Push in your User Portal','','pending','open','open','','','','','2017-11-16 12:46:49','2017-11-16 12:46:49','',0,'http://pumexadmin.wpengine.com/?p=57',0,'post','',0),(58,2,'2017-11-16 12:50:25','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-16 12:50:25','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=58',0,'post','',0),(59,3,'2017-11-16 13:18:38','0000-00-00 00:00:00','test','test','','pending','open','open','','','','','2017-11-16 13:18:38','2017-11-16 13:18:38','',0,'http://pumexadmin.wpengine.com/?p=59',0,'post','',0),(60,3,'2017-11-16 13:25:44','0000-00-00 00:00:00','The purpose of this article is to share our approach to continuous deployment for WordPress plugins and themes on our servers at WP Engine. Continuous deployment is the automated testing and delivery of code to development and production environments. Knowing your web host’s requirements is essential to setting up a continuous delivery process. Once you know this, then you can evaluate a service and later develop a solution that meets your needs. I have implemented this for more than a dozen WordPress themes and plugins, and I believe that effort was worth the time it is saving us now.','Continuous Deployment with Codeship and WP Engine','','pending','open','open','','','','','2017-11-16 13:25:44','2017-11-16 13:25:44','',0,'http://pumexadmin.wpengine.com/?p=60',0,'post','',0),(61,3,'2017-11-17 03:30:00','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-17 03:30:00','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=61',0,'post','',0),(62,2,'2017-11-17 03:43:47','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-17 03:43:47','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=62',0,'post','',0),(63,3,'2017-11-17 03:44:25','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-17 03:44:25','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=63',0,'post','',0),(64,3,'2017-11-17 03:50:42','0000-00-00 00:00:00','','post8','','pending','open','open','','','','','2017-11-17 03:50:42','2017-11-17 03:50:42','',0,'http://pumexadmin.wpengine.com/?p=64',0,'post','',0),(65,3,'2017-11-17 04:57:29','0000-00-00 00:00:00','','post','','pending','open','open','','','','','2017-11-17 04:57:29','2017-11-17 04:57:29','',0,'http://pumexadmin.wpengine.com/?p=65',0,'post','',0),(66,5,'2017-11-17 04:12:22','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-17 04:12:22','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=66',0,'post','',0),(67,5,'2017-11-17 04:12:50','0000-00-00 00:00:00','','my new post','','pending','open','open','','','','','2017-11-17 04:12:50','2017-11-17 04:12:50','',0,'http://pumexadmin.wpengine.com/?p=67',0,'post','',0),(68,3,'2017-11-17 05:10:27','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-17 05:10:27','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=68',0,'post','',0),(69,2,'2017-11-17 12:40:24','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-17 12:40:24','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=69',0,'post','',0),(70,2,'2017-11-17 12:50:24','2017-11-17 12:50:24','content','title','','publish','open','open','','title','','','2017-11-17 12:50:24','2017-11-17 12:50:24','',0,'http://pumexadmin.wpengine.com/?p=70',0,'post','',0),(71,3,'2017-11-17 12:58:49','2017-11-17 12:58:49','sariga post','Title sariga','','publish','open','open','','title-sariga','','','2017-11-17 12:58:49','2017-11-17 12:58:49','',0,'http://pumexadmin.wpengine.com/?p=71',0,'post','',0),(73,3,'2017-11-17 13:04:50','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-17 13:04:50','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=73',0,'post','',0),(74,3,'2017-11-17 13:05:02','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-17 13:05:02','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=74',0,'post','',0),(75,2,'2017-11-18 04:58:39','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 04:58:39','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=75',0,'post','',0),(76,3,'2017-11-18 04:59:16','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 04:59:16','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=76',0,'post','',0),(77,2,'2017-11-18 05:00:36','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 05:00:36','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=77',0,'post','',0),(78,3,'2017-11-18 05:00:58','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 05:00:58','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=78',0,'post','',0),(79,2,'2017-11-18 05:02:09','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 05:02:09','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=79',0,'post','',0),(80,2,'2017-11-18 05:13:54','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 05:13:54','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=80',0,'post','',0),(81,3,'2017-11-18 05:16:30','0000-00-00 00:00:00','','Git code integration','','pending','open','open','','','','','2017-11-18 05:16:30','2017-11-18 05:16:30','',0,'http://pumexadmin.wpengine.com/?p=81',0,'post','',0),(82,2,'2017-11-18 05:17:25','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 05:17:25','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=82',0,'post','',0),(83,3,'2017-11-18 05:17:40','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 05:17:40','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=83',0,'post','',0),(84,2,'2017-11-18 05:24:17','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 05:24:17','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=84',0,'post','',0),(85,3,'2017-11-18 05:27:16','2017-11-18 05:27:16','','Codeship','','publish','open','open','','codeship','','','2017-11-18 05:27:16','2017-11-18 05:27:16','',0,'http://pumexadmin.wpengine.com/?p=85',0,'post','',0),(86,3,'2017-11-18 05:32:42','0000-00-00 00:00:00','','Integration','','pending','open','open','','','','','2017-11-18 05:32:42','2017-11-18 05:32:42','',0,'http://pumexadmin.wpengine.com/?p=86',0,'post','',0),(87,3,'2017-11-18 06:00:56','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 06:00:56','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=87',0,'post','',0),(88,3,'2017-11-18 06:04:24','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 06:04:24','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=88',0,'post','',0),(89,3,'2017-11-18 06:18:32','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 06:18:32','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=89',0,'post','',0),(90,3,'2017-11-18 09:52:52','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 09:52:52','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=90',0,'post','',0),(91,2,'2017-11-18 10:08:26','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 10:08:26','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=91',0,'post','',0),(92,3,'2017-11-18 10:09:49','0000-00-00 00:00:00','','post8','','pending','open','open','','','','','2017-11-18 10:09:49','2017-11-18 10:09:49','',0,'http://pumexadmin.wpengine.com/?p=92',0,'post','',0),(93,3,'2017-11-18 10:13:50','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-18 10:13:50','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=93',0,'post','',0),(94,2,'2017-11-20 03:38:36','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-20 03:38:36','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=94',0,'post','',0),(95,3,'2017-11-20 03:39:04','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-20 03:39:04','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=95',0,'post','',0),(96,3,'2017-11-20 03:52:56','0000-00-00 00:00:00','','New post','','pending','open','open','','','','','2017-11-20 03:52:56','2017-11-20 03:52:56','',0,'http://pumexadmin.wpengine.com/?p=96',0,'post','',0),(97,3,'2017-11-20 03:55:37','0000-00-00 00:00:00','','post','','pending','open','open','','','','','2017-11-20 03:55:37','2017-11-20 03:55:37','',0,'http://pumexadmin.wpengine.com/?p=97',0,'post','',0),(98,3,'2017-11-20 03:57:47','0000-00-00 00:00:00','','Newpost','','pending','open','open','','','','','2017-11-20 03:57:47','2017-11-20 03:57:47','',0,'http://pumexadmin.wpengine.com/?p=98',0,'post','',0),(99,3,'2017-11-20 04:01:21','0000-00-00 00:00:00','','test','','pending','open','open','','','','','2017-11-20 04:01:21','2017-11-20 04:01:21','',0,'http://pumexadmin.wpengine.com/?p=99',0,'post','',0),(100,3,'2017-11-20 04:02:25','0000-00-00 00:00:00','','posttest','','pending','open','open','','','','','2017-11-20 04:02:25','2017-11-20 04:02:25','',0,'http://pumexadmin.wpengine.com/?p=100',0,'post','',0),(101,2,'2017-11-20 04:04:46','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-20 04:04:46','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=101',0,'post','',0),(102,3,'2017-11-20 04:05:19','0000-00-00 00:00:00','','newtestpost','','pending','open','open','','','','','2017-11-20 04:05:19','2017-11-20 04:05:20','',0,'http://pumexadmin.wpengine.com/?p=102',0,'post','',0),(103,3,'2017-11-20 04:10:32','0000-00-00 00:00:00','','post','','pending','open','open','','','','','2017-11-20 04:10:32','2017-11-20 04:10:32','',0,'http://pumexadmin.wpengine.com/?p=103',0,'post','',0),(104,3,'2017-11-20 05:01:25','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-20 05:01:25','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=104',0,'post','',0),(105,3,'2017-11-20 05:05:26','0000-00-00 00:00:00','','New Post','','pending','open','open','','','','','2017-11-20 05:05:26','2017-11-20 05:05:26','',0,'http://pumexadmin.wpengine.com/?p=105',0,'post','',0),(106,3,'2017-11-20 05:13:00','0000-00-00 00:00:00','','Test post','','pending','open','open','','','','','2017-11-20 05:13:00','2017-11-20 05:13:00','',0,'http://pumexadmin.wpengine.com/?p=106',0,'post','',0),(107,2,'2017-11-20 05:14:24','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-20 05:14:24','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=107',0,'post','',0),(108,3,'2017-11-20 05:15:29','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-20 05:15:29','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=108',0,'post','',0),(109,3,'2017-11-20 09:13:35','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2017-11-20 09:13:35','0000-00-00 00:00:00','',0,'http://pumexadmin.wpengine.com/?p=109',0,'post','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0),(6,1,0),(7,1,0),(8,1,0),(17,1,0),(18,1,0),(21,1,0),(22,1,0),(24,1,0),(25,1,0),(26,1,0),(28,1,0),(29,1,0),(31,1,0),(32,1,0),(33,1,0),(34,1,0),(35,1,0),(36,1,0),(37,1,0),(38,1,0),(39,1,0),(40,1,0),(41,1,0),(42,1,0),(44,1,0),(45,1,0),(46,1,0),(48,1,0),(50,1,0),(51,1,0),(53,1,0),(54,1,0),(56,1,0),(57,1,0),(59,1,0),(60,1,0),(64,1,0),(65,1,0),(67,1,0),(70,1,0),(71,1,0),(81,1,0),(85,1,0),(86,1,0),(92,1,0),(96,1,0),(97,1,0),(98,1,0),(99,1,0),(100,1,0),(102,1,0),(103,1,0),(105,1,0),(106,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,12);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','wpengine'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description','This is the \"wpengine\" admin user that our staff uses to gain access to your admin area to provide support and troubleshooting. It can only be accessed by a button in our secure log that auto generates a password and dumps that password after the staff member has logged in. We have taken extreme measures to ensure that our own user is not going to be misused to harm any of our clients sites.'),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'locale',''),(11,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(12,1,'wp_user_level','10'),(13,1,'dismissed_wp_pointers',''),(14,1,'show_welcome_panel','1'),(15,2,'nickname','pumexadmin'),(16,2,'first_name',''),(17,2,'last_name',''),(18,2,'description',''),(19,2,'rich_editing','true'),(20,2,'comment_shortcuts','false'),(21,2,'admin_color','fresh'),(22,2,'use_ssl','0'),(23,2,'show_admin_bar_front','true'),(24,2,'locale',''),(25,2,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(26,2,'wp_user_level','10'),(27,2,'default_password_nag',''),(29,2,'wp_dashboard_quick_press_last_post_id','69'),(30,2,'community-events-location','a:1:{s:2:\"ip\";s:13:\"117.239.237.0\";}'),(31,3,'nickname','sariga'),(32,3,'first_name','Sariga'),(33,3,'last_name','S'),(34,3,'description',''),(35,3,'rich_editing','true'),(36,3,'comment_shortcuts','false'),(37,3,'admin_color','fresh'),(38,3,'use_ssl','0'),(39,3,'show_admin_bar_front','true'),(40,3,'locale',''),(41,3,'wp_capabilities','a:1:{s:6:\"author\";b:1;}'),(42,3,'wp_user_level','2'),(43,3,'dismissed_wp_pointers',''),(45,3,'wp_dashboard_quick_press_last_post_id','10'),(46,3,'community-events-location','a:1:{s:2:\"ip\";s:13:\"117.239.237.0\";}'),(48,3,'session_tokens','a:2:{s:64:\"4e25cb7ae0a0d071f236ba4a9effc8382788b9d6dad6888d5bb911a2b288c23a\";a:4:{s:10:\"expiration\";i:1511157962;s:2:\"ip\";s:15:\"117.239.237.218\";s:2:\"ua\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.25 Safari/537.36\";s:5:\"login\";i:1510985162;}s:64:\"dd0f5250f4300fe365c20969326177147a31614ea974ba9f3e3cb953ea37b87a\";a:4:{s:10:\"expiration\";i:1511326791;s:2:\"ip\";s:15:\"117.239.237.218\";s:2:\"ua\";s:112:\"Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36\";s:5:\"login\";i:1511153991;}}'),(70,2,'session_tokens','a:1:{s:64:\"565504392db1230ff6101c44a5fe7f2dec22e20e3bfc935d1922b2047c6e3b0a\";a:4:{s:10:\"expiration\";i:1511523704;s:2:\"ip\";s:15:\"117.239.237.218\";s:2:\"ua\";s:112:\"Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36\";s:5:\"login\";i:1511350904;}}'),(71,5,'nickname','Sariga Raghunath'),(72,5,'first_name',''),(73,5,'last_name',''),(74,5,'description',''),(75,5,'rich_editing','true'),(76,5,'comment_shortcuts','false'),(77,5,'admin_color','fresh'),(78,5,'use_ssl','0'),(79,5,'show_admin_bar_front','true'),(80,5,'locale',''),(81,5,'wp_capabilities','a:1:{s:11:\"contributor\";b:1;}'),(82,5,'wp_user_level','1'),(83,5,'dismissed_wp_pointers',''),(85,5,'wp_dashboard_quick_press_last_post_id','66'),(86,5,'community-events-location','a:1:{s:2:\"ip\";s:13:\"117.239.237.0\";}'),(87,3,'closedpostboxes_post','a:0:{}'),(88,3,'metaboxhidden_post','a:6:{i:0;s:9:\"formatdiv\";i:1;s:11:\"postexcerpt\";i:2;s:13:\"trackbacksdiv\";i:3;s:10:\"postcustom\";i:4;s:16:\"commentstatusdiv\";i:5;s:7:\"slugdiv\";}'),(89,3,'meta-box-order_post','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:67:\"acf_4,submitdiv,formatdiv,categorydiv,tagsdiv-post_tag,postimagediv\";s:6:\"normal\";s:61:\"postexcerpt,trackbacksdiv,postcustom,commentstatusdiv,slugdiv\";s:8:\"advanced\";s:0:\"\";}'),(90,3,'screen_layout_post','2'),(91,3,'wp_user-settings','editor_expand=on'),(92,3,'wp_user-settings-time','1510998718');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'wpengine','$P$BPUwzSMVdhDFCT1q8nZk8CU/HIX.841','wpengine','bitbucket@wpengine.com','http://wpengine.com','2017-06-20 20:39:42','',0,'wpengine'),(2,'pumexadmin','$P$BBjrbZrjOlP2mFiuBk3jScchSpCD98.','pumexadmin','admin@pumexcomputing.com','http://pumexadmin.wpengine.com','2017-11-09 01:20:45','',0,'pumexadmin'),(3,'sariga','$P$Bb3oRcyfcLBMNRjj6VHczhpjdP8equ/','sariga','sariga.raghunath@brahmaait.com','','2017-11-15 12:10:00','1510747800:$P$BGRn41GTfWOMDbQAYhjf0NpdyvwmGv1',0,'Sariga S'),(5,'Sariga Raghunath','$P$BNBpGIFAoG4jHgPK86hpLdaNNM5oLj0','sariga-raghunath','sariga.brahmaait@gmail.com','','2017-11-17 04:11:15','1510891875:$P$BFhsbEd1PMDwWQusiBUc.qSAZBIq6g0',0,'Sariga Raghunath');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wp_pumexadmin'
--

--
-- Dumping routines for database 'wp_pumexadmin'
--
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
