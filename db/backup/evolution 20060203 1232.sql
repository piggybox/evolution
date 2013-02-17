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
INSERT INTO `investor_performances` (`id`,`investor_id`,`date`,`pm_id`,`actualized_return`,`after_cost_return`) VALUES 
 (1,667,'2006-01-17',699,'-2.8267','-4.3267'),
 (2,667,'2006-01-23',701,'5.2253','5.2253'),
 (3,667,'2006-01-30',699,'-0.3958','-1.3958'),
 (4,668,'2006-01-17',699,'-2.8267','-4.3267'),
 (5,668,'2006-01-23',701,'5.2253','5.2253'),
 (6,668,'2006-01-30',699,'-0.3958','-1.3958'),
 (7,669,'2006-01-17',699,'-2.8267','-4.3267'),
 (8,669,'2006-01-23',701,'5.2253','5.2253'),
 (9,669,'2006-01-30',699,'-0.3958','-1.3958'),
 (10,670,'2006-01-23',701,'5.2253','3.7253'),
 (11,670,'2006-01-30',701,'-0.3958','-1.3958'),
 (12,671,'2006-01-23',701,'5.2253','3.7253'),
 (13,671,'2006-01-30',701,'-0.3958','-1.3958'),
 (14,672,'2006-01-23',701,'5.2253','3.7253'),
 (15,672,'2006-01-30',701,'-0.3958','-1.3958');
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
 (667,1,-100,'Calculated'),
 (668,1,0,'Calculated'),
 (669,1,100,'Calculated'),
 (670,2,-100,'Calculated'),
 (671,2,0,'Calculated'),
 (672,2,100,'Calculated');
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
INSERT INTO `pm_performances` (`id`,`pm_id`,`optimized_date`,`actualized_return`,`actualized_date`,`after_cost_return`) VALUES 
 (12346,699,'2005-12-27','2.2994','2006-01-03',1.79937),
 (12347,699,'2006-01-03','5.0573','2006-01-09',5.0453),
 (12348,699,'2006-01-09','-2.8267','2006-01-17',-3.8267),
 (12349,699,'2006-01-17','5.2253','2006-01-23',5.19085),
 (12350,699,'2006-01-23','-0.3958','2006-01-30',-0.3958),
 (12351,700,'2005-12-27','2.2994','2006-01-03',1.79937),
 (12352,700,'2005-12-27','4.9981','2006-01-09',4.99815),
 (12353,700,'2006-01-09','-2.8267','2006-01-17',-3.8267),
 (12354,700,'2006-01-09','5.0413','2006-01-23',5.04127),
 (12355,700,'2006-01-23','-0.3958','2006-01-30',-0.430247),
 (12356,701,'2006-01-03','4.4910','2006-01-09',3.99097),
 (12357,701,'2006-01-09','-2.4656','2006-01-17',-2.58046),
 (12358,701,'2006-01-17','5.2253','2006-01-23',4.2253),
 (12359,701,'2006-01-23','-0.3958','2006-01-30',-0.3958),
 (12360,702,'2006-01-03','4.4910','2006-01-09',3.99097),
 (12361,702,'2006-01-03','-3.8278','2006-01-17',-3.82776),
 (12362,702,'2006-01-17','5.2253','2006-01-23',4.2253);
INSERT INTO `pm_performances` (`id`,`pm_id`,`optimized_date`,`actualized_return`,`actualized_date`,`after_cost_return`) VALUES 
 (12363,702,'2006-01-17','-0.3958','2006-01-30',-0.3958);
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
 (699,2,1,NULL,'Calculated'),
 (700,2,2,NULL,'Calculated'),
 (701,3,1,NULL,'Calculated'),
 (702,3,2,NULL,'Calculated');
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
INSERT INTO `portfolio_items` (`id`,`pm_id`,`date`,`ticker`,`fraction`,`shares`,`book_value`,`market_value`) VALUES 
 (6066,699,'2005-12-27','BMO','98.8003',NULL,NULL,NULL),
 (6067,699,'2005-12-27','GOOG','1.1997',NULL,NULL,NULL),
 (6068,699,'2006-01-03','BMO','100.0000',NULL,NULL,NULL),
 (6069,699,'2006-01-09','MSFT','96.5553',NULL,NULL,NULL),
 (6070,699,'2006-01-09','TM','3.4447',NULL,NULL,NULL),
 (6071,699,'2006-01-17','MSFT','100.0000',NULL,NULL,NULL),
 (6072,699,'2006-01-23','MSFT','100.0000',NULL,NULL,NULL),
 (6073,699,'2006-01-30','BMO','99.6410',NULL,NULL,NULL),
 (6074,699,'2006-01-30','TM','0.3590',NULL,NULL,NULL),
 (6075,700,'2005-12-27','GOOG','1.1997',NULL,NULL,NULL),
 (6076,700,'2005-12-27','BMO','98.8003',NULL,NULL,NULL),
 (6077,700,'2006-01-09','TM','3.4447',NULL,NULL,NULL),
 (6078,700,'2006-01-09','MSFT','96.5553',NULL,NULL,NULL),
 (6079,700,'2006-01-23','MSFT','100.0000',NULL,NULL,NULL),
 (6080,701,'2006-01-03','BMO','88.5140',NULL,NULL,NULL),
 (6081,701,'2006-01-03','GOOG','11.4860',NULL,NULL,NULL),
 (6082,701,'2006-01-09','BMO','100.0000',NULL,NULL,NULL);
INSERT INTO `portfolio_items` (`id`,`pm_id`,`date`,`ticker`,`fraction`,`shares`,`book_value`,`market_value`) VALUES 
 (6083,701,'2006-01-17','MSFT','100.0000',NULL,NULL,NULL),
 (6084,701,'2006-01-23','MSFT','100.0000',NULL,NULL,NULL),
 (6085,701,'2006-01-30','ADBE','23.6321',NULL,NULL,NULL),
 (6086,701,'2006-01-30','TM','76.3679',NULL,NULL,NULL),
 (6087,702,'2006-01-03','GOOG','11.4860',NULL,NULL,NULL),
 (6088,702,'2006-01-03','BMO','88.5140',NULL,NULL,NULL),
 (6089,702,'2006-01-17','MSFT','100.0000',NULL,NULL,NULL),
 (6090,702,'2006-01-30','TM','76.3679',NULL,NULL,NULL),
 (6091,702,'2006-01-30','ADBE','23.6321',NULL,NULL,NULL);
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
 (12,'GOOG','Google','USD',NULL,'Imported',NULL);
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
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4472,'2006-01-30','71.1700','76.6000','70.8700','72.1000',31611175,'72.1000','0.000972','AAPL',1),
 (4473,'2006-01-23','76.1000','79.5600','71.1000','72.0300',40093020,'72.0300','-0.053358','AAPL',1),
 (4474,'2006-01-17','85.7000','86.3800','75.8300','76.0900',43454175,'76.0900','-0.110994','AAPL',1),
 (4475,'2006-01-09','76.7300','86.4000','75.7400','85.5900',46470140,'85.5900','0.121756','AAPL',1),
 (4476,'2006-01-03','72.3800','76.7000','72.2500','76.3000',23042125,'76.3000','0.061344','AAPL',1),
 (4477,'2005-12-27','74.0000','75.1800','70.3400','71.8900',18776725,'71.8900','-0.019905','AAPL',1),
 (4478,'2005-12-19','71.1100','74.4900','71.0400','73.3500',14890060,'73.3500','0.031500','AAPL',1),
 (4480,'2006-01-30','39.9100','40.5900','38.8300','39.3900',5000500,'39.3900','-0.017216','ADBE',2),
 (4481,'2006-01-23','38.6300','40.1300','37.7900','40.0800',5845560,'40.0800','0.042935','ADBE',2),
 (4482,'2006-01-17','38.7000','40.8500','38.2700','38.4300',5253850,'38.4300','-0.010556','ADBE',2);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4483,'2006-01-09','39.0500','39.9700','37.8700','38.8400',6226420,'38.8400','-0.004103','ADBE',2),
 (4484,'2006-01-03','37.2000','39.0200','36.1300','39.0000',8635525,'39.0000','0.055195','ADBE',2),
 (4485,'2005-12-27','37.4500','37.6500','36.6000','36.9600',2966250,'36.9600','-0.004042','ADBE',2),
 (4486,'2005-12-19','38.5100','39.1100','36.9100','37.1100',6604320,'37.1100','-0.044049','ADBE',2),
 (4488,'2006-01-30','59.0800','60.4500','58.8500','58.8600',49550,'58.8600','0.006842','BMO',3),
 (4489,'2006-01-23','58.6900','60.2500','58.1400','58.8800',67280,'58.4600','0.005331','BMO',3),
 (4490,'2006-01-17','60.0200','60.1900','58.1100','58.5700',38150,'58.1500','-0.024656','BMO',3),
 (4491,'2006-01-09','56.4000','60.0800','56.3200','60.0500',50740,'59.6200','0.050573','BMO',3),
 (4492,'2006-01-03','55.7100','58.5100','55.7100','57.1600',58975,'56.7500','0.021786','BMO',3),
 (4493,'2005-12-27','55.3800','56.0000','55.1000','55.9400',16500,'55.5400','0.010186','BMO',3);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4494,'2005-12-19','54.8000','55.6100','54.3600','55.3800',35320,'54.9800','0.007698','BMO',3),
 (4496,'2006-01-30','29.3400','29.9600','28.8200','29.0000',18112950,'29.0000','-0.009224','DELL',4),
 (4497,'2006-01-23','30.0700','30.6200','28.9400','29.2700',23988340,'29.2700','-0.023031','DELL',4),
 (4498,'2006-01-17','30.2200','30.7600','29.2500','29.9600',25979325,'29.9600','-0.020275','DELL',4),
 (4499,'2006-01-09','30.5900','31.5100','30.4600','30.5800',16340120,'30.5800','-0.001958','DELL',4),
 (4500,'2006-01-03','30.0100','31.0400','29.9500','30.6400',21949850,'30.6400','0.023038','DELL',4),
 (4501,'2005-12-27','31.2900','31.4400','29.8400','29.9500',12896400,'29.9500','-0.039140','DELL',4),
 (4502,'2005-12-19','32.4500','32.6700','30.7100','31.1700',16049220,'31.1700','-0.042396','DELL',4),
 (4504,'2006-01-30','32.9000','33.2900','32.6300','32.9000',35902575,'32.9000','-0.001517','GE',5),
 (4505,'2006-01-23','33.5300','33.6700','32.6500','32.9500',45769620,'32.9500','-0.012586','GE',5);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4506,'2006-01-17','35.6300','35.6300','33.2200','33.3700',38403175,'33.3700','-0.049288','GE',5),
 (4507,'2006-01-09','35.4000','35.5500','34.8000','35.1000',20705520,'35.1000','-0.010431','GE',5),
 (4508,'2006-01-03','35.1000','35.5300','34.8000','35.4700',24545000,'35.4700','0.011983','GE',5),
 (4509,'2005-12-27','35.5700','35.6000','34.9500','35.0500',17016950,'35.0500','-0.010446','GE',5),
 (4510,'2005-12-19','36.0000','36.1100','35.1700','35.4200',18623640,'35.4200','-0.010615','GE',5),
 (4512,'2006-01-30','80.2100','82.2400','80.2100','81.2300',5928500,'81.2300','0.002592','IBM',7),
 (4513,'2006-01-23','81.3300','82.1500','80.5900','81.0200',6494200,'81.0200','-0.004179','IBM',7),
 (4514,'2006-01-17','82.8000','84.7000','81.2500','81.3600',8698125,'81.3600','-0.021763','IBM',7),
 (4515,'2006-01-09','83.9000','84.8100','82.5000','83.1700',6034640,'83.1700','-0.020954','IBM',7),
 (4516,'2006-01-03','82.4500','85.0300','80.8100','84.9500',9239550,'84.9500','0.033455','IBM',7);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4517,'2005-12-27','83.4800','84.5000','81.5600','82.2000',4405500,'82.2000','-0.015333','IBM',7),
 (4518,'2005-12-19','83.2300','84.2000','82.0600','83.4800',5459640,'83.4800','0.001319','IBM',7),
 (4520,'2006-01-30','22.0100','22.0100','21.1400','21.3200',129950,'21.3200','-0.023810','INTL',8),
 (4521,'2006-01-23','21.5300','22.4000','21.0900','21.8400',128440,'21.8400','0.022472','INTL',8),
 (4522,'2006-01-17','21.3000','22.7300','20.8000','21.3600',249625,'21.3600','-0.002801','INTL',8),
 (4523,'2006-01-09','20.3700','22.0500','20.3700','21.4200',188660,'21.4200','0.048972','INTL',8),
 (4524,'2006-01-03','19.5000','20.4500','19.0300','20.4200',114300,'20.4200','0.043434','INTL',8),
 (4525,'2005-12-27','20.0500','20.3900','19.5100','19.5700',98275,'19.5700','-0.022966','INTL',8),
 (4526,'2005-12-19','19.7400','20.2400','19.5000','20.1100',133520,'20.0300','0.025077','INTL',8),
 (4528,'2006-01-30','27.8200','28.3800','27.5500','27.6800',80590674,'27.6800','-0.003958','MSFT',9);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4529,'2006-01-23','26.4100','27.9500','26.2200','27.7900',74813680,'27.7900','0.052253','MSFT',9),
 (4530,'2006-01-17','26.9000','27.2400','26.2600','26.4100',62619076,'26.4100','-0.028687','MSFT',9),
 (4531,'2006-01-09','26.9300','27.3900','26.5900','27.1900',55616080,'27.1900','0.010405','MSFT',9),
 (4532,'2006-01-03','26.2500','27.1300','26.1000','26.9100',71789275,'26.9100','0.029063','MSFT',9),
 (4533,'2005-12-27','26.6800','26.8500','26.1000','26.1500',39200875,'26.1500','-0.018393','MSFT',9),
 (4534,'2005-12-19','26.8200','26.9100','26.4200','26.6400',65881537,'26.6400','-0.009665','MSFT',9),
 (4536,'2006-01-30','102.4000','104.2000','101.6500','102.1000',344975,'102.1000','-0.003319','TM',10),
 (4537,'2006-01-23','103.2800','104.2100','101.4200','102.4400',445320,'102.4400','-0.001170','TM',10),
 (4538,'2006-01-17','102.0000','104.5900','99.9300','102.5600',722475,'102.5600','-0.016494','TM',10),
 (4539,'2006-01-09','107.6800','108.2500','103.8300','104.2800',571920,'104.2800','-0.027964','TM',10);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4540,'2006-01-03','105.8000','107.3600','105.0100','107.2800',504575,'107.2800','0.025425','TM',10),
 (4541,'2005-12-27','101.6800','104.9000','101.1300','104.6200',629025,'104.6200','0.009066','TM',10),
 (4542,'2005-12-19','98.7500','103.6800','98.2300','103.6800',494840,'103.6800','0.054945','TM',10),
 (4544,'2006-01-30','429.2300','439.6000','387.5200','396.0400',17396275,'396.0400','-0.086392','GOOG',12),
 (4545,'2006-01-23','407.3800','454.2300','405.7300','433.4900',15664820,'433.4900','0.085190','GOOG',12),
 (4546,'2006-01-17','463.0600','469.9000','394.7400','399.4600',21102500,'399.4600','-0.143249','GOOG',12),
 (4547,'2006-01-09','466.4100','475.1100','460.9400','466.2500',9735660,'466.2500','0.001267','GOOG',12),
 (4548,'2006-01-03','422.5200','470.5000','418.2200','465.6600',14243200,'465.6600','0.122451','GOOG',12),
 (4549,'2005-12-27','431.8600','431.8600','413.7400','414.8600',7088400,'414.8600','-0.037291','GOOG',12),
 (4550,'2005-12-19','432.2000','446.2100','420.1100','430.9300',11077020,'430.9300','0.001813','GOOG',12);
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
 (14,'f8b171794a19fd68c138f1713a9830f3','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-02-03 09:58:13');
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
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

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
  `status` varchar(10) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mg_unique` (`memory`,`greed`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`investors`
--

/*!40000 ALTER TABLE `investors` DISABLE KEYS */;
INSERT INTO `investors` (`id`,`memory`,`greed`,`status`) VALUES 
 (526,1,-100,'Calculated'),
 (527,1,-50,'Calculated'),
 (528,1,0,'Calculated'),
 (529,1,50,'Calculated'),
 (530,1,100,'Calculated'),
 (531,2,-100,'Calculated'),
 (532,2,-50,'Calculated'),
 (533,2,0,'Calculated'),
 (534,2,50,'Calculated'),
 (535,2,100,'Calculated'),
 (536,3,-100,'Calculated'),
 (537,3,-50,'Calculated'),
 (538,3,0,'Calculated'),
 (539,3,50,'Calculated'),
 (540,3,100,'Calculated'),
 (541,4,-100,'Calculated'),
 (542,4,-50,'Calculated'),
 (543,4,0,'Calculated'),
 (544,4,50,'Calculated'),
 (545,4,100,'Calculated'),
 (546,5,-100,'Calculated'),
 (547,5,-50,'Calculated'),
 (548,5,0,'Calculated'),
 (549,5,50,'Calculated'),
 (550,5,100,'Calculated');
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
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

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
  `status` varchar(10) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mc_unique` (`memory`,`confidence`,`concentration`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`pms`
--

/*!40000 ALTER TABLE `pms` DISABLE KEYS */;
INSERT INTO `pms` (`id`,`memory`,`confidence`,`concentration`,`status`) VALUES 
 (550,2,1,NULL,'Calculated'),
 (551,2,2,NULL,'Calculated'),
 (552,2,3,NULL,'Calculated'),
 (553,2,4,NULL,'Calculated'),
 (554,2,5,NULL,'Calculated'),
 (555,3,1,NULL,'Calculated'),
 (556,3,2,NULL,'Calculated'),
 (557,3,3,NULL,'Calculated'),
 (558,3,4,NULL,'Calculated'),
 (559,3,5,NULL,'Calculated'),
 (560,4,1,NULL,'Calculated'),
 (561,4,2,NULL,'Calculated'),
 (562,4,3,NULL,'Calculated'),
 (563,4,4,NULL,'Calculated'),
 (564,4,5,NULL,'Calculated'),
 (565,5,1,NULL,'Calculated'),
 (566,5,2,NULL,'Calculated'),
 (567,5,3,NULL,'Calculated'),
 (568,5,4,NULL,'Calculated'),
 (569,5,5,NULL,'Calculated');
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
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

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
  `status` varchar(10) default NULL,
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
 (11,'GOOG','Google','USD',NULL,'Imported',NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `evolution_production`.`quotes`
--

/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3915,'2006-01-23','76.1000','79.5600','71.9300','72.3300',41599625,'72.3300','-0.049400','AAPL',1),
 (3916,'2006-01-17','85.7000','86.3800','75.8300','76.0900',43454175,'76.0900','-0.111000','AAPL',1),
 (3917,'2006-01-09','76.7300','86.4000','75.7400','85.5900',46470140,'85.5900','0.121800','AAPL',1),
 (3918,'2006-01-03','72.3800','76.7000','72.2500','76.3000',23042125,'76.3000','0.061300','AAPL',1),
 (3919,'2005-12-27','74.0000','75.1800','70.3400','71.8900',18776725,'71.8900','-0.019900','AAPL',1),
 (3920,'2005-12-19','71.1100','74.4900','71.0400','73.3500',14890060,'73.3500','0.031500','AAPL',1),
 (3921,'2005-12-12','74.8700','75.4600','70.2700','71.1100',26441860,'71.1100','-0.043300','AAPL',1),
 (3922,'2005-12-05','71.9500','74.8300','71.4900','74.3300',24757500,'74.3300','0.023400','AAPL',1),
 (3923,'2005-11-28','70.7200','72.7400','67.3500','72.6300',30102020,'72.6300','0.047400','AAPL',1),
 (3924,'2005-11-21','64.8200','69.5400','63.7200','69.3400',17257675,'69.3400','0.074000','AAPL',1);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3925,'2005-11-14','61.5400','65.8800','60.9100','64.5600',20660420,'64.5600','0.049100','AAPL',1),
 (3926,'2005-11-07','60.8500','62.1100','59.0100','61.5400',19688000,'61.5400','0.006400','AAPL',1),
 (3927,'2005-10-31','55.2000','62.3200','54.7500','61.1500',30785780,'61.1500','0.122600','AAPL',1),
 (3928,'2005-10-24','55.2500','57.5600','54.1700','54.4700',20627160,'54.4700','-0.021400','AAPL',1),
 (3929,'2005-10-17','53.9800','56.9800','51.2100','55.6600',31354240,'55.6600','0.030700','AAPL',1),
 (3930,'2005-10-10','51.7600','54.3500','47.8700','54.0000',52371460,'54.0000','0.052600','AAPL',1),
 (3931,'2005-10-03','54.1600','55.3500','50.5500','51.3000',22094300,'51.3000','-0.043100','AAPL',1),
 (3932,'2005-09-26','54.0300','54.5600','50.5900','53.6100',22730640,'53.6100','0.007700','AAPL',1),
 (3933,'2005-09-19','51.0500','53.8100','51.0500','53.2000',21860660,'53.2000','0.038900','AAPL',1),
 (3934,'2005-09-12','51.1000','51.6300','49.3300','51.2100',17330480,'51.2100','-0.001900','AAPL',1);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3935,'2005-09-06','46.7000','51.3500','46.5500','51.3100',27678350,'51.3100','0.110100','AAPL',1),
 (3936,'2005-08-29','45.2700','47.1700','45.2600','46.2200',12548280,'46.2200','0.010500','AAPL',1),
 (3937,'2005-08-22','46.1500','47.1200','45.2600','45.7400',12805140,'45.7400','-0.002000','AAPL',1),
 (3938,'2005-08-15','46.4800','48.3300','45.7500','45.8300',21022880,'45.8300','-0.005900','AAPL',1),
 (3940,'2006-01-23','38.6300','39.4500','37.7900','38.7700',5703350,'38.7700','0.008800','ADBE',2),
 (3941,'2006-01-17','38.7000','40.8500','38.2700','38.4300',5253850,'38.4300','-0.010600','ADBE',2),
 (3942,'2006-01-09','39.0500','39.9700','37.8700','38.8400',6226420,'38.8400','-0.004100','ADBE',2),
 (3943,'2006-01-03','37.2000','39.0200','36.1300','39.0000',8635525,'39.0000','0.055200','ADBE',2),
 (3944,'2005-12-27','37.4500','37.6500','36.6000','36.9600',2966250,'36.9600','-0.004000','ADBE',2),
 (3945,'2005-12-19','38.5100','39.1100','36.9100','37.1100',6604320,'37.1100','-0.044000','ADBE',2);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3946,'2005-12-12','35.6900','39.3400','33.7500','38.8200',12544960,'38.8200','0.090400','ADBE',2),
 (3947,'2005-12-05','34.6000','37.2500','34.4900','35.6000',12120980,'35.6000','0.018000','ADBE',2),
 (3948,'2005-11-28','33.7300','35.6800','32.0900','34.9700',7935720,'34.9700','0.031300','ADBE',2),
 (3949,'2005-11-21','33.6400','33.9800','32.8900','33.9100',3296400,'33.9100','0.012200','ADBE',2),
 (3950,'2005-11-14','32.8100','34.2400','32.6900','33.5000',4725440,'33.5000','0.017900','ADBE',2),
 (3951,'2005-11-07','32.5900','33.1000','31.9500','32.9100',3304500,'32.9100','0.014200','ADBE',2),
 (3952,'2005-10-31','32.1700','33.2000','31.8000','32.4500',5431920,'32.4500','0.004300','ADBE',2),
 (3953,'2005-10-24','31.0100','33.6400','30.9400','32.3100',8905180,'32.3100','0.035200','ADBE',2),
 (3954,'2005-10-17','29.9400','31.2800','29.6600','31.2100',6704940,'31.2100','0.042400','ADBE',2),
 (3955,'2005-10-10','29.0400','30.0300','27.8600','29.9400',5839080,'29.9400','0.027100','ADBE',2);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3956,'2005-10-03','29.5500','30.6600','28.5900','29.1500',6118980,'29.1500','-0.023500','ADBE',2),
 (3957,'2005-09-26','28.2200','29.9900','27.9100','29.8500',5329960,'29.8500','0.063000','ADBE',2),
 (3958,'2005-09-19','29.2700','29.2700','27.1600','28.0800',4877700,'28.0800','-0.045900','ADBE',2),
 (3959,'2005-09-12','27.4000','29.5800','26.6700','29.4300',8839360,'29.4300','0.078000','ADBE',2),
 (3960,'2005-09-06','26.7500','28.1000','26.7000','27.3000',3719575,'27.3000','0.024800','ADBE',2),
 (3961,'2005-08-29','27.2700','27.4400','26.5400','26.6400',3581980,'26.6400','-0.032300','ADBE',2),
 (3962,'2005-08-22','26.2000','28.2300','26.0000','27.5300',5601760,'27.5300','0.052400','ADBE',2),
 (3963,'2005-08-15','26.8800','27.0800','26.0100','26.1600',5005680,'26.1600','-0.025300','ADBE',2),
 (3965,'2006-01-23','58.6900','60.2500','58.1400','58.7200',76925,'58.7200','0.002600','BMO',3),
 (3966,'2006-01-17','60.0200','60.1900','58.1100','58.5700',38150,'58.5700','-0.024600','BMO',3);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3967,'2006-01-09','56.4000','60.0800','56.3200','60.0500',50740,'60.0500','0.050600','BMO',3),
 (3968,'2006-01-03','55.7100','58.5100','55.7100','57.1600',58975,'57.1600','0.021800','BMO',3),
 (3969,'2005-12-27','55.3800','56.0000','55.1000','55.9400',16500,'55.9400','0.010100','BMO',3),
 (3970,'2005-12-19','54.8000','55.6100','54.3600','55.3800',35320,'55.3800','0.007800','BMO',3),
 (3971,'2005-12-12','54.6700','55.1300','53.7500','54.9500',35820,'54.9500','0.008300','BMO',3),
 (3972,'2005-12-05','54.1000','55.1000','53.9700','54.5000',34220,'54.5000','0.007800','BMO',3),
 (3973,'2005-11-28','52.2800','54.5000','52.0900','54.0800',76040,'54.0800','0.029300','BMO',3),
 (3974,'2005-11-21','49.7500','52.6700','49.7500','52.5400',37750,'52.5400','0.067000','BMO',3),
 (3975,'2005-11-14','48.9000','49.3700','48.4600','49.2400',19220,'49.2400','0.005900','BMO',3),
 (3976,'2005-11-07','48.1000','49.0500','47.9000','48.9500',33480,'48.9500','0.009900','BMO',3);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3977,'2005-10-31','48.9000','49.3900','48.2600','48.4700',20260,'48.4700','0.004800','BMO',3),
 (3978,'2005-10-24','47.7700','48.8300','47.5500','48.6500',23240,'48.2400','0.016200','BMO',3),
 (3979,'2005-10-17','48.6200','48.6300','47.5800','47.8700',32620,'47.4700','-0.011200','BMO',3),
 (3980,'2005-10-10','48.4000','49.0000','48.0500','48.4200',22840,'48.0100','-0.004100','BMO',3),
 (3981,'2005-10-03','49.8000','49.8000','48.1900','48.6200',130720,'48.2100','-0.023700','BMO',3),
 (3982,'2005-09-26','50.0000','51.0000','49.2600','49.8000',34460,'49.3800','-0.004600','BMO',3),
 (3983,'2005-09-19','48.9700','50.1500','48.8700','50.0300',21060,'49.6100','0.024200','BMO',3),
 (3984,'2005-09-12','48.6600','49.2500','48.2600','48.8500',25280,'48.4400','0.001700','BMO',3),
 (3985,'2005-09-06','48.8000','49.2700','48.2600','48.7700',28025,'48.3600','0.002100','BMO',3),
 (3986,'2005-08-29','48.0500','49.3100','47.8500','48.6700',35860,'48.2600','0.010500','BMO',3);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3987,'2005-08-22','50.1000','50.2900','48.0800','48.1700',46080,'47.7600','-0.036100','BMO',3),
 (3988,'2005-08-15','50.3500','51.6200','49.2500','49.9700',33160,'49.5500','-0.007600','BMO',3),
 (3990,'2006-01-23','30.0700','30.6200','28.9400','29.3100',24096425,'29.3100','-0.021700','DELL',4),
 (3991,'2006-01-17','30.2200','30.7600','29.2500','29.9600',25979325,'29.9600','-0.020300','DELL',4),
 (3992,'2006-01-09','30.5900','31.5100','30.4600','30.5800',16340120,'30.5800','-0.002000','DELL',4),
 (3993,'2006-01-03','30.0100','31.0400','29.9500','30.6400',21949850,'30.6400','0.023000','DELL',4),
 (3994,'2005-12-27','31.2900','31.4400','29.8400','29.9500',12896400,'29.9500','-0.039100','DELL',4),
 (3995,'2005-12-19','32.4500','32.6700','30.7100','31.1700',16049220,'31.1700','-0.042400','DELL',4),
 (3996,'2005-12-12','32.4600','33.2200','32.1700','32.5500',24018080,'32.5500','0.011800','DELL',4),
 (3997,'2005-12-05','31.2700','32.2700','31.0600','32.1700',22935720,'32.1700','0.043800','DELL',4);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (3998,'2005-11-28','30.3800','31.1600','30.1200','30.8200',20369340,'30.8200','0.016200','DELL',4),
 (3999,'2005-11-21','29.9800','30.5700','29.8500','30.3300',18008975,'30.3300','0.016100','DELL',4),
 (4000,'2005-11-14','29.4700','30.0900','29.1100','29.8500',23978940,'29.8500','0.015300','DELL',4),
 (4001,'2005-11-07','29.6900','29.8400','28.6200','29.4000',28321900,'29.4000','-0.012100','DELL',4),
 (4002,'2005-10-31','30.9900','32.1500','28.8100','29.7600',43274240,'29.7600','-0.041900','DELL',4),
 (4003,'2005-10-24','31.9800','32.3500','30.8200','31.0600',16864140,'31.0600','-0.030900','DELL',4),
 (4004,'2005-10-17','33.0000','33.3400','31.5000','32.0500',18461060,'32.0500','-0.026700','DELL',4),
 (4005,'2005-10-10','32.4200','33.2900','32.3500','32.9300',16605140,'32.9300','0.026500','DELL',4),
 (4006,'2005-10-03','34.1100','34.2700','31.5400','32.0800',27862640,'32.0800','-0.062000','DELL',4),
 (4007,'2005-09-26','34.1400','34.7100','33.7000','34.2000',14934760,'34.2000','0.003200','DELL',4);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4008,'2005-09-19','34.7500','34.7500','33.2400','34.0900',18895880,'34.0900','-0.022100','DELL',4),
 (4009,'2005-09-12','34.8400','35.2500','34.4600','34.8600',16523080,'34.8600','0.006100','DELL',4),
 (4010,'2005-09-06','35.0500','35.6800','34.4400','34.6500',19463350,'34.6500','-0.009400','DELL',4),
 (4011,'2005-08-29','35.1200','35.6600','34.9200','34.9800',13654260,'34.9800','-0.009600','DELL',4),
 (4012,'2005-08-22','36.5000','36.8500','35.2800','35.3200',21098480,'35.3200','-0.029400','DELL',4),
 (4013,'2005-08-15','36.5500','37.1300','36.3400','36.3900',25251820,'36.3900','-0.006800','DELL',4),
 (4015,'2006-01-23','33.5300','33.6700','32.6500','33.0200',46382500,'33.0200','-0.010500','GE',5),
 (4016,'2006-01-17','35.6300','35.6300','33.2200','33.3700',38403175,'33.3700','-0.049300','GE',5),
 (4017,'2006-01-09','35.4000','35.5500','34.8000','35.1000',20705520,'35.1000','-0.010400','GE',5),
 (4018,'2006-01-03','35.1000','35.5300','34.8000','35.4700',24545000,'35.4700','0.012000','GE',5);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4019,'2005-12-27','35.5700','35.6000','34.9500','35.0500',17016950,'35.0500','-0.010400','GE',5),
 (4020,'2005-12-19','36.0000','36.1100','35.1700','35.4200',18623640,'35.4200','-0.010600','GE',5),
 (4021,'2005-12-12','35.6600','36.2600','35.3500','36.0600',25957280,'35.8000','0.014700','GE',5),
 (4022,'2005-12-05','35.4200','36.1000','35.2700','35.5300',23626700,'35.2800','0.000900','GE',5),
 (4023,'2005-11-28','36.2000','36.2300','35.2600','35.5000',22627400,'35.2500','-0.019200','GE',5),
 (4024,'2005-11-21','35.7600','36.3400','35.6500','36.2000',21620650,'35.9400','0.012400','GE',5),
 (4025,'2005-11-14','34.6600','35.8000','34.2900','35.7500',24191240,'35.5000','0.032000','GE',5),
 (4026,'2005-11-07','34.1000','34.7800','33.7100','34.6500',18088440,'34.4000','0.018400','GE',5),
 (4027,'2005-10-31','34.0000','34.1500','33.5100','34.0200',20854060,'33.7800','-0.000900','GE',5),
 (4028,'2005-10-24','33.7600','34.2000','33.4100','34.0500',19126420,'33.8100','0.009600','GE',5);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4029,'2005-10-17','34.2100','34.5000','33.6500','33.7300',21962100,'33.4900','-0.017900','GE',5),
 (4030,'2005-10-10','34.2300','34.4800','33.5800','34.3400',20435260,'34.1000','0.003500','GE',5),
 (4031,'2005-10-03','33.6000','34.3000','32.6700','34.2200',27314680,'33.9800','0.016500','GE',5),
 (4032,'2005-09-26','33.5800','33.8400','33.0800','33.6700',20289960,'33.4300','0.008100','GE',5),
 (4033,'2005-09-19','34.3000','34.3300','33.1600','33.4000',20426580,'33.1600','-0.024700','GE',5),
 (4034,'2005-09-12','34.0000','34.5800','33.9900','34.4700',24212960,'34.0000','0.014300','GE',5),
 (4035,'2005-09-06','33.4500','34.2300','33.4500','33.9800',21681750,'33.5200','0.019500','GE',5),
 (4036,'2005-08-29','33.1700','33.6800','32.8500','33.3300',23936720,'32.8800','-0.001500','GE',5),
 (4037,'2005-08-22','34.0700','34.2400','33.3100','33.3800',16464640,'32.9300','-0.016700','GE',5),
 (4038,'2005-08-15','34.1200','34.3800','33.8600','33.9500',14719360,'33.4900','-0.008600','GE',5);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4040,'2006-01-23','81.3300','82.1500','80.5900','80.7200',6591900,'80.7200','-0.007900','IBM',7),
 (4041,'2006-01-17','82.8000','84.7000','81.2500','81.3600',8698125,'81.3600','-0.021800','IBM',7),
 (4042,'2006-01-09','83.9000','84.8100','82.5000','83.1700',6034640,'83.1700','-0.021000','IBM',7),
 (4043,'2006-01-03','82.4500','85.0300','80.8100','84.9500',9239550,'84.9500','0.033500','IBM',7),
 (4044,'2005-12-27','83.4800','84.5000','81.5600','82.2000',4405500,'82.2000','-0.015300','IBM',7),
 (4045,'2005-12-19','83.2300','84.2000','82.0600','83.4800',5459640,'83.4800','0.001300','IBM',7),
 (4046,'2005-12-12','87.0100','87.3500','82.7500','83.3700',7861060,'83.3700','-0.041400','IBM',7),
 (4047,'2005-12-05','88.4000','89.9200','86.3300','86.9700',5285560,'86.9700','-0.019000','IBM',7),
 (4048,'2005-11-28','88.8000','89.9400','88.3600','88.6500',5153080,'88.6500','-0.001700','IBM',7),
 (4049,'2005-11-21','87.6000','89.3900','86.8800','88.8000',4548275,'88.8000','0.011700','IBM',7);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4050,'2005-11-14','84.2500','88.0000','84.0300','87.7700',6143900,'87.7700','0.038100','IBM',7),
 (4051,'2005-11-07','83.1000','84.8400','82.3000','84.5500',4352520,'84.5500','0.021100','IBM',7),
 (4052,'2005-10-31','81.5100','83.3000','80.6400','83.0000',6230800,'82.8000','0.019300','IBM',7),
 (4053,'2005-10-24','83.1500','83.9500','80.5000','81.4200',5158680,'81.2300','-0.022900','IBM',7),
 (4054,'2005-10-17','82.3600','84.6000','81.9300','83.3300',7857220,'83.1300','0.011900','IBM',7),
 (4055,'2005-10-10','81.2400','83.5200','81.0800','82.3500',7269860,'82.1500','0.022900','IBM',7),
 (4056,'2005-10-03','80.2200','81.4700','78.7000','80.5000',6184360,'80.3100','0.003500','IBM',7),
 (4057,'2005-09-26','78.3100','80.5500','76.9300','80.2200',6023340,'80.0300','0.028500','IBM',7),
 (4058,'2005-09-19','79.7400','79.9800','77.3000','78.0000',6340360,'77.8100','-0.029100','IBM',7),
 (4059,'2005-09-12','81.0300','82.1100','79.6700','80.3300',5022080,'80.1400','-0.013700','IBM',7);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4060,'2005-09-06','79.7000','81.5200','79.7000','81.4400',4670325,'81.2500','0.025000','IBM',7),
 (4061,'2005-08-29','80.0000','81.7500','79.3400','79.4600',5034300,'79.2700','-0.011500','IBM',7),
 (4062,'2005-08-22','82.7500','83.3500','80.2600','80.3800',4442100,'80.1900','-0.028700','IBM',7),
 (4063,'2005-08-15','81.9000','83.3000','80.8000','82.7600',4577160,'82.5600','0.007000','IBM',7),
 (4065,'2006-01-23','21.5300','22.1800','21.0900','22.1800',131500,'22.1800','0.038400','INTL',8),
 (4066,'2006-01-17','21.3000','22.7300','20.8000','21.3600',249625,'21.3600','-0.002800','INTL',8),
 (4067,'2006-01-09','20.3700','22.0500','20.3700','21.4200',188660,'21.4200','0.049000','INTL',8),
 (4068,'2006-01-03','19.5000','20.4500','19.0300','20.4200',114300,'20.4200','0.043400','INTL',8),
 (4069,'2005-12-27','20.0500','20.3900','19.5100','19.5700',98275,'19.5700','-0.023000','INTL',8),
 (4070,'2005-12-19','19.7400','20.2400','19.5000','20.1100',133520,'20.0300','0.025100','INTL',8);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4071,'2005-12-12','20.3100','20.5900','19.5500','19.6200',168160,'19.5400','-0.037000','INTL',8),
 (4072,'2005-12-05','20.8900','20.9100','19.9200','20.3700',110860,'20.2900','-0.019800','INTL',8),
 (4073,'2005-11-28','20.6300','21.0000','20.0500','20.7800',122260,'20.7000','0.001500','INTL',8),
 (4074,'2005-11-21','20.5100','21.0100','20.4000','20.7500',117000,'20.6700','0.009300','INTL',8),
 (4075,'2005-11-14','19.8900','20.9300','19.4500','20.5600',147160,'20.4800','0.037500','INTL',8),
 (4076,'2005-11-07','19.7200','20.0000','19.3200','19.8200',139580,'19.7400','0.002500','INTL',8),
 (4077,'2005-10-31','18.4600','20.0900','18.1800','19.7700',186600,'19.6900','0.074200','INTL',8),
 (4078,'2005-10-24','18.6600','18.9000','18.1200','18.4100',308480,'18.3300','-0.010300','INTL',8),
 (4079,'2005-10-17','18.9300','19.3800','18.5000','18.6000',201140,'18.5200','-0.012800','INTL',8),
 (4080,'2005-10-10','19.0500','19.2700','18.1500','18.8400',281260,'18.7600','-0.002700','INTL',8);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4081,'2005-10-03','20.1000','20.4400','18.7700','18.8900',320580,'18.8100','-0.100400','INTL',8),
 (4082,'2005-09-26','20.7900','21.4100','20.6300','21.0000',160480,'20.9100','0.021000','INTL',8),
 (4083,'2005-09-19','20.5500','21.0200','20.0000','20.6400',187260,'20.4800','0.002000','INTL',8),
 (4084,'2005-09-12','21.6000','22.2500','20.5000','20.6000',196980,'20.4400','-0.048400','INTL',8),
 (4085,'2005-09-06','22.1100','22.4500','21.3700','21.6500',166700,'21.4800','-0.021900','INTL',8),
 (4086,'2005-08-29','22.0000','22.1900','21.7200','22.1300',116620,'21.9600','0.001400','INTL',8),
 (4087,'2005-08-22','22.3000','22.6400','21.8400','22.1000',141840,'21.9300','-0.009900','INTL',8),
 (4088,'2005-08-15','22.3500','22.9400','21.8000','22.3300',130400,'22.1500','-0.004900','INTL',8),
 (4090,'2006-01-23','26.4100','26.7200','26.2200','26.5000',59886924,'26.5000','0.003400','MSFT',9),
 (4091,'2006-01-17','26.9000','27.2400','26.2600','26.4100',62619076,'26.4100','-0.028700','MSFT',9);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4092,'2006-01-09','26.9300','27.3900','26.5900','27.1900',55616080,'27.1900','0.010400','MSFT',9),
 (4093,'2006-01-03','26.2500','27.1300','26.1000','26.9100',71789275,'26.9100','0.029100','MSFT',9),
 (4094,'2005-12-27','26.6800','26.8500','26.1000','26.1500',39200875,'26.1500','-0.018400','MSFT',9),
 (4095,'2005-12-19','26.8200','26.9100','26.4200','26.6400',65881537,'26.6400','-0.009700','MSFT',9),
 (4096,'2005-12-12','27.7000','27.7500','26.8100','26.9000',80135899,'26.9000','-0.029200','MSFT',9),
 (4097,'2005-12-05','27.9300','28.0200','27.5500','27.7100',56295820,'27.7100','-0.010700','MSFT',9),
 (4098,'2005-11-28','27.7900','28.1000','27.5300','28.0100',55793600,'28.0100','0.009000','MSFT',9),
 (4099,'2005-11-21','28.0700','28.2400','27.4700','27.7600',71167873,'27.7600','-0.011000','MSFT',9),
 (4100,'2005-11-14','27.3600','28.2500','27.2000','28.0700',77058499,'28.0700','0.032000','MSFT',9),
 (4101,'2005-11-07','26.7200','27.3900','26.6400','27.2800',64403800,'27.2000','0.023300','MSFT',9);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4102,'2005-10-31','25.6100','26.7100','25.5000','26.6600',70489040,'26.5800','0.044000','MSFT',9),
 (4103,'2005-10-24','24.8900','25.6000','24.6800','25.5300',63896399,'25.4600','0.030400','MSFT',9),
 (4104,'2005-10-17','24.6800','25.1300','24.4400','24.7800',62217780,'24.7100','0.004500','MSFT',9),
 (4105,'2005-10-10','24.6700','24.7300','24.2500','24.6700',64156259,'24.6000','0.003300','MSFT',9),
 (4106,'2005-10-03','25.7100','25.7300','24.5200','24.5900',82637121,'24.5200','-0.044100','MSFT',9),
 (4107,'2005-09-26','25.4000','26.0000','25.2100','25.7300',60094520,'25.6500','0.017900','MSFT',9),
 (4108,'2005-09-19','26.0900','26.2700','25.1200','25.2700',65773839,'25.2000','-0.030400','MSFT',9),
 (4109,'2005-09-12','26.6200','26.7600','25.9700','26.0700',81336900,'25.9900','-0.019200','MSFT',9),
 (4110,'2005-09-06','27.0600','27.2900','26.5200','26.5800',46203300,'26.5000','-0.016300','MSFT',9),
 (4111,'2005-08-29','26.8100','27.4400','26.8100','27.0200',60140619,'26.9400','0.001900','MSFT',9);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4112,'2005-08-22','26.7900','27.1700','26.7400','26.9700',45942860,'26.8900','0.009400','MSFT',9),
 (4113,'2005-08-15','26.9800','27.3000','26.6600','26.7200',44437940,'26.6400','-0.009300','MSFT',9),
 (4115,'2006-01-23','103.2800','104.2100','101.4200','102.8000',463550,'102.8000','0.002300','TM',10),
 (4116,'2006-01-17','102.0000','104.5900','99.9300','102.5600',722475,'102.5600','-0.016500','TM',10),
 (4117,'2006-01-09','107.6800','108.2500','103.8300','104.2800',571920,'104.2800','-0.028000','TM',10),
 (4118,'2006-01-03','105.8000','107.3600','105.0100','107.2800',504575,'107.2800','0.025400','TM',10),
 (4119,'2005-12-27','101.6800','104.9000','101.1300','104.6200',629025,'104.6200','0.009100','TM',10),
 (4120,'2005-12-19','98.7500','103.6800','98.2300','103.6800',494840,'103.6800','0.054900','TM',10),
 (4121,'2005-12-12','96.9900','98.9100','96.8600','98.2800',364920,'98.2800','0.013700','TM',10),
 (4122,'2005-12-05','97.8300','98.1200','96.0500','96.9500',362000,'96.9500','-0.008900','TM',10);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4123,'2005-11-28','99.7200','100.7700','96.7500','97.8200',466720,'97.8200','-0.004700','TM',10),
 (4124,'2005-11-21','99.3000','100.8000','98.0800','98.2800',456950,'98.2800','-0.003900','TM',10),
 (4125,'2005-11-14','90.0900','98.8800','89.8000','98.6600',356520,'98.6600','0.083900','TM',10),
 (4126,'2005-11-07','91.4500','92.0000','90.3400','91.0200',333500,'91.0200','-0.013300','TM',10),
 (4127,'2005-10-31','92.2200','93.8300','91.5100','92.2500',299560,'92.2500','0.011000','TM',10),
 (4128,'2005-10-24','87.7000','91.3700','87.6200','91.2500',271840,'91.2500','0.045400','TM',10),
 (4129,'2005-10-17','92.1500','92.6800','86.0400','87.2900',517840,'87.2900','-0.052300','TM',10),
 (4130,'2005-10-10','90.7600','92.3800','89.2600','92.1100',345600,'92.1100','0.016900','TM',10),
 (4131,'2005-10-03','92.9400','93.5000','87.0000','90.5800',384880,'90.5800','-0.019400','TM',10),
 (4132,'2005-09-26','89.0000','94.3300','87.2000','92.3700',460080,'92.3700','0.074800','TM',10);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4133,'2005-09-19','86.7500','88.0400','85.6600','86.6400',413660,'85.9400','-0.001300','TM',10),
 (4134,'2005-09-12','85.2000','86.9400','84.9700','86.7500',326840,'86.0500','0.018800','TM',10),
 (4135,'2005-09-06','83.0000','85.2000','83.0000','85.1500',362475,'84.4600','0.037700','TM',10),
 (4136,'2005-08-29','78.6000','82.2600','78.6000','82.0600',241500,'81.3900','0.000600','TM',10),
 (4137,'2005-08-22','80.6800','82.8400','80.6500','82.0000',318100,'81.3400','0.035400','TM',10),
 (4138,'2005-08-15','79.2000','79.8900','78.5600','79.2000',207460,'78.5600','-0.010000','TM',10),
 (4140,'2006-01-23','407.3800','454.2300','405.7300','434.2700',17467975,'434.2700','0.087100','GOOG',11),
 (4141,'2006-01-17','463.0600','469.9000','394.7400','399.4600',21102500,'399.4600','-0.143200','GOOG',11),
 (4142,'2006-01-09','466.4100','475.1100','460.9400','466.2500',9735660,'466.2500','0.001300','GOOG',11),
 (4143,'2006-01-03','422.5200','470.5000','418.2200','465.6600',14243200,'465.6600','0.122500','GOOG',11);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4144,'2005-12-27','431.8600','431.8600','413.7400','414.8600',7088400,'414.8600','-0.037300','GOOG',11),
 (4145,'2005-12-19','432.2000','446.2100','420.1100','430.9300',11077020,'430.9300','0.001800','GOOG',11),
 (4146,'2005-12-12','414.6300','432.5000','409.9500','430.1500',8822760,'430.1500','0.051200','GOOG',11),
 (4147,'2005-12-05','417.0000','417.5000','399.0100','409.2000',10724700,'409.2000','-0.020300','GOOG',11),
 (4148,'2005-11-28','429.8200','431.2400','395.5600','417.7000',13077840,'417.7000','-0.025500','GOOG',11),
 (4149,'2005-11-21','399.1700','428.7500','393.4900','428.6200',8714050,'428.6200','0.071000','GOOG',11),
 (4150,'2005-11-14','392.1200','404.5000','390.9500','400.2100',8273180,'400.2100','0.025100','GOOG',11),
 (4151,'2005-11-07','395.1000','397.4700','377.4300','390.4000',8829700,'390.4000','-0.000100','GOOG',11),
 (4152,'2005-10-31','360.2400','391.7900','359.5100','390.4300',11507540,'390.4300','0.090100','GOOG',11),
 (4153,'2005-10-24','343.3700','358.9500','342.1900','358.1700',7251080,'358.1700','0.053800','GOOG',11);
