# Host: 127.0.0.1  (Version: 5.7.38)
# Date: 2023-09-24 14:20:57
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "teacher"
#

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userAc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "teacher"
#

INSERT INTO `teacher` VALUES (10,276376240);

#
# Structure for table "cla"
#

DROP TABLE IF EXISTS `cla`;
CREATE TABLE `cla` (
  `type` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intro` text,
  `teacher_id` int(11) DEFAULT NULL,
  `room` text,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `cla_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "cla"
#

INSERT INTO `cla` VALUES ('其他计算机',13,'招新',10,'线上'),('托福 - 阅读',14,'无',10,'无');

#
# Structure for table "span"
#

DROP TABLE IF EXISTS `span`;
CREATE TABLE `span` (
  `span_id` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` text,
  `endTime` text,
  `day` text,
  `cla_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`span_id`),
  KEY `cla_id` (`cla_id`),
  CONSTRAINT `span_ibfk_1` FOREIGN KEY (`cla_id`) REFERENCES `cla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "span"
#

INSERT INTO `span` VALUES (12,'15:00','16:00','周六',13),(13,'13:12','16:00','周一',14);

#
# Structure for table "hw"
#

DROP TABLE IF EXISTS `hw`;
CREATE TABLE `hw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `ddl` date DEFAULT NULL,
  `cla_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cla_id` (`cla_id`),
  CONSTRAINT `hw_ibfk_1` FOREIGN KEY (`cla_id`) REFERENCES `cla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "hw"
#

INSERT INTO `hw` VALUES (1,'无','2021-02-21',13),(2,NULL,NULL,14);

#
# Structure for table "clachose"
#

DROP TABLE IF EXISTS `clachose`;
CREATE TABLE `clachose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cla_id1` int(11) DEFAULT NULL,
  `cla_id2` int(11) DEFAULT NULL,
  `cla_id3` int(11) DEFAULT NULL,
  `cla_id4` int(11) DEFAULT NULL,
  `cla_id5` int(11) DEFAULT NULL,
  `studentAc` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cla_id1` (`cla_id1`),
  KEY `cla_id2` (`cla_id2`),
  KEY `cla_id3` (`cla_id3`),
  KEY `cla_id4` (`cla_id4`),
  KEY `cla_id5` (`cla_id5`),
  CONSTRAINT `clachose_ibfk_1` FOREIGN KEY (`cla_id1`) REFERENCES `cla` (`id`),
  CONSTRAINT `clachose_ibfk_2` FOREIGN KEY (`cla_id2`) REFERENCES `cla` (`id`),
  CONSTRAINT `clachose_ibfk_3` FOREIGN KEY (`cla_id3`) REFERENCES `cla` (`id`),
  CONSTRAINT `clachose_ibfk_4` FOREIGN KEY (`cla_id4`) REFERENCES `cla` (`id`),
  CONSTRAINT `clachose_ibfk_5` FOREIGN KEY (`cla_id5`) REFERENCES `cla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "clachose"
#

INSERT INTO `clachose` VALUES (10,NULL,13,NULL,NULL,NULL,276376240),(11,13,NULL,NULL,NULL,NULL,601826661);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `account` int(11) NOT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `grade` text NOT NULL,
  `class_name` text NOT NULL,
  `type` enum('teacher','student') DEFAULT 'student',
  `clachose_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account`),
  KEY `clachose_id` (`clachose_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`clachose_id`) REFERENCES `clachose` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (276376240,'czukq040','王浩宇','高三','一班','teacher',10),(601826661,'liuduo','刘多','高三','一班','student',11);

#
# Structure for table "feedback"
#

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `teacher_id` text,
  `user_account` int(11) DEFAULT NULL,
  `tim` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_account` (`user_account`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_account`) REFERENCES `user` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "feedback"
#

INSERT INTO `feedback` VALUES (5,'ifohafiahioa','10',276376240,'2022-09-08');
