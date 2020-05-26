-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: wikipedia
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_users_id` int(11) NOT NULL DEFAULT '3',
  `a_language_id` int(11) NOT NULL DEFAULT '3',
  `a_subcategory_id` int(11) NOT NULL DEFAULT '1',
  `a_name` varchar(45) NOT NULL DEFAULT 'default',
  `a_full_name` varchar(45) NOT NULL DEFAULT 'default',
  `a_date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_short_desc` varchar(100) NOT NULL DEFAULT 'default',
  `a_description_1` varchar(2000) NOT NULL DEFAULT 'default',
  `a_description_2` varchar(2000) DEFAULT NULL,
  `a_description_3` varchar(2000) DEFAULT NULL,
  `a_image_logo` varchar(200) NOT NULL DEFAULT 'default link',
  `a_image` varchar(200) NOT NULL DEFAULT 'default link',
  PRIMARY KEY (`a_id`),
  KEY `fk_article_users_idx` (`a_users_id`),
  KEY `fk_article_language_idx` (`a_language_id`),
  KEY `fk_article_subcategory_idx` (`a_subcategory_id`),
  CONSTRAINT `fk_article_language` FOREIGN KEY (`a_language_id`) REFERENCES `article_language` (`al_id`),
  CONSTRAINT `fk_article_subcategory` FOREIGN KEY (`a_subcategory_id`) REFERENCES `article_subcategory` (`as_id`),
  CONSTRAINT `fk_article_users` FOREIGN KEY (`a_users_id`) REFERENCES `users` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1200,2,1,1,'Bessie Van Vorst','Bessie Van Vorst','2020-05-13 16:30:42',' American journalist Bessie Van Vorst worked undercover.','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/0.jpg'),(1300,2,2,2,'Test','Élisabeth Vigée Le Brun','2020-05-19 16:38:45','Born in Paris on 16 April 1755','Born in Paris on 16 April 1755, Élisabeth Louise Vigée was the daughter of Jeanne (née Maissin) (1728–1800), a hairdresser, and portraitist and fan painter, Louis Vigée, from whom she received her first instruction. In 1760, at the age of five, she entered a convent, where she remained until 1766. Her father died when she was 12 years old. In 1768, her mother married a wealthy jeweller, Jacques-François Le Sèvre, and shortly after, the family moved to the Rue Saint-Honoré, close to the Palais Royal. In her memoir, Vigée Le Brun directly stated her feelings about her step-father: ','In 1787, she caused a minor public scandal when her Self-Portrait with Her Daughter Julie (1787) was exhibited at the Salon of 1787 showing her smiling and open-mouthed, which was in direct contravention of traditional painting conventions going back to antiquity. The court gossip-sheet Mémoires secrets commented: ','As her career blossomed, Vigée Le Brun was granted patronage by Marie Antoinette. She painted more than 30 portraits of the queen and her family, leading to the common perception that she was the official portraitist of Marie Antoinette. At the Salon of 1783, Vigée Le Brun exhibited Marie-Antoinette in a Muslin Dress (1783), sometimes called Marie-Antoinette en gaulle, in which the queen chose to be shown in a simple, informal white cotton garment. The resulting scandal was prompted by both the informality of the attire and the queen\'s decision to be shown in that way. Vigée Le Brun\'s later Marie-Antoinette and her Children (1787) was evidently an attempt to improve the queen\'s image by making her more relatable to the public, in the hopes of countering the bad press and negative judgments that the queen had recently received. The portrait shows the queen at home in the Palace of Versailles, engaged in her official function as the mother of the king\'s children, but also suggests Marie-Antoinette\'s uneasy identity as a foreign-born queen whose maternal role was her only true function under Salic law. The child on the right is pointing to an empty cradle, which signified her recent loss of a child, further emphasizing Marie-Antoinette\'s role as a mother.','link','images/articles/1.jpg'),(1400,3,3,4,'Oxford Circus','Oxford Circus','2020-05-13 16:30:42','The Abbasid invasion of Asia Minor in 806.','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/2.jpg'),(1500,3,1,3,'Pterophorus pentadactyla','Pterophorus pentadactyla','2020-05-13 16:30:42','Commonly known as the white plume moth','Born in Paris on 16 April 1755, Élisabeth Louise Vigée was the daughter of Jeanne (née Maissin) (1728–1800), a hairdresser, and portraitist and fan painter, Louis Vigée, from whom she received her first instruction. In 1760, at the age of five, she entered a convent, where she remained until 1766. Her father died when she was 12 years old. In 1768, her mother married a wealthy jeweller, Jacques-François Le Sèvre, and shortly after, the family moved to the Rue Saint-Honoré, close to the Palais Royal. In her memoir, Vigée Le Brun directly stated her feelings about her step-father: \"I hated this man; even more so since he made use of my father\'s personal possessions. He wore his clothes, just as they were, without altering them to fit his figure.\" During this period, Élisabeth benefited from the advice of Gabriel François Doyen, Jean-Baptiste Greuze, and Joseph Vernet, whose influence is evident in her portrait of her younger brother, playwright and poet Étienne Vigée (1773).','In 1787, she caused a minor public scandal when her Self-Portrait with Her Daughter Julie (1787) was exhibited at the Salon of 1787 showing her smiling and open-mouthed, which was in direct contravention of traditional painting conventions going back to antiquity. The court gossip-sheet Mémoires secrets commented: \"An affectation which artists, art-lovers and persons of taste have been united in condemning, and which finds no precedent among the Ancients, is that in smiling, [Madame Vigée LeBrun] shows her teeth.\" In light of this and her other Self-Portrait with Her Daughter Julie (1789), Simone de Beauvoir dismissed Vigée Le Brun as narcissistic in The Second Sex (1949): \"Madame Vigée-Lebrun never wearied of putting her smiling maternity on her canvases.\"','As her career blossomed, Vigée Le Brun was granted patronage by Marie Antoinette. She painted more than 30 portraits of the queen and her family, leading to the common perception that she was the official portraitist of Marie Antoinette. At the Salon of 1783, Vigée Le Brun exhibited Marie-Antoinette in a Muslin Dress (1783), sometimes called Marie-Antoinette en gaulle, in which the queen chose to be shown in a simple, informal white cotton garment. The resulting scandal was prompted by both the informality of the attire and the queen\'s decision to be shown in that way. Vigée Le Brun\'s later Marie-Antoinette and her Children (1787) was evidently an attempt to improve the queen\'s image by making her more relatable to the public, in the hopes of countering the bad press and negative judgments that the queen had recently received. The portrait shows the queen at home in the Palace of Versailles, engaged in her official function as the mother of the king\'s children, but also suggests Marie-Antoinette\'s uneasy identity as a foreign-born queen whose maternal role was her only true function under Salic law. The child on the right is pointing to an empty cradle, which signified her recent loss of a child, further emphasizing Marie-Antoinette\'s role as a mother.','link','images/articles/3.jpg'),(1600,2,2,1,'Charles Spencer Francis','Charles Spencer Francis','2020-05-13 16:30:42','Nikephoros was forced to seek peace.','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/4.jpg'),(1700,3,4,2,'Emilia Clarke','Emilia Clarke','2020-05-13 16:30:42','Nikephoros violated the peace terms.','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/5.jpg'),(1800,4,5,5,'Caha Mountains','Caha Mountains','2020-05-13 16:30:43','British forces commanded by Lieutenant-General','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/6.jpg'),(1900,5,6,2,'Game of Thrones','Game of Thrones','2020-05-13 16:30:43','hirty-eight people are killed in a tornado outbreak','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/7.jpg'),(2000,6,4,1,'Lithuanian Crusade','Lithuanian Crusade','2020-05-13 16:30:43','The High Court of Australia quashes the conviction','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/8.jpg'),(2100,7,1,2,'Kaunas Castle','Kaunas Castle','2020-05-13 16:30:43','Cyclone Harold impacts the Solomon Islands','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/9.jpg'),(2200,8,3,1,'Peak District','Peak District','2020-05-13 16:30:43','he Peak District was designated the first.','maining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more rec','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','ars old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of th','link','images/articles/10.jpg'),(2202,2,3,1,'qwe','qwe','2020-05-19 16:42:08','article','testtreter','q','q','default link','/images/articles/11.jpg');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_category` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_category_name` varchar(45) NOT NULL,
  `ac_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` VALUES (1,'General reference','2020-03-19 13:28:48'),(2,'Culture and the arts','2020-03-19 13:28:48'),(3,'Geography and places','2020-03-19 13:28:48'),(4,'Health and fitness','2020-03-19 13:28:48'),(5,'History and events','2020-03-19 13:28:48'),(6,'Human activities','2020-03-19 13:28:48'),(7,'Mathematics and logic','2020-03-19 13:28:48'),(8,'Natural and physical sciences','2020-03-19 13:28:48'),(9,'People and self','2020-03-19 13:28:48'),(10,'Philosophy and thinking','2020-03-19 13:28:48'),(11,'Religion and belief systems','2020-03-19 13:28:48'),(12,'Society and social sciences','2020-03-19 13:28:48'),(13,'Technology and applied sciences','2020-03-19 13:28:48');
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_language`
--

