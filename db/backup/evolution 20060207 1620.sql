-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.15-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema evolution_development
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ evolution_development;
USE evolution_development;

--
-- Table structure for table `evolution_development`.`industries`
--

DROP TABLE IF EXISTS `industries`;
CREATE TABLE `industries` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `sector_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`industries`
--

/*!40000 ALTER TABLE `industries` DISABLE KEYS */;
/*!40000 ALTER TABLE `industries` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`investor_performances`
--

DROP TABLE IF EXISTS `investor_performances`;
CREATE TABLE `investor_performances` (
  `id` int(11) NOT NULL auto_increment,
  `investor_id` int(11) NOT NULL default '0',
  `date` date NOT NULL,
  `pm_id` int(11) default NULL,
  `actualized_return` decimal(10,4) default NULL,
  `after_cost_return` decimal(10,4) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idp_unique` (`investor_id`,`date`,`pm_id`),
  KEY `fk_ip_date` (`date`),
  KEY `fk_ip_pm_id` (`pm_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`investor_performances`
--

/*!40000 ALTER TABLE `investor_performances` DISABLE KEYS */;
/*!40000 ALTER TABLE `investor_performances` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`investors`
--

DROP TABLE IF EXISTS `investors`;
CREATE TABLE `investors` (
  `id` int(11) NOT NULL auto_increment,
  `memory` int(11) default NULL,
  `greed` int(11) default NULL,
  `status` varchar(15) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mg_unique` (`memory`,`greed`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`investors`
--

/*!40000 ALTER TABLE `investors` DISABLE KEYS */;
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (673,1,-100,'Waiting'),
 (674,1,-90,'Waiting'),
 (675,1,-80,'Waiting'),
 (676,1,-70,'Waiting'),
 (677,1,-60,'Waiting'),
 (678,1,-50,'Waiting'),
 (679,1,-40,'Waiting'),
 (680,1,-30,'Waiting'),
 (681,1,-20,'Waiting'),
 (682,1,-10,'Waiting'),
 (683,1,0,'Waiting'),
 (684,1,10,'Waiting'),
 (685,1,20,'Waiting'),
 (686,1,30,'Waiting'),
 (687,1,40,'Waiting'),
 (688,1,50,'Waiting'),
 (689,1,60,'Waiting'),
 (690,1,70,'Waiting'),
 (691,1,80,'Waiting'),
 (692,1,90,'Waiting'),
 (693,1,100,'Waiting'),
 (694,2,-100,'Waiting'),
 (695,2,-90,'Waiting'),
 (696,2,-80,'Waiting'),
 (697,2,-70,'Waiting'),
 (698,2,-60,'Waiting'),
 (699,2,-50,'Waiting'),
 (700,2,-40,'Waiting'),
 (701,2,-30,'Waiting'),
 (702,2,-20,'Waiting'),
 (703,2,-10,'Waiting'),
 (704,2,0,'Waiting'),
 (705,2,10,'Waiting'),
 (706,2,20,'Waiting'),
 (707,2,30,'Waiting'),
 (708,2,40,'Waiting'),
 (709,2,50,'Waiting'),
 (710,2,60,'Waiting'),
 (711,2,70,'Waiting'),
 (712,2,80,'Waiting'),
 (713,2,90,'Waiting');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (714,2,100,'Waiting'),
 (715,3,-100,'Waiting'),
 (716,3,-90,'Waiting'),
 (717,3,-80,'Waiting'),
 (718,3,-70,'Waiting'),
 (719,3,-60,'Waiting'),
 (720,3,-50,'Waiting'),
 (721,3,-40,'Waiting'),
 (722,3,-30,'Waiting'),
 (723,3,-20,'Waiting'),
 (724,3,-10,'Waiting'),
 (725,3,0,'Waiting'),
 (726,3,10,'Waiting'),
 (727,3,20,'Waiting'),
 (728,3,30,'Waiting'),
 (729,3,40,'Waiting'),
 (730,3,50,'Waiting'),
 (731,3,60,'Waiting'),
 (732,3,70,'Waiting'),
 (733,3,80,'Waiting'),
 (734,3,90,'Waiting'),
 (735,3,100,'Waiting'),
 (736,4,-100,'Waiting'),
 (737,4,-90,'Waiting'),
 (738,4,-80,'Waiting'),
 (739,4,-70,'Waiting'),
 (740,4,-60,'Waiting'),
 (741,4,-50,'Waiting'),
 (742,4,-40,'Waiting'),
 (743,4,-30,'Waiting'),
 (744,4,-20,'Waiting'),
 (745,4,-10,'Waiting'),
 (746,4,0,'Waiting'),
 (747,4,10,'Waiting'),
 (748,4,20,'Waiting'),
 (749,4,30,'Waiting'),
 (750,4,40,'Waiting'),
 (751,4,50,'Waiting'),
 (752,4,60,'Waiting'),
 (753,4,70,'Waiting'),
 (754,4,80,'Waiting');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (755,4,90,'Waiting'),
 (756,4,100,'Waiting'),
 (757,5,-100,'Waiting'),
 (758,5,-90,'Waiting'),
 (759,5,-80,'Waiting'),
 (760,5,-70,'Waiting'),
 (761,5,-60,'Waiting'),
 (762,5,-50,'Waiting'),
 (763,5,-40,'Waiting'),
 (764,5,-30,'Waiting'),
 (765,5,-20,'Waiting'),
 (766,5,-10,'Waiting'),
 (767,5,0,'Waiting'),
 (768,5,10,'Waiting'),
 (769,5,20,'Waiting'),
 (770,5,30,'Waiting'),
 (771,5,40,'Waiting'),
 (772,5,50,'Waiting'),
 (773,5,60,'Waiting'),
 (774,5,70,'Waiting'),
 (775,5,80,'Waiting'),
 (776,5,90,'Waiting'),
 (777,5,100,'Waiting'),
 (778,6,-100,'Waiting'),
 (779,6,-90,'Waiting'),
 (780,6,-80,'Waiting'),
 (781,6,-70,'Waiting'),
 (782,6,-60,'Waiting'),
 (783,6,-50,'Waiting'),
 (784,6,-40,'Waiting'),
 (785,6,-30,'Waiting'),
 (786,6,-20,'Waiting'),
 (787,6,-10,'Waiting'),
 (788,6,0,'Waiting'),
 (789,6,10,'Waiting'),
 (790,6,20,'Waiting'),
 (791,6,30,'Waiting'),
 (792,6,40,'Waiting'),
 (793,6,50,'Waiting'),
 (794,6,60,'Waiting'),
 (795,6,70,'Waiting');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (796,6,80,'Waiting'),
 (797,6,90,'Waiting'),
 (798,6,100,'Waiting'),
 (799,7,-100,'Waiting'),
 (800,7,-90,'Waiting'),
 (801,7,-80,'Waiting'),
 (802,7,-70,'Waiting'),
 (803,7,-60,'Waiting'),
 (804,7,-50,'Waiting'),
 (805,7,-40,'Waiting'),
 (806,7,-30,'Waiting'),
 (807,7,-20,'Waiting'),
 (808,7,-10,'Waiting'),
 (809,7,0,'Waiting'),
 (810,7,10,'Waiting'),
 (811,7,20,'Waiting'),
 (812,7,30,'Waiting'),
 (813,7,40,'Waiting'),
 (814,7,50,'Waiting'),
 (815,7,60,'Waiting'),
 (816,7,70,'Waiting'),
 (817,7,80,'Waiting'),
 (818,7,90,'Waiting'),
 (819,7,100,'Waiting'),
 (820,8,-100,'Waiting'),
 (821,8,-90,'Waiting'),
 (822,8,-80,'Waiting'),
 (823,8,-70,'Waiting'),
 (824,8,-60,'Waiting'),
 (825,8,-50,'Waiting'),
 (826,8,-40,'Waiting'),
 (827,8,-30,'Waiting'),
 (828,8,-20,'Waiting'),
 (829,8,-10,'Waiting'),
 (830,8,0,'Waiting'),
 (831,8,10,'Waiting'),
 (832,8,20,'Waiting'),
 (833,8,30,'Waiting'),
 (834,8,40,'Waiting'),
 (835,8,50,'Waiting'),
 (836,8,60,'Waiting');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (837,8,70,'Waiting'),
 (838,8,80,'Waiting'),
 (839,8,90,'Waiting'),
 (840,8,100,'Waiting'),
 (841,9,-100,'Waiting'),
 (842,9,-90,'Waiting'),
 (843,9,-80,'Waiting'),
 (844,9,-70,'Waiting'),
 (845,9,-60,'Waiting'),
 (846,9,-50,'Waiting'),
 (847,9,-40,'Waiting'),
 (848,9,-30,'Waiting'),
 (849,9,-20,'Waiting'),
 (850,9,-10,'Waiting'),
 (851,9,0,'Waiting'),
 (852,9,10,'Waiting'),
 (853,9,20,'Waiting'),
 (854,9,30,'Waiting'),
 (855,9,40,'Waiting'),
 (856,9,50,'Waiting'),
 (857,9,60,'Waiting'),
 (858,9,70,'Waiting'),
 (859,9,80,'Waiting'),
 (860,9,90,'Waiting'),
 (861,9,100,'Waiting'),
 (862,10,-100,'Waiting'),
 (863,10,-90,'Waiting'),
 (864,10,-80,'Waiting'),
 (865,10,-70,'Waiting'),
 (866,10,-60,'Waiting'),
 (867,10,-50,'Waiting'),
 (868,10,-40,'Waiting'),
 (869,10,-30,'Waiting'),
 (870,10,-20,'Waiting'),
 (871,10,-10,'Waiting'),
 (872,10,0,'Waiting'),
 (873,10,10,'Waiting'),
 (874,10,20,'Waiting'),
 (875,10,30,'Waiting'),
 (876,10,40,'Waiting'),
 (877,10,50,'Waiting');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (878,10,60,'Waiting'),
 (879,10,70,'Waiting'),
 (880,10,80,'Waiting'),
 (881,10,90,'Waiting'),
 (882,10,100,'Waiting'),
 (883,11,-100,'Waiting'),
 (884,11,-90,'Waiting'),
 (885,11,-80,'Waiting'),
 (886,11,-70,'Waiting'),
 (887,11,-60,'Waiting'),
 (888,11,-50,'Waiting'),
 (889,11,-40,'Waiting'),
 (890,11,-30,'Waiting'),
 (891,11,-20,'Waiting'),
 (892,11,-10,'Waiting'),
 (893,11,0,'Waiting'),
 (894,11,10,'Waiting'),
 (895,11,20,'Waiting'),
 (896,11,30,'Waiting'),
 (897,11,40,'Waiting'),
 (898,11,50,'Waiting'),
 (899,11,60,'Waiting'),
 (900,11,70,'Waiting'),
 (901,11,80,'Waiting'),
 (902,11,90,'Waiting'),
 (903,11,100,'Waiting'),
 (904,12,-100,'Waiting'),
 (905,12,-90,'Waiting'),
 (906,12,-80,'Waiting'),
 (907,12,-70,'Waiting'),
 (908,12,-60,'Waiting'),
 (909,12,-50,'Waiting'),
 (910,12,-40,'Waiting'),
 (911,12,-30,'Waiting'),
 (912,12,-20,'Waiting'),
 (913,12,-10,'Waiting'),
 (914,12,0,'Waiting'),
 (915,12,10,'Waiting'),
 (916,12,20,'Waiting'),
 (917,12,30,'Waiting');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (918,12,40,'Waiting'),
 (919,12,50,'Waiting'),
 (920,12,60,'Waiting'),
 (921,12,70,'Waiting'),
 (922,12,80,'Waiting'),
 (923,12,90,'Waiting'),
 (924,12,100,'Waiting'),
 (925,13,-100,'Waiting'),
 (926,13,-90,'Waiting'),
 (927,13,-80,'Waiting'),
 (928,13,-70,'Waiting'),
 (929,13,-60,'Waiting'),
 (930,13,-50,'Waiting'),
 (931,13,-40,'Waiting'),
 (932,13,-30,'Waiting'),
 (933,13,-20,'Waiting'),
 (934,13,-10,'Waiting'),
 (935,13,0,'Waiting'),
 (936,13,10,'Waiting'),
 (937,13,20,'Waiting'),
 (938,13,30,'Waiting'),
 (939,13,40,'Waiting'),
 (940,13,50,'Waiting'),
 (941,13,60,'Waiting'),
 (942,13,70,'Waiting'),
 (943,13,80,'Waiting'),
 (944,13,90,'Waiting'),
 (945,13,100,'Waiting'),
 (946,14,-100,'Waiting'),
 (947,14,-90,'Waiting'),
 (948,14,-80,'Waiting'),
 (949,14,-70,'Waiting'),
 (950,14,-60,'Waiting'),
 (951,14,-50,'Waiting'),
 (952,14,-40,'Waiting'),
 (953,14,-30,'Waiting'),
 (954,14,-20,'Waiting'),
 (955,14,-10,'Waiting'),
 (956,14,0,'Waiting');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (957,14,10,'Waiting'),
 (958,14,20,'Waiting'),
 (959,14,30,'Waiting'),
 (960,14,40,'Waiting'),
 (961,14,50,'Waiting'),
 (962,14,60,'Waiting'),
 (963,14,70,'Waiting'),
 (964,14,80,'Waiting'),
 (965,14,90,'Waiting'),
 (966,14,100,'Waiting'),
 (967,15,-100,'Waiting'),
 (968,15,-90,'Waiting'),
 (969,15,-80,'Waiting'),
 (970,15,-70,'Waiting'),
 (971,15,-60,'Waiting'),
 (972,15,-50,'Waiting'),
 (973,15,-40,'Waiting'),
 (974,15,-30,'Waiting'),
 (975,15,-20,'Waiting'),
 (976,15,-10,'Waiting'),
 (977,15,0,'Waiting'),
 (978,15,10,'Waiting'),
 (979,15,20,'Waiting'),
 (980,15,30,'Waiting'),
 (981,15,40,'Waiting'),
 (982,15,50,'Waiting'),
 (983,15,60,'Waiting'),
 (984,15,70,'Waiting'),
 (985,15,80,'Waiting'),
 (986,15,90,'Waiting'),
 (987,15,100,'Waiting');
/*!40000 ALTER TABLE `investors` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`pm_performances`
--

DROP TABLE IF EXISTS `pm_performances`;
CREATE TABLE `pm_performances` (
  `id` int(11) NOT NULL auto_increment,
  `pm_id` int(11) NOT NULL default '0',
  `optimized_date` date NOT NULL,
  `actualized_return` decimal(10,4) default NULL,
  `actualized_date` date default NULL,
  `after_cost_return` float default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pa_unique` (`pm_id`,`actualized_date`),
  KEY `fk_pmp_adate` (`actualized_date`),
  KEY `fk_pmp_odate` (`optimized_date`),
  KEY `fk_pmp_pm_id` (`pm_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`pm_performances`
--

/*!40000 ALTER TABLE `pm_performances` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_performances` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`pms`
--

DROP TABLE IF EXISTS `pms`;
CREATE TABLE `pms` (
  `id` int(11) NOT NULL auto_increment,
  `memory` int(11) default NULL,
  `confidence` int(11) default NULL,
  `concentration` int(11) default NULL,
  `status` varchar(15) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mc_unique` (`memory`,`confidence`,`concentration`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB; InnoDB free: 1';

--
-- Dumping data for table `evolution_development`.`pms`
--

/*!40000 ALTER TABLE `pms` DISABLE KEYS */;
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (917,2,1,NULL,'Calculated'),
 (918,2,2,NULL,'Calculated'),
 (919,3,1,NULL,'Calculated'),
 (920,3,2,NULL,'Calculated');
/*!40000 ALTER TABLE `pms` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`portfolio_items`
--

DROP TABLE IF EXISTS `portfolio_items`;
CREATE TABLE `portfolio_items` (
  `id` int(11) NOT NULL auto_increment,
  `pm_id` int(11) NOT NULL default '0',
  `date` date NOT NULL,
  `ticker` varchar(10) NOT NULL default '',
  `fraction` decimal(10,4) NOT NULL,
  `shares` int(11) default NULL,
  `book_value` float default NULL,
  `market_value` float default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pdt_unique` (`pm_id`,`date`,`ticker`),
  KEY `fk_portfolio_quote` (`date`,`ticker`),
  KEY `fk_portfolios_pm_id` (`pm_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`portfolio_items`
--

/*!40000 ALTER TABLE `portfolio_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_items` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL auto_increment,
  `ticker` varchar(10) NOT NULL default '',
  `name` varchar(45) default NULL,
  `currency` varchar(10) NOT NULL default 'USD',
  `capitalization` int(11) default NULL,
  `status` varchar(15) default NULL,
  `industry_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ticker_unique` (`ticker`),
  KEY `fk_profiles_ticker` (`ticker`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`profiles`
--

/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` (`id`,`ticker`,`name`,`currency`,`capitalization`,`status`,`industry_id`) VALUES 
 (1,'AAPL','Apple Computer','USD',NULL,'Imported',NULL),
 (2,'ADBE','Adobe','USD',NULL,'Imported',NULL),
 (3,'BMO','Bank of Montreal','USD',NULL,'Imported',NULL),
 (4,'DELL','Dell Computer','USD',NULL,'Imported',NULL),
 (5,'GE','General Electric','USD',NULL,'Imported',NULL),
 (7,'IBM','IBM','USD',NULL,'Imported',NULL),
 (8,'INTL','Intel','USD',NULL,'Imported',NULL),
 (9,'MSFT','Microsoft','USD',NULL,'Imported',NULL),
 (10,'TM','Toyota Motor','USD',NULL,'Imported',NULL),
 (13,'YHOO','Yahoo','USD',NULL,'Imported',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`quotes`
--

DROP TABLE IF EXISTS `quotes`;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL auto_increment,
  `date` date NOT NULL,
  `open` decimal(10,4) default NULL,
  `high` decimal(10,4) default NULL,
  `low` decimal(10,4) default NULL,
  `close` decimal(10,4) default NULL,
  `volume` int(11) default NULL,
  `adjusted_close` decimal(10,4) default '0.0000',
  `rate_of_return` decimal(12,6) default NULL,
  `ticker` varchar(10) NOT NULL default '',
  `profile_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `td_unique` (`ticker`,`date`),
  KEY `fk_quotes_pk` (`ticker`,`date`),
  KEY `fk_quotes_profile_id` (`profile_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`quotes`
--

/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`risk_free_rates`
--

DROP TABLE IF EXISTS `risk_free_rates`;
CREATE TABLE `risk_free_rates` (
  `id` int(11) NOT NULL auto_increment,
  `date` date NOT NULL,
  `t_bill_rate` decimal(10,4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`risk_free_rates`
--

/*!40000 ALTER TABLE `risk_free_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_free_rates` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`sectors`
--

DROP TABLE IF EXISTS `sectors`;
CREATE TABLE `sectors` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`sectors`
--

/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) default NULL,
  `data` text,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `sessions_session_id_index` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`,`session_id`,`data`,`updated_at`) VALUES 
 (1,'38a58d6b47badb1e4889690d309d317c','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-26 17:17:19'),
 (2,'9c349d83e89cbd88b78560f79c270a47','BAh7CDoLanVtcHRvMDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250\ncm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2006-01-27 08:59:28'),
 (3,'47e78863faa3904d6e5460b575e344db','BAh7CDoLanVtcHRvQzoeSGFzaFdpdGhJbmRpZmZlcmVudEFjY2Vzc3sHIgth\nY3Rpb24iCWxpc3QiD2NvbnRyb2xsZXIiE3Byb2ZpbGVzX2FkbWluIgpmbGFz\naElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpA\ndXNlZHsAOgx1c2VyX2lkMA==\n','2006-01-27 13:46:42'),
 (4,'20aeebc0037555fa6447a94c4d2b0790','BAh7CDoLanVtcHRvQzoeSGFzaFdpdGhJbmRpZmZlcmVudEFjY2Vzc3sHIgth\nY3Rpb24iCmluZGV4Ig9jb250cm9sbGVyIg5ldm9sdXRpb24iCmZsYXNoSUM6\nJ0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2Vk\newA6DHVzZXJfaWQw\n','2006-01-27 13:06:58'),
 (5,'0fc692cac353c6181c1e8c8d4ce79312','BAh7CDoLanVtcHRvQzoeSGFzaFdpdGhJbmRpZmZlcmVudEFjY2Vzc3sHIgth\nY3Rpb24iCmluZGV4Ig9jb250cm9sbGVyIg5ldm9sdXRpb24iCmZsYXNoSUM6\nJ0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2Vk\newA6DHVzZXJfaWQw\n','2006-01-27 13:20:40'),
 (6,'c4fa2ecd39a9bf8ca38e28bbe09bae80','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkH\n','2006-01-27 13:37:35');
INSERT INTO `sessions` (`id`,`session_id`,`data`,`updated_at`) VALUES 
 (7,'79ddb63440744fd5c4604dad9bdfa5c3','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-27 13:39:44'),
 (8,'dd9cd14cec3d9d70da3280b9dfdf4212','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-27 14:09:20'),
 (9,'e94dc67f85cbdd28d823513e9a58be64','BAh7CDoLanVtcHRvQzoeSGFzaFdpdGhJbmRpZmZlcmVudEFjY2Vzc3sHIgth\nY3Rpb24iCmluZGV4Ig9jb250cm9sbGVyIg5ldm9sdXRpb24iCmZsYXNoSUM6\nJ0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2Vk\newA6DHVzZXJfaWQw\n','2006-01-27 14:11:14'),
 (10,'ca99059a483717782d7a6cd334f70484','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-27 14:33:40'),
 (11,'573e5a01b9653c149060975c2e11c261','BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoLanVtcHRvMDoMdXNlcl9pZGkG\n','2006-01-30 09:49:18'),
 (12,'20c5f9231fdae34a4070067fdc423f75','BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoLanVtcHRvMDoMdXNlcl9pZGkG\n','2006-01-30 10:00:27');
INSERT INTO `sessions` (`id`,`session_id`,`data`,`updated_at`) VALUES 
 (13,'a4854f7bdc4bb8c17cebde774d0289ea','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-30 10:51:28'),
 (14,'f8b171794a19fd68c138f1713a9830f3','BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoLanVtcHRvMDoMdXNlcl9pZGkG\n','2006-02-03 15:00:47'),
 (15,'4f6b9948d7c49bfd33fe4a14cfb18e92','BAh7CDoLanVtcHRvMDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250\ncm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2006-02-07 11:37:57'),
 (16,'14fe930244f698b67a6189fe110148d1','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2006-02-06 11:09:11');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Table structure for table `evolution_development`.`users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `hashed_password` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_development`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`hashed_password`) VALUES 
 (1,'Sky','68a99c354b2d091b0995fbe7f5a4741c6933f4d8'),
 (2,'raafat','51203fc2f63d87cb611326d1da0fb642f5fa92c6');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Create schema evolution_production
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ evolution_production;
USE evolution_production;

--
-- Table structure for table `evolution_production`.`industries`
--

DROP TABLE IF EXISTS `industries`;
CREATE TABLE `industries` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `sector_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`industries`
--

/*!40000 ALTER TABLE `industries` DISABLE KEYS */;
/*!40000 ALTER TABLE `industries` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`investor_performances`
--

DROP TABLE IF EXISTS `investor_performances`;
CREATE TABLE `investor_performances` (
  `id` int(11) NOT NULL auto_increment,
  `investor_id` int(11) NOT NULL default '0',
  `date` date NOT NULL,
  `pm_id` int(11) default NULL,
  `actualized_return` decimal(10,4) default NULL,
  `after_cost_return` decimal(10,4) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idp_unique` (`investor_id`,`date`,`pm_id`),
  KEY `fk_ip_date` (`date`),
  KEY `fk_ip_pm_id` (`pm_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`investor_performances`
--

/*!40000 ALTER TABLE `investor_performances` DISABLE KEYS */;
/*!40000 ALTER TABLE `investor_performances` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`investors`
--

DROP TABLE IF EXISTS `investors`;
CREATE TABLE `investors` (
  `id` int(11) NOT NULL auto_increment,
  `memory` int(11) default NULL,
  `greed` int(11) default NULL,
  `status` varchar(15) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mg_unique` (`memory`,`greed`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`investors`
--

/*!40000 ALTER TABLE `investors` DISABLE KEYS */;
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (673,1,-100,'Calculated'),
 (674,1,-90,'Calculated'),
 (675,1,-80,'Calculated'),
 (676,1,-70,'Calculated'),
 (677,1,-60,'Calculated'),
 (678,1,-50,'Calculated'),
 (679,1,-40,'Calculated'),
 (680,1,-30,'Calculated'),
 (681,1,-20,'Calculated'),
 (682,1,-10,'Calculated'),
 (683,1,0,'Calculated'),
 (684,1,10,'Calculated'),
 (685,1,20,'Calculated'),
 (686,1,30,'Calculated'),
 (687,1,40,'Calculated'),
 (688,1,50,'Calculated'),
 (689,1,60,'Calculated'),
 (690,1,70,'Calculated'),
 (691,1,80,'Calculated'),
 (692,1,90,'Calculated'),
 (693,1,100,'Calculated'),
 (694,2,-100,'Calculated'),
 (695,2,-90,'Calculated'),
 (696,2,-80,'Calculated'),
 (697,2,-70,'Calculated'),
 (698,2,-60,'Calculated'),
 (699,2,-50,'Calculated'),
 (700,2,-40,'Calculated'),
 (701,2,-30,'Calculated'),
 (702,2,-20,'Calculated'),
 (703,2,-10,'Calculated'),
 (704,2,0,'Calculated'),
 (705,2,10,'Calculated'),
 (706,2,20,'Calculated'),
 (707,2,30,'Calculated'),
 (708,2,40,'Calculated'),
 (709,2,50,'Calculated');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (710,2,60,'Calculated'),
 (711,2,70,'Calculated'),
 (712,2,80,'Calculated'),
 (713,2,90,'Calculated'),
 (714,2,100,'Calculated'),
 (715,3,-100,'Calculated'),
 (716,3,-90,'Calculated'),
 (717,3,-80,'Calculated'),
 (718,3,-70,'Calculated'),
 (719,3,-60,'Calculated'),
 (720,3,-50,'Calculated'),
 (721,3,-40,'Calculated'),
 (722,3,-30,'Calculated'),
 (723,3,-20,'Calculated'),
 (724,3,-10,'Calculated'),
 (725,3,0,'Calculated'),
 (726,3,10,'Calculated'),
 (727,3,20,'Calculated'),
 (728,3,30,'Calculated'),
 (729,3,40,'Calculated'),
 (730,3,50,'Calculated'),
 (731,3,60,'Calculated'),
 (732,3,70,'Calculated'),
 (733,3,80,'Calculated'),
 (734,3,90,'Calculated'),
 (735,3,100,'Calculated'),
 (736,4,-100,'Calculated'),
 (737,4,-90,'Calculated'),
 (738,4,-80,'Calculated'),
 (739,4,-70,'Calculated'),
 (740,4,-60,'Calculated'),
 (741,4,-50,'Calculated'),
 (742,4,-40,'Calculated'),
 (743,4,-30,'Calculated'),
 (744,4,-20,'Calculated'),
 (745,4,-10,'Calculated'),
 (746,4,0,'Calculated');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (747,4,10,'Calculated'),
 (748,4,20,'Calculated'),
 (749,4,30,'Calculated'),
 (750,4,40,'Calculated'),
 (751,4,50,'Calculated'),
 (752,4,60,'Calculated'),
 (753,4,70,'Calculated'),
 (754,4,80,'Calculated'),
 (755,4,90,'Calculated'),
 (756,4,100,'Calculated'),
 (757,5,-100,'Calculated'),
 (758,5,-90,'Calculated'),
 (759,5,-80,'Calculated'),
 (760,5,-70,'Calculated'),
 (761,5,-60,'Calculated'),
 (762,5,-50,'Calculated'),
 (763,5,-40,'Calculated'),
 (764,5,-30,'Calculated'),
 (765,5,-20,'Calculated'),
 (766,5,-10,'Calculated'),
 (767,5,0,'Calculated'),
 (768,5,10,'Calculated'),
 (769,5,20,'Calculated'),
 (770,5,30,'Calculated'),
 (771,5,40,'Calculated'),
 (772,5,50,'Calculated'),
 (773,5,60,'Calculated'),
 (774,5,70,'Calculated'),
 (775,5,80,'Calculated'),
 (776,5,90,'Calculated'),
 (777,5,100,'Calculated'),
 (778,6,-100,'Calculated'),
 (779,6,-90,'Calculated'),
 (780,6,-80,'Calculated'),
 (781,6,-70,'Calculated'),
 (782,6,-60,'Calculated'),
 (783,6,-50,'Calculated');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (784,6,-40,'Calculated'),
 (785,6,-30,'Calculated'),
 (786,6,-20,'Calculated'),
 (787,6,-10,'Calculated'),
 (788,6,0,'Calculated'),
 (789,6,10,'Calculated'),
 (790,6,20,'Calculated'),
 (791,6,30,'Calculated'),
 (792,6,40,'Calculated'),
 (793,6,50,'Calculated'),
 (794,6,60,'Calculated'),
 (795,6,70,'Calculated'),
 (796,6,80,'Calculated'),
 (797,6,90,'Calculated'),
 (798,6,100,'Calculated'),
 (799,7,-100,'Calculated'),
 (800,7,-90,'Calculated'),
 (801,7,-80,'Calculated'),
 (802,7,-70,'Calculated'),
 (803,7,-60,'Calculated'),
 (804,7,-50,'Calculated'),
 (805,7,-40,'Calculated'),
 (806,7,-30,'Calculated'),
 (807,7,-20,'Calculated'),
 (808,7,-10,'Calculated'),
 (809,7,0,'Calculated'),
 (810,7,10,'Calculated'),
 (811,7,20,'Calculated'),
 (812,7,30,'Calculated'),
 (813,7,40,'Calculated'),
 (814,7,50,'Calculated'),
 (815,7,60,'Calculated'),
 (816,7,70,'Calculated'),
 (817,7,80,'Calculated'),
 (818,7,90,'Calculated'),
 (819,7,100,'Calculated'),
 (820,8,-100,'Calculated');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (821,8,-90,'Calculated'),
 (822,8,-80,'Calculated'),
 (823,8,-70,'Calculated'),
 (824,8,-60,'Calculated'),
 (825,8,-50,'Calculated'),
 (826,8,-40,'Calculated'),
 (827,8,-30,'Calculated'),
 (828,8,-20,'Calculated'),
 (829,8,-10,'Calculated'),
 (830,8,0,'Calculated'),
 (831,8,10,'Calculated'),
 (832,8,20,'Calculated'),
 (833,8,30,'Calculated'),
 (834,8,40,'Calculated'),
 (835,8,50,'Calculated'),
 (836,8,60,'Calculated'),
 (837,8,70,'Calculated'),
 (838,8,80,'Calculated'),
 (839,8,90,'Calculated'),
 (840,8,100,'Calculated'),
 (841,9,-100,'Calculated'),
 (842,9,-90,'Calculated'),
 (843,9,-80,'Calculated'),
 (844,9,-70,'Calculated'),
 (845,9,-60,'Calculated'),
 (846,9,-50,'Calculated'),
 (847,9,-40,'Calculated'),
 (848,9,-30,'Calculated'),
 (849,9,-20,'Calculated'),
 (850,9,-10,'Calculated'),
 (851,9,0,'Calculated'),
 (852,9,10,'Calculated'),
 (853,9,20,'Calculated'),
 (854,9,30,'Calculated'),
 (855,9,40,'Calculated'),
 (856,9,50,'Calculated'),
 (857,9,60,'Calculated');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (858,9,70,'Calculated'),
 (859,9,80,'Calculated'),
 (860,9,90,'Calculated'),
 (861,9,100,'Calculated'),
 (862,10,-100,'Calculated'),
 (863,10,-90,'Calculated'),
 (864,10,-80,'Calculated'),
 (865,10,-70,'Calculated'),
 (866,10,-60,'Calculated'),
 (867,10,-50,'Calculated'),
 (868,10,-40,'Calculated'),
 (869,10,-30,'Calculated'),
 (870,10,-20,'Calculated'),
 (871,10,-10,'Calculated'),
 (872,10,0,'Calculated'),
 (873,10,10,'Calculated'),
 (874,10,20,'Calculated'),
 (875,10,30,'Calculated'),
 (876,10,40,'Calculated'),
 (877,10,50,'Calculated'),
 (878,10,60,'Calculated'),
 (879,10,70,'Calculated'),
 (880,10,80,'Calculated'),
 (881,10,90,'Calculated'),
 (882,10,100,'Calculated'),
 (883,11,-100,'Calculated'),
 (884,11,-90,'Calculated'),
 (885,11,-80,'Calculated'),
 (886,11,-70,'Calculated'),
 (887,11,-60,'Calculated'),
 (888,11,-50,'Calculated'),
 (889,11,-40,'Calculated'),
 (890,11,-30,'Calculated'),
 (891,11,-20,'Calculated'),
 (892,11,-10,'Calculated');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (893,11,0,'Calculated'),
 (894,11,10,'Calculated'),
 (895,11,20,'Calculated'),
 (896,11,30,'Calculated'),
 (897,11,40,'Calculated'),
 (898,11,50,'Calculated'),
 (899,11,60,'Calculated'),
 (900,11,70,'Calculated'),
 (901,11,80,'Calculated'),
 (902,11,90,'Calculated'),
 (903,11,100,'Calculated'),
 (904,12,-100,'Calculated'),
 (905,12,-90,'Calculated'),
 (906,12,-80,'Calculated'),
 (907,12,-70,'Calculated'),
 (908,12,-60,'Calculated'),
 (909,12,-50,'Calculated'),
 (910,12,-40,'Calculated'),
 (911,12,-30,'Calculated'),
 (912,12,-20,'Calculated'),
 (913,12,-10,'Calculated'),
 (914,12,0,'Calculated'),
 (915,12,10,'Calculated'),
 (916,12,20,'Calculated'),
 (917,12,30,'Calculated'),
 (918,12,40,'Calculated'),
 (919,12,50,'Calculated'),
 (920,12,60,'Calculated'),
 (921,12,70,'Calculated'),
 (922,12,80,'Calculated'),
 (923,12,90,'Calculated'),
 (924,12,100,'Calculated'),
 (925,13,-100,'Calculated'),
 (926,13,-90,'Calculated'),
 (927,13,-80,'Calculated'),
 (928,13,-70,'Calculated');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (929,13,-60,'Calculated'),
 (930,13,-50,'Calculated'),
 (931,13,-40,'Calculated'),
 (932,13,-30,'Calculated'),
 (933,13,-20,'Calculated'),
 (934,13,-10,'Calculated'),
 (935,13,0,'Calculated'),
 (936,13,10,'Calculated'),
 (937,13,20,'Calculated'),
 (938,13,30,'Calculated'),
 (939,13,40,'Calculated'),
 (940,13,50,'Calculated'),
 (941,13,60,'Calculated'),
 (942,13,70,'Calculated'),
 (943,13,80,'Calculated'),
 (944,13,90,'Calculated'),
 (945,13,100,'Calculated'),
 (946,14,-100,'Calculated'),
 (947,14,-90,'Calculated'),
 (948,14,-80,'Calculated'),
 (949,14,-70,'Calculated'),
 (950,14,-60,'Calculated'),
 (951,14,-50,'Calculated'),
 (952,14,-40,'Calculated'),
 (953,14,-30,'Calculated'),
 (954,14,-20,'Calculated'),
 (955,14,-10,'Calculated'),
 (956,14,0,'Calculated'),
 (957,14,10,'Calculated'),
 (958,14,20,'Calculated'),
 (959,14,30,'Calculated'),
 (960,14,40,'Calculated'),
 (961,14,50,'Calculated'),
 (962,14,60,'Calculated'),
 (963,14,70,'Calculated'),
 (964,14,80,'Calculated');
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (965,14,90,'Calculated'),
 (966,14,100,'Calculated'),
 (967,15,-100,'Calculated'),
 (968,15,-90,'Calculated'),
 (969,15,-80,'Calculated'),
 (970,15,-70,'Calculated'),
 (971,15,-60,'Calculated'),
 (972,15,-50,'Calculated'),
 (973,15,-40,'Calculated'),
 (974,15,-30,'Calculated'),
 (975,15,-20,'Calculated'),
 (976,15,-10,'Calculated'),
 (977,15,0,'Calculated'),
 (978,15,10,'Calculated'),
 (979,15,20,'Calculated'),
 (980,15,30,'Calculated'),
 (981,15,40,'Calculated'),
 (982,15,50,'Calculated'),
 (983,15,60,'Calculated'),
 (984,15,70,'Calculated'),
 (985,15,80,'Calculated'),
 (986,15,90,'Calculated'),
 (987,15,100,'Calculated');
/*!40000 ALTER TABLE `investors` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`pm_performances`
--

DROP TABLE IF EXISTS `pm_performances`;
CREATE TABLE `pm_performances` (
  `id` int(11) NOT NULL auto_increment,
  `pm_id` int(11) NOT NULL default '0',
  `optimized_date` date NOT NULL,
  `actualized_return` decimal(10,4) default NULL,
  `actualized_date` date default NULL,
  `after_cost_return` float default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pa_unique` (`pm_id`,`actualized_date`),
  KEY `fk_pmp_adate` (`actualized_date`),
  KEY `fk_pmp_odate` (`optimized_date`),
  KEY `fk_pmp_pm_id` (`pm_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`pm_performances`
--

/*!40000 ALTER TABLE `pm_performances` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_performances` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`pms`
--

DROP TABLE IF EXISTS `pms`;
CREATE TABLE `pms` (
  `id` int(11) NOT NULL auto_increment,
  `memory` int(11) default NULL,
  `confidence` int(11) default NULL,
  `concentration` int(11) default NULL,
  `status` varchar(15) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mc_unique` (`memory`,`confidence`,`concentration`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB; InnoDB free: 1';

--
-- Dumping data for table `evolution_production`.`pms`
--

/*!40000 ALTER TABLE `pms` DISABLE KEYS */;
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (917,2,1,NULL,'Calculated'),
 (918,2,2,NULL,'Calculated'),
 (919,3,1,NULL,'Calculated'),
 (920,3,2,NULL,'Calculated'),
 (921,2,3,NULL,'Calculated'),
 (922,2,4,NULL,'Calculated'),
 (923,2,5,NULL,'Calculated'),
 (924,2,6,NULL,'Calculated'),
 (925,2,7,NULL,'Calculated'),
 (926,2,8,NULL,'Calculated'),
 (927,2,9,NULL,'Calculated'),
 (928,2,10,NULL,'Calculated'),
 (929,3,3,NULL,'Calculated'),
 (930,3,4,NULL,'Calculated'),
 (931,3,5,NULL,'Calculated'),
 (932,3,6,NULL,'Calculated'),
 (933,3,7,NULL,'Calculated'),
 (934,3,8,NULL,'Calculated'),
 (935,3,9,NULL,'Calculated'),
 (936,3,10,NULL,'Calculated'),
 (937,4,1,NULL,'Calculated'),
 (938,4,2,NULL,'Calculated'),
 (939,4,3,NULL,'Calculated'),
 (940,4,4,NULL,'Calculated'),
 (941,4,5,NULL,'Calculated'),
 (942,4,6,NULL,'Calculated'),
 (943,4,7,NULL,'Calculated'),
 (944,4,8,NULL,'Calculated'),
 (945,4,9,NULL,'Calculated'),
 (946,4,10,NULL,'Calculated'),
 (947,5,1,NULL,'Calculated'),
 (948,5,2,NULL,'Calculated');
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (949,5,3,NULL,'Calculated'),
 (950,5,4,NULL,'Calculated'),
 (951,5,5,NULL,'Calculated'),
 (952,5,6,NULL,'Calculated'),
 (953,5,7,NULL,'Calculated'),
 (954,5,8,NULL,'Calculated'),
 (955,5,9,NULL,'Calculated'),
 (956,5,10,NULL,'Calculated'),
 (957,6,1,NULL,'Calculated'),
 (958,6,2,NULL,'Calculated'),
 (959,6,3,NULL,'Calculated'),
 (960,6,4,NULL,'Calculated'),
 (961,6,5,NULL,'Calculated'),
 (962,6,6,NULL,'Calculated'),
 (963,6,7,NULL,'Calculated'),
 (964,6,8,NULL,'Calculated'),
 (965,6,9,NULL,'Calculated'),
 (966,6,10,NULL,'Calculated'),
 (967,7,1,NULL,'Calculated'),
 (968,7,2,NULL,'Calculated'),
 (969,7,3,NULL,'Calculated'),
 (970,7,4,NULL,'Calculated'),
 (971,7,5,NULL,'Calculated'),
 (972,7,6,NULL,'Calculated'),
 (973,7,7,NULL,'Calculated'),
 (974,7,8,NULL,'Calculated'),
 (975,7,9,NULL,'Calculated'),
 (976,7,10,NULL,'Calculated'),
 (977,8,1,NULL,'Calculated'),
 (978,8,2,NULL,'Calculated'),
 (979,8,3,NULL,'Calculated'),
 (980,8,4,NULL,'Calculated');
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (981,8,5,NULL,'Calculated'),
 (982,8,6,NULL,'Calculated'),
 (983,8,7,NULL,'Calculated'),
 (984,8,8,NULL,'Calculated'),
 (985,8,9,NULL,'Calculated'),
 (986,8,10,NULL,'Calculated'),
 (987,9,1,NULL,'Calculated'),
 (988,9,2,NULL,'Calculated'),
 (989,9,3,NULL,'Calculated'),
 (990,9,4,NULL,'Calculated'),
 (991,9,5,NULL,'Calculated'),
 (992,9,6,NULL,'Calculated'),
 (993,9,7,NULL,'Calculated'),
 (994,9,8,NULL,'Calculated'),
 (995,9,9,NULL,'Calculated'),
 (996,9,10,NULL,'Calculated'),
 (997,10,1,NULL,'Calculated'),
 (998,10,2,NULL,'Calculated'),
 (999,10,3,NULL,'Calculated'),
 (1000,10,4,NULL,'Calculated'),
 (1001,10,5,NULL,'Calculated'),
 (1002,10,6,NULL,'Calculated'),
 (1003,10,7,NULL,'Calculated'),
 (1004,10,8,NULL,'Calculated'),
 (1005,10,9,NULL,'Calculated'),
 (1006,10,10,NULL,'Calculated'),
 (1007,2,11,NULL,'Calculated'),
 (1008,2,12,NULL,'Calculated'),
 (1009,2,13,NULL,'Calculated'),
 (1010,2,14,NULL,'Calculated'),
 (1011,2,15,NULL,'Calculated');
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (1012,3,11,NULL,'Calculated'),
 (1013,3,12,NULL,'Calculated'),
 (1014,3,13,NULL,'Calculated'),
 (1015,3,14,NULL,'Calculated'),
 (1016,3,15,NULL,'Calculated'),
 (1017,4,11,NULL,'Calculated'),
 (1018,4,12,NULL,'Calculated'),
 (1019,4,13,NULL,'Calculated'),
 (1020,4,14,NULL,'Calculated'),
 (1021,4,15,NULL,'Calculated'),
 (1022,5,11,NULL,'Calculated'),
 (1023,5,12,NULL,'Calculated'),
 (1024,5,13,NULL,'Calculated'),
 (1025,5,14,NULL,'Calculated'),
 (1026,5,15,NULL,'Calculated'),
 (1027,6,11,NULL,'Calculated'),
 (1028,6,12,NULL,'Calculated'),
 (1029,6,13,NULL,'Calculated'),
 (1030,6,14,NULL,'Calculated'),
 (1031,6,15,NULL,'Calculated'),
 (1032,7,11,NULL,'Calculated'),
 (1033,7,12,NULL,'Calculated'),
 (1034,7,13,NULL,'Calculated'),
 (1035,7,14,NULL,'Calculated'),
 (1036,7,15,NULL,'Calculated'),
 (1037,8,11,NULL,'Calculated'),
 (1038,8,12,NULL,'Calculated'),
 (1039,8,13,NULL,'Calculated'),
 (1040,8,14,NULL,'Calculated'),
 (1041,8,15,NULL,'Calculated');
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (1042,9,11,NULL,'Calculated'),
 (1043,9,12,NULL,'Calculated'),
 (1044,9,13,NULL,'Calculated'),
 (1045,9,14,NULL,'Calculated'),
 (1046,9,15,NULL,'Calculated'),
 (1047,10,11,NULL,'Calculated'),
 (1048,10,12,NULL,'Calculated'),
 (1049,10,13,NULL,'Calculated'),
 (1050,10,14,NULL,'Calculated'),
 (1051,10,15,NULL,'Calculated'),
 (1052,11,1,NULL,'Calculated'),
 (1053,11,2,NULL,'Calculated'),
 (1054,11,3,NULL,'Calculated'),
 (1055,11,4,NULL,'Calculated'),
 (1056,11,5,NULL,'Calculated'),
 (1057,11,6,NULL,'Calculated'),
 (1058,11,7,NULL,'Calculated'),
 (1059,11,8,NULL,'Calculated'),
 (1060,11,9,NULL,'Calculated'),
 (1061,11,10,NULL,'Calculated'),
 (1062,11,11,NULL,'Calculated'),
 (1063,11,12,NULL,'Calculated'),
 (1064,11,13,NULL,'Calculated'),
 (1065,11,14,NULL,'Calculated'),
 (1066,11,15,NULL,'Calculated'),
 (1067,12,1,NULL,'Calculated'),
 (1068,12,2,NULL,'Calculated'),
 (1069,12,3,NULL,'Calculated'),
 (1070,12,4,NULL,'Calculated'),
 (1071,12,5,NULL,'Calculated');
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (1072,12,6,NULL,'Calculated'),
 (1073,12,7,NULL,'Calculated'),
 (1074,12,8,NULL,'Calculated'),
 (1075,12,9,NULL,'Calculated'),
 (1076,12,10,NULL,'Calculated'),
 (1077,12,11,NULL,'Calculated'),
 (1078,12,12,NULL,'Calculated'),
 (1079,12,13,NULL,'Calculated'),
 (1080,12,14,NULL,'Calculated'),
 (1081,12,15,NULL,'Calculated'),
 (1082,13,1,NULL,'Calculated'),
 (1083,13,2,NULL,'Calculated'),
 (1084,13,3,NULL,'Calculated'),
 (1085,13,4,NULL,'Calculated'),
 (1086,13,5,NULL,'Calculated'),
 (1087,13,6,NULL,'Calculated'),
 (1088,13,7,NULL,'Calculated'),
 (1089,13,8,NULL,'Calculated'),
 (1090,13,9,NULL,'Calculated'),
 (1091,13,10,NULL,'Calculated'),
 (1092,13,11,NULL,'Calculated'),
 (1093,13,12,NULL,'Calculated'),
 (1094,13,13,NULL,'Calculated'),
 (1095,13,14,NULL,'Calculated'),
 (1096,13,15,NULL,'Calculated'),
 (1097,14,1,NULL,'Calculated'),
 (1098,14,2,NULL,'Calculated'),
 (1099,14,3,NULL,'Calculated'),
 (1100,14,4,NULL,'Calculated'),
 (1101,14,5,NULL,'Calculated');
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (1102,14,6,NULL,'Calculated'),
 (1103,14,7,NULL,'Calculated'),
 (1104,14,8,NULL,'Calculated'),
 (1105,14,9,NULL,'Calculated'),
 (1106,14,10,NULL,'Calculated'),
 (1107,14,11,NULL,'Calculated'),
 (1108,14,12,NULL,'Calculated'),
 (1109,14,13,NULL,'Calculated'),
 (1110,14,14,NULL,'Calculated'),
 (1111,14,15,NULL,'Calculated'),
 (1112,15,1,NULL,'Calculated'),
 (1113,15,2,NULL,'Calculated'),
 (1114,15,3,NULL,'Calculated'),
 (1115,15,4,NULL,'Calculated'),
 (1116,15,5,NULL,'Calculated'),
 (1117,15,6,NULL,'Calculated'),
 (1118,15,7,NULL,'Calculated'),
 (1119,15,8,NULL,'Calculated'),
 (1120,15,9,NULL,'Calculated'),
 (1121,15,10,NULL,'Calculated'),
 (1122,15,11,NULL,'Calculated'),
 (1123,15,12,NULL,'Calculated'),
 (1124,15,13,NULL,'Calculated'),
 (1125,15,14,NULL,'Calculated'),
 (1126,15,15,NULL,'Calculated');
/*!40000 ALTER TABLE `pms` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`portfolio_items`
--

DROP TABLE IF EXISTS `portfolio_items`;
CREATE TABLE `portfolio_items` (
  `id` int(11) NOT NULL auto_increment,
  `pm_id` int(11) NOT NULL default '0',
  `date` date NOT NULL,
  `ticker` varchar(10) NOT NULL default '',
  `fraction` decimal(10,4) NOT NULL,
  `shares` int(11) default NULL,
  `book_value` float default NULL,
  `market_value` float default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pdt_unique` (`pm_id`,`date`,`ticker`),
  KEY `fk_portfolio_quote` (`date`,`ticker`),
  KEY `fk_portfolios_pm_id` (`pm_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`portfolio_items`
--

/*!40000 ALTER TABLE `portfolio_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_items` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL auto_increment,
  `ticker` varchar(10) NOT NULL default '',
  `name` varchar(45) default NULL,
  `currency` varchar(10) NOT NULL default 'USD',
  `capitalization` int(11) default NULL,
  `status` varchar(15) default NULL,
  `industry_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ticker_unique` (`ticker`),
  KEY `fk_profiles_ticker` (`ticker`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`profiles`
--

/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` (`id`,`ticker`,`name`,`currency`,`capitalization`,`status`,`industry_id`) VALUES 
 (1,'AAPL','Apple Computer','USD',NULL,'Imported',NULL),
 (2,'ADBE','Adobe','USD',NULL,'Imported',NULL),
 (3,'BMO','Bank of Montreal','USD',NULL,'Imported',NULL),
 (4,'DELL','Dell Computer','USD',NULL,'Imported',NULL),
 (5,'GE','General Electric','USD',NULL,'Imported',NULL),
 (7,'IBM','IBM','USD',NULL,'Imported',NULL),
 (8,'INTL','Intel','USD',NULL,'Imported',NULL),
 (9,'MSFT','Microsoft','USD',NULL,'Imported',NULL),
 (10,'TM','Toyota Motor','USD',NULL,'Imported',NULL),
 (13,'YHOO','Yahoo','USD',NULL,'Imported',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`quotes`
--

DROP TABLE IF EXISTS `quotes`;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL auto_increment,
  `date` date NOT NULL,
  `open` decimal(10,4) default NULL,
  `high` decimal(10,4) default NULL,
  `low` decimal(10,4) default NULL,
  `close` decimal(10,4) default NULL,
  `volume` int(11) default NULL,
  `adjusted_close` decimal(10,4) default '0.0000',
  `rate_of_return` decimal(12,6) default NULL,
  `ticker` varchar(10) NOT NULL default '',
  `profile_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `td_unique` (`ticker`,`date`),
  KEY `fk_quotes_pk` (`ticker`,`date`),
  KEY `fk_quotes_profile_id` (`profile_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`quotes`
--

/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`risk_free_rates`
--

DROP TABLE IF EXISTS `risk_free_rates`;
CREATE TABLE `risk_free_rates` (
  `id` int(11) NOT NULL auto_increment,
  `date` date NOT NULL,
  `t_bill_rate` decimal(10,4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`risk_free_rates`
--

/*!40000 ALTER TABLE `risk_free_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_free_rates` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`sectors`
--

DROP TABLE IF EXISTS `sectors`;
CREATE TABLE `sectors` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`sectors`
--

/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) default NULL,
  `data` text,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `sessions_session_id_index` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`,`session_id`,`data`,`updated_at`) VALUES 
 (1,'38a58d6b47badb1e4889690d309d317c','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-26 17:17:19'),
 (2,'9c349d83e89cbd88b78560f79c270a47','BAh7CDoLanVtcHRvMDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250\ncm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2006-01-27 08:59:28'),
 (3,'47e78863faa3904d6e5460b575e344db','BAh7CDoLanVtcHRvQzoeSGFzaFdpdGhJbmRpZmZlcmVudEFjY2Vzc3sHIgth\nY3Rpb24iCWxpc3QiD2NvbnRyb2xsZXIiE3Byb2ZpbGVzX2FkbWluIgpmbGFz\naElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpA\ndXNlZHsAOgx1c2VyX2lkMA==\n','2006-01-27 13:46:42'),
 (4,'20aeebc0037555fa6447a94c4d2b0790','BAh7CDoLanVtcHRvQzoeSGFzaFdpdGhJbmRpZmZlcmVudEFjY2Vzc3sHIgth\nY3Rpb24iCmluZGV4Ig9jb250cm9sbGVyIg5ldm9sdXRpb24iCmZsYXNoSUM6\nJ0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2Vk\newA6DHVzZXJfaWQw\n','2006-01-27 13:06:58'),
 (5,'0fc692cac353c6181c1e8c8d4ce79312','BAh7CDoLanVtcHRvQzoeSGFzaFdpdGhJbmRpZmZlcmVudEFjY2Vzc3sHIgth\nY3Rpb24iCmluZGV4Ig9jb250cm9sbGVyIg5ldm9sdXRpb24iCmZsYXNoSUM6\nJ0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2Vk\newA6DHVzZXJfaWQw\n','2006-01-27 13:20:40'),
 (6,'c4fa2ecd39a9bf8ca38e28bbe09bae80','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkH\n','2006-01-27 13:37:35');
INSERT INTO `sessions` (`id`,`session_id`,`data`,`updated_at`) VALUES 
 (7,'79ddb63440744fd5c4604dad9bdfa5c3','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-27 13:39:44'),
 (8,'dd9cd14cec3d9d70da3280b9dfdf4212','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-27 14:09:20'),
 (9,'e94dc67f85cbdd28d823513e9a58be64','BAh7CDoLanVtcHRvQzoeSGFzaFdpdGhJbmRpZmZlcmVudEFjY2Vzc3sHIgth\nY3Rpb24iCmluZGV4Ig9jb250cm9sbGVyIg5ldm9sdXRpb24iCmZsYXNoSUM6\nJ0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2Vk\newA6DHVzZXJfaWQw\n','2006-01-27 14:11:14'),
 (10,'ca99059a483717782d7a6cd334f70484','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-27 14:33:40'),
 (11,'573e5a01b9653c149060975c2e11c261','BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoLanVtcHRvMDoMdXNlcl9pZGkG\n','2006-01-30 09:49:18'),
 (12,'20c5f9231fdae34a4070067fdc423f75','BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoLanVtcHRvMDoMdXNlcl9pZGkG\n','2006-01-30 10:00:27');
INSERT INTO `sessions` (`id`,`session_id`,`data`,`updated_at`) VALUES 
 (13,'a4854f7bdc4bb8c17cebde774d0289ea','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-30 10:51:28'),
 (14,'f8b171794a19fd68c138f1713a9830f3','BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoLanVtcHRvMDoMdXNlcl9pZGkG\n','2006-02-03 15:00:47'),
 (15,'4f6b9948d7c49bfd33fe4a14cfb18e92','BAh7CDoLanVtcHRvMDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250\ncm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2006-02-06 12:15:07');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Table structure for table `evolution_production`.`users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `hashed_password` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`hashed_password`) VALUES 
 (1,'Sky','68a99c354b2d091b0995fbe7f5a4741c6933f4d8'),
 (2,'raafat','51203fc2f63d87cb611326d1da0fb642f5fa92c6');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
