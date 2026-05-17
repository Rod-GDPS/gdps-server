-- GDPS Schema Update 2026-05-17
-- Creates all tables required for the dashboard, automod, clans, events, vault codes, udids, replies and sfx tools if they do not exist.

CREATE TABLE IF NOT EXISTS `automod` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0,
  `value1` varchar(255) NOT NULL DEFAULT '',
  `value2` varchar(255) NOT NULL DEFAULT '',
  `value3` varchar(255) NOT NULL DEFAULT '',
  `value4` varchar(255) NOT NULL DEFAULT '',
  `value5` varchar(255) NOT NULL DEFAULT '',
  `value6` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `resolved` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `bans` (
  `banID` int(11) NOT NULL AUTO_INCREMENT,
  `modID` varchar(255) NOT NULL DEFAULT '',
  `person` varchar(50) NOT NULL DEFAULT '',
  `reason` varchar(2048) NOT NULL DEFAULT '',
  `modReason` varchar(2048) NOT NULL DEFAULT '',
  `banType` int(11) NOT NULL DEFAULT 0,
  `personType` int(11) NOT NULL DEFAULT 0,
  `expires` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`banID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `clancomments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(1024) NOT NULL DEFAULT '',
  `userID` int(11) NOT NULL DEFAULT 0,
  `clanID` int(11) NOT NULL DEFAULT 0,
  `likes` int(11) NOT NULL DEFAULT 0,
  `dislikes` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `clanrequests` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` int(11) NOT NULL DEFAULT 0,
  `clanID` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `clans` (
  `clanID` int(11) NOT NULL AUTO_INCREMENT,
  `clanName` varchar(255) NOT NULL DEFAULT '',
  `clanTag` varchar(15) NOT NULL DEFAULT '',
  `clanDesc` varchar(2048) NOT NULL DEFAULT '',
  `clanOwner` int(11) NOT NULL DEFAULT 0,
  `clanMembers` varchar(2048) NOT NULL DEFAULT '',
  `clanColor` varchar(6) NOT NULL DEFAULT 'FFFFFF',
  `clanRank` int(11) NOT NULL DEFAULT 0,
  `isClosed` tinyint(1) NOT NULL DEFAULT 0,
  `creationDate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `events` (
  `feaID` int(11) NOT NULL AUTO_INCREMENT,
  `levelID` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `rewards` varchar(2048) NOT NULL DEFAULT '',
  `webhookSent` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`feaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `favsongs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `songID` int(11) NOT NULL DEFAULT 0,
  `accountID` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `notifies` (
  `notifyID` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` varchar(255) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT 0,
  `value1` varchar(2048) NOT NULL DEFAULT '',
  `value2` varchar(255) NOT NULL DEFAULT '',
  `value3` varchar(255) NOT NULL DEFAULT '',
  `value4` varchar(255) NOT NULL DEFAULT '',
  `value5` varchar(255) NOT NULL DEFAULT '',
  `value6` varchar(255) NOT NULL DEFAULT '',
  `modID` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `isChecked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`notifyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `replies` (
  `replyID` int(11) NOT NULL AUTO_INCREMENT,
  `commentID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `body` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`replyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `sfxs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `authorName` varchar(100) NOT NULL,
  `download` varchar(255) DEFAULT '',
  `milliseconds` int(11) NOT NULL DEFAULT 0,
  `size` varchar(100) NOT NULL,
  `isDisabled` int(11) NOT NULL DEFAULT 0,
  `levelsCount` int(11) NOT NULL DEFAULT 0,
  `reuploadID` int(11) NOT NULL DEFAULT 0,
  `reuploadTime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `name` (`name`),
  KEY `authorName` (`authorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `udids` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT 0,
  `udids` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `vaultcodes` (
  `rewardID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  `rewards` varchar(2048) NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT 0,
  `uses` int(11) NOT NULL DEFAULT -1,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rewardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