INSERT INTO `quotes` (`id`,`date`,`open`,`high`,`low`,`close`,`volume`,`adjusted_close`,`rate_of_return`,`ticker`,`profile_id`) VALUES 
 (4154,'2005-10-17','297.5000','346.4300','294.5600','339.9000',11691860,'339.9000','0.147800','GOOG',11),
 (4155,'2005-10-10','313.3100','314.8200','290.6800','296.1400',8501560,'296.1400','-0.053800','GOOG',11),
 (4156,'2005-10-03','313.6300','321.2800','308.0000','312.9900',8279420,'312.9900','-0.011000','GOOG',11),
 (4157,'2005-09-26','319.5000','320.9500','305.6000','316.4600',7906000,'316.4600','0.003500','GOOG',11),
 (4158,'2005-09-19','301.0000','319.2200','300.7100','315.3600',9344560,'315.3600','0.050500','GOOG',11),
 (4159,'2005-09-12','301.7500','315.5300','297.9100','300.2000',11001640,'300.2000','0.003700','GOOG',11),
 (4160,'2005-09-06','289.0000','299.2800','285.2800','299.0900',5678900,'299.0900','0.036900','GOOG',11),
 (4161,'2005-08-29','282.2400','289.9900','282.2400','288.4500',4381120,'288.4500','0.017200','GOOG',11),
 (4162,'2005-08-22','281.2400','285.0200','273.3500','283.5800',5871940,'283.5800','0.012800','GOOG',11),
 (4163,'2005-08-15','289.8000','292.7700','275.0000','280.0000',7316580,'280.0000','-0.033500','GOOG',11);
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
 (10,'ca99059a483717782d7a6cd334f70484','BAh7CDoLanVtcHRvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2006-01-27 14:33:40');
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
