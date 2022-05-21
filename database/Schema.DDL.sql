DROP DATABASE IF EXISTS `db_project`;
CREATE DATABASE IF NOT EXISTS `db_project`;

USE `db_project`;

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_project
-- ------------------------------------------------------
-- Server version	8.0.27

/*!50503 SET character_set_client = utf8mb4 */
;

--
-- Table structure for table `deliverable`
--
DROP TABLE IF EXISTS `deliverable`;


CREATE TABLE `deliverable` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου το οποίο αφορά το παραδοτέο',
  `title` varchar(100) NOT NULL COMMENT 'Τίτλος παραδοτέου',
  `description` varchar(255) NOT NULL COMMENT 'Περιγραφή παραδοτέου',
  `delivery_date` date DEFAULT NULL COMMENT 'Ημερομηνία παράδοσης',
  PRIMARY KEY (`title`, `projectId`),
  KEY `has_deliverables` (`projectId`),
  CONSTRAINT `has_deliverables` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Παραδοτέα έργων';

--
-- Table structure for table `executive`
--
DROP TABLE IF EXISTS `executive`;

CREATE TABLE `executive` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Μοναδικό αναγνωριστικό στελέχους',
  `name` varchar(100) NOT NULL COMMENT 'Όνομα στελέχους (μοναδικό)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Στελέχη ΕΛ.ΙΔ.Ε.Κ.';

--
-- Table structure for table `managed_by`
--
DROP TABLE IF EXISTS `managed_by`;

CREATE TABLE `managed_by` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου το οποίο συμμετέχει στη σχέση',
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα του οργανισμού που διαχειρίζεται το έργο',
  UNIQUE KEY `projectId_UNIQUE` (`projectId`),
  KEY `managing_organization` (`organizationName`),
  CONSTRAINT `managed_project` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `managing_organization` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Σχέση διαχείρισης μεταξύ έργου και οργανισμού';

--
-- Table structure for table `organization`
--
DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `name` varchar(100) NOT NULL COMMENT 'Μοναδικό όνομα του οργανισμού',
  `abbreviation` varchar(10) NOT NULL COMMENT 'Συντομογραφία',
  `street` varchar(100) NOT NULL COMMENT 'Διεύθυνση οργανισμού: Οδός',
  `number` int NOT NULL COMMENT 'Διεύθυνση οργανισμού: Αριθμός',
  `postal_code` varchar(5) NOT NULL COMMENT 'Διεύθυνση οργανισμού: Τ.Κ.',
  `city` varchar(100) NOT NULL COMMENT 'Διεύθυνση οργανισμού: Πόλη',
  `category` varchar(20) NOT NULL COMMENT 'Κατηγορία: Ερευνητικό Κέντρο(Research Center), Πανεπιστήμιο (University) ή Εταιρεία (Company)',
  PRIMARY KEY (`name`),
  CONSTRAINT `check_category` CHECK (
    (
      `category` in (
        _utf8mb4 'University',
        _utf8mb4 'Company',
        _utf8mb4 'Research Center'
      )
    )
  )
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Οργανισμός';

--
-- Table structure for table `phone_number`
--
DROP TABLE IF EXISTS `phone_number`;

