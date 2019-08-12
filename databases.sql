-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: demos
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `demos`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `demos` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `demos`;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'Manguera',4),(1,'Escalera',20),(1,'Martillo',5),(1,'Destornillador',2);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `User` varchar(20) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'user1','pass1'),(2,'user2','pass2'),(3,'user3','pass3'),(4,'user4','pass4'),(5,'user5','ab');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `foro`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `foro` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `foro`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_description` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_name_unique` (`cat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `post_id` int(8) NOT NULL AUTO_INCREMENT,
  `post_content` text NOT NULL,
  `post_date` datetime NOT NULL,
  `post_topic` int(8) NOT NULL,
  `post_by` int(8) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_topic` (`post_topic`),
  KEY `post_by` (`post_by`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_topic`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`post_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `topic_id` int(8) NOT NULL AUTO_INCREMENT,
  `topic_subject` varchar(255) NOT NULL,
  `topic_date` datetime NOT NULL,
  `topic_cat` int(8) NOT NULL,
  `topic_by` int(8) NOT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topic_cat` (`topic_cat`),
  KEY `topic_by` (`topic_by`),
  CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`topic_cat`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`topic_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_date` datetime NOT NULL,
  `user_level` int(8) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_unique` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test1','b444ac06613fc8d63795be9ad0beaf55011936ac','test1@test.com','2019-04-23 08:37:49',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `forum`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `forum` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `forum`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf16_bin NOT NULL,
  `description` text COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Web Programming','䙯牵洠灯獴⁡扯畴⁷敢⁰牯杲慭浩湧⁬楫攠偈倬⁎潤攮䩓Ⱐ䩁噁Ⱐ偹瑨潮⁥瑣'),(2,'Web Design','D敳楧湩湧⁢敡畴楦畬⁷敢⁰慧敳Ⱐ䍍匬⁰桯瑯獨潰⁤敳楧渠慮搠浯牥');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `body` text COLLATE utf16_bin NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` VALUES (1,2,2,'健牳潮慬汹Ⱐ䤠獴慲瑥搠瑯⁬潯欠慴⁳潭攠數慭灬敳⁡湤⁡晴敲⁉⁢畩汤⁳潭攠捲慰灹⁳楴敳Ⱐ䤠汥慲湥搠煵楴攠睥汬⸠䅳⁡⁲散潭浥湤瑡楯測⁹潵⁣慮⁣桥捫⁨瑴瀺⼯睷眮眳獣桯潬献捯洮⁔桥⁳楴攠楳⁰牥瑴礠捯浰汥瑥','2015-01-17 05:10:17'),(2,2,1,'T桡琠睡猠杲敡琠桥慲楮朠瑨慴⁦牯洠祯甠䅭物琡','2015-01-17 05:10:17'),(3,4,2,'H呍䰠慮搠䍓匠慲攠扡獩挮⁔桥牥⁩猠湯琠浵捨⁩渠瑨敭⁴漠汥慲渮⁌敡牮楮朠桯眠扡獩挠敬敭敮瑳⁩湴敲慣琠楳⁴桥⁭潳琠捯浰汥砠灡牴⁩湣汵摩湧⁣牯獳ⵢ牯睳敲⁣潭灡瑩扩汩瑹','2015-01-17 05:15:21'),(4,3,1,'H呍䰠慮搠䍓匠慲攠扡獩挮⁔桥牥⁩猠湯琠浵捨⁩渠瑨敭⁴漠汥慲渮⁌敡牮楮朠桯眠扡獩挠敬敭敮瑳⁩湴敲慣琠楳⁴桥⁭潳琠捯浰汥砠灡牴⁩湣汵摩湧⁣牯獳ⵢ牯睳敲⁣潭灡瑩扩汩瑹','2015-01-17 05:15:21'),(5,3,2,'周敲攠楳⁮潴⁭畣栠楮⁴桥洠瑯⁬敡牮⸠䱥慲湩湧⁨潷⁢慳楣⁥汥浥湴猠楮瑥牡捴⁩猠瑨攠浯獴⁣潭灬數⁰慲琠楮捬畤楮朠捲潳猭扲潷獥爠捯浰慴楢楬楴礮','2015-01-17 05:15:21'),(6,3,1,'䱥慲湩湧⁨潷⁢慳楣⁥汥浥湴猠楮瑥牡捴⁩猠瑨攠浯獴⁣潭灬數⁰慲琠楮捬畤楮朠捲潳猭扲潷獥爠捯浰慴楢楬楴礮','2015-01-17 05:15:21'),(7,1,2,'䤠摯渧琠畮摥牳瑡湤⁷桡琠祯甠慲攠瑥汬楮朠浥⁴漠牥灬礿','2015-01-17 05:15:21'),(8,1,2,'T桥ⁱ略獴楯渠楳⁳異敲⁣汥慲⸠奯甠湥敤⁴漠牥慤ⁱ略獴楯渠慧慩渠慮搠慧慩渠畮瑩氠祯甠畮摥牳瑡湤','2015-01-17 05:15:21'),(9,4,2,'䤠桡癥⁎敶敲⁨敡牤⁯映却潲敤⁰牯捥摵牥献⁗桡琠慲攠瑨敹⁡捴畡汬礿','2015-01-17 05:15:21'),(10,4,2,'D潥猠偈倠獵灰潲琠瑲楧来牳㼠䤠摯渧琠瑨楮欠瑨敹⁤漮','2015-01-17 05:15:21'),(11,4,1,'呲楧来牳⁡牥⁮潴⁲敬慴敤⁴漠偈倮⁔桥礠慲攠牥污瑥搠瑯⁍祳煬','2015-01-17 05:15:21'),(12,4,1,'䑥晩湩瑥汹⁭祳煬⁤漠獵灰潲琠呲楧来牳⸠周攠晵湣瑩潮慬楴礠睡猠慤摥搠慦瑥爠浹獱氠癥牳楯渠㔮','2015-01-17 05:15:21'),(13,6,1,'䡔䵌㔠慮搠䍓匳⁩猠湥睥爠癥牳楯渠潦⁲敧畬慲⁈呍䰠慮搠䍓匮⁔桥獥⁳異灯牴⁭慮礠湥眠敮桡湣敭敮瑳Ⱐ睨楣栠睯畬搠瑡步⁶敲礠捯浰汥砠灲潧牡浭楮朠潴桥牷楳攮⁈呍䰵⁦敡瑵牥猠湥眠摡瑡⁴祰敳⁩渠楮灵琠景牭猬⁖楤敯⁡湤⁭慮礠浯牥⸠䍓匳⁣潮瑡楮猠愠汯慤⁯映湥眠獴祬楮朠潰瑩潮献','2015-01-18 04:09:30'),(14,5,1,'O扪散琠潲楥湴敤⁰牯杲慭浩湧⁡湤⁐牯捥摵牡氠灲潧牡浭楮朠慲攠獵灰潲瑥搠批⁭潳琠潦⁴桥⁷敢⁳捲楰瑩湧⁬慮杵慧敳⁩湣汵摩湧⁐䡐⸠','2015-01-18 04:09:30'),(15,5,2,'坨楣栠潮攠獨潵汤⁷攠畳政','2015-01-18 04:09:30'),(16,5,1,'奯甠捡渠畳攠慮礠潮攠慣捯牤楮朠瑯⁹潵爠牥煵楲敭敮瑳⸠䥦⁹潵爠灲潪散琠楳⁳浡汬敲⁡湤⁯湬礠湥敤猠晥睥爠汩湥猠潦⁣潤敳Ⱐ祯甠捡渠畳攠灲潣敤畲慬⁳瑹汥⸠䥦⁹潵⁮敥搠浯牥⁣潭灬楣慴敤⁳瑲畣瑵牥Ⱐ住⁩猠牥煵楲敤⁴漠浡湡来⁴桥⁣潭灬數楴礮','2015-01-18 04:09:30'),(17,5,3,'F潲⁡湤⁥硡浰汥⁄䈠捯湮散瑩潮⁴桲潵杨⁏传偄传楳⁭畣栠扥瑴敲⁴桡渠畳楮朠浹獱汩⸠奯甠捡渠牥畳攠住⁣污獳敳⁡癡楬慢汥⁩渠楮瑥牮整⁴漠浡步⁹潵爠灲潪散琠癡特⁦慳琮','2015-01-18 04:09:30'),(18,7,4,'<p>&lt;script&gt;alert(&quot;adios&quot;)&lt;/script&gt;</p>','2019-04-23 09:08:29'),(19,7,4,'<script>alert(\"Hola\")</script>','2019-04-23 09:45:42');
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf16_bin NOT NULL,
  `body` text COLLATE utf16_bin NOT NULL,
  `last_activity` datetime NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,1,1,'Favourite Server-Side Language','W桡琠楳⁹潵爠晡癯物瑥⁳敲癥爭獩摥⁬慮杵慧攠慮搠睨礿','0000-00-00 00:00:00','2015-01-16 10:52:39'),(2,2,1,'How did you Learn CSS and HTML?','䑩癩湧⁩湴漠䍓匠慮搠䡔䵌⁤敳楧渠慮搠摥癥汯灭敮琠楳⁥慳礬⁨潷敶敲⁬敡牮楮朠楴⁴漠灥牦散瑩潮⁩猠癥特⁤慵湴楮朠瑡獫⸠䡯眠摩搠祯甠汥慲渠䍓匠慮搠䡔䵌㼠䡯眠慢潵琠汥慲湩湧⁈呍䰵⁷楴栠䍓匳㼠坨慴⁷敲攠瑨攠獯畲捥猠瑨慴⁹潵⁧潴⁩湦潲浡瑩潮⁡扯畴⁩琿','0000-00-00 00:00:00','2015-01-16 10:52:39'),(3,1,1,'Photoshop design to Web Page','坨慴⁩猠祯畲⁦慶潲楴攠浥獳慧攠瑯⁣桡湧攠愠偨潴潳桯瀠摥獩杮⁴漠愠扥慵瑩晵氠睥扳楴政','0000-00-00 00:00:00','2015-01-16 11:07:30'),(4,2,1,'Mysql Triggers and Stored Procedures','C慮⁷攠睲楴攠瑲楧来牳⁡湤⁳瑯牥搠灲潣敤畲敳⁩渠䵙危氿⁈潷⁴漠睲楴攠瑨慴⁩映楴⁩猠灯獳楢汥㼠','0000-00-00 00:00:00','2015-01-16 11:07:30'),(5,2,2,'Object oriented scripting vs procedural','䍡渠睥⁵獥⁯扪散琠潲楥湴敤⁳捲楰瑩湧⁬慮杵慧攠楮⁷敢⁡灰汩捡瑩潮㼠坨楣栠瑯潬猠慲攠慶慩污扬政⁗桡琠楳⁴桥⁤楦晥牥湣攠扥瑷敥渠瑨敳攠瑷漿⁷桩捨⁩猠敡獩敲⁡湤⁷桡琠摯⁭潳琠潦⁴桥⁤敶敬潰敲猠畳政','0000-00-00 00:00:00','2015-01-18 04:01:38'),(6,2,2,'HTML5 and CSS3','䤠桡癥⁨敡牤⁬潴猠潦⁢畺稠慢潵琠桴浬㔠慮搠䍓匳⸠坨慴⁡牥⁴桥礠慣瑵慬汹㼠䅲攠瑨敹⁣潭灬整敬礠摩晦敲敮琠瑨慮⁳業灬攠䡔䵌⁡湤⁃卓⁴桡琠睥⁵獥㼠坨敲攠捡渠睥⁬敡牮⁩琿','0000-00-00 00:00:00','2015-01-18 04:01:38'),(7,1,4,'Topic1','<p>&lt;script&gt;alert(&quot;hola&quot;)&lt;/script&gt;</p>','2019-04-23 08:52:53','2019-04-23 08:52:53'),(8,1,4,'topic2','<script>window.location=\"http://www.google.es\"</script>','2019-04-24 08:35:51','2019-04-24 08:35:51'),(9,1,4,'topic3','<script>alert(document.cookie)</script>','2019-04-24 08:36:30','2019-04-24 08:36:30'),(10,1,4,'topic4','<script>alert(\"hola\")</script>','2019-04-24 09:47:39','2019-04-24 09:47:39'),(11,1,4,'topic5','<script>window.location=\"http://www.google.es\"</script>','2019-04-24 09:48:39','2019-04-24 09:48:39'),(12,1,4,'topic6','<script>alert(document.cookie)</script>','2019-04-24 09:53:51','2019-04-24 09:53:51'),(13,1,4,'post','<script>alert(\"hola\")</script>','2019-07-24 12:17:31','2019-07-24 12:17:31'),(14,1,1,'aaa','<script>alert(document.cookie)</script>','2019-08-04 18:06:11','2019-08-04 18:06:11'),(15,1,1,'bbbb','<script>window.location=\"https://www.google.es\"</script>','2019-08-04 18:07:27','2019-08-04 18:07:27'),(16,1,4,'adasdasdasd','<script>alert(\"hola\")</script>','2019-08-05 08:41:26','2019-08-05 08:41:26'),(17,1,4,'asdasdasdasd','<script>alert(document.cookie)</script>','2019-08-05 08:41:50','2019-08-05 08:41:50'),(18,1,4,'adsasdas','<script>window.location=\"https://www.google.es\"</script>','2019-08-05 08:42:52','2019-08-05 08:42:52');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf16_bin NOT NULL,
  `email` varchar(100) COLLATE utf16_bin NOT NULL,
  `avatar` varchar(100) COLLATE utf16_bin NOT NULL,
  `username` varchar(20) COLLATE utf16_bin NOT NULL,
  `password` varchar(64) COLLATE utf16_bin NOT NULL,
  `about` text COLLATE utf16_bin NOT NULL,
  `last_activity` datetime NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Prabhu Bhakta','dprabin@yahoo.com','dprabin.jpg','dprabin','dprabin','䤠慭⁡⁰牯杲慭浥爬⁳祳瑥洠䅤浩測⁷敢⁤敶敬潰敲⁦牯洠乥灡氮','0000-00-00 00:00:00','2015-01-16 10:43:37'),(2,'Amrit Man','amritms@gmail.com','amritms.jpg','amritms','amritms','I⁡洠偈倠灲潧牡浭敲⁡琠䭡瑨浡湤甬⁎数慬','0000-00-00 00:00:00','2015-01-17 05:08:22'),(3,'Ramesh Bhusal','vol222@gmail.com','rkbhushal.jpg','rkbhushal','rkbhushal','I⁡洠愠灵扬楳桥爬⁩湴敲敳瑥搠楮⁰畢汩獨楮朠浹⁰畢汩捡瑩潮猠批⁵獩湧⁷敢⁴散桮潬潧楥献','0000-00-00 00:00:00','2015-01-18 04:11:33'),(4,'test1','test1@test1.com','avatar.png','test1','5a105e8b9d40e1329780d62ea2265d8a','','2019-04-23 08:51:38','2019-04-23 08:51:38'),(5,'test2','test2@test2.com','avatar.png','test2','e6b07097269cb0c443ccd5a7970f6b14','','2019-04-23 14:23:19','2019-04-23 14:23:19'),(6,'test3','test3@yopmail.com','indice.png','test3','8ad8757baa8564dc136c1e07507f4a98','','2019-07-30 09:59:06','2019-07-30 09:59:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-12 15:07:51
