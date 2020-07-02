-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               5.0.95-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5492
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for deploy
DROP DATABASE IF EXISTS `deploy`;
CREATE DATABASE IF NOT EXISTS `deploy` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `deploy`;

-- Dumping structure for table deploy.auth_group
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table deploy.auth_group_permissions
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table deploy.auth_permission
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.auth_permission: ~30 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
REPLACE INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add group', 2, 'add_group'),
	(5, 'Can change group', 2, 'change_group'),
	(6, 'Can delete group', 2, 'delete_group'),
	(7, 'Can add permission', 3, 'add_permission'),
	(8, 'Can change permission', 3, 'change_permission'),
	(9, 'Can delete permission', 3, 'delete_permission'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add release', 7, 'add_release'),
	(20, 'Can change release', 7, 'change_release'),
	(21, 'Can delete release', 7, 'delete_release'),
	(22, 'Can add cluster', 8, 'add_cluster'),
	(23, 'Can change cluster', 8, 'change_cluster'),
	(24, 'Can delete cluster', 8, 'delete_cluster'),
	(25, 'Can add config', 9, 'add_config'),
	(26, 'Can change config', 9, 'change_config'),
	(27, 'Can delete config', 9, 'delete_config'),
	(28, 'Can add project', 10, 'add_project'),
	(29, 'Can change project', 10, 'change_project'),
	(30, 'Can delete project', 10, 'delete_project');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table deploy.auth_user
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(128) NOT NULL,
  `last_login` datetime default NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.auth_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table deploy.auth_user_groups
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table deploy.auth_user_user_permissions
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table deploy.django_admin_log
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) default NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.django_admin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table deploy.django_content_type
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.django_content_type: ~10 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
REPLACE INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(2, 'auth', 'group'),
	(3, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(8, 'model', 'cluster'),
	(9, 'model', 'config'),
	(10, 'model', 'project'),
	(7, 'model', 'release'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table deploy.django_migrations
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL auto_increment,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.django_migrations: ~24 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
REPLACE INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2020-05-27 00:55:05'),
	(2, 'auth', '0001_initial', '2020-05-27 00:55:06'),
	(3, 'admin', '0001_initial', '2020-05-27 00:55:07'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2020-05-27 00:55:07'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2020-05-27 00:55:07'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2020-05-27 00:55:07'),
	(7, 'auth', '0003_alter_user_email_max_length', '2020-05-27 00:55:07'),
	(8, 'auth', '0004_alter_user_username_opts', '2020-05-27 00:55:07'),
	(9, 'auth', '0005_alter_user_last_login_null', '2020-05-27 00:55:07'),
	(10, 'auth', '0006_require_contenttypes_0002', '2020-05-27 00:55:07'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2020-05-27 00:55:08'),
	(12, 'auth', '0008_alter_user_username_max_length', '2020-05-27 00:55:08'),
	(13, 'model', '0001_initial', '2020-05-27 00:55:08'),
	(14, 'model', '0002_release', '2020-05-27 00:55:08'),
	(15, 'model', '0003_project_git_alias', '2020-05-27 00:55:08'),
	(16, 'model', '0004_cluster', '2020-05-27 00:55:08'),
	(17, 'model', '0005_auto_20200315_0034', '2020-05-27 00:55:08'),
	(18, 'model', '0006_auto_20200315_1156', '2020-05-27 00:55:09'),
	(19, 'model', '0007_auto_20200315_1356', '2020-05-27 00:55:09'),
	(20, 'model', '0008_auto_20200315_2218', '2020-05-27 00:55:09'),
	(21, 'model', '0009_release_k8s_logs', '2020-05-27 00:55:09'),
	(22, 'model', '0010_release_docker_build_logs', '2020-05-27 00:55:09'),
	(23, 'model', '0011_release_port', '2020-05-27 00:55:09'),
	(24, 'sessions', '0001_initial', '2020-05-27 00:55:09');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table deploy.django_session
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.django_session: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table deploy.model_cluster
DROP TABLE IF EXISTS `model_cluster`;
CREATE TABLE IF NOT EXISTS `model_cluster` (
  `cluster_id` int(11) NOT NULL auto_increment,
  `cluster_name` varchar(200) NOT NULL,
  `describe` longtext,
  `visit_by_https` tinyint(1) NOT NULL,
  `user_name` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `api_server` varchar(200) NOT NULL,
  `dns_server` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`cluster_id`),
  UNIQUE KEY `cluster_name` (`cluster_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.model_cluster: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_cluster` ENABLE KEYS */;

-- Dumping structure for table deploy.model_config
DROP TABLE IF EXISTS `model_config`;
CREATE TABLE IF NOT EXISTS `model_config` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.model_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_config` ENABLE KEYS */;

-- Dumping structure for table deploy.model_project
DROP TABLE IF EXISTS `model_project`;
CREATE TABLE IF NOT EXISTS `model_project` (
  `project_id` int(11) NOT NULL auto_increment,
  `project_name` varchar(60) NOT NULL,
  `git_ssh_address` varchar(255) NOT NULL,
  `dir_address` varchar(160) NOT NULL,
  `is_cluster` smallint(6) NOT NULL,
  `describe` varchar(255) NOT NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  `git_alias` varchar(60) NOT NULL,
  PRIMARY KEY  (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.model_project: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_project` ENABLE KEYS */;

-- Dumping structure for table deploy.model_release
DROP TABLE IF EXISTS `model_release`;
CREATE TABLE IF NOT EXISTS `model_release` (
  `release_id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `branch` varchar(160) NOT NULL,
  `version` varchar(80) NOT NULL,
  `backup_name` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  `cluster_id` int(11) default NULL,
  `exec_command` varchar(2000) NOT NULL,
  `image_name` varchar(200) NOT NULL,
  `k8s_logs` longtext NOT NULL,
  `docker_build_logs` longtext NOT NULL,
  `port` int(11) NOT NULL,
  PRIMARY KEY  (`release_id`),
  KEY `model_release_cluster_id_1907a711_fk_model_cluster_cluster_id` (`cluster_id`),
  CONSTRAINT `model_release_cluster_id_1907a711_fk_model_cluster_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `model_cluster` (`cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table deploy.model_release: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_release` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_release` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