CREATE TABLE `phone_number` (
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα του οργανισμού στον οποίο ανήκει ο αριθμός',
  `phone` varchar(10) NOT NULL COMMENT 'Αριθμός τηλεφώνου του οργανισμού (μοναδικός) - Ακριβώς 10 χαρακτήρες',
  PRIMARY KEY (`organizationName`, `phone`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  CONSTRAINT `belongs_to` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`),
  CONSTRAINT `check_phone` CHECK (regexp_like(`phone`, _utf8mb4 '^[0-9]{10}$'))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Τηλεφωνικοί αριθμοί (τουλάχιστον 1 για κάθε οργανισμό)';

--
-- Table structure for table `program`
--
DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Μοναδικό αναγνωριστικό του προγράμματος',
  `name` varchar(100) NOT NULL COMMENT 'Όνομα προγράμματος',
  `address` varchar(255) NOT NULL COMMENT 'Διεύθυνση',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Προγράμματα που χρηματοδοτούν έργα';

--
-- Table structure for table `project`
--
DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Μοναδικό αναγνωριστικό του έργου',
  `title` varchar(100) NOT NULL COMMENT 'Τίτλος του έργου',
  `description` varchar(255) NOT NULL COMMENT 'Περίληψη',
  `budget` decimal(9, 2) NOT NULL COMMENT 'Ποσό χρηματοδότησης',
  `start_date` date NOT NULL COMMENT 'Έναρξη',
  `end_date` date DEFAULT NULL COMMENT 'Λήξη (αν είναι κενό, το έργο είναι ακόμα ενεργό)',
  `duration` decimal(3, 2) GENERATED ALWAYS AS (
    (
      (to_days(`end_date`) - to_days(`start_date`)) / 365
    )
  ) STORED COMMENT 'Διάρκεια του έργου (υπολογιζόμενο πεδίο)',
  `programId` int NOT NULL COMMENT 'Αναγνωριστικό του προγράμματος που χρηματοδοτεί το έργο',
  `researchManagerId` int NOT NULL COMMENT 'Επιστημονικός υπεύθυνος του έργου',
  `executiveId` int NOT NULL COMMENT 'Στέλεχος του ΕΛ.ΙΔ.Ε.Κ που διαχειρίζεται το έργο',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `has_research_manager` (`researchManagerId`),
  KEY `manages` (`executiveId`),
  KEY `sponsors` (`programId`),
  CONSTRAINT `has_research_manager` FOREIGN KEY (`researchManagerId`) REFERENCES `researcher` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `manages` FOREIGN KEY (`executiveId`) REFERENCES `executive` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sponsors` FOREIGN KEY (`programId`) REFERENCES `program` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `limit_end_date` CHECK (
    (
      (
        (to_days(`end_date`) - to_days(`start_date`)) / 365
      ) between 1
      and 4
    )
  )
) ENGINE = InnoDB AUTO_INCREMENT = 121 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Έργα/Επιχορηγήσεις';

--
-- Table structure for table `project_rating`
--
DROP TABLE IF EXISTS `project_rating`;

CREATE TABLE `project_rating` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου που αξιολογήθηκε (κάθε έργο μπορεί να αξιολογηθεί μόνο μία φορά)',
  `researcherId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του ερευνητή που αξιολόγησε το έργο',
  `rating` int NOT NULL COMMENT 'Αξιολόγηση (1-10)',
  `rating_date` date NOT NULL COMMENT 'Ημερομηνία αξιολόγησης',
  UNIQUE KEY `projectId_UNIQUE` (`projectId`),
  KEY `rated_project` (`projectId`),
  KEY `rating_researcher` (`researcherId`),
  CONSTRAINT `project_rating_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `rating_researcher` FOREIGN KEY (`researcherId`) REFERENCES `researcher` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `check_rating` CHECK (
    (
      `rating` between 1
      and 10
    )
  )
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Αξιολογήσεις έργων από ερευνητές';

/*!40101 SET character_set_client = @saved_cs_client */
;

/*!50003 SET @saved_cs_client      = @@character_set_client */
;

/*!50003 SET @saved_cs_results     = @@character_set_results */
;

/*!50003 SET @saved_col_connection = @@collation_connection */
;

/*!50003 SET character_set_client  = utf8mb4 */
;

/*!50003 SET character_set_results = utf8mb4 */
;

/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */
;

/*!50003 SET @saved_sql_mode       = @@sql_mode */
;

/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */
;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `check_researcher_not_in_organization` BEFORE INSERT ON `project_rating` FOR EACH ROW BEGIN
 IF rating_researcher_in_organization(NEW.projectId, NEW.researcherId) = 1 THEN
 SET NEW.researcherId = NULL;
 END IF;
 END */
;


--
-- Table structure for table `project_researchers`
--
DROP TABLE IF EXISTS `project_researchers`;

CREATE TABLE `project_researchers` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου',
  `researcherId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του ερευνητή που εργάζεται στο έργο',
  PRIMARY KEY (`projectId`, `researcherId`),
  KEY `works_on` (`researcherId`)
  /*!80000 INVISIBLE */
,
  CONSTRAINT `has_researchers` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `works_on` FOREIGN KEY (`researcherId`) REFERENCES `researcher` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Ερευνητές σε κάθε έργο';

--
-- Table structure for table `related_to`
--
DROP TABLE IF EXISTS `related_to`;

CREATE TABLE `related_to` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου',
  `research_fieldName` varchar(100) NOT NULL COMMENT 'Όνομα του επιστημονικού πεδίου με το οποίο συνδέεται',
  PRIMARY KEY (`projectId`, `research_fieldName`),
  KEY `field_to_project` (`research_fieldName`),
  CONSTRAINT `field_to_project` FOREIGN KEY (`research_fieldName`) REFERENCES `research_field` (`name`),
  CONSTRAINT `project_fields` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Σύνδεση έργου με επιστημονικά πεδία';

--
-- Table structure for table `research_field`
--
DROP TABLE IF EXISTS `research_field`;

CREATE TABLE `research_field` (
  `name` varchar(100) NOT NULL COMMENT 'Όνομα (μοναδικό) του επιστημονικού πεδίου',
  PRIMARY KEY (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Επιστημονικά πεδία';

--
-- Table structure for table `researcher`
--
DROP TABLE IF EXISTS `researcher`;

CREATE TABLE `researcher` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Μοναδικό αναγνωριστικό του ερευνητή',
  `name` varchar(100) NOT NULL COMMENT 'Όνομα',
  `surname` varchar(100) NOT NULL COMMENT 'Επίθετο',
  `gender` varchar(10) NOT NULL COMMENT 'Φύλο (male ή female)',
  `birth_date` date NOT NULL COMMENT 'Ημερομηνία Γέννησης',
  PRIMARY KEY (`id`),
  CONSTRAINT `check_gender` CHECK ((`gender` in (_utf8mb4 'male', _utf8mb4 'female')))
) ENGINE = InnoDB AUTO_INCREMENT = 111 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Ερευνητές που εργάζονται σε έργα';

--
-- Table structure for table `works_for`
--
DROP TABLE IF EXISTS `works_for`;

CREATE TABLE `works_for` (
  `researcherId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του εργαζόμενου ερευνητή',
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα του οργανισμού στον οποίο εργάζεται',
  `employment_date` date NOT NULL COMMENT 'Ημερομηνία έναρξης της εργασίας',
  PRIMARY KEY (`researcherId`),
  KEY `employing_organization` (`organizationName`),
  CONSTRAINT `employed_researcher` FOREIGN KEY (`researcherId`) REFERENCES `researcher` (`id`),
  CONSTRAINT `employing_organization` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Υπαλληλική σχέση ερευνητή/οργανισμού';

--
-- Dumping events for database 'db_project'
--
--
-- Dumping routines for database 'db_project'
--
/*!50003 DROP FUNCTION IF EXISTS `rating_researcher_in_organization` */
;

/*!50003 SET @saved_cs_client      = @@character_set_client */
;

/*!50003 SET @saved_cs_results     = @@character_set_results */
;

/*!50003 SET @saved_col_connection = @@collation_connection */
;

/*!50003 SET character_set_client  = utf8mb4 */
;

/*!50003 SET character_set_results = utf8mb4 */
;

/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */
;

/*!50003 SET @saved_sql_mode       = @@sql_mode */
;

/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */
;

DELIMITER $

$

CREATE DEFINER = `root` @`localhost` FUNCTION `rating_researcher_in_organization`(projectId INT, researcherId INT) RETURNS int READS SQL DATA BEGIN RETURN EXISTS (
  SELECT
    m.organizationName
  FROM
    managed_by AS m
    JOIN works_for AS w ON researcherId = w.researcherId
    AND m.organizationName = w.organizationName
  WHERE
    m.projectId = projectId
);

END;

$

DELIMITER ;

--
-- Final view structure for view `project_information`
--
/*!50001 DROP VIEW IF EXISTS `project_information`*/
;

/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_information` AS select `p`.`id` AS `id`,`p`.`title` AS `title`,`p`.`description` AS `description`,`p`.`budget` AS `budget`,`p`.`start_date` AS `startDate`,`p`.`end_date` AS `endDate`,`p`.`duration` AS `duration`,`e`.`name` AS `executiveName`,`pr`.`name` AS `programName`,`pr`.`address` AS `programAddress`,`rm`.`name` AS `researchManagerName`,`rm`.`surname` AS `researchManagerSurname`,`rm`.`gender` AS `researchManagerGender`,`rm`.`birth_date` AS `researchManagerBirthDate`,`rating`.`rating` AS `rating`,`rating`.`rating_date` AS `ratingDate`,`rr`.`name` AS `ratingResearcherName`,`rr`.`surname` AS `ratingResearcherSurname`,`o`.`name` AS `organizationName`,`o`.`abbreviation` AS `organizationAbbreviation`,`o`.`street` AS `organizationStreet`,`o`.`number` AS `organizationStreetNumber`,`o`.`postal_code` AS `organizationPostalCode`,`o`.`city` AS `organizationCity`,`o`.`category` AS `organizationCategory`,`rt`.`research_fieldName` AS `researchFieldName` from ((((((((`project` `p` join `executive` `e` on((`e`.`id` = `p`.`executiveId`))) join `program` `pr` on((`pr`.`id` = `p`.`programId`))) join `researcher` `rm` on((`rm`.`id` = `p`.`researchManagerId`))) join `project_rating` `rating` on((`rating`.`projectId` = `p`.`id`))) join `researcher` `rr` on((`rr`.`id` = `rating`.`researcherId`))) join `managed_by` `mb` on((`mb`.`projectId` = `p`.`id`))) join `organization` `o` on((`o`.`name` = `mb`.`organizationName`))) join `related_to` `rt` on((`rt`.`projectId` = `p`.`id`))) order by `p`.`id`,`rt`.`research_fieldName` */
;

--
-- Final view structure for view `projects_per_researcher`
--
/*!50001 DROP VIEW IF EXISTS `projects_per_researcher`*/
;

/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projects_per_researcher` AS select `r`.`id` AS `id`,`r`.`name` AS `name`,`r`.`surname` AS `surname`,`r`.`gender` AS `gender`,`r`.`birth_date` AS `birth_date`,`p`.`title` AS `project_title`,`p`.`budget` AS `project_budget`,`p`.`start_date` AS `project_start_date`,`p`.`end_date` AS `project_end_date`,`p`.`duration` AS `project_duration` from ((`researcher` `r` join `project_researchers` `pr` on((`r`.`id` = `pr`.`researcherId`))) join `project` `p` on((`p`.`id` = `pr`.`projectId`))) order by `r`.`name`,`p`.`start_date` */
;


-- Dump completed on 2022-05-21 19:17:07