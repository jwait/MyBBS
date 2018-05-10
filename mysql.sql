/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : mysql

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 11/05/2018 00:41:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for columns_priv
-- ----------------------------
DROP TABLE IF EXISTS `columns_priv`;
CREATE TABLE `columns_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`, `Column_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Column privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for db
-- ----------------------------
DROP TABLE IF EXISTS `db`;
CREATE TABLE `db`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`, `Db`, `User`) USING BTREE,
  INDEX `User`(`User`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Database privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for engine_cost
-- ----------------------------
DROP TABLE IF EXISTS `engine_cost`;
CREATE TABLE `engine_cost`  (
  `engine_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_type` int(11) NOT NULL,
  `cost_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost_value` float NULL DEFAULT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cost_name`, `engine_name`, `device_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime(0) NULL DEFAULT NULL,
  `interval_value` int(11) NULL DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `modified` timestamp(0) NOT NULL,
  `last_executed` datetime(0) NULL DEFAULT NULL,
  `starts` datetime(0) NULL DEFAULT NULL,
  `ends` datetime(0) NULL DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) UNSIGNED NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `body_utf8` longblob NULL,
  PRIMARY KEY (`db`, `name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Events' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for func
-- ----------------------------
DROP TABLE IF EXISTS `func`;
CREATE TABLE `func`  (
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT 0,
  `dl` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'User defined functions' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for general_log
-- ----------------------------
DROP TABLE IF EXISTS `general_log`;
CREATE TABLE `general_log`  (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thread_id` bigint(21) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `command_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE = CSV CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'General log' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gtid_executed
-- ----------------------------
DROP TABLE IF EXISTS `gtid_executed`;
CREATE TABLE `gtid_executed`  (
  `source_uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint(20) NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint(20) NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`, `interval_start`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for help_category
-- ----------------------------
DROP TABLE IF EXISTS `help_category`;
CREATE TABLE `help_category`  (
  `help_category_id` smallint(5) UNSIGNED NOT NULL,
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_category_id` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`help_category_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'help categories' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for help_keyword
-- ----------------------------
DROP TABLE IF EXISTS `help_keyword`;
CREATE TABLE `help_keyword`  (
  `help_keyword_id` int(10) UNSIGNED NOT NULL,
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`help_keyword_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'help keywords' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for help_relation
-- ----------------------------
DROP TABLE IF EXISTS `help_relation`;
CREATE TABLE `help_relation`  (
  `help_topic_id` int(10) UNSIGNED NOT NULL,
  `help_keyword_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`help_keyword_id`, `help_topic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'keyword-topic relation' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for help_topic
-- ----------------------------
DROP TABLE IF EXISTS `help_topic`;
CREATE TABLE `help_topic`  (
  `help_topic_id` int(10) UNSIGNED NOT NULL,
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `help_category_id` smallint(5) UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `example` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`help_topic_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'help topics' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for innodb_index_stats
-- ----------------------------
DROP TABLE IF EXISTS `innodb_index_stats`;
CREATE TABLE `innodb_index_stats`  (
  `database_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `stat_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stat_value` bigint(20) UNSIGNED NOT NULL,
  `sample_size` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `stat_description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`, `table_name`, `index_name`, `stat_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for innodb_table_stats
-- ----------------------------
DROP TABLE IF EXISTS `innodb_table_stats`;
CREATE TABLE `innodb_table_stats`  (
  `database_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `n_rows` bigint(20) UNSIGNED NOT NULL,
  `clustered_index_size` bigint(20) UNSIGNED NOT NULL,
  `sum_of_other_index_sizes` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`database_name`, `table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for ndb_binlog_index
-- ----------------------------
DROP TABLE IF EXISTS `ndb_binlog_index`;
CREATE TABLE `ndb_binlog_index`  (
  `Position` bigint(20) UNSIGNED NOT NULL,
  `File` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `epoch` bigint(20) UNSIGNED NOT NULL,
  `inserts` int(10) UNSIGNED NOT NULL,
  `updates` int(10) UNSIGNED NOT NULL,
  `deletes` int(10) UNSIGNED NOT NULL,
  `schemaops` int(10) UNSIGNED NOT NULL,
  `orig_server_id` int(10) UNSIGNED NOT NULL,
  `orig_epoch` bigint(20) UNSIGNED NOT NULL,
  `gci` int(10) UNSIGNED NOT NULL,
  `next_position` bigint(20) UNSIGNED NOT NULL,
  `next_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`epoch`, `orig_server_id`, `orig_epoch`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for plugin
-- ----------------------------
DROP TABLE IF EXISTS `plugin`;
CREATE TABLE `plugin`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'MySQL plugins' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for proc
-- ----------------------------
DROP TABLE IF EXISTS `proc`;
CREATE TABLE `proc`  (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `specific_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `language` enum('SQL') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `modified` timestamp(0) NOT NULL,
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `body_utf8` longblob NULL,
  PRIMARY KEY (`db`, `name`, `type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Stored Procedures' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for procs_priv
-- ----------------------------
DROP TABLE IF EXISTS `procs_priv`;
CREATE TABLE `procs_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Grantor` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`Host`, `Db`, `User`, `Routine_name`, `Routine_type`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Procedure privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for proxies_priv
-- ----------------------------
DROP TABLE IF EXISTS `proxies_priv`;
CREATE TABLE `proxies_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT 0,
  `Grantor` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`Host`, `User`, `Proxied_host`, `Proxied_user`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'User proxy privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for server_cost
-- ----------------------------
DROP TABLE IF EXISTS `server_cost`;
CREATE TABLE `server_cost`  (
  `cost_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost_value` float NULL DEFAULT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cost_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers`  (
  `Server_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Username` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Password` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT 0,
  `Socket` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Wrapper` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Owner` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'MySQL Foreign Servers table' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for slave_master_info
-- ----------------------------
DROP TABLE IF EXISTS `slave_master_info`;
CREATE TABLE `slave_master_info`  (
  `Number_of_lines` int(10) UNSIGNED NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint(20) UNSIGNED NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The password used to connect to the master.',
  `Port` int(10) UNSIGNED NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int(10) UNSIGNED NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The master server uuid.',
  `Retry_count` bigint(20) UNSIGNED NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'Tls version',
  PRIMARY KEY (`Channel_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Master Information' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for slave_relay_log_info
-- ----------------------------
DROP TABLE IF EXISTS `slave_relay_log_info`;
CREATE TABLE `slave_relay_log_info`  (
  `Number_of_lines` int(10) UNSIGNED NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint(20) UNSIGNED NOT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint(20) UNSIGNED NOT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int(11) NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int(10) UNSIGNED NOT NULL,
  `Id` int(10) UNSIGNED NOT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relay Log Information' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for slave_worker_info
-- ----------------------------
DROP TABLE IF EXISTS `slave_worker_info`;
CREATE TABLE `slave_worker_info`  (
  `Id` int(10) UNSIGNED NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint(20) UNSIGNED NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint(20) UNSIGNED NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint(20) UNSIGNED NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint(20) UNSIGNED NOT NULL,
  `Checkpoint_seqno` int(10) UNSIGNED NOT NULL,
  `Checkpoint_group_size` int(10) UNSIGNED NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`, `Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Worker Information' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for slow_log
-- ----------------------------
DROP TABLE IF EXISTS `slow_log`;
CREATE TABLE `slow_log`  (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint(21) UNSIGNED NOT NULL
) ENGINE = CSV CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Slow log' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tables_priv
-- ----------------------------
DROP TABLE IF EXISTS `tables_priv`;
CREATE TABLE `tables_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Table privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for time_zone
-- ----------------------------
DROP TABLE IF EXISTS `time_zone`;
CREATE TABLE `time_zone`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zones' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for time_zone_leap_second
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_leap_second`;
CREATE TABLE `time_zone_leap_second`  (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Leap seconds information for time zones' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for time_zone_name
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_name`;
CREATE TABLE `time_zone_name`  (
  `Name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone names' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for time_zone_transition
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_transition`;
CREATE TABLE `time_zone_transition`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Time_zone_id`, `Transition_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone transitions' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for time_zone_transition_type
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_transition_type`;
CREATE TABLE `time_zone_transition_type`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Transition_type_id` int(10) UNSIGNED NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT 0,
  `Is_DST` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Abbreviation` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`, `Transition_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone transition types' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_updates` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_connections` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_user_connections` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `plugin` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'mysql_native_password',
  `authentication_string` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `password_expired` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp(0) NULL DEFAULT NULL,
  `password_lifetime` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`, `User`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Users and global privileges' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
