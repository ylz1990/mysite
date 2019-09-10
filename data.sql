-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mysite_db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Tag',7,'add_tag'),(20,'Can change Tag',7,'change_tag'),(21,'Can delete Tag',7,'delete_tag'),(22,'Can add Tagged Item',8,'add_taggeditem'),(23,'Can change Tagged Item',8,'change_taggeditem'),(24,'Can delete Tagged Item',8,'delete_taggeditem'),(25,'Can add YLZ-博客',9,'add_blogs'),(26,'Can change YLZ-博客',9,'change_blogs'),(27,'Can delete YLZ-博客',9,'delete_blogs'),(28,'Can add blog type',10,'add_blogtype'),(29,'Can change blog type',10,'change_blogtype'),(30,'Can delete blog type',10,'delete_blogtype'),(31,'Can add comment',11,'add_comment'),(32,'Can change comment',11,'change_comment'),(33,'Can delete comment',11,'delete_comment'),(34,'Can add profile',12,'add_profile'),(35,'Can change profile',12,'change_profile'),(36,'Can delete profile',12,'delete_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$vxTbSVNakLby$EjQAkqjDS+CpMuJgWRHkg+3bm7t4hP54AKYRF7h+4RM=','2019-09-04 10:52:09.333800',0,'蜡笔小新','','','827937539@qq.com',0,1,'2019-09-04 10:52:09.006800'),(2,'pbkdf2_sha256$100000$0FjKLWXHSLEY$FW/Tr7HPE/Pxq/2lfSfpC/p3aLhO9vSxKS4LTWPNSV4=','2019-09-04 10:57:06.521800',1,'mysite','','','827937539@qq.com',1,1,'2019-09-04 10:56:25.450800');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'YLZ-Blog主题'),(2,'IT技术笔记'),(3,'财经主题'),(4,'五味生活'),(5,'资讯分享');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_content_type_id_fbfb9793_fk_django_co` (`content_type_id`),
  KEY `comment_comment_user_id_6078e57b_fk_auth_user_id` (`user_id`),
  KEY `comment_comment_parent_id_b612524c_fk_comment_comment_id` (`parent_id`),
  KEY `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` (`reply_to_id`),
  KEY `comment_comment_root_id_28721811_fk_comment_comment_id` (`root_id`),
  CONSTRAINT `comment_comment_content_type_id_fbfb9793_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comment_comment_parent_id_b612524c_fk_comment_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` FOREIGN KEY (`reply_to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `comment_comment_root_id_28721811_fk_comment_comment_id` FOREIGN KEY (`root_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (1,6,'<p>学习了&nbsp;&nbsp;</p>','2019-09-04 12:24:01.413800',9,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-09-04 11:01:46.649800','1','YLZ-Blog主题',1,'[{\"added\": {}}]',10,2),(2,'2019-09-04 11:02:04.025800','2','IT技术笔记',1,'[{\"added\": {}}]',10,2),(3,'2019-09-04 11:02:14.127800','3','财经主题',1,'[{\"added\": {}}]',10,2),(4,'2019-09-04 11:02:29.224800','4','五味生活',1,'[{\"added\": {}}]',10,2),(5,'2019-09-04 11:02:39.011800','5','资讯分享',1,'[{\"added\": {}}]',10,2),(6,'2019-09-04 11:05:40.226800','1','<Blog: 晨读丨坦诚，最高的情商>',1,'[{\"added\": {}}]',9,2),(7,'2019-09-04 11:11:03.906800','2','<Blog: 再爆冷门!美又一数据跌破荣枯线 黄金避险吸引力飙升>',1,'[{\"added\": {}}]',9,2),(8,'2019-09-04 11:13:00.099800','3','<Blog: 晨读丨你的每一次靠谱都是给自己存入本金>',1,'[{\"added\": {}}]',9,2),(9,'2019-09-04 11:17:00.191800','4','<Blog: 脱欧局势动荡避险飙升 黄金“借机”重拾涨势>',1,'[{\"added\": {}}]',9,2),(10,'2019-09-04 11:21:23.188800','5','<Blog: python-django：我的网站搭建 模型设计>',1,'[{\"added\": {}}]',9,2),(11,'2019-09-04 11:22:32.830800','6','<Blog: python-django：我的网站搭建 数据库选型>',1,'[{\"added\": {}}]',9,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'blog','blogs'),(10,'blog','blogtype'),(11,'comment','comment'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'taggit','tag'),(8,'taggit','taggeditem'),(12,'user','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-09-04 10:49:27.320800'),(2,'auth','0001_initial','2019-09-04 10:49:28.324800'),(3,'admin','0001_initial','2019-09-04 10:49:28.601800'),(4,'admin','0002_logentry_remove_auto_add','2019-09-04 10:49:28.614800'),(5,'contenttypes','0002_remove_content_type_name','2019-09-04 10:49:28.790800'),(6,'auth','0002_alter_permission_name_max_length','2019-09-04 10:49:28.894800'),(7,'auth','0003_alter_user_email_max_length','2019-09-04 10:49:28.926800'),(8,'auth','0004_alter_user_username_opts','2019-09-04 10:49:28.941800'),(9,'auth','0005_alter_user_last_login_null','2019-09-04 10:49:29.032800'),(10,'auth','0006_require_contenttypes_0002','2019-09-04 10:49:29.039800'),(11,'auth','0007_alter_validators_add_error_messages','2019-09-04 10:49:29.052800'),(12,'auth','0008_alter_user_username_max_length','2019-09-04 10:49:29.280800'),(13,'auth','0009_alter_user_last_name_max_length','2019-09-04 10:49:29.372800'),(14,'taggit','0001_initial','2019-09-04 10:49:29.645800'),(15,'taggit','0002_auto_20150616_2121','2019-09-04 10:49:29.683800'),(16,'taggit','0003_taggeditem_add_unique_index','2019-09-04 10:49:29.709800'),(17,'blog','0001_initial','2019-09-04 10:49:29.976800'),(18,'blog','0002_blogs_tags','2019-09-04 10:49:29.991800'),(19,'blog','0003_blogs_text','2019-09-04 10:49:30.029800'),(20,'blog','0004_remove_blogs_comment_num','2019-09-04 10:49:30.110800'),(21,'comment','0001_initial','2019-09-04 10:49:30.315800'),(22,'comment','0002_auto_20190820_1244','2019-09-04 10:49:31.978800'),(23,'sessions','0001_initial','2019-09-04 10:49:32.263800'),(24,'user','0001_initial','2019-09-04 10:49:32.807800');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bo5tlxbrpjjkt8y3qpgvaeogli32q8m7','YWEzZjcwZWExNDRkMTg3MTZkYzNjNjhhN2IzMDhmZGYzZDlmZGJhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTJiNDE0MWRkZjRjMzQ5ZGRmZmY2Yzk2NjllMzBkZDQ4ZGVjODc0In0=','2019-09-18 10:57:06.527800');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'坦诚',''),(3,'态度','_1'),(5,'情商','_2'),(7,'现货黄金','_3'),(9,'制造业','_4'),(11,'黄金','_5'),(13,'生活','_6'),(15,'靠谱','_7'),(17,'晨读','_8'),(19,'思维','_9'),(21,'人生','_10'),(23,'美元','_11'),(25,'脱欧','_12'),(27,'美联储','_13'),(29,'货币','_14'),(30,'django','django'),(32,'模型','_15'),(33,'python','python'),(35,'数据库','_16');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,1,9,1),(2,1,9,3),(3,1,9,5),(6,2,9,7),(4,2,9,9),(5,2,9,11),(7,3,9,13),(8,3,9,15),(9,3,9,17),(10,3,9,19),(11,3,9,21),(15,4,9,23),(12,4,9,25),(13,4,9,27),(14,4,9,29),(18,5,9,30),(16,5,9,32),(17,5,9,33),(21,6,9,30),(19,6,9,33),(20,6,9,35);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mysite`
--

DROP TABLE IF EXISTS `tb_mysite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_mysite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_num` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `img_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `blog_type_id` int(11) NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_mysite_author_id_02f23b10_fk_auth_user_id` (`author_id`),
  KEY `tb_mysite_blog_type_id_f5d3fe5a_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `tb_mysite_author_id_02f23b10_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `tb_mysite_blog_type_id_f5d3fe5a_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mysite`
--

LOCK TABLES `tb_mysite` WRITE;
/*!40000 ALTER TABLE `tb_mysite` DISABLE KEYS */;
INSERT INTO `tb_mysite` VALUES (1,'晨读丨坦诚，最高的情商',23,'<p><!--StartFragment --></p>\r\n\r\n<p>坦诚，是一种态度。<br />\r\n<br />\r\n我曾经参加一个比赛，是小组合作的形式。大家都是第一次合作，前期少不了磨合。<br />\r\n<br />\r\n第一次开完会后，闲聊之间，有个组员说，&ldquo;我有时候想问题容易钻牛角尖，也没有大家聪明，偶尔思维跟不上大家。希望大家多多包涵，我会努力跟上大家的步伐。&rdquo;<br />\r\n<br />\r\n在合作的过程中，大家发现，他确实爱钻牛角尖，很容易抓着一个小问题不放。偶尔也会跟不上大家的想法，思路容易跑偏。<br />\r\n<br />\r\n但谁都没有责怪他，因为他一开始就说明了自己的问题，态度好，够坦诚。他能够意识到自己的问题，并且说出来，这种真诚的态度，让我们愿意去包容他的那些小问题。<br />\r\n<br />\r\n坦诚，是人际交往的第一原则，是良好关系的前提。以诚相待，你才会获得别人的理解与尊重。<br />\r\n<br />\r\n2<br />\r\n<br />\r\n坦诚，是一种修养。<br />\r\n<br />\r\n2010年3月，福布斯全球富豪排行榜发布，卡洛斯&bull;斯利姆&bull;赫鲁以535亿美元的身价，荣登榜首，打败了连续13次在榜的比尔盖茨。<br />\r\n<br />\r\n消息一出，记者蜂拥而至。<br />\r\n<br />\r\n接受采访时，赫鲁先生没有回答对于摘得全球首富桂冠的感想，而是说了这样一席话：<br />\r\n<br />\r\n&ldquo;感谢各位的光临，但我真没什么好说的。让大家来，只是想借此机会告诉大家，真正的首富并不是我，而是比尔&middot;盖茨先生！因为，在过去的5年里，比尔&middot;盖茨先生向社会捐了240亿美元的个人财产。要不然，他的财富会远超于我。&rdquo;<br />\r\n<br />\r\n最后，赫鲁说，自己这次被评为首富，说明为大家做的还不够多，对此感到遗憾。<br />\r\n<br />\r\n赫鲁的坦诚让所有人鼓掌叫好，在得到世界首富的头衔后，还能理性思考，反思自己的不足，更加值得尊敬。<br />\r\n<br />\r\n坦诚，是需要勇气的。它需要你直面自己的缺点与不足，去承认自己的不完美。而愿意将自己的缺点暴露于他人面前，更是一种魄力。<br />\r\n<br />\r\n为什么坦诚的人更容易取得他人信任？<br />\r\n<br />\r\n因为他会让人觉得真实、安心。当一个人将自己的缺点暴露在你面前时，你从心理上，会得到一种掌控感。这种掌控感，能让你获得安全感，从而更愿意与他交往。<br />\r\n<br />\r\n如果一个人在你面前，展现的都是完美的一面，那么你永远都会觉得与这个人有距离。你很难去信任他，与其亲近。<br />\r\n<br />\r\n对自己坦诚，是一种能力。对他人坦诚，是一种修养。<br />\r\n<br />\r\n3<br />\r\n<br />\r\n坦诚，是一种智慧。<br />\r\n<br />\r\n有人提问：情商高和虚伪的区别是什么？<br />\r\n<br />\r\n有人回答：真正的情商高是充满智慧的真诚，因为他们知道天底下没有真正的傻子。虚伪是利益导向，并且一厢情愿地认为别人傻。其实，谁都看得出来他虚伪。<br />\r\n<br />\r\n刚开始工作时，有位同事颇有能力，性格也活泼开朗，但人际关系极差。当时我很不解，为什么这么好的人，大家都不喜欢他呢？后来，我俩共同负责一个项目，我才知道了问题根源所在。<br />\r\n<br />\r\n有一个项目是我俩共同负责的，当时作汇报，我手头上在忙其他事，没多想，就让他一个人去了。没想到，他跟上司说，大部分事情都是他在做，整个项目几乎是他一个人跑下来的。<br />\r\n<br />\r\n当时我就震惊了，明明我们俩是一块儿做事，我做的一点都不比他少，还能这样睁眼说瞎话？合作的时候，他甚至对我称兄道弟，每次遇到什么问题，我俩都一起加班，共同讨论。谁曾想一起熬夜加班互相鼓励的合作伙伴，背后却是这样？<br />\r\n<br />\r\n他在办公室表面对人和善，实则将所有人都看作竞争对手，死死防守。看似坦诚，实则虚伪至极。<br />\r\n<br />\r\n富兰林克说，坦诚是最明智的策略。与人交往，无需太多弯弯绕绕。你要相信，坦诚就是沟通的最好语言，它有着化繁为简的力量。直击核心，快速获得他人信任，这才是最大的智慧。<br />\r\n<br />\r\n坦诚，其实就是一张做人的名片。成本不高，但需要你用心去做。<br />\r\n<br />\r\n坦诚待人，真诚做事，愿你拥有和谐的人际关系，在大千世界，开心畅行。</p>','2019-09-04 11:05:40.185800','blog/关于K金_你想知道的都在这里..jpeg',2,1,'坦诚，是一种态度。\r\n\r\n我曾经参加一个比赛，是小组合作的形式。大家都是第一次合作，前期少不了磨合。第一次开完会后，闲聊之间，有个组员说，“我有时候想问题容易钻牛角尖，也没有大家聪明，偶尔思维跟不上大家。希望大家多多包涵，我会努力跟上大家的步伐。”'),(2,'再爆冷门!美又一数据跌破荣枯线 黄金避险吸引力飙升',6,'<p>路透的报道指出，此前美国疲弱的制造业数据加剧人们对经济下滑的担忧，美国制造业8月的采购经理人指数(PMI)再爆冷门下降至49.1%，不仅创下2016年1月以来最低水平，且是2016年8月以来首次跌破荣枯线。进一步提升黄金的避险吸引力。</p>\r\n\r\n<p>隔夜现货黄金持续走高，涨幅扩大至1.3%，最高报1549.60美元/盎司，较日低攀升逾28美元。截至目前，现货黄金报价1542.97美元/盎司。</p>\r\n\r\n<p><img alt=\"\" src=\"/media/upload/2019/09/04/5d1d9f5145489.jpeg\" style=\"height:340px; width:550px\" /></p>\r\n\r\n<h3>美经济衰退信号频现</h3>\r\n\r\n<p>据最新统计，美国制造业8月的采购经理人指数(PMI)下降至49.1%，这一数据不仅是三年来的最低，而且跌破50%，意味着已出现了萎缩的信号。</p>\r\n\r\n<p>负责进行这项调查统计的美国供应管理学会制造业普查委员会主席蒂莫西&middot;菲奥在其声明中表示：&ldquo;受访者对美中贸易摩擦表现出更多的担忧。由于出口的大量减少，贸易依旧最为严重的问题。&rdquo;</p>\r\n\r\n<p>据统计，美国8月的出口订货连续第二个月出现2009年以来的最低。根据该学会的调查，不仅美国制造业结束了35个月以来的扩张出现了萎缩，8月的产量数据和就业数据都表现出萎缩的迹象。</p>\r\n\r\n<p>美国嘉信理财公司首席投资策略师利斯&middot;松德斯表示，因为制造业走势变化领先于消费等领域，因此她预计，美国制造业前景很可能会继续恶化，且疲软势头很可能会蔓延到美国服务业。</p>\r\n\r\n<p>IHS马基特公司当天发布的数据还显示，8月份美国服务业PMI从7月的53大幅降至50.9，创3个月来低位。基石宏观首席投资策略师迈克尔&middot;坎特罗威茨警告说：&ldquo;当服务业PMI跌破50时，衰退就到来了。</p>\r\n\r\n<h3>今年美国经济增长放缓或成定局?</h3>\r\n\r\n<p>美国商务部日前公布的修正数据显示，今年第二季度美国实际国内生产总值(GDP)按年率计算增长2%，较此前公布的首次预估数据下调0.1个百分点。</p>\r\n\r\n<p>分析人士认为，由于贸易政策及其不确定性对美国经济造成冲击，加上减税政策的刺激效果已基本消失殆尽，今年美国经济增长放缓或成定局，预计全年增长率约在2.5%，低于政府设定的3%增长目标。</p>\r\n\r\n<p>前美国财政部顾问拉特纳指出，目前外界对于美国经济或陷入衰退的担忧日益加剧。虽然美国政府将经济放缓主要归咎于美联储加息举措，但事实上美联储加息幅度不大且利率仍处于历史极低水平。</p>\r\n\r\n<p>BubbaTrading.com首席市场策略师Todd Horwitz撰文称，随着金价和银价在一个区间内盘整，今天美市上午盘中两者似乎都试图突破，这将使它们创下更多新高。他们所处的模式是：大幅反弹，回落盘整至支撑位，然后突破至新高。</p>\r\n\r\n<p>Horwitz指出，这与市场的各个阶段相联系，即整合突破和爆发，而这正是我们在黄金和白银中不断看到的。趋势偏于上行，下一轮走势将推动金价升至1600美元。</p>\r\n\r\n<p>Horwitz表示，黄金和白银的支撑位已经站稳，黄金的稳固支撑位于1525美元，这些水平应该被用作买入。目前看来还没有抛售的迹象，不过我们预计金价将继续上涨，因此会出现回调。</p>','2019-09-04 11:11:03.874800','blog/5d11be229ac06_248x2he.jpeg',2,3,'路透的报道指出，此前美国疲弱的制造业数据加剧人们对经济下滑的担忧，美国制造业8月的采购经理人指数(PMI)再爆冷门下降至49.1%，不仅创下2016年1月以来最低水平，且是2016年8月以来首次跌破荣枯线。进一步提升黄金的避险吸引力。'),(3,'晨读丨你的每一次靠谱都是给自己存入本金',2,'<p>前几天，和朋友小聚，反思人生，说起后悔没早点知道的道理。</p>\r\n\r\n<p>一个老同学讲起自己毕业十年的血泪史。</p>\r\n\r\n<p>刚毕业的时候，他凭借着国内一流大学的光环，早早地就通过某国有银行的录取，当上了客户经理。</p>\r\n\r\n<p>一表人才，口齿伶俐，思维敏捷，上手能力极快。</p>\r\n\r\n<p>按照这个剧情顺利发展下去，本应有大好前途，可他在职场却屡屡受挫，两年换了三份工作，总有各种干不下去的理由。当时的他，并没有想到，这所有的挫折，都是自己给自己挖的坑。</p>\r\n\r\n<p>回想起来，当年每逢领导指派任务给他，他大都是这头积极响应，那头敷衍了事。</p>\r\n\r\n<p>不仅如此，还常常临时撂挑子，让其他伙伴万分无奈。</p>\r\n\r\n<p>这让我想起曾在知乎上看到的一个问题：那些相见恨晚的道理，你想告诉年轻时的自己。</p>\r\n\r\n<p>我最喜欢的答案是这样三句话：尽心尽力、说到做到、有始有终。</p>\r\n\r\n<p>&ldquo;尽心尽力&rdquo;这四个字，很不起眼，可是能做到的，却凤毛麟角。</p>\r\n\r\n<p>我想起了以前公司招过的一个刚毕业的大学生，做设计助理。</p>\r\n\r\n<p>刚上班半年，她就成了办公室的&ldquo;香饽饽&rdquo;，所有人都抢着用她，老板经常指派她参加公司最重要的项目。这在我们公司是以往没有的先例。</p>\r\n\r\n<p>很多人好奇她怎么这么厉害，其实了解的人都知道，这都是她应得的。</p>\r\n\r\n<p>她从不轻易答应别人，但一旦愿意帮你的忙，效果绝对惊艳。</p>\r\n\r\n<p>我第一次和她合作，是让她帮忙出一个线下活动的电子海报，第二天交，时间非常紧迫。</p>\r\n\r\n<p>可她第二天不仅准时交了海报，还给了我三个版本，针对不同人群场景和风格喜好，说其实我们的活动不应该只有一个版本。</p>\r\n\r\n<p>我问她，是不是一夜没睡。</p>\r\n\r\n<p>她害羞地点点头说，做不好，睡不着。</p>\r\n\r\n<p>后来我们慢慢熟悉，我才知道她工作时间外付出的努力远不止这些。</p>\r\n\r\n<p>为了形成自己的资料库，她几乎在所有文献、文库、素材、模板网站自费开通了会员，还加入了跟工作相关的各种圈子，力求能更快得到一手行业消息。</p>\r\n\r\n<p>每件事情只要经过她手，都能让你收获满满的惊喜。</p>\r\n\r\n<p>从她身上，能明白一个道理：你有多尽心，就有多值钱。</p>\r\n\r\n<p>在职场上，态度比能力重要。勤能补拙，能力的欠缺可以依靠勤奋来弥补，但态度上的短板，能力再强也无法弥补。</p>\r\n\r\n<p>很多人觉得员工的尽心尽力，全看老板给多少钱。但其实，聪明人都懂，尽心尽力不是为老板工作，而是对自己负责。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>二</p>\r\n\r\n<p>这些年，每次和同事聊天，大家都会说起职场新人的不靠谱，flag常常立，常常倒。</p>\r\n\r\n<p>至于为什么没能说到做到，理由多种多样。身体不好、家里有事&hellip;&hellip;总有别人无法反驳的理由。可当结果不美好的时候，无论你的理由多么合情合理，听起来都像是借口。</p>\r\n\r\n<p>闺蜜曾经在一家互联网公司做销售，部门总监看起来就是一个小姑娘，实际年龄比闺蜜还小。</p>\r\n\r\n<p>刚入职的时候，闺蜜还有点看轻这位领导。</p>\r\n\r\n<p>很快，闺蜜就知道她为什么能在短短两年时间内成为公司最年轻的中层领导。</p>\r\n\r\n<p>有一次，总监请了几天年假，恰逢年度大客户续签，客户每天提出各种无理的要求，方案一改再改，总监没日没夜地回复信息、开电话会，完全不像在休假。</p>\r\n\r\n<p>后来，大家才知道，总监休假是因为家人重病住院，每天都在陪护。</p>\r\n\r\n<p>她没说过自己的苦，但谁都能想象，她连夜在病房外敲方案的模样。</p>\r\n\r\n<p>就是这么个身材娇小的姑娘，带着自己的团队成了公司唯一提前完成全年KPI的人。</p>\r\n\r\n<p>闺蜜问总监，为什么这么拼。</p>\r\n\r\n<p>总监说了一句话，让很多人汗颜：自己答应的KPI，自己不扛，谁来扛？</p>\r\n\r\n<p>成年人总有很多无奈，也有很多理由无法兑现自己的承诺，可现实的残酷是，大家只关心结果，没人能理解过程有多苦。</p>\r\n\r\n<p>至于为什么，道理其实很简单。</p>\r\n\r\n<p>每个人在职场都有一个银行账户，每一次靠谱都是存入本金，积累个人信用财富。没有这笔积蓄，你在职场寸步难行。</p>\r\n\r\n<p>三</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>曾经听过一句话，考验一个人，看他和前任老板的关系。</p>\r\n\r\n<p>这一点我深有体会。</p>\r\n\r\n<p>我们公司有位秘书，每天都是最早一个到办公室，帮大家把文件整整齐齐地收拾好，做事勤快，加班也从来没有半句怨言。</p>\r\n\r\n<p>直到她辞职的前一天，还在熬夜。</p>\r\n\r\n<p>当时，老板留了她很久，可她为了个人发展，还是决定去一家大公司。</p>\r\n\r\n<p>走之前，她把自己分门别类整理好的资料和经验，整齐地打包给接手的人，接下来的好几个礼拜，手忙脚乱的新人一直在&ldquo;骚扰&rdquo;她，她都耐心地一点点教。</p>\r\n\r\n<p>这样的人，走到哪里都不会过得太差。</p>\r\n\r\n<p>人们都说辞职最见人品，因为开始不难，难的是如何结尾。</p>\r\n\r\n<p>在职场，见过太多无疾而终的努力。开始的时候说尽漂亮话，不知不觉就石沉大海。</p>\r\n\r\n<p>长此以往，如果你在大家的印象里被贴上&ldquo;有始无终&rdquo;的标签，将不会再有人把不紧急却极为重要的任务交给你。</p>\r\n\r\n<p>因为，缺乏放心感的员工，难以被委以重任。</p>\r\n\r\n<p>现在不少人似乎更需要速成的方法论，总想求得技巧来应对生活和工作中的所有难题。</p>\r\n\r\n<p>殊不知，一个人的终极成长，即是悟透所学，并知道如何用它来指导自己过好一生。</p>\r\n\r\n<p>有人问我，为什么毕业五年后，跟同龄人的差距越来越大？</p>\r\n\r\n<p>那是因为有些人，知道成功没有捷径，于是一早就去努力去践行那些从小就懂的最朴素的道理。<br />\r\n&nbsp;</p>','2019-09-04 11:13:00.047800','blog/3D硬金价格为什么比普通黄金贵._6cVKh9W.jpg',2,1,'前几天，和朋友小聚，反思人生，说起后悔没早点知道的道理。\r\n\r\n一个老同学讲起自己毕业十年的血泪史。\r\n\r\n刚毕业的时候，他凭借着国内一流大学的光环，早早地就通过某国有银行的录取，当上了客户经理。'),(4,'脱欧局势动荡避险飙升 黄金“借机”重拾涨势',6,'<p>受到欧系货币集体疲软的影响，美元被动向上，并再度刷新两年来的新高。由于美指的不断强势，导致市场出现了&ldquo;恐高&rdquo;，投资者纷纷把目光投向本周的非农数据，希望从中可以找寻到美联储接下来的货币政策。而英国硬脱欧的风险仍在不断加大，常态弱势已成习惯，后市破底的概率增加。</p>\r\n\r\n<p><img alt=\"图片1.png\" src=\"http://res0.dyhjw.com/ueditor/php/upload/image/20190903/1567504310691739.png\" title=\"1567504310691739.png\" /></p>\r\n\r\n<p>碰到许许多多还在亏损中迷茫的投资者，没有一成不变的行情，也没有一成不变的投资者，需要不断学习和调整从而融入到行情当中。多年的从业经历，有情怀的指导团队将陪伴你的投资之路，获取投资干货。市场是无止境的，行情是不断演变的，交易是永不停止的，虽然我们不能把每一波行情都做到，但我们可以抓住瞬息万变的机会，用客观冷静的态度对待市场，分析市场，等待市场，为每一次交易做充分的准备，工欲善其事，必先利其器，不是交易胜似交易。</p>\r\n\r\n<p>&mdash;&mdash;黄金消息面&mdash;&mdash;</p>\r\n\r\n<p>美联储将于北京时间周四凌晨公布12个地区的月度国内经济&quot;褐皮书&quot;，将为投资者提供一个更清晰的经济增长图景。此前，因为避险问题上的紧张关系不断加剧，美国经历了动荡的8月份。如若经济数据疲软，或将表明，全球最大经济体美国已收到一系列表明全球前景正在走弱的证据。上个月，褐皮书显示经济温和增长，缓解了人们对企业削减支出的担忧。但最近的迹象不那么乐观。</p>\r\n\r\n<p><img alt=\"图片2.png\" src=\"http://res0.dyhjw.com/ueditor/php/upload/image/20190903/1567504320108761.png\" title=\"1567504320108761.png\" /></p>\r\n\r\n<p>上周公布的8月初步数据显示，制造业采购经理人指数跌破50点的中性水平，至49.9，为2009年9月以来首次萎缩，低于经济学家的预期。美国和亚洲之间的长期对峙也给经济增长蒙上了阴影。本月早些时候，美国总统特.朗.普的关税政策让避险争端显著升温。段戊认为，预计经济不会很快陷入衰退，但也有可能经济形势恶化得更快。因为避险方面存在的不确定因素太多。</p>\r\n\r\n<p>&mdash;&mdash;黄金走势分析&mdash;&mdash;</p>\r\n\r\n<p>受美国劳动节休市影响，隔日<a href=\"http://www.dyhjw.com/huangjinjiage/\" target=\"_blank\">国际黄金</a>整体波幅不大，日线上却收得小阳形态，结束了三连阴排列，不过布林带开口收窄，短期均线有拐头向下之势，其他各周期均线呈回调之势，短周期指标同样保持回调，与之K线发展配合到位，日线方面来看还是空方占优。4小时线上来看，布林带开口向下，金价运行在短期均线下方，其他各周期均线呈空方排列，短周期指标保持下行，不过势能方面表现不足， 4小时上或将还会有所调整。整体操作看跌做空是必然!震荡需耐心!想跟上操作的朋友可以威信duanwu6358联系，但值得注意的是，上周跌破1520支撑之后，若要发起新一轮阶段性下跌之前，那么1520关口附近必将反复测试，以此巩固新的下跌平台!回顾历史走势，均如此!所以国际黄金短线高抛低吸，轻仓操作，但是大势还是看跌为主!可以确定的是，跌是波段回调!后市1500也将会必到!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"图片3.png\" src=\"http://res0.dyhjw.com/ueditor/php/upload/image/20190903/1567504353524735.png\" title=\"1567504353524735.png\" /></p>\r\n\r\n<p>以盈利为目的，在资本市场中，没有慈善家，只有赢家和输家。无论你在其他方面如何成功，到了市场里，赢输就是唯一标准。在市场中生存，要向溪水一样，不急不躁，狭隙生存，寻求最简单，最单纯的状态。</p>\r\n\r\n<p>任何市场没有永远的牛市，也没有永远的熊市，懂得熊市暂避锋芒比懂得牛市大举杀入更为重要，懂得规避风险并控制风险说明你已经逐步走上了正确的投资道路，一个只看见机遇而忘记风险的投资者是在靠运气进行交易，而不是靠真正的投资理念。真正的投资是一个长期的过程，在这个过程中胜利和失败总是同时存在，相伴而生。心态与技术一样重要，错误的心态只会干扰操作的思路，良好的心态是成功所必备的条件。</p>','2019-09-04 11:17:00.143800','blog/5d12d33dc1816.jpeg',2,3,'受到欧系货币集体疲软的影响，美元被动向上，并再度刷新两年来的新高。由于美指的不断强势，导致市场出现了“恐高”，投资者纷纷把目光投向本周的非农数据，希望从中可以找寻到美联储接下来的货币政策。'),(5,'python-django：我的网站搭建 模型设计',2,'<p>&nbsp; 网站已经成功部署好多天了，今天突然发现以前在开发过程中遇到的问题没有被好好的记录下来，或者说是没有被保存。这样肯定是不可取的，这会让我陷入问题的轮回中，重复思考着如何解决一个问题，那就太花费时间和精力了。所以，现在就尽可能地恢复一些记忆和还原当时做网站的经历，日后肯定会感谢今天的自己。</p>\r\n\r\n<p>&nbsp; &nbsp; 首先一些基础知识如创建虚拟环境，创建项目已经在之前写过的Django入门里面详细介绍了，具体可以参照<a href=\"https://www.jzfblog.com/detail/17\" rel=\"nofollow\">Django入门: (第一天) 开发环境</a>，这里就直接进入主题-模型设计</p>\r\n\r\n<p>&nbsp; &nbsp; 模型设计也就是对需求的满足，想要实现什么功能，模型就得怎么设计，因为我制作的是个人网站，所以我的设计应该是包含：</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>文章的标题</p>\r\n	</li>\r\n	<li>\r\n	<p>文章的正文</p>\r\n	</li>\r\n	<li>\r\n	<p>文章的发表时间</p>\r\n	</li>\r\n	<li>\r\n	<p>文章的修改时间</p>\r\n	</li>\r\n	<li>\r\n	<p>文章的摘要</p>\r\n	</li>\r\n	<li>\r\n	<p>文章的分类</p>\r\n	</li>\r\n	<li>\r\n	<p>文章的作者&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp; &nbsp; 为减少查询数据集的负担，需要将文章的分类和文章的作者作为外键引用，其代码如下:</p>\r\n\r\n<pre>\r\n<code>class&nbsp;Category(models.Model):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Django&nbsp;要求模型必须继承&nbsp;models.Model&nbsp;类。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category&nbsp;只需要一个简单的分类名&nbsp;name&nbsp;就可以了。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CharField&nbsp;指定了分类名&nbsp;name&nbsp;的数据类型，CharField&nbsp;是字符型，\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CharField&nbsp;的&nbsp;max_length&nbsp;参数指定其最大长度，超过这个长度的分类名就不能被存入数据库。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;name&nbsp;=&nbsp;models.CharField(u&#39;分类&#39;,&nbsp;max_length=20)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;class&nbsp;Meta:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name&nbsp;=&nbsp;&#39;分类&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name_plural&nbsp;=&nbsp;&#39;分类&#39;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;__str__(self):\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;self.name</code></pre>\r\n\r\n<p>&nbsp; &nbsp; 而Django自身提供了一个User类，可以直接引用这个外键，所以可不必另外建一个模型类</p>\r\n\r\n<p>&nbsp; models代码如下:</p>\r\n\r\n<pre>\r\n<code>from&nbsp;django.db&nbsp;import&nbsp;models\r\nfrom&nbsp;django.contrib.auth.models&nbsp;import&nbsp;User&nbsp;&nbsp;#&nbsp;引入USER\r\n\r\n\r\nclass&nbsp;Category(models.Model):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Django&nbsp;要求模型必须继承&nbsp;models.Model&nbsp;类。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category&nbsp;只需要一个简单的分类名&nbsp;name&nbsp;就可以了。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CharField&nbsp;指定了分类名&nbsp;name&nbsp;的数据类型，CharField&nbsp;是字符型，\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CharField&nbsp;的&nbsp;max_length&nbsp;参数指定其最大长度，超过这个长度的分类名就不能被存入数据库。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;name&nbsp;=&nbsp;models.CharField(u&#39;分类&#39;,&nbsp;max_length=20)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;class&nbsp;Meta:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name&nbsp;=&nbsp;&#39;分类&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name_plural&nbsp;=&nbsp;&#39;分类&#39;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;__str__(self):\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;self.name\r\n\r\nclass&nbsp;Post(models.Model):&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章的数据库表稍微复杂一点，主要是涉及的字段更多。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;文章标题\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;u&#39;文章标题&#39;可以在后台显示里面的字段名\r\n&nbsp;&nbsp;&nbsp;&nbsp;title&nbsp;=&nbsp;models.CharField(u&#39;文章标题&#39;,&nbsp;max_length=70)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;文章正文，我们使用了&nbsp;TextField。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;存储比较短的字符串可以使用&nbsp;CharField，但对于文章的正文来说可能会是一大段文本，因此使用&nbsp;TextField&nbsp;来存储大段文本。\r\n&nbsp;&nbsp;&nbsp;&nbsp;body&nbsp;=&nbsp;TextField()\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;这两个列分别表示文章的创建时间和最后一次修改时间，存储时间的字段用&nbsp;DateTimeField&nbsp;类型。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;auto_now_add=True时间可以被确定为现在的时间,不需要在后台对该字段名进行操作\r\n&nbsp;&nbsp;&nbsp;&nbsp;created_time&nbsp;=&nbsp;models.DateTimeField(u&#39;创建时间&#39;,&nbsp;auto_now_add=True)\r\n&nbsp;&nbsp;&nbsp;&nbsp;modified_time&nbsp;=&nbsp;models.DateTimeField(u&#39;修改时间&#39;,&nbsp;auto_now_add=True)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;文章摘要，可以没有文章摘要，但默认情况下&nbsp;CharField&nbsp;要求必须存入数据，否则就会报错。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;指定&nbsp;CharField&nbsp;的&nbsp;blank=True&nbsp;参数值后就可以允许空值了。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;excerpt&nbsp;=&nbsp;models.CharField(u&#39;摘要&#39;,&nbsp;max_length=200,&nbsp;blank=True)\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;这里我把摘要注释了，因为每次都要输入摘要很麻烦，后面可以直接模板中采用过滤器truncatechars可自由提取文章前规定字数\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;这是分类，分类的模型已经定义在上面。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;这里把文章对应的数据库表和分类、标签对应的数据库表关联了起来，但是关联形式稍微有点不同。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;规定一篇文章只能对应一个分类，但是一个分类下可以有多篇文章，所以使用的是&nbsp;ForeignKey，即一对多的关联关系。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;而对于标签来说，一篇文章可以有多个标签，同一个标签下也可能有多篇文章，所以使用&nbsp;ManyToManyField，表明这是多对多的关联关系。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;文章可以没有标签，因此为标签&nbsp;tags&nbsp;指定了&nbsp;blank=True。\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;category&nbsp;=&nbsp;models.ForeignKey(Category)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;文章作者，这里&nbsp;User&nbsp;是从&nbsp;django.contrib.auth.models&nbsp;导入的。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;django.contrib.auth&nbsp;是&nbsp;Django&nbsp;内置的应用，专门用于处理网站用户的注册、登录等流程，User&nbsp;是&nbsp;Django已经写好的用户模型。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;通过&nbsp;ForeignKey&nbsp;把文章和&nbsp;User&nbsp;关联了起来。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;规定一篇文章只能有一个作者，而一个作者可能会写多篇文章，因此这是一对多的关联关系，和&nbsp;Category&nbsp;类似。\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;on_delete=models.CASCADE表示级联删除\r\n&nbsp;&nbsp;&nbsp;&nbsp;author&nbsp;=&nbsp;models.ForeignKey(User,&nbsp;on_delete=models.CASCADE)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;__str__(self):\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;self.title\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;class&nbsp;Meta:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name&nbsp;=&nbsp;&#39;文章&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name_plural&nbsp;=&nbsp;&#39;文章&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ordering&nbsp;=&nbsp;[&#39;-modified_time&#39;]</code></pre>\r\n\r\n<p>&nbsp; &nbsp; 这个时候虽然已经把模型定下来了，但是注意要将该应用注册到seetings中，然后使用python manage.py createsuperuser创建一个超级用户，然后在admin.py加入以下代码，就可以在后台显示了</p>\r\n\r\n<pre>\r\n<code>from&nbsp;django.contrib&nbsp;import&nbsp;admin\r\nfrom&nbsp;.models&nbsp;import&nbsp;Category,&nbsp;Post\r\n&nbsp;\r\n#&nbsp;自定义\r\n@admin.register(Category)\r\nclass&nbsp;CategoryAdmin(admin.ModelAdmin):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作用:自定义分类管理工具\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;admin.ModelAdmin:继承admin.ModelAdmin类\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;在后台显示id值和分类名\r\n&nbsp;&nbsp;&nbsp;&nbsp;list_display&nbsp;=&nbsp;(&#39;id&#39;,&nbsp;&#39;name&#39;)\r\n\r\n@admin.register(Post)\r\nclass&nbsp;PostAdmin(admin.ModelAdmin):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作用:自定义文章管理工具\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;admin.ModelAdmin:继承admin.ModelAdmin类\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;在后台显示id值，博文名，创建时间，修改时间，目录，作者\r\n&nbsp;&nbsp;&nbsp;&nbsp;list_display&nbsp;=&nbsp;(&#39;id&#39;,&nbsp;&#39;title&#39;,&nbsp;&#39;created_time&#39;,&nbsp;&#39;modified_time&#39;,&nbsp;&#39;category&#39;,&nbsp;&#39;author&#39;)&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;增加过滤框,且以文章分类作过滤器\r\n&nbsp;&nbsp;&nbsp;&nbsp;list_filter&nbsp;=&nbsp;[&#39;category&#39;]\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;增加文章标题搜索字段\r\n&nbsp;&nbsp;&nbsp;&nbsp;search_fields&nbsp;=&nbsp;[&#39;title&#39;]\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;后台管理每页显示20篇文章标题\r\n&nbsp;&nbsp;&nbsp;&nbsp;list_per_page&nbsp;=&nbsp;20</code></pre>','2019-09-04 11:21:23.155800','blog/3_mSEFCHo.png',2,2,'网站已经成功部署好多天了，今天突然发现以前在开发过程中遇到的问题没有被好好的记录下来，或者说是没有被保存。这样肯定是不可取的，这会让我陷入问题的轮回中，重复思考着如何解决一个问题，那就太花费时间和精力了。'),(6,'python-django：我的网站搭建 数据库选型',3,'<p>&nbsp;上一篇记录的是模型设计，也就是博客展示的基本功能，那么这些模型在进行数据迁移的时候就会产生数据。如何有效地保存好这些数据，这就是每一个开发者都值得去斗智斗勇的一件事，如防止跨站攻击，反爬虫等。今天内容就是Django框架的数据库选型问题，其实Django 对各种数据库都提供了很好的支持，包括：PostgreSQL，MySQL，SQLite，&nbsp;Oracle，在选择这些数据库的时候都可以根据自己的需求去选择。关于SQLite数据库，它是一种文档型数据库，是Django默认自带的，不需要用户去下载，在数据迁移的时候，会直接在项目根目录下产生一个db.sqlite3的文件。而我在项目中使用的是MySQL数据库，一种关系型数据库。下面就介绍一下如何将Django自带的SQLite换成MySQL：</p>\r\n\r\n<p>&nbsp; &nbsp; 首先第一步：肯定是需要在当前主机上安装MySQL，另外要注意的是在网站部署的时候也要在服务器上安装MySQL，否则网站在运行时候肯定是会报错的</p>\r\n\r\n<pre>\r\n<code>sudo&nbsp;apt-get&nbsp;install&nbsp;mysql-server&nbsp;mysql-client</code></pre>\r\n\r\n<p>&nbsp; 第二步：启动MySQL服务。先注册一个用户用于登录，然后创建一个数据库名叫做blog</p>\r\n\r\n<pre>\r\n<code>create&nbsp;database&nbsp;blog&nbsp;charset=utf8;</code></pre>\r\n\r\n<p>&nbsp; &nbsp; 第三步：下载一个Python驱动Mysql的包。在这里有必要说一下的是Django目前仅支持Python2版本的Mysqldb包，如果使用Python3开发的版本就必须要使用pymysql的驱动包，它们是有区别的。这样的话是不是Django就不能支持Python3了呢，其实是可以的，只需要在Django项目中的__init__.py文件加上下面这两行</p>\r\n\r\n<pre>\r\n<code>import&nbsp;pymysql\r\npymysql.install_as_MySQLdb()</code></pre>\r\n\r\n<p>&nbsp; &nbsp; 第四步：修改settings.py文件中的DATABASES选项</p>\r\n\r\n<pre>\r\n<code>DATABASES&nbsp;=&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&#39;default&#39;:&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;ENGINE&#39;:&nbsp;&#39;django.db.backends.mysql&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;NAME&#39;:&nbsp;&#39;blog&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;USER&#39;:&nbsp;&#39;root&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;PASSWORD&#39;:&nbsp;&#39;password&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;HOST&#39;:&nbsp;&#39;localhost&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;PORT&#39;:&nbsp;&#39;3306&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}</code></pre>\r\n\r\n<p>&nbsp; &nbsp; 好了，以上就是Django完美支持Mysql的全部内容。</p>','2019-09-04 11:22:32.804800','blog/4_qEDCTBC.png',2,2,'上一篇记录的是模型设计，也就是博客展示的基本功能，那么这些模型在进行数据迁移的时候就会产生数据。如何有效地保存好这些数据，这就是每一个开发者都值得去斗智斗勇的一件事，如防止跨站攻击，反爬虫等。');
/*!40000 ALTER TABLE `tb_mysite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_profile_user_id_8fdce8e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-06 18:08:02