DROP TABLE IF EXISTS `article_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_language` (
  `al_id` int(11) NOT NULL AUTO_INCREMENT,
  `al_lang` varchar(45) NOT NULL,
  `al_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_language`
--

LOCK TABLES `article_language` WRITE;
/*!40000 ALTER TABLE `article_language` DISABLE KEYS */;
INSERT INTO `article_language` VALUES (1,'Mandarin Chinese','2020-03-19 12:56:34'),(2,'Spanish','2020-03-19 12:56:34'),(3,'English','2020-03-19 12:56:34'),(4,'Bengali','2020-03-19 12:56:34'),(5,'Portuguese','2020-03-19 12:56:34'),(6,'Russian','2020-03-19 12:56:34'),(7,'Japanese','2020-03-19 12:56:34'),(8,'Marathi','2020-03-19 12:56:34'),(9,'Telugu','2020-03-19 12:56:34'),(10,'Turkish','2020-03-19 12:56:34'),(11,'Korean','2020-03-19 12:56:34'),(12,'French','2020-03-19 12:56:34'),(13,'German','2020-03-19 12:56:34');
/*!40000 ALTER TABLE `article_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_subcategory`
--

DROP TABLE IF EXISTS `article_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_subcategory` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `as_category_id` int(11) NOT NULL,
  `as_name_subcategory` varchar(50) NOT NULL,
  `as_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`as_id`),
  KEY `fk_subcategory_category_idx` (`as_category_id`),
  CONSTRAINT `fk_subcategory_category` FOREIGN KEY (`as_category_id`) REFERENCES `article_category` (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_subcategory`
--

LOCK TABLES `article_subcategory` WRITE;
/*!40000 ALTER TABLE `article_subcategory` DISABLE KEYS */;
INSERT INTO `article_subcategory` VALUES (1,1,'Almanacs','2020-03-19 13:31:55'),(2,1,'Biographical dictionaries','2020-03-19 13:31:55'),(3,1,'Handbooks and manuals','2020-03-19 13:31:55'),(4,1,'Style guides','2020-03-19 13:31:55'),(5,2,'Classics','2020-03-19 13:31:55'),(6,2,'Arts and crafts','2020-03-19 13:31:55'),(7,2,'Celebrity','2020-03-19 13:31:55'),(8,2,'Festivals','2020-03-19 13:31:55'),(9,3,'Atmospheric sciences','2020-03-19 13:31:55'),(10,3,'Geology','2020-03-19 13:31:55'),(11,4,'Diseases','2020-03-19 13:31:55'),(12,4,'Clinical research','2020-03-19 13:31:55'),(13,4,'Epidemiology','2020-03-19 13:31:55');
/*!40000 ALTER TABLE `article_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_description` varchar(45) NOT NULL,
  `c_type_id` int(11) NOT NULL,
  `c_status_id` int(11) NOT NULL,
  `c_user_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_contact_type_idx` (`c_type_id`),
  KEY `fk_contact_status_idx` (`c_status_id`),
  KEY `fk_users_contact_idx` (`c_user_id`),
  CONSTRAINT `fk_contact_status` FOREIGN KEY (`c_status_id`) REFERENCES `contact_status` (`cs_id`),
  CONSTRAINT `fk_contact_type` FOREIGN KEY (`c_type_id`) REFERENCES `contact_type` (`ct_id`),
  CONSTRAINT `fk_users_contact` FOREIGN KEY (`c_user_id`) REFERENCES `users` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Where can I get some?',2,1,3),(2,'Where does it come from?',2,2,2),(3,'What is Lorem Ipsum?',1,2,5),(4,'Why do we use it',4,1,6),(5,'does it come from?',1,2,7),(6,'qwe',1,2,2),(7,'qdasdasd',1,2,2),(8,'aasas',1,2,2),(9,'qwesd',1,2,2),(10,'help me',1,2,2);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_status`
--

DROP TABLE IF EXISTS `contact_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_status` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT,
  `cs_status_name` varchar(45) NOT NULL,
  `cs_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_status`
--

LOCK TABLES `contact_status` WRITE;
/*!40000 ALTER TABLE `contact_status` DISABLE KEYS */;
INSERT INTO `contact_status` VALUES (1,'accepted','2020-03-19 14:28:48'),(2,'under_consideration','2020-03-19 14:28:48'),(3,'rejected','2020-03-19 14:28:48');
/*!40000 ALTER TABLE `contact_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_type`
--

DROP TABLE IF EXISTS `contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_type` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_type_name` varchar(45) NOT NULL,
  `ct_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (1,'help','2020-03-19 14:27:10'),(2,'wishes','2020-03-19 14:27:10'),(3,'not_work','2020-03-19 14:27:10'),(4,'other','2020-03-19 14:27:10');
/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_user_id` int(11) NOT NULL,
  `n_title` varchar(45) NOT NULL,
  `n_description` varchar(45) NOT NULL,
  `n_image` varchar(45) NOT NULL,
  PRIMARY KEY (`n_id`),
  KEY `fk_news_users_idx` (`n_user_id`),
  CONSTRAINT `fk_news_users` FOREIGN KEY (`n_user_id`) REFERENCES `users` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (10000,2,'Breacking News','Aert Covid 19','images/news/0.jpg'),(10001,3,'Weekend News','4 millions people covid-19','images/news/0.jpg');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_parthners`
--

DROP TABLE IF EXISTS `site_parthners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_parthners` (
  `sp_id` int(11) NOT NULL,
  `sp_name` varchar(45) NOT NULL,
  `sp_logo` varchar(500) NOT NULL,
  `sp_short_desc` varchar(100) NOT NULL,
  `sp_desc` varchar(300) NOT NULL,
  `sp_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_parthners`
--

LOCK TABLES `site_parthners` WRITE;
/*!40000 ALTER TABLE `site_parthners` DISABLE KEYS */;
INSERT INTO `site_parthners` VALUES (1,'Coca-cola','cola','Happy new year','Happy new 2021 year','2020-04-02 11:10:38');
/*!40000 ALTER TABLE `site_parthners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_role_id` int(11) NOT NULL DEFAULT '1',
  `u_status_id` int(11) NOT NULL DEFAULT '1',
  `u_city_id` int(11) NOT NULL DEFAULT '1',
  `u_firstName_EN` varchar(45) DEFAULT NULL,
  `u_lastName_EN` varchar(45) DEFAULT NULL,
  `u_firstName_RU` varchar(45) DEFAULT NULL,
  `u_lastName_RU` varchar(45) DEFAULT NULL,
  `u_nickname` varchar(45) DEFAULT NULL,
  `u_email` varchar(45) DEFAULT NULL,
  `u_password` varchar(45) DEFAULT NULL,
  `u_gender` varchar(45) DEFAULT NULL,
  `u_worker_type` varchar(45) DEFAULT NULL,
  `u_department` varchar(45) DEFAULT NULL,
  `u_room` varchar(45) DEFAULT NULL,
  `u_internal_phone` varchar(45) DEFAULT NULL,
  `u_mobile_phone` varchar(45) DEFAULT NULL,
  `u_skype` varchar(45) DEFAULT NULL,
  `u_c_number` varchar(45) DEFAULT NULL,
  `u_address` varchar(50) DEFAULT NULL,
  `u_image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_nickname_UNIQUE` (`u_nickname`),
  UNIQUE KEY `u_email_UNIQUE` (`u_email`),
  UNIQUE KEY `c_number_UNIQUE` (`u_c_number`),
  KEY `fk_users_role_idx` (`u_role_id`),
  KEY `fk_users_status_idx` (`u_status_id`),
  KEY `fk_users_city_idx` (`u_city_id`),
  CONSTRAINT `fk_users_city` FOREIGN KEY (`u_city_id`) REFERENCES `users_city` (`ucity_id`),
  CONSTRAINT `fk_users_role` FOREIGN KEY (`u_role_id`) REFERENCES `users_role` (`ur_id`),
  CONSTRAINT `fk_users_status` FOREIGN KEY (`u_status_id`) REFERENCES `users_status` (`us_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,3,1,1,'Nathan','Ford','Нэйтан','Форд','shayrma','nathan@gmail.com','123','Mr','user','General','2020','123','+375 29 1224567','test','1','Not living anywhere','images/0.jpg'),(3,3,1,34,'Jax','Loyd','Джекс','Лойд','jaxxy','jaxxy@gmail.com','321','Mr','user','Culture','2020','123','+375 29 12444567','test','2','Not living anywhere','images/1.jpg'),(4,1,1,5,'Frank','Kastro','Франк','Кастро','frank','frank@gmail.com','test','Mr','user','Geography','2020','123','+375 29 1221467','test','3','Unknown','images/2.jpg'),(5,3,1,2,'Pablo','Escobar','Пабло','Эскобар','pab','pab@gmail.com','test','Mr','user','Activities','2020','123','+375 29 1234567','test','4','Sorry?','images/4.jpg'),(6,1,1,1,'Jim','Kerry','Джим','Керри','jimmy','jimmy@gmail.com','test','Mr','user','General','2020','123','+375 29 1234567','test','5','unknown','images/5.jpg'),(7,1,1,6,'Nora','Raily','Нора','Райли','nora','nora@gmail.com','test','Mrs','hr','People','2020','123','+375 29 1234567','test','6','unknown','images/11.jpg'),(8,1,1,5,'Liza','Kudrow','Лиза','Кудроу','liza','liza@gmail.com','test','Mrs','hr','General','2020','123','+375 29 1234567','test','7','not write','images/12.jpg'),(9,2,1,8,'Jonh','Snow','Джон','Сноу','john','john@gmail.com','test','Mr','user','Activities','2020','123','+375 29 1234567','test','8','unknown','images/7.jpg'),(10,1,1,7,'Jake','Bistrov','Джейк','Бистров','jake321','jake321@gmail.com','test','Mr','user','General','2020','123','+375 29 1234567','test','9','in ur mom','images/6.jpg'),(11,3,1,4,'Fiona','Side','Фиона','Сайд','normik123','normik123@gmail.com','test','Mrs','hr','Events','2020','123','+375 29 1234567','test','10','kek','images/10.jpg'),(12,3,1,9,'Angelina','Randall','Ангелина','Рэндалл','gel228','gel228@gmail.com','test','Mrs','hr','General','2020','123','+375 29 1234567','test','11','not for saying','images/3.jpg'),(13,1,1,2,'Jon','Law','Джон','Лоу','jonik','jonik@gmail.com','test','Mr','user','History','2020','123','+375 29 1234567','test','12','russia','images/9.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_city`
--

DROP TABLE IF EXISTS `users_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_city` (
  `ucity_id` int(11) NOT NULL AUTO_INCREMENT,
  `ucity_name` varchar(45) NOT NULL,
  `ucity_country_id` int(11) NOT NULL,
  PRIMARY KEY (`ucity_id`),
  KEY `fk_city_country_idx` (`ucity_country_id`),
  CONSTRAINT `fk_city_country` FOREIGN KEY (`ucity_country_id`) REFERENCES `users_country` (`ucountry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_city`
--

LOCK TABLES `users_city` WRITE;
/*!40000 ALTER TABLE `users_city` DISABLE KEYS */;
INSERT INTO `users_city` VALUES (1,'Shanghai',1),(2,'Beijing',1),(3,'Tianjin',1),(4,'Mumbai',2),(5,'Delhi',2),(6,'New York City',3),(7,'Los Angeles',3),(8,'Chicago',3),(9,'Brooklyn',3),(10,'Houston',3),(11,'Queens',3),(12,'Philadelphia',3),(13,'Phoenix',3),(14,'Manhattan',3),(15,'San Diego',3),(16,'Jakarta',4),(17,'Surabaya',4),(18,'Medan',4),(19,'Karachi',5),(20,'Lahore',5),(21,'Sao Paulo',6),(22,'Rio de Janeiro',6),(23,'Salvador',6),(24,'Lagos',7),(25,'Kano',7),(26,'Ibadan',7),(27,'Dhaka',8),(28,'Chittagong',8),(29,'Moscow',9),(30,'Saint Petersburg',9),(31,'Novosibirsk',9),(32,'Yekaterinburg',9),(33,'Nizhniy Novgorod',9),(34,'Mexico City',10),(35,'Tokyo',11),(36,'Addis Ababa',12),(37,'Quezon City',13),(38,'Cairo',14),(39,'Ho Chi Minh City',15);
/*!40000 ALTER TABLE `users_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_comments`
--

DROP TABLE IF EXISTS `users_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_comments` (
  `uc_id` int(11) NOT NULL AUTO_INCREMENT,
  `uc_user_id` int(11) NOT NULL,
  `uc_text` varchar(300) NOT NULL,
  PRIMARY KEY (`uc_id`),
  KEY `fk_comments_users_idx` (`uc_user_id`),
  CONSTRAINT `fk_comments_users` FOREIGN KEY (`uc_user_id`) REFERENCES `users` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_comments`
--

LOCK TABLES `users_comments` WRITE;
/*!40000 ALTER TABLE `users_comments` DISABLE KEYS */;
INSERT INTO `users_comments` VALUES (1,3,'Hello'),(2,3,'By'),(3,3,'qweqd'),(4,3,'asdasdasd'),(5,3,'asdasfdgfs'),(6,3,'test'),(7,3,'asfsadasdasdas'),(8,3,'lol'),(9,3,'khjkghjhgh'),(10,3,'kek');
/*!40000 ALTER TABLE `users_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_country`
--

DROP TABLE IF EXISTS `users_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_country` (
  `ucountry_id` int(11) NOT NULL AUTO_INCREMENT,
  `ucountry_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ucountry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_country`
--

LOCK TABLES `users_country` WRITE;
/*!40000 ALTER TABLE `users_country` DISABLE KEYS */;
INSERT INTO `users_country` VALUES (1,'China'),(2,'India'),(3,'United States'),(4,'Indonesia'),(5,'Pakistan'),(6,'Brazil'),(7,'	Nigeria'),(8,'Bangladesh'),(9,'Russia'),(10,'Mexico'),(11,'Japan'),(12,'Ethiopia'),(13,'Philippines'),(14,'Egypt'),(15,'Vietnam');
/*!40000 ALTER TABLE `users_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_role`
--

DROP TABLE IF EXISTS `users_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_role` (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`ur_id`),
  UNIQUE KEY `ur_role_UNIQUE` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_role`
--

LOCK TABLES `users_role` WRITE;
/*!40000 ALTER TABLE `users_role` DISABLE KEYS */;
INSERT INTO `users_role` VALUES (3,'admin'),(2,'editor'),(1,'user');
/*!40000 ALTER TABLE `users_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_status`
--

DROP TABLE IF EXISTS `users_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_status` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_status` varchar(45) NOT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_status_UNIQUE` (`us_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_status`
--

LOCK TABLES `users_status` WRITE;
/*!40000 ALTER TABLE `users_status` DISABLE KEYS */;
INSERT INTO `users_status` VALUES (1,'active'),(2,'banned');
/*!40000 ALTER TABLE `users_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-26 18:54:04
