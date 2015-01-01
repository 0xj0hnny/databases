

USE chat;

-- CREATE TABLE messages (
--    Describe your table here.
-- );

/* Create other tables and define schemas for them here! */




-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'messages'
--
-- ---

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `text` VARCHAR(500) NULL DEFAULT NULL,
  `userid` INTEGER(10) NULL DEFAULT NULL,
  `roomname` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'users'
--
-- ---

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `username` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);


-- ---
-- Foreign Keys
-- ---


-- ---
-- Table Properties
-- ---

-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---


-- INSERT INTO `users` (`id`,`username`) VALUES
-- ('1','bob');
-- INSERT INTO `users` (`id`,`username`) VALUES
-- ('2','tim');
-- INSERT INTO `users` (`id`,`username`) VALUES
-- ('3','terry');
-- INSERT INTO `messages` (`id`,`text`,`userid`,`roomname`) VALUES
-- ('1','hello world','1','lobby');
-- INSERT INTO `messages` (`id`,`text`,`userid`,`roomname`) VALUES
-- ('2','hello second world','2','lobby');
-- INSERT INTO `messages` (`id`,`text`,`userid`,`roomname`) VALUES
-- ('3','hello third world','1','lobby');





/*  Execute this file from the command line by typing:
 *    mysql < schema.sql
 *  to create the database and the tables.*/




