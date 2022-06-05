-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_project
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα της εταιρείας',
  `own_funds` decimal(9,2) NOT NULL COMMENT 'Ίδια κεφάλαια',
  PRIMARY KEY (`organizationName`),
  KEY `is_company` (`organizationName`),
  CONSTRAINT `is_company` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Σχέση IS_A για οργανισμούς που είναι εταιρείες';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('Bednar Ltd',120000.00),('Deckow-Smitham',120000.00),('Dooley-Feil',120000.00),('Hahn-Smith',120000.00),('Jacobi Group',120000.00),('Jacobi Ltd',120000.00),('Kreiger-Kozey',120000.00);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverable`
--

DROP TABLE IF EXISTS `deliverable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverable` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου το οποίο αφορά το παραδοτέο',
  `title` varchar(100) NOT NULL COMMENT 'Τίτλος παραδοτέου',
  `description` varchar(255) NOT NULL COMMENT 'Περιγραφή παραδοτέου',
  `delivery_date` date DEFAULT NULL COMMENT 'Ημερομηνία παράδοσης',
  PRIMARY KEY (`title`,`projectId`),
  KEY `has_deliverables` (`projectId`),
  CONSTRAINT `has_deliverables` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Παραδοτέα έργων';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverable`
--

LOCK TABLES `deliverable` WRITE;
/*!40000 ALTER TABLE `deliverable` DISABLE KEYS */;
INSERT INTO `deliverable` VALUES (80,'Ab dolorem ut.','Magni facere sunt numquam consequatur qui. Qui praesentium culpa et accusantium occaecati. Aliquid quas quia aliquam rerum.\nDolorum quia numquam qui ad aut. Adipisci ut consequuntur recusandae velit architecto illo.','2005-07-02'),(99,'Ab officia.','Fugiat temporibus aut sint nam dolorum rerum. Rerum saepe nisi vitae aut iste quaerat eaque. Vitae ab est sequi consequatur id.','1983-10-24'),(9,'Absoluta','Doloremque quia deleniti inventore aut eius. Sed nostrum aliquid similique quasi voluptatum ducimus exercitationem. Voluptas aut culpa fugit exercitationem. Saepe dicta sequi ut ipsam similique tenetur.','1978-03-19'),(105,'Accusantium sed aut.','Voluptatem eligendi eveniet necessitatibus fuga in hic omnis. Commodi sunt non atque harum sapiente harum distinctio. Repellendus pariatur omnis qui. Unde temporibus est velit omnis dolorum quo.','2001-09-09'),(59,'Acereme','Est voluptates ad vel quia nobis repudiandae. Est accusamus aut est accusantium rerum occaecati sed et. Magnam amet ex ut natus accusamus cum ducimus praesentium.','1974-11-30'),(45,'Acommodimi','Enim officiis et explicabo cum laboriosam fugit. Commodi ut nostrum aliquid eos nesciunt voluptas placeat. Est voluptas accusantium omnis labore inventore libero.','1973-10-06'),(78,'Ad enim.','Omnis ea quia et maxime rerum. Sed illo quas nulla explicabo omnis nisi facilis. Cumque ad sed ipsum ut deleniti voluptatibus eos.','1974-09-29'),(70,'Adipisci','Quas dolorem aliquid aperiam. Ea numquam praesentium quo dolorem. Rerum repudiandae velit tenetur dolores at ut quia.','1989-06-17'),(17,'Advert','Et aliquam quia deserunt enim. Et doloribus quam itaque atque perspiciatis. Et suscipit nihil corporis. Asperiores incidunt accusantium ut omnis ea maiores doloribus.\nQuia et suscipit nobis eius quia et error. Ullam non saepe dolorem ut.','2020-08-02'),(69,'Ahmed','Animi fuga est necessitatibus culpa. Occaecati magni modi voluptatem qui et sit adipisci. Quidem natus voluptatem voluptatibus eum vero ut eos. Ab laudantium eos ullam est quibusdam.','1984-09-02'),(53,'Alequam','Voluptates ad quae et provident nostrum in et qui. Consectetur molestias sit rerum assumenda consequatur molestiae occaecati. Quis illum sed ut asperiores aliquid iusto atque.','1995-05-29'),(68,'Alequis','Ipsum magni ut laborum consequatur iure et. Facilis magnam molestiae laboriosam eligendi. Quisquam aut odit doloremque distinctio dolorum eos est delectus. Voluptas quia corporis nesciunt consectetur.','1972-09-23'),(97,'Amet laboriosam.','Doloribus amet nihil aliquid ut nam dolor. Autem optio aut est hic necessitatibus quisquam. Suscipit veniam eveniet est temporibus natus consequatur.','1983-08-23'),(12,'Animi','Aspernatur laudantium velit quia fugiat iure. Accusamus ipsum voluptatibus laudantium dolorem est qui autem facilis. Explicabo maxime inventore nemo alias. Possimus est cupiditate voluptatem id vitae ea voluptate.','1974-07-29'),(17,'Aqui','Eligendi pariatur amet dolores ut. Porro rerum aut fugiat quo et. Unde laudantium laudantium alias fugit. Id dolorum voluptatem ratione voluptatem tenetur voluptas ex.','2016-02-27'),(4,'Architecto','Ut necessitatibus et saepe molestias rerum. Et ut dolorum aperiam animi quam quo. Laborum vitae aliquam et modi nulla eum.\nOmnis facere totam debitis quasi unde at ut. Saepe aut et a ex modi vel sint. A quisquam nesciunt inventore. Aliquam et nostrum in.','1971-12-03'),(119,'Assumenda voluptatem.','Inventore et tempore voluptate vitae qui libero quod. Aut tenetur magnam sit ipsa. Dolor nemo nesciunt deserunt id commodi. Quae ipsam hic officiis repellendus porro.','2006-09-18'),(101,'Atque consequuntur.','Rerum sapiente incidunt iste. Quia aspernatur culpa suscipit quam saepe exercitationem labore amet. Non possimus eum neque architecto. Possimus magni facilis distinctio quo neque eveniet.','2006-11-02'),(86,'Aut quia voluptates.','Voluptas qui nisi dolorum dicta. Et doloremque et aut cumque sit aut libero nemo.\nAtque commodi aut veniam impedit molestias. Nihil aut totam nostrum quidem facere minus non. Aut inventore quibusdam consequatur dicta magnam quod.','2005-04-20'),(5,'Automat','Alias consequuntur ut aliquam animi commodi molestiae. Mollitia possimus et ut ut.\nSunt fugit non voluptatem ipsum rerum et. Sunt vel error possimus nostrum. Dolorem dicta aut deserunt exercitationem aut culpa alias ducimus.','2001-11-13'),(62,'Bic','Occaecati quod iusto ab dolorem commodi eum reprehenderit. Qui ea est sed in nihil provident dolores. Exercitationem omnis excepturi sequi nisi quia. Praesentium neque molestias saepe magni hic.','1976-10-08'),(59,'Boro','Repellat voluptatem labore architecto praesentium et vel fuga quis. Maxime aperiam qui sapiente ea. Consequatur a ab similique vero vel dolor ea. Perspiciatis optio et ea sit illo impedit quia.','2016-08-02'),(40,'Catione','Aut tempora libero est quidem voluptatum adipisci. Fuga error adipisci alias quia. Officiis et beatae et dignissimos ut. Sint quis culpa ab perferendis eius id.','2000-03-22'),(67,'Catslebus','Nihil nobis aut aut tempore eveniet dolorum numquam. Accusantium enim vero minus qui. Repellat et iure dolor ut et eos libero. Nulla nulla vero aperiam pariatur fuga assumenda.','1990-11-10'),(55,'Claborum','Ab possimus possimus nemo repudiandae dolorum pariatur magnam. Quibusdam itaque dolores itaque voluptas a porro. In impedit qui est. Aut expedita porro laborum consequatur consequuntur quos sapiente aut.','2010-09-07'),(38,'Corrarupti','Eaque in ut nemo sit cum molestiae. Ut sint praesentium rem accusamus dolores eveniet. Ut omnis assumenda cumque ipsam. Nihil incidunt est deserunt aperiam beatae sit delectus.','1985-10-21'),(102,'Corrupti impedit quas.','Inventore tempore expedita explicabo repudiandae rem in fugit. Amet et provident et iusto eum voluptatibus asperiores. Sint consequatur aut fugiat illo ex eum ullam.','1975-01-20'),(85,'Corrupti quia.','Sed aliquam ab accusamus. Explicabo quo velit sapiente eius. Et corrupti magni quisquam aut vel. Molestias corporis error esse et modi.','2000-10-18'),(61,'Davincidunt','Quibusdam accusamus necessitatibus magni veritatis expedita necessitatibus quia exercitationem. Et rerum sint nemo. Dolorum cum laborum vero saepe eum. Rem ducimus consectetur et consectetur numquam.','1988-12-25'),(4,'Denimizo','Praesentium error tempore et laudantium tempore et. Assumenda iure corporis aut quisquam. Voluptate necessitatibus tempore ipsa deserunt rerum fuga architecto.','1983-06-13'),(117,'Deserunt amet.','Officia ullam iste omnis sed est vitae dolorem fuga. Repudiandae nam dignissimos perspiciatis et ut iste. Nemo harum maxime possimus magni sunt.\nMolestiae optio voluptatem laudantium ea. Iure perspiciatis officiis et. Amet laboriosam in non dolor.','1982-10-01'),(3,'Destfrom','Odit et nemo a aut. Distinctio id voluptas eum fugiat rerum.\nAb sit repellendus eaque corporis omnis voluptatem animi dignissimos. Aliquam rerum quis rerum atque est non quo.','1990-01-27'),(42,'Diabitis','Cumque a aliquid quia doloremque architecto. Sint ut consequatur a eos sapiente pariatur architecto quos. Aut aliquid aut libero molestiae minus quisquam et. Enim quia earum saepe corporis nesciunt modi.','2008-08-02'),(59,'Diduassumendagender','Laborum nihil aperiam minima eum quis quos possimus. Et fugiat laudantium ab quos ad et libero quo. Saepe expedita qui saepe saepe ad.','2015-12-18'),(50,'Distinctiocoming','Repudiandae sapiente pariatur sed quos. Earum quis ipsa delectus dicta. Sit eum maxime sit molestiae illo veritatis nobis.','2017-12-04'),(48,'Doloribus','Dolorem magnam aut eaque corrupti. Itaque aperiam voluptas inventore aut voluptatibus ut dolore. Ut dolor velit eum est et hic sit omnis.','2008-02-23'),(78,'Ducimus sapiente.','Officiis cumque nihil est quae quasi. Impedit et aut et. Blanditiis nesciunt perferendis quia cupiditate ut magni in.\nEius iste sequi eaque architecto fuga. Vel aut aspernatur ab. Ipsa porro rerum asperiores explicabo atque facere quod.','1991-04-15'),(85,'Earum id.','Facilis consequuntur culpa dolorum aut dicta et ea. Itaque dignissimos non qui facere. Et corporis rerum libero asperiores mollitia nam. Quis et nostrum ducimus doloribus.','2000-08-11'),(1,'Eisores','Asperiores consectetur in dolores reiciendis et repellat deserunt consectetur. Aut labore laboriosam iste dolorem voluptatum facere. Iusto minus quia quae dolores. Ab voluptatibus excepturi aspernatur facere incidunt.','1986-04-23'),(30,'Elabore','Sit cum molestiae saepe quis aliquam. Accusamus quia repudiandae libero modi voluptas et. Et rerum eveniet et inventore consequuntur.','2000-12-20'),(30,'Elaboriosam','Nesciunt ratione quaerat perspiciatis velit cum voluptatibus. Suscipit quisquam eaque dignissimos blanditiis. Deleniti cupiditate non consequatur tempore. Velit voluptate quas et consequuntur.','2005-11-25'),(117,'Eligendi commodi id.','Id ut dolorem eos omnis facilis sit. Beatae voluptatem eos quam molestiae quisquam voluptate et. Optio provident molestiae pariatur quidem.','1984-07-15'),(108,'Enim quas.','Et quisquam voluptates rerum nihil illo vitae possimus. Aut occaecati delectus est soluta rerum. Voluptatem aliquam earum consequatur iusto.','1995-01-29'),(75,'Eos et.','Non facere quis dolor aut quibusdam. Facilis voluptatibus et voluptas libero consequatur. Voluptatum molestiae explicabo voluptas.','2009-06-02'),(12,'Eospalikar','Qui consequatur aut eius omnis fugit eos illo. Sed vel quisquam impedit eveniet.\nIste quis eaque voluptas enim aperiam. Nam porro suscipit cupiditate alias. Eum exercitationem ipsam dolorem eaque ut consequuntur.','2013-11-24'),(57,'Epidignissimos','Reiciendis similique facere ut et numquam rerum voluptatem praesentium. Expedita est et ad. Natus quas accusamus pariatur alias laudantium temporibus quis. Maiores voluptas vel ea numquam et reiciendis.','1989-08-02'),(12,'Esequi','Repudiandae omnis est unde eius. Culpa temporibus eos ab sapiente quia.','2001-04-18'),(47,'Esimiliques','Saepe voluptas nam repellat voluptatem debitis est. Aut est autem dicta quia recusandae deserunt molestias. Dolor ipsam aut qui.','1983-10-26'),(105,'Et aspernatur eos.','Facere tempore sunt hic aliquam ut ut error doloribus. Voluptatem enim tenetur dolorum non odio ea. Vitae ipsa vero nisi eveniet eum corrupti quas.\nNesciunt facilis est voluptatem molestiae. Dolorum aut qui a autem.','1997-07-30'),(86,'Et consequuntur delectus.','Quo sint doloremque quaerat suscipit et. Pariatur doloribus blanditiis pariatur omnis rerum quia molestias inventore. Magni quo velit quia a est deleniti consequatur.','2012-09-13'),(116,'Et cumque.','Ut totam sunt earum ratione. Odit natus dolorem assumenda dolorem culpa illo. Autem dolorem ut itaque vero excepturi architecto. Facilis unde assumenda natus earum ab autem.','1979-05-14'),(116,'Et dignissimos.','Corporis deserunt at tempora non sunt. Impedit provident sequi corporis quo et repudiandae quo. Iure modi quisquam vero ducimus est voluptas nobis.','2006-09-04'),(108,'Et voluptas adipisci.','Modi fugit suscipit quae similique est nihil expedita. Illum recusandae aut sed ea reprehenderit asperiores. Est sit atque quibusdam distinctio. Aut dolores id inventore consequatur non.','1990-10-23'),(50,'Ethereum','Veritatis delectus qui quia quae dolorum rerum voluptas hic. Unde modi corporis atque et qui. Rem error illum nam praesentium. Neque laborum qui temporibus rerum nam quibusdam praesentium. Placeat repellat modi nostrum eveniet fugiat suscipit.','1990-04-21'),(97,'Eum voluptatem.','Dolor illo deleniti animi et maiores et sequi. Cumque dolorem tempore asperiores. Fugiat sunt veniam nam quo ratione quidem iure.','1988-03-17'),(85,'Eveniet non saepe.','Modi rerum molestias provident animi omnis perspiciatis in dolor. Dicta est praesentium aliquid et quisquam. Est expedita culpa nihil amet.','1985-06-14'),(89,'Ex accusantium dolorum.','Omnis modi recusandae reiciendis iusto. Repellendus ut quia praesentium quo. Vero quo occaecati quis rerum.\nDolor corporis vel dolores eum qui. At recusandae fugiat dolor vel dolores. Non corrupti deleniti voluptatem omnis et qui vero dolorum.','1970-08-20'),(57,'Excalibo','Qui est et molestiae consequatur. Dolorem debitis id voluptas voluptatum autem repudiandae culpa. Tempora quia in totam corporis corrupti. Eum voluptate quasi magni ut.','2013-11-27'),(118,'Exercitationem ducimus sit.','Mollitia dolorum aut at molestiae. A sequi sed sit aspernatur voluptas. Expedita quis sed ex cum.','2002-12-15'),(45,'Exexucuc','Et et accusamus unde magnam iusto neque. Exercitationem dolor facilis sed ad rerum.\nIllo autem iste voluptatem. Dicta qui et ad voluptatibus praesentium incidunt est. Incidunt libero in delectus. Quia dolor maiores est quaerat.','2016-01-10'),(5,'Fugifigi','Accusantium dolorem distinctio quam commodi et quo accusantium culpa. Sunt aut nobis quia. A iste nesciunt et quibusdam esse qui voluptatem. Enim eum porro mollitia dolorum.','2020-09-11'),(50,'Fugitapodo','Maxime neque et fugit saepe. Similique quo ea minus rerum et vel.\nDolore autem voluptatum molestias vero praesentium nostrum nesciunt. Similique incidunt cum hic sit. Et ea accusantium sit deleniti eum cupiditate commodi. Et non consectetur eveniet.','2019-02-16'),(38,'Harumlipithum','Id repellendus maiores mollitia hic aut. Dolor eaque illo nostrum corporis. Et deserunt eligendi quia dolores eligendi minima enim ut. Praesentium aspernatur repellendus et et consequuntur explicabo.','1996-02-11'),(12,'Hilliwirld','Fuga earum esse est laudantium. Voluptates rem consequatur ea in officiis. Autem voluptatum expedita sunt ipsam veritatis.\nReprehenderit quod vitae voluptatem omnis omnis. Illum quo laboriosam ea dolore assumenda veritatis. Autem suscipit pariatur hic.','1998-07-05'),(12,'Holestias','Dolor vel eos saepe cum. Cumque ipsum consequatur est maiores amet magnam. Rerum doloribus ullam et. Hic nulla illum est dolor qui.','2013-02-02'),(74,'Id sunt.','Sunt tempore quia cum ut porro. Vero iusto perspiciatis vero eos tempore vel. Dolores culpa rerum quas impedit velit.','1996-11-10'),(92,'Impedit cumque.','Eum qui commodi eos. Dolor facere illum tenetur amet iusto et. Id accusantium illo quo labore maxime nihil. Asperiores iure nulla tenetur delectus.','1993-06-22'),(91,'Impedit fugit.','Inventore sed sit praesentium id. Pariatur autem ad consequatur quia qui tenetur. Provident optio est dolor facilis. Illum fugit et iure quas dolores assumenda.','1982-07-24'),(52,'Indahou','Iste quidem fugit numquam tempora. Vero at numquam sed. Fugiat qui aperiam sequi aliquid dolor corporis et. Exercitationem harum molestiae ea quaerat dolor aut est.','2006-02-24'),(92,'Inventore dolorem ipsa.','Veniam corrupti sed enim voluptatum dolorem et enim. Quos odio porro reiciendis consequatur. Est dignissimos quae maiores velit facilis doloribus.','1994-08-03'),(113,'Inventore quia vel.','Alias delectus quo eos repellat. At quia sequi enim fugit. Ut id qui aperiam doloribus accusamus optio vel. Dignissimos et sit quis laborum sunt quidem rerum.','1973-04-20'),(1,'Ioure','Voluptas mollitia laborum voluptatem earum. Voluptatem quas debitis non laborum illo cumque ut. Et adipisci aut vitae fugiat.','1983-08-20'),(60,'Ipadr','Qui sapiente aut et officia cumque facilis harum. Expedita rerum voluptate asperiores et voluptatem ipsam possimus vel. Voluptate laudantium ipsam aut nemo. Eos quas quidem voluptatem magni quia ab officiis. At dolore ut accusamus dolores neque.','1973-01-21'),(27,'Joluptates','At reiciendis aspernatur eveniet. Omnis rerum odit doloremque at. Aut itaque est culpa eum. Veritatis corrupti fugit exercitationem quo impedit quo officia.','1984-09-04'),(34,'Kalisperiores','Perferendis totam labore inventore. Accusantium soluta ut ratione. Rerum earum cumque ut temporibus magni tenetur. Architecto sunt ut quo. Ex enim nemo consequatur quaerat ipsam consequatur.','1995-09-14'),(49,'Karatue','Dolorem dolore molestiae harum. Adipisci maiores porro ullam dolorem beatae magnam. Delectus vitae possimus vero eos. Quia soluta molestiae eligendi possimus quisquam et.','2012-10-15'),(35,'Kat','Iste sint dolores eos qui mollitia aut magni. Officia est repudiandae non enim dolor omnis ducimus. Qui quis maiores vel dolores sit.','1993-12-11'),(45,'Klautem','Sit provident libero quae ea cumque accusantium voluptas ut. Aperiam aspernatur est veritatis impedit ab. Laborum nesciunt ab praesentium quae culpa voluptates. Sequi aliquid occaecati exercitationem.','2005-08-25'),(15,'Koluptatem','Quia at alias velit ad dolores. Vel iure quis neque odio et sit. Vel quibusdam enim aliquam dolores dolor tenetur et dicta. Rem qui assumenda doloribus officiis nisi quo sunt aut.','2008-01-25'),(3,'Kopsame','Veritatis est nihil omnis illum eum fuga. Ea ad quis aut voluptates. Magnam id cumque modi. Excepturi ratione provident consequatur ipsam.','2017-07-26'),(86,'Laboriosam voluptatem.','Voluptas doloremque natus atque quidem natus. Quis quas occaecati est itaque. Eos perspiciatis tempora dolorem deserunt modi aliquid omnis. Ut voluptatem est eius reiciendis ad sed.','2020-05-18'),(15,'Leakinisi','Odit omnis sapiente libero dolores aliquid eveniet. Quo odit qui voluptas explicabo maiores.\nEt cumque dolorem nihil sunt qui odit qui rem. Id iste nisi ut et sequi quis. Rerum ea praesentium vel in perferendis possimus.','2019-01-27'),(30,'Leaquepasa','Autem ut in deserunt. Est molestias consequuntur sapiente temporibus sunt. Ut assumenda amet dignissimos ad accusamus magnam et.','2008-01-10'),(30,'Lequibusdam','Quod id eum ut quam aut reprehenderit. Quasi quia ducimus est est id. Qui totam ea blanditiis amet. Magni cum ea non culpa.\nAperiam sed dicta et quam rerum dolorem. Et rerum consectetur porro eius.','1972-07-27'),(15,'Lihil','Incidunt dolores iure ipsum perspiciatis vel quaerat sed. Totam perferendis provident et vel. Vel quasi labore maiores numquam suscipit quidem. Repellat dolorum repellendus nemo itaque. Vitae odit sit quae assumenda.','2003-08-28'),(9,'Lonam','Aut iure quia quia quae et sed. Occaecati quia illum sint repudiandae. Fuga iusto vel nesciunt illum.','2007-05-16'),(61,'Losunt','Perferendis sint laudantium alias nihil necessitatibus assumenda. Doloremque voluptatem omnis pariatur. Culpa ipsa eum similique et.','1993-08-23'),(103,'Maxime qui.','Eveniet voluptates omnis ut cum aperiam vel. Voluptatem in asperiores qui eos voluptatem. Aut beatae qui sit fugit odio. Occaecati omnis quos ipsam aut voluptatum nesciunt. Rerum eum et incidunt.','2007-07-08'),(34,'Maximes','Fugiat et eaque sapiente consequatur dolores. Laborum qui voluptatibus et voluptate. Ipsam et quos in magnam.\nVel est molestiae laborum. Et animi quo nihil tenetur voluptate quas ad.','2011-10-16'),(68,'Minusten','Repudiandae suscipit sint amet autem aperiam dolorem quibusdam sit. Eaque autem sit in aperiam ut ab omnis qui. Adipisci minus placeat impedit repellendus quas aut. Repudiandae accusamus quibusdam ut ipsa atque soluta.','2011-11-29'),(120,'Necessitatibus beatae et.','Iusto temporibus corporis ut sit dolores sed. Officiis dicta hic odio dolorem officiis amet impedit. Doloribus voluptas dolorem in voluptas maxime voluptas accusantium omnis. Dolores odio aliquid soluta qui repellendus et.','2003-05-16'),(84,'Necessitatibus et nisi.','Voluptas consectetur eligendi itaque omnis reiciendis id rem. Quia voluptatum sint dolor et omnis amet deleniti nesciunt. Facere eum non quidem quis deleniti expedita ab est. Error eum veritatis qui ipsam id quisquam a.','2009-06-17'),(95,'Nesciunt vel.','Ut qui tempora expedita vero corrupti at vitae. In magni non repudiandae eius nobis voluptatum. Vel dolore tempora quia quia odio et.','1979-05-29'),(118,'Nisi labore rem.','Veritatis vel ut a sed maiores. Fugit optio odit sit hic. Vitae magni ut iusto.','1985-05-30'),(9,'Noexercitatione','Consequatur aut quis corrupti reprehenderit voluptatem nihil non. Laboriosam quis dicta explicabo consequatur est repellendus cumque nam. Nam amet suscipit sit animi laudantium. Consequuntur ut recusandae odit.','1986-03-02'),(76,'Non earum.','Laudantium consequatur iusto molestiae voluptatibus repudiandae. Repellendus iusto est autem molestiae id blanditiis ea.\nVel quidem quaerat perspiciatis consequatur quis magnam. Dolores ut velit voluptatem placeat quia. Ducimus rem hic aut delectus sunt.','1986-12-16'),(80,'Non quam.','Omnis libero mollitia quos quibusdam. Quisquam aliquid ex laborum dolore mollitia harum corrupti. Dolorem distinctio rem libero quo autem facere.','2015-11-19'),(12,'Noobis','Sunt quia omnis reprehenderit earum molestias quod dolorem. Vero totam possimus alias maxime. Animi vitae praesentium fugiat. Enim harum tenetur deleniti ipsa officia praesentium.','2015-04-29'),(70,'Nosciuntu','Impedit eligendi quia maxime reiciendis est soluta consequatur. Sunt cumque molestiae consequatur earum. Quam explicabo corporis est et.','1997-04-12'),(115,'Nostrum perspiciatis.','Pariatur debitis modi quam ut non. Voluptates saepe praesentium fugit incidunt tempora sit rerum. Maiores sint quisquam at impedit at vel et aut.','1991-05-05'),(48,'Nowsit','Autem qui explicabo recusandae voluptas eum. Culpa recusandae enim quidem quia laudantium. A fugiat veritatis quis est.\nCorporis omnis ab suscipit tempora. Natus totam perferendis sint. Et dolorem excepturi molestiae aliquid unde molestiae.','2005-01-10'),(53,'Oblanditiis','Ut sed non minima in. Totam quia quia ullam atque qui. Sed est adipisci error facere et. Facilis modi repudiandae voluptas eos commodi quas eum.','1993-07-05'),(96,'Odio voluptatibus in.','Ab voluptatem consequuntur ut. Sed impedit non rerum eos dolorem quidem dolor maxime. Temporibus aut magni dolorum repellat deserunt. Porro molestias qui rerum repellat voluptatem.','1991-10-16'),(91,'Omnis voluptas.','Minus nostrum numquam sunt cumque ipsum animi adipisci. Corrupti animi ut reprehenderit et. Nostrum dolor ut ex omnis. Quo quo ducimus ullam.','1997-07-27'),(22,'Omnispro','Rerum eligendi dolores blanditiis occaecati quisquam pariatur et voluptatem. Modi ut voluptatem tempora quia. Qui dolor dolor possimus voluptate atque. Et quia in quos exercitationem cum. Eius officia est et quidem inventore.','1995-07-14'),(54,'Palaquas','Quidem cupiditate porro animi quia optio. Facilis tempora numquam doloribus quibusdam.\nAperiam sit nobis ea. Omnis nulla mollitia corrupti qui. Sit unde dolor voluptatem voluptatum.','1983-11-06'),(33,'Pamenisi','Deserunt tempora et ullam non assumenda. Tempora itaque exercitationem provident dolore voluptates animi reprehenderit totam. Et voluptates quo perferendis laborum rerum ad. Fuga repellat quibusdam in illo.','1985-01-13'),(42,'Pampelibero','Magnam et odio ad molestias ad nam. Optio in quos ut ex nostrum et consequatur. Sequi numquam voluptas voluptatem nobis tenetur.','2020-06-24'),(21,'Paraconsequatur','Non beatae ut ipsam officiis perspiciatis velit. Amet sunt et est quia et ducimus. Delectus ut sed ut.\nEt omnis quia rerum repudiandae voluptatem. Itaque porro quia et ut vel autem ut.','1977-10-08'),(40,'Perferendis','Ut qui ducimus beatae commodi saepe eveniet porro. Nisi non pariatur harum sapiente dolores sed. Nisi numquam deserunt consequatur. Quo sint soluta nobis neque modi asperiores. Saepe eum odio eveniet vero unde id nobis.','1995-07-05'),(73,'Perferendis enim.','Atque minus quia et ipsa iusto voluptate ut. Culpa quia quo libero unde ad voluptates. Assumenda quas ipsa in. Nam et modi distinctio rerum ullam.','1993-11-22'),(99,'Perspiciatis consequatur.','Modi est fugit dolorem rerum minima deserunt accusantium. Officiis laboriosam possimus dolores qui perspiciatis sunt. Saepe provident vero alias enim sequi exercitationem.','1972-06-24'),(78,'Perspiciatis ipsam reprehenderit.','Aut repudiandae sint perspiciatis magni sint placeat dicta. Non asperiores omnis voluptate commodi odio dolore facilis. Quisquam ex non officia quia. Unde molestias autem consequatur minus ut perspiciatis. Et quasi impedit et corporis enim officia.','1977-03-03'),(95,'Perspiciatis iure.','Modi consequatur sed autem iste sint odit iure omnis. Qui doloremque occaecati quia maiores. Enim omnis quis aut suscipit ut dolorem expedita.','2005-06-24'),(15,'Petpat','Quia aut voluptatum quisquam pariatur culpa. Aut blanditiis aut excepturi dolores quia omnis rerum unde.\nHic nobis possimus sint optio et quaerat. Ipsum maxime tenetur repellat dolores commodi.','1998-05-27'),(95,'Placeat amet.','Libero placeat aut ipsa nulla a. Eveniet quo sed provident explicabo. Corrupti impedit labore omnis ducimus.','2011-09-25'),(59,'Politia','Facere molestiae non ut autem facere modi explicabo in. Est est quibusdam voluptas. Sunt consequatur ducimus magnam magni eius. Itaque minus nulla doloribus enim.','1984-04-07'),(54,'Porquia','Minus autem iusto suscipit. Dolores laboriosam consequatur ut eius at voluptatibus quisquam. Qui cupiditate quasi repellat rerum reiciendis esse quod.','1982-02-04'),(86,'Possimus vel ut.','Totam occaecati maiores non. Molestiae voluptate harum minima consequatur officia cupiditate aut. Dolore ducimus modi debitis. Consectetur nisi quas ut eaque nihil. Delectus et optio hic velit voluptatum est nam autem.','2003-03-28'),(10,'Preprehenderit','Porro placeat laboriosam ut inventore id. Dolorum quod aut atque et sunt. Voluptatem omnis at enim eveniet rerum veniam ut. Molestiae dolorem quo aperiam officia repudiandae et eos nisi. Repellat corrupti quia sunt deserunt doloribus magnam labore.','2013-11-25'),(53,'Providenefai','Veritatis aliquid sapiente aut officia et qui. Ut non ad architecto aut fuga. Expedita iusto officia fugiat qui atque eum molestiae.','2009-11-21'),(55,'Puntusnatus','Suscipit ut error quo porro. Quaerat autem nisi placeat. Nisi magnam accusamus fugit veritatis sed molestias sint impedit. Ratione accusamus minima alias sit totam tenetur dicta ea.','1986-03-07'),(101,'Quaerat quas ea.','Debitis in beatae consectetur sit ipsum. Molestiae minima iste voluptate sed corporis. Enim rerum rerum explicabo sit veritatis.','1986-05-30'),(19,'Quaquod','Soluta mollitia voluptatem perspiciatis nihil consequatur nam at. Aut quis eveniet ut illo temporibus laboriosam. Quidem voluptas praesentium impedit.','1977-12-03'),(95,'Quasi iure ut.','Ut assumenda nobis harum nemo non quisquam sapiente. Possimus qui placeat dignissimos dicta temporibus laborum placeat animi. Suscipit sit quam consectetur in qui ut. Consequatur enim consectetur eaque minima culpa dignissimos commodi.','2010-08-06'),(45,'Quecumque','Est fugit recusandae quos et iure repellat. Quis maiores eius similique consequatur quis dolorem. Aliquam veritatis sint voluptatem rerum non.\nCorrupti ratione id placeat voluptatibus ad maiores. Qui culpa sint magnam eius accusamus consequuntur minus.','2012-06-10'),(75,'Qui aliquam quas.','Officia beatae fuga adipisci labore sunt consequatur. Ea vel vel aut voluptatibus est provident soluta. Laudantium repellat natus et voluptate sit. Aut quas rerum eius.','1970-06-09'),(119,'Quia in est.','Rerum accusamus ipsum harum quaerat. Architecto iusto omnis eveniet incidunt. Voluptatem deleniti omnis aut necessitatibus et. Praesentium occaecati eum ut optio quia aut.','1981-04-13'),(101,'Quis et.','Facilis magnam aut velit unde est. Maxime non quisquam pariatur provident vero corporis. Quis cum omnis autem debitis similique aut qui ut.','1995-09-05'),(120,'Quis quis.','Ut voluptas at ab. Provident a magni molestiae quos quia dolores officiis. Itaque deleniti corporis magni sed omnis. Ea voluptatibus et deleniti soluta ut facilis.','1998-05-17'),(101,'Quod officiis.','Officia dignissimos qui ducimus quod voluptatem. Dolores atque molestias laboriosam recusandae possimus voluptatem. Dolorem accusamus recusandae est culpa.\nVoluptates ut in numquam est ut harum voluptatem. Autem molestias repellendus eius repudiandae at.','1995-12-06'),(27,'Rebellendius','Architecto dolor recusandae consequatur non eligendi quidem. Vitae sed itaque vel nesciunt rerum. Ut rerum nostrum odit ex velit sit minus.','2019-02-19'),(49,'Reiciendisto','Quo amet sint accusamus magni. Est iusto cupiditate aliquid vitae. Labore ad autem qui autem.\nAtque id officiis id asperiores. Magnam quidem nihil quae pariatur sed quia.','2013-02-20'),(35,'Repelates','Voluptas corporis quisquam dolores voluptatem. Consequatur ipsam ea adipisci pariatur repudiandae. Sequi neque recusandae veniam error ipsa.\nSequi minus esse dolores ipsa nulla. Qui architecto quisquam impedit.','1982-12-21'),(110,'Repellendus nam.','Enim optio delectus sed. Aut error error ut atque eum et eius. Quos dolorum sequi molestiae omnis. Aspernatur suscipit nam repellat et aliquam aliquid.','1976-10-15'),(73,'Rerum perspiciatis.','Pariatur aspernatur minus omnis debitis ut qui. Qui enim vero dolores et qui. Quia sit velit rerum voluptatibus nemo corrupti et quos. Numquam sint quidem nostrum quaerat nesciunt repellendus asperiores.','1996-01-31'),(92,'Rerum quas voluptas.','Qui distinctio aperiam quia impedit et laborum. Harum voluptas omnis nobis omnis quis error quidem autem. Repellendus quia ab dolorem non est.','1999-08-07'),(20,'Resapiente','Aut et quas est autem. Odit dolores aut id qui itaque illum. Error mollitia nihil architecto sunt nisi repellat. In qui at eum.','2013-11-02'),(67,'Smelimpedit','Ut nulla fuga repellendus perspiciatis aut. Hic voluptas iure nam officiis fuga. Quidem dolor soluta voluptate error error. Nostrum dolores alias nisi quas tempore quia iure.','2004-08-06'),(78,'Soluta qui.','Tempora occaecati maiores eum laboriosam odio in. Veritatis est dolor totam eos ex tenetur repudiandae. Et aspernatur vel tempore id dolore voluptatem consequuntur.','1977-12-29'),(82,'Temporibus labore.','Modi unde ut enim libero sit sit. Quasi earum voluptatem sit nisi. Deserunt omnis rerum repellendus harum magni ullam architecto. Voluptate possimus natus doloremque.','1985-07-08'),(10,'Titempore','Consectetur illum et exercitationem illum est nam. Ut et eveniet debitis est. Et qui recusandae sed ipsum. Voluptatem dolorum et repellendus consequatur velit.','2015-03-15'),(113,'Totam et.','Sunt ut amet adipisci ut reiciendis porro est. Reprehenderit rerum et est aut nobis ut non. Laudantium suscipit sed voluptate at fugit itaque amet. Ducimus rerum repellat reprehenderit qui excepturi.','1995-10-10'),(38,'Tudolor','Nulla expedita consequatur earum maxime voluptatem. Et praesentium aut vel laudantium mollitia fuga odio.\nIpsam recusandae dolores molestiae sit officiis. Sint quo vel qui in nisi. Doloribus unde quia nam quia.','2014-05-24'),(76,'Ullam quis.','Molestias quasi consequuntur fuga cum aut quisquam repudiandae cumque. Provident minus eius est possimus sed corporis. Debitis delectus ut iste. Quidem totam et quasi qui quis non ab eum.','1977-05-06'),(47,'Undege','Voluptatem id cum aut esse expedita ducimus vero. Consequatur quod ea iusto alias alias. Est dolorum eaque quas enim est aut nisi.','2001-04-10'),(24,'Usint','Enim ad beatae quod asperiores molestiae similique dolor. Reprehenderit qui corrupti sint qui ut. Laudantium praesentium eum saepe reiciendis.','1993-10-06'),(99,'Ut nesciunt reprehenderit.','Et esse similique voluptatem. Blanditiis ad vero hic dignissimos voluptatum id veniam. Qui corrupti sequi voluptas. Quas pariatur voluptatem ea nulla atque qui.','2004-12-08'),(4,'Utapodo','Fugit qui fugiat voluptates omnis aut magni. Consequuntur quos sit ipsum a deserunt minima quisquam. Illo voluptatem voluptatem ut vitae ut tenetur.','2015-11-13'),(93,'Vel quo eos.','Voluptatem et placeat ut cum occaecati. Pariatur sequi ipsam inventore. Eius eos fuga dolorem earum provident est. Sint ut delectus molestiae explicabo aut perferendis dicta.','2016-03-06'),(74,'Veniam eos accusamus.','Et expedita quia ut occaecati corporis. In consequatur voluptas voluptas pariatur totam cupiditate et quibusdam. Et beatae et et earum nemo.','2018-06-27'),(110,'Voluptatem rem alias.','Dolor mollitia et vitae iusto consequatur. Quos aut delectus qui perspiciatis ab eos temporibus. Corrupti laudantium velit laboriosam nam iste. Ratione vitae aut soluta omnis.','2011-07-01'),(34,'Wessex','Quos quam debitis excepturi. Earum veniam illo est. Quidem eligendi dolores at in. Rerum omnis quis qui earum hic.','2013-09-30'),(45,'Yoluptatum','Laboriosam ex sunt quo possimus eveniet voluptatem. Temporibus eaque temporibus corrupti impedit vel ratione libero. Totam nam reiciendis aspernatur suscipit qui in error. Dolor a quidem provident asperiores ut et expedita.','2020-03-17'),(45,'Ypoquos','Doloremque dolor et recusandae ea. Iste praesentium et et rerum voluptatem. Aliquid tempore est perspiciatis ut eum dolor architecto.','2009-06-29'),(19,'Zoluptas','Perspiciatis laboriosam assumenda nobis quis ipsa. Magnam omnis eum ratione reprehenderit. Eos quo quo occaecati delectus dolorem dolor totam.','1985-12-24');
/*!40000 ALTER TABLE `deliverable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executive`
--

DROP TABLE IF EXISTS `executive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executive` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Μοναδικό αναγνωριστικό στελέχους',
  `name` varchar(100) NOT NULL COMMENT 'Όνομα στελέχους (μοναδικό)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Στελέχη ΕΛ.ΙΔ.Ε.Κ.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executive`
--

LOCK TABLES `executive` WRITE;
/*!40000 ALTER TABLE `executive` DISABLE KEYS */;
INSERT INTO `executive` VALUES (1,'Alberta Stanton'),(2,'Arjun Welch'),(3,'Dandre Boyer'),(4,'Elbert Franecki'),(5,'Elda Kling'),(6,'Kristina Ebert I'),(7,'Lexie Ward'),(8,'Mavis Schowalter'),(9,'Mrs. Julianne Toy IV'),(10,'Petra Schinner'),(11,'Sandra Maggio'),(12,'Shaina Kirlin'),(13,'Sofia McCullough MD'),(14,'Toby Pouros'),(15,'Velva Pacocha');
/*!40000 ALTER TABLE `executive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managed_by`
--

DROP TABLE IF EXISTS `managed_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managed_by` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου το οποίο συμμετέχει στη σχέση',
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα του οργανισμού που διαχειρίζεται το έργο',
  UNIQUE KEY `projectId_UNIQUE` (`projectId`),
  KEY `managing_organization` (`organizationName`),
  CONSTRAINT `managed_project` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `managing_organization` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Σχέση διαχείρισης μεταξύ έργου και οργανισμού';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managed_by`
--

LOCK TABLES `managed_by` WRITE;
/*!40000 ALTER TABLE `managed_by` DISABLE KEYS */;
INSERT INTO `managed_by` VALUES (1,'Abernathy-Cremin'),(28,'Abernathy-Cremin'),(30,'Abernathy-Cremin'),(52,'Abernathy-Cremin'),(60,'Abernathy-Cremin'),(78,'Abernathy-Cremin'),(100,'Abernathy-Cremin'),(54,'Adams, Weissnat and Roob'),(63,'Adams, Weissnat and Roob'),(8,'Barton Inc'),(11,'Barton Inc'),(12,'Barton Inc'),(13,'Barton Inc'),(22,'Barton Inc'),(24,'Barton Inc'),(26,'Barton Inc'),(32,'Barton Inc'),(37,'Barton Inc'),(38,'Barton Inc'),(49,'Barton Inc'),(51,'Barton Inc'),(56,'Barton Inc'),(62,'Barton Inc'),(64,'Barton Inc'),(71,'Barton Inc'),(75,'Barton Inc'),(77,'Barton Inc'),(89,'Barton Inc'),(92,'Barton Inc'),(93,'Barton Inc'),(98,'Barton Inc'),(102,'Barton Inc'),(105,'Barton Inc'),(107,'Barton Inc'),(108,'Barton Inc'),(112,'Barton Inc'),(116,'Barton Inc'),(118,'Barton Inc'),(9,'Bednar Ltd'),(17,'Bednar Ltd'),(23,'Bednar Ltd'),(29,'Bednar Ltd'),(36,'Bednar Ltd'),(40,'Bednar Ltd'),(42,'Bednar Ltd'),(48,'Bednar Ltd'),(59,'Bednar Ltd'),(67,'Bednar Ltd'),(69,'Bednar Ltd'),(74,'Bednar Ltd'),(88,'Bednar Ltd'),(90,'Bednar Ltd'),(91,'Bednar Ltd'),(97,'Bednar Ltd'),(101,'Bednar Ltd'),(113,'Bednar Ltd'),(115,'Bednar Ltd'),(119,'Bednar Ltd'),(120,'Bednar Ltd'),(7,'Bergstrom-Huels'),(16,'Brekke LLC'),(34,'Brekke LLC'),(96,'Brekke LLC'),(104,'Brekke LLC'),(19,'Cummings, Medhurst and Brown'),(57,'Cummings, Medhurst and Brown'),(99,'Cummings, Medhurst and Brown'),(2,'Deckow-Smitham'),(14,'Deckow-Smitham'),(33,'Deckow-Smitham'),(66,'Deckow-Smitham'),(72,'Deckow-Smitham'),(94,'Deckow-Smitham'),(103,'Deckow-Smitham'),(15,'Fadel, Mills and Senger'),(20,'Fadel, Mills and Senger'),(95,'Fadel, Mills and Senger'),(110,'Fadel, Mills and Senger'),(6,'Fritsch Ltd'),(58,'Fritsch Ltd'),(61,'Fritsch Ltd'),(76,'Fritsch Ltd'),(79,'Gleason PLC'),(18,'Heidenreich Inc'),(35,'Heidenreich Inc'),(47,'Hickle and Sons'),(87,'Hickle and Sons'),(43,'Hintz PLC'),(53,'Hintz PLC'),(83,'Hintz PLC'),(3,'Hoppe, Hagenes and Hegmann'),(44,'Hoppe, Hagenes and Hegmann'),(73,'Hoppe, Hagenes and Hegmann'),(84,'Hoppe, Hagenes and Hegmann'),(5,'Jacobi Ltd'),(21,'Jacobi Ltd'),(45,'Jacobi Ltd'),(85,'Jacobi Ltd'),(111,'Jacobi Ltd'),(31,'Jakubowski-Luettgen'),(68,'Jakubowski-Luettgen'),(50,'Jerde, Grant and O\'Kon'),(65,'Klocko PLC'),(80,'Klocko PLC'),(41,'Kreiger-Kozey'),(70,'Kreiger-Kozey'),(81,'Kreiger-Kozey'),(82,'Kreiger-Kozey'),(55,'Kuhlman and Sons'),(114,'Kuhlman and Sons'),(4,'Kuhlman-Cole'),(10,'Kuhlman-Cole'),(25,'Marquardt, Marquardt and Hauck'),(27,'Marquardt, Marquardt and Hauck'),(46,'Marquardt, Marquardt and Hauck'),(86,'Marquardt, Marquardt and Hauck'),(117,'Marquardt, Marquardt and Hauck'),(106,'Mayert Group'),(39,'McDermott, Balistreri and Heller'),(109,'McDermott, Balistreri and Heller');
/*!40000 ALTER TABLE `managed_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `name` varchar(100) NOT NULL COMMENT 'Μοναδικό όνομα του οργανισμού',
  `abbreviation` varchar(10) NOT NULL COMMENT 'Συντομογραφία',
  `street` varchar(100) NOT NULL COMMENT 'Διεύθυνση οργανισμού: Οδός',
  `number` int NOT NULL COMMENT 'Διεύθυνση οργανισμού: Αριθμός',
  `postal_code` varchar(5) NOT NULL COMMENT 'Διεύθυνση οργανισμού: Τ.Κ.',
  `city` varchar(100) NOT NULL COMMENT 'Διεύθυνση οργανισμού: Πόλη',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Οργανισμός';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('Abernathy-Cremin','AC','Greta Mountain',371,'18498','Lemkeshire'),('Adams, Weissnat and Roob','AWR','Kunze Viaduct',65,'86973','New Isaimouth'),('Barton Inc','Barton','Murazik Curve',192,'44932','West Eviemouth'),('Bednar Ltd','Bednar','D\'Amore Pine',356,'98352','Wehnerborough'),('Bergstrom-Huels','Ber.Hu.','Orrin Trace',74,'90348','Ziemeport'),('Brekke LLC','Brekke','Wilkinson Landing',93,'33244','Port Jeraldburgh'),('Cummings, Medhurst and Brown','CMB','Veum Trail',490,'67262','Ondrickamouth'),('Deckow-Smitham','DS','Ebert Stream',111,'65844','Romagueraview'),('Dooley-Feil','DF','Tiana Port',495,'42347','East Alethaside'),('Emmerich-Braun','EB','Thompson Mountain',184,'49901','New Timmy'),('Fadel, Mills and Senger','FMS','Berge Landing',18,'61230','New Melody'),('Fritsch Ltd','Fritsch','Feil Burgs',1,'59684','Matteoland'),('Gleason PLC','Gleason','Schmidt Skyway',314,'57540','South Edwinmouth'),('Hahn-Smith','HS','Miles Ranch',14,'90550','Kemmerhaven'),('Heidenreich Inc','HDN','Dach Coves',36,'57197','East Alisa'),('Hickle and Sons','HIC','Joesph Corners',370,'20910','Lake Ebba'),('Hintz PLC','HZ','Amelie Garden',187,'15290','Robertaton'),('Hoppe, Hagenes and Hegmann','','Rogelio Unions',465,'20374','North Bonnieland'),('Jacobi Group','JG','Carolyne Path',188,'34267','Joannieshire'),('Jacobi Ltd','JL','Shields Drive',106,'71222','Koeppland'),('Jakubowski-Luettgen','JL','Rowe Stravenue',255,'41072','Kirlinfort'),('Jerde, Grant and O\'Kon','JGOK','Brandy Points',355,'71617','South Anabelle'),('Klocko PLC','KLCK','Catharine Fields',431,'49236','Shieldsstad'),('Kreiger-Kozey','KK','Kerluke Grove',446,'16893','Lake Fiona'),('Kuhlman and Sons','K&S','Runte Roads',106,'46191','Boscochester'),('Kuhlman-Cole','KC','Kunze Course',395,'44437','East Joberg'),('Marquardt, Marquardt and Hauck','MMH','Ali Station',328,'92554','South Helen'),('Mayert Group','MG','Koss Trail',224,'16852','Hirthechester'),('McDermott, Balistreri and Heller','MBH','Alivia Forest',152,'68048','North Idellburgh'),('McGlynn LLC','MCG','Stanton Springs',119,'00713','West Jaylon');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_number`
--

DROP TABLE IF EXISTS `phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_number` (
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα του οργανισμού στον οποίο ανήκει ο αριθμός',
  `phone` varchar(10) NOT NULL COMMENT 'Αριθμός τηλεφώνου του οργανισμού (μοναδικός) - Ακριβώς 10 χαρακτήρες',
  PRIMARY KEY (`organizationName`,`phone`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  CONSTRAINT `belongs_to` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`),
  CONSTRAINT `check_phone` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{10}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Τηλεφωνικοί αριθμοί (τουλάχιστον 1 για κάθε οργανισμό)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_number`
--

LOCK TABLES `phone_number` WRITE;
/*!40000 ALTER TABLE `phone_number` DISABLE KEYS */;
INSERT INTO `phone_number` VALUES ('Marquardt, Marquardt and Hauck','2113068598'),('Adams, Weissnat and Roob','2113112177'),('Jacobi Group','2120602942'),('Barton Inc','2120807910'),('Adams, Weissnat and Roob','2127258215'),('Fritsch Ltd','2140887029'),('Barton Inc','2143135064'),('Abernathy-Cremin','2145445500'),('Bergstrom-Huels','2147685824'),('Gleason PLC','2149884006'),('Bednar Ltd','2161458895'),('Hoppe, Hagenes and Hegmann','2163761992'),('Brekke LLC','2165534537'),('Cummings, Medhurst and Brown','2166861694'),('Jakubowski-Luettgen','2168762400'),('Dooley-Feil','2169126383'),('Brekke LLC','2173193475'),('Kuhlman-Cole','2174705322'),('Brekke LLC','2183230344'),('Jacobi Ltd','2185296311'),('Jacobi Group','2187683307'),('Deckow-Smitham','2188024151'),('McGlynn LLC','2189580430'),('Abernathy-Cremin','2189943197'),('Jacobi Ltd','2190465566'),('Abernathy-Cremin','2191988154'),('Brekke LLC','2201317509'),('Cummings, Medhurst and Brown','2208216114'),('Hoppe, Hagenes and Hegmann','2211430552'),('Dooley-Feil','2211667962'),('Bednar Ltd','2213058431'),('Abernathy-Cremin','2215345492'),('Deckow-Smitham','2227437226'),('Hickle and Sons','2227776137'),('Jacobi Ltd','2235131994'),('Strosin, Hickle and Breitenberg','2235838919'),('Jacobi Ltd','2240501864'),('Bednar Ltd','2240560059'),('Abernathy-Cremin','2241539255'),('McGlynn LLC','2245154736'),('Jakubowski-Luettgen','2248098375'),('Emmerich-Braun','2252411832'),('Emmerich-Braun','2252806743'),('Jerde, Grant and O\'Kon','2255954394'),('Fadel, Mills and Senger','2257405870'),('Heidenreich Inc','2257517171'),('Fadel, Mills and Senger','2258560866'),('Brekke LLC','2262748490'),('Deckow-Smitham','2263201515'),('Kreiger-Kozey','2266317706'),('Hahn-Smith','2268918741'),('Hahn-Smith','2272842999'),('Jakubowski-Luettgen','2273186016'),('Cummings, Medhurst and Brown','2274803171'),('Barton Inc','2278141718'),('Marquardt, Marquardt and Hauck','2282264000'),('Barton Inc','2288664114'),('Hickle and Sons','2289654389'),('McDermott, Balistreri and Heller','2291509666'),('Fadel, Mills and Senger','2297873979'),('Deckow-Smitham','2300357080'),('Hahn-Smith','2302707593'),('Kuhlman and Sons','2310282204'),('Jacobi Ltd','2312646174'),('Deckow-Smitham','2312678823'),('Strosin, Hickle and Breitenberg','2315909227'),('Cummings, Medhurst and Brown','2335926470'),('Hoppe, Hagenes and Hegmann','2337022562'),('Heidenreich Inc','2338161212'),('Adams, Weissnat and Roob','2338382062'),('Bergstrom-Huels','2345343335'),('Hintz PLC','2346758182'),('Kuhlman-Cole','2351895966'),('Jerde, Grant and O\'Kon','2352533929'),('Heidenreich Inc','2354873234'),('Fritsch Ltd','2354977036'),('Fritsch Ltd','2355125731'),('Hickle and Sons','2355321187'),('Cummings, Medhurst and Brown','2356933786'),('Hintz PLC','2363083544'),('Klocko PLC','2374171840'),('Dooley-Feil','2374375933'),('Jakubowski-Luettgen','2381401236'),('Mayert Group','2382924420'),('McDermott, Balistreri and Heller','2384325735'),('Heidenreich Inc','2388140763'),('Kuhlman-Cole','2394765135'),('Gleason PLC','2395021182'),('Gleason PLC','2399792179'),('Barton Inc','2400261037'),('Klocko PLC','2410855587'),('Jacobi Group','2411653832'),('Emmerich-Braun','2412955917'),('Mayert Group','2416776769'),('Hintz PLC','2417477311'),('Kuhlman-Cole','2424664302'),('Kuhlman and Sons','2429355985'),('Kreiger-Kozey','2429894964'),('Heidenreich Inc','2431567128'),('Bergstrom-Huels','2438983802');
/*!40000 ALTER TABLE `phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Μοναδικό αναγνωριστικό του προγράμματος',
  `name` varchar(100) NOT NULL COMMENT 'Όνομα προγράμματος',
  `address` varchar(255) NOT NULL COMMENT 'Διεύθυνση',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Προγράμματα που χρηματοδοτούν έργα';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'Rerum','87422 Kihn Crest Suite 948\nBruenberg, CO 06418-6037'),(2,'Expedita','26959 Kurt Coves\nAdahview, DC 07125-8208'),(3,'Atat','498 Taylor Points Suite 642\nSouth Birdieville, FL 56730'),(4,'Saepe','231 Abbott Harbor Suite 729\nPort Raoulhaven, MA 92782'),(5,'Placeat','5069 Williamson Groves Apt. 757\nSamanthafurt, SD 11893'),(6,'Doloremque','38182 Lillian Ranch Suite 040\nArnoldchester, WY 45850-2442'),(7,'Inpro','3166 Armani Flats\nSporerchester, NE 32453'),(8,'Cuma','342 Tremblay Camp Apt. 163\nEast Alicebury, WY 52882'),(9,'Itaque','638 Corbin Neck\nErnserborough, WA 73539'),(10,'Laboriosam','44861 Kassulke Pines\nSouth Westleyshire, CA 86418'),(11,'Molestias','798 Eula Causeway Apt. 061\nBodeshire, GA 94987'),(12,'Exercitationem','274 Langosh Skyway Suite 138\nWest Cary, MD 56985-4124'),(13,'Tenetur','48727 Thiel Loop\nNorth Luraborough, GA 47775'),(14,'Numquam','475 Katharina Stravenue\nChesleytown, WY 93815-3403'),(15,'Culpa','7285 Goldner Isle\nWest Camrenberg, ND 65765-3603'),(16,'Fugit','7261 Giovani Knoll\nPort Agustina, WA 18678'),(17,'Quibusdam','1310 Stehr Union Suite 355\nMadalynhaven, VA 52558'),(18,'Commodi','19932 Dina View Apt. 831\nCiaraborough, OR 86561-2727'),(19,'Eius','27363 Strosin Skyway\nTylerburgh, OK 06840-0865'),(20,'Quas','953 Marjorie Plains Suite 725\nPredovichaven, KY 89636-8571'),(21,'Voluptates','73798 Schroeder Circle Suite 766\nHaydenchester, DE 16154-9149'),(22,'Ealp','35254 Hettinger Spur Suite 340\nLake Kaleb, WV 82121'),(23,'Suscipit','003 Ova Club\nVerdietown, NM 39941'),(24,'Voluptas','076 Kassulke Rue\nCreolaborough, MT 47553-7369'),(25,'Ut','07345 Dare Street\nGerholdmouth, IN 31870'),(26,'Expurt','326 Hugh Mission\nNew Mellie, PA 19730'),(27,'Omnis','2324 Gloria Overpass Apt. 599\nLeolaport, PA 83121'),(28,'Nesciunt','854 Velva Underpass Suite 602\nLake Wilhelmshire, IL 33250-1108'),(29,'Sunt','77972 Jackie Hills\nSouth Irvington, AZ 55107-0612'),(30,'Minus','25749 Anya Orchard Suite 409\nGleichnerfurt, MD 53675'),(31,'Quot','65732 Harris Gateway\nWest Rosalinda, AR 39598'),(32,'Nihil','0864 Ivory Extension\nLynchland, SD 92356-9193'),(33,'Odio','18594 Godfrey Roads Apt. 198\nPaucekside, VA 47254-2281'),(34,'Molestiae','651 Zetta Plains Apt. 172\nChadrickton, DC 11069'),(35,'Eos','10811 Rahul Radial\nHamillton, IA 63411'),(36,'Etome','300 Simonis Islands\nMarieville, DC 44300-9838'),(37,'Praesentium','5891 Osborne Place\nOrtizborough, ID 93425-8111'),(38,'Deserunt','6061 Alba Fall Suite 478\nRogeliohaven, VA 36341'),(39,'Mollitia','0982 O\'Connell Streets Suite 888\nNolanville, MD 46660-4539'),(40,'Aliquam','9397 Raven Station Suite 037\nWilliamsonfurt, ID 88024');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Μοναδικό αναγνωριστικό του έργου',
  `title` varchar(100) NOT NULL COMMENT 'Τίτλος του έργου',
  `description` varchar(255) NOT NULL COMMENT 'Περίληψη',
  `budget` decimal(9,2) NOT NULL COMMENT 'Ποσό χρηματοδότησης',
  `start_date` date NOT NULL COMMENT 'Έναρξη',
  `end_date` date DEFAULT NULL COMMENT 'Λήξη (αν είναι κενό, το έργο είναι ακόμα ενεργό)',
  `duration` decimal(3,2) GENERATED ALWAYS AS (((to_days(`end_date`) - to_days(`start_date`)) / 365)) STORED COMMENT 'Διάρκεια του έργου (υπολογιζόμενο πεδίο)',
  `programId` int NOT NULL COMMENT 'Αναγνωριστικό του προγράμματος που χρηματοδοτεί το έργο',
  `researchManagerId` int NOT NULL COMMENT 'Επιστημονικός υπεύθυνος του έργου',
  `executiveId` int NOT NULL COMMENT 'Στέλεχος του ΕΛ.ΙΔ.Ε.Κ που διαχειρίζεται το έργο',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `has_research_manager` (`researchManagerId`),
  KEY `has_executive_manager` (`executiveId`),
  KEY `has_sponsoring_program` (`programId`),
  KEY `idx_start_date` (`start_date`),
  KEY `idx_duration` (`duration`),
  KEY `idx_title` (`title`),
  CONSTRAINT `has_executive_manager` FOREIGN KEY (`executiveId`) REFERENCES `executive` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `has_research_manager` FOREIGN KEY (`researchManagerId`) REFERENCES `researcher` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `has_sponsoring_program` FOREIGN KEY (`programId`) REFERENCES `program` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `limit_end_date` CHECK ((((to_days(`end_date`) - to_days(`start_date`)) / 365) between 1 and 4))
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Έργα/Επιχορηγήσεις';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `title`, `description`, `budget`, `start_date`, `end_date`, `programId`, `researchManagerId`, `executiveId`) VALUES (1,'Non','Molestias ut quam maiores tempore. Nemo vel enim sapiente quam voluptatem dicta. Pariatur vitae expedita rerum.\nLaboriosam sint et enim quod eos. Quis magni aliquam ut asperiores sint temporibus.',266491.53,'2018-12-26','2020-03-20',1,1,1),(2,'Blanditiis','Minus velit sit quod occaecati. Sint voluptatum non nisi enim sit aspernatur possimus. Dolor in sapiente harum dolores ut aut id.',644445.93,'2015-01-01','2016-05-26',2,2,2),(3,'Error','Repellat odit quo ad eos alias numquam quam doloribus. Blanditiis voluptatem voluptatibus debitis aut.\nMinima nobis non nihil in ut sed ullam. Autem cumque et odio.',763909.30,'2020-11-30',NULL,3,3,3),(4,'Atar','Facilis debitis quibusdam enim molestiae. Amet voluptas itaque in voluptatum voluptatem. Aspernatur deleniti maxime voluptatem magnam corrupti dolorem.',709685.39,'2011-07-23','2015-02-22',4,4,4),(5,'Praesentium','Veritatis nihil velit eos magnam ex sit. Et eos et atque quibusdam dolores velit deserunt. Et omnis placeat assumenda est. Ratione sapiente qui omnis voluptatem aut porro.',238510.85,'2015-11-03','2017-05-09',5,5,5),(6,'Volupatates','Fuga reprehenderit odit atque quas ut. Aut qui consequatur alias neque. Eum laboriosam possimus ullam ut quas commodi doloremque. Voluptas tempora ullam illo fugiat.\nDolor aut aut vero fugit. Fugiat molestiae optio omnis ipsa.',705483.04,'2015-05-24','2017-04-20',6,6,6),(7,'Eum','Voluptatibus praesentium quia laborum praesentium alias et. Enim vel pariatur autem provident qui. Mollitia maxime est tempore placeat odit distinctio.',158940.06,'2017-04-12','2021-03-13',7,7,7),(8,'Est','Delectus neque ipsum aspernatur dolor voluptas culpa quo similique. Corrupti eos neque earum veniam blanditiis.\nIllum sit neque nihil dignissimos voluptatem. Culpa voluptatem numquam minima eos iure optio aspernatur.',377898.63,'2021-06-02',NULL,8,8,8),(9,'Ut','Explicabo quis temporibus labore omnis optio sit sed. Eligendi tempora esse ut. Repudiandae est quis laudantium minima laborum ea aut provident. Repellat error qui asperiores est sit fuga. Quisquam unde aut commodi perferendis.',847301.21,'2020-10-06','2022-04-22',9,9,9),(10,'Possimus','Dignissimos quas sed nesciunt perspiciatis aut ut. Nisi deserunt in suscipit qui maxime. Illo explicabo a laboriosam magnam voluptates minima. Officia deleniti dolores praesentium tenetur illo eveniet modi at.',709291.43,'2014-09-14','2018-07-08',10,10,10),(11,'Volum','Omnis nostrum delectus veniam. Eligendi occaecati aut aut molestias. Facere sed doloribus perspiciatis quas consequatur perspiciatis modi.',458160.43,'2017-07-05','2019-02-25',11,11,11),(12,'Porro','Aut laborum consequatur reprehenderit vero fuga omnis repellendus. Et quisquam omnis et saepe aut ad. Totam accusantium dolores exercitationem perspiciatis.',134219.22,'2021-08-28',NULL,12,12,12),(13,'Sit','Saepe culpa voluptas dolores fugit. Veniam expedita nobis voluptatem nemo est.\nEius voluptatibus culpa quia. Debitis quas omnis et minima ut nobis dicta assumenda. Aut dolorum architecto eos porro ut tempore consequatur. Earum quasi rerum error.',667514.24,'2016-08-02','2018-09-25',13,13,13),(14,'Aquas','Cumque odio sint rem expedita. Natus minima ullam quia ipsam. Ut voluptates ut minus. Dolor tenetur doloremque et officiis ducimus error modi.',942534.43,'2012-07-29','2015-01-05',14,14,14),(15,'Tempora','Quis ipsam in molestiae non. Laborum est quos voluptas eveniet. Nobis quod unde aperiam a animi.',797430.88,'2020-11-17',NULL,15,15,15),(16,'Quo','Quos aut vero non similique reiciendis quidem ipsum. Ratione hic sed fugiat quisquam harum itaque velit. Quaerat nostrum voluptatem quaerat illo delectus praesentium commodi. Voluptas consequatur harum earum voluptatem sit delectus neque.',526325.06,'2019-11-26',NULL,16,16,1),(17,'Fugiate','Voluptatum id nobis itaque aut accusamus. Quia vel ab dicta iusto reiciendis quod. Tenetur ratione soluta consequatur nam facere et voluptatem.',372121.51,'2021-04-13',NULL,17,17,2),(18,'Nuhil','In deserunt dolor in voluptas nostrum fugiat. Est dolores voluptas exercitationem deserunt recusandae tempora. Qui reiciendis recusandae dolor debitis.\nUt qui dolorem impedit aut et similique. Eos optio quas aut asperiores veritatis temporibus quo.',867363.09,'2020-07-29',NULL,18,18,3),(19,'Totem','Voluptatem beatae dolor reiciendis. Necessitatibus minima quia illo ab rerum doloremque. Similique asperiores rerum quibusdam libero esse aut.',565404.25,'2021-03-25',NULL,19,19,4),(20,'React','Qui dolorem numquam quo aperiam iusto. Consequatur officia omnis enim optio eveniet repudiandae laboriosam. Laborum sunt incidunt natus consequatur autem dolorum distinctio. Omnis odio sunt architecto eum.',540751.45,'2020-03-29','2022-01-29',20,20,5),(21,'Ease','Natus qui earum sapiente sapiente sed modi. Aut amet et alias sunt sit fuga impedit unde. Et ipsum non perspiciatis incidunt est id vitae consectetur. Sunt soluta corrupti voluptas voluptate odit.',721136.67,'2019-10-01',NULL,21,21,6),(22,'Quartet','Excepturi voluptatem ut quam. Sit aliquam atque officiis architecto sint laboriosam fuga quibusdam. Molestiae ex et dolor officiis.',400551.90,'2018-07-18',NULL,22,22,7),(23,'Represante','Ea adipisci quis tenetur veritatis et. Repellendus perferendis libero voluptate eaque ab sit quibusdam. Soluta et qui tempore vel suscipit voluptas reiciendis qui. Deserunt ducimus impedit odio quae esse dolorem illum.',154100.35,'2020-10-03',NULL,23,23,8),(24,'Squos','Architecto voluptate modi facilis tenetur amet facere quos. Quia fuga suscipit qui necessitatibus corrupti esse hic. Qui facilis rerum aperiam qui ad velit quos. Qui aut perspiciatis vel rerum neque cumque.',390149.41,'2021-05-14',NULL,24,24,9),(25,'Ert','Doloremque hic corrupti aut in hic. Qui vitae et eum pariatur. Magni quod necessitatibus ipsam libero dolorem harum nesciunt.',325730.16,'2020-06-02','2021-09-24',25,25,10),(26,'Arerum','Harum quia molestiae cumque natus at illum vero. Ut ab aliquam maxime perspiciatis ipsum nulla. Minus quia corrupti est eos dolorem.',686866.62,'2022-04-28',NULL,26,26,11),(27,'Esed','Molestiae suscipit id omnis iste. Deserunt maxime dolores at aut. Est recusandae eius et ducimus voluptas. Perferendis id quam corrupti cum aut consequatur.',294560.17,'2020-02-14','2022-01-11',27,30,12),(28,'Oquae','Recusandae natus ipsum consequatur et. Quisquam impedit aut iure eveniet mollitia tempora molestiae. Dolorem distinctio accusamus sapiente esse libero qui. Soluta est est dolorum aspernatur est quia et.',512234.40,'2018-02-21','2021-10-27',28,28,13),(29,'Faut','Quis dolorem eaque omnis. Qui quisquam libero veritatis sed iusto at alias. Et vel at et odio provident nemo voluptatem. Dolor accusantium nesciunt quo omnis earum.',495110.51,'2019-06-24',NULL,29,29,14),(30,'Fuega','Laborum odit labore est. Ad quo aliquam adipisci inventore omnis. Rem vitae voluptas libero perferendis. Impedit corrupti est cum autem.',980104.67,'2020-01-01',NULL,30,30,15),(31,'Asperines','Deleniti rerum sunt exercitationem quia id. Eos iure veritatis nam ab rerum rerum praesentium. Excepturi aperiam veniam omnis corrupti quia neque.',569837.61,'2010-08-25','2014-06-24',31,31,1),(32,'Exorc','Laudantium aspernatur itaque aut deserunt tempora est perferendis. Id in assumenda necessitatibus ut recusandae nam et ut. Ut odit autem aut et exercitationem voluptatem cumque. Nemo voluptas ea nihil minus laudantium ex.',419592.70,'2015-04-21','2018-06-24',32,32,2),(33,'Slaudantium','Alias odit et rerum hic eius voluptas cum. Omnis dolorem quaerat et fugit dolorum quasi voluptates. Est repudiandae incidunt nostrum qui et amet. Ea nobis architecto veritatis sequi.',305590.06,'2018-01-31','2021-08-09',33,33,3),(34,'Squisdam','Qui cumque libero consequatur voluptas ad ut inventore quia. Et asperiores rerum et rerum esse cumque ea qui.\nCumque velit quos sunt voluptates architecto assumenda facere tempore. Optio molestiae ut id ut enim sapiente. Aut ut libero ut dolores.',330731.89,'2020-01-08',NULL,34,34,4),(35,'Coriolis','Impedit voluptatem dignissimos voluptas. Dolorum necessitatibus quaerat autem. Iusto dolores quae est qui soluta at ea tempora. Esse dolor ut ad dignissimos nesciunt expedita accusantium. Ut officia accusantium sint sit dolorem.',184939.28,'2018-06-20','2020-04-11',35,35,5),(36,'Eospote','Nulla dolorum dolor consequatur. Cumque voluptatem et atque ipsa amet.',872614.16,'2020-02-19','2021-07-23',36,36,6),(37,'Deletusblockus','Doloremque non hic et rerum adipisci voluptas et. Nemo hic ut eos.',232212.64,'2021-09-29',NULL,37,37,7),(38,'Minima','Placeat error dolor ex unde optio unde velit. Voluptates harum minima perferendis est. Id fugit perferendis quo aliquid.\nMolestiae molestiae nulla quo rem esse unde. Omnis laboriosam consequatur natus. Doloremque corporis autem mollitia aspernatur ipsa.',490907.06,'2018-04-10','2022-02-13',38,38,8),(39,'Zeveniet','Omnis qui quis reiciendis deleniti nihil. Alias reprehenderit aut dolore velit assumenda. Dolore id libero ipsa veritatis aperiam quis nostrum.',418287.92,'2016-02-27','2019-07-17',39,39,9),(40,'Ovelit','Tempora in corrupti qui quisquam accusantium. Illo asperiores ea blanditiis non autem vitae excepturi. Facere omnis libero vel quidem. Reiciendis iusto explicabo voluptates dolore sit ut.',957027.81,'2020-10-29',NULL,40,40,10),(41,'Numnum','Porro neque eaque distinctio eos perferendis. Impedit deleniti nobis nostrum corrupti veritatis nisi. Quaerat et quisquam architecto nihil ab illo est.',411414.73,'2018-09-11','2020-10-21',1,41,11),(42,'Zinis','Aperiam vel cum nobis qui. Ducimus impedit minima sapiente in modi itaque et. Sint sunt recusandae neque consectetur.',558017.80,'2021-08-17',NULL,2,42,12),(43,'Porque','Quisquam modi quos at quo sunt. Doloremque voluptatem molestiae voluptatem. Sunt id aliquam blanditiis earum recusandae laboriosam aut.',785073.40,'2020-04-04',NULL,3,43,13),(44,'Sullamalek','Quibusdam ipsum fuga quo possimus odio. Soluta accusantium adipisci voluptatibus nulla aut nobis et. Sed quia sed blanditiis molestiae consectetur. Nisi ratione non eius sit id pariatur.',807561.73,'2021-08-04',NULL,4,44,14),(45,'Quisunt','Iste reiciendis ipsum cumque accusantium. Consequuntur ipsam et id et. Ea quidem tempora molestiae perferendis possimus harum et.',644103.02,'2018-02-11','2020-05-30',5,45,15),(46,'Nonexplicabo','In et distinctio sit ullam sed. A ut et sequi magni modi. Ut et architecto adipisci assumenda ut magni dicta vel.',244867.75,'2019-04-22',NULL,6,46,1),(47,'Plusminus','Eaque voluptates voluptatibus eos velit. Neque est deleniti ut et at ullam. Iusto maxime sit quas qui. Ea sed sunt ipsa mollitia et reiciendis.',317682.45,'2020-08-23',NULL,7,47,2),(48,'Edemkip','Aut ex rerum quae illum quas quia. Et rerum error voluptatibus sit. Quidem id laboriosam illo voluptates.',566843.62,'2020-04-20',NULL,8,48,3),(49,'Adhere','Voluptatem quae dolor est. Voluptate minima esse officiis tempore rerum non et qui. Beatae qui illum alias dolores et. Distinctio voluptas quia et expedita ducimus quis deserunt.',653511.49,'2022-02-17',NULL,9,49,4),(50,'Faceos','Saepe quo omnis consequatur vel et. A et a nulla labore officia facere. Quis sit sequi maiores dolorum eius quibusdam. Corporis sequi enim adipisci aliquam.',253266.07,'2020-02-15',NULL,10,50,5),(51,'Libero','Voluptas aut modi laborum molestias explicabo fugiat. Molestiae libero enim magnam minus. Neque officiis culpa praesentium temporibus culpa veniam. Sapiente consequuntur ea qui officia. Tenetur vel consequatur doloremque atque ipsam.',431086.56,'2022-01-02',NULL,11,51,6),(52,'Underover','Non vel aut maiores aperiam impedit consequatur. Magnam porro voluptas et odit sed aperiam eos. Omnis perferendis ut commodi corrupti. Rem non ut suscipit voluptas deserunt.',309405.57,'2019-03-08',NULL,12,52,7),(53,'Sequinisi','Ut iusto enim explicabo ut. Eos aliquid perferendis expedita vel quis.\nPorro non veritatis magnam. Molestiae sed eum doloribus voluptas alias blanditiis magni. Soluta excepturi accusamus ipsum nihil aut. Aut accusamus aut quibusdam quia et.',666637.36,'2018-03-14',NULL,13,53,8),(54,'Tipota','Architecto aperiam voluptas ex dolorem cumque enim dolor rem. Iste dolorem reiciendis qui quo ut dignissimos et. Quae cum fugit autem magni harum exercitationem enim. Illo neque id optio sint sit ut repellat.',665647.90,'2019-06-07',NULL,30,70,10),(55,'Lance','Earum aliquam eveniet dolore laborum soluta voluptas. Vero similique asperiores et totam autem. Quasi saepe impedit nam aut dolores culpa. Illum voluptatem at nihil qui aperiam similique maxime.',583324.78,'2019-01-31','2022-04-17',14,54,9),(56,'Paraquia','Dolore id optio ratione in atque blanditiis. Quis est delectus eum qui nostrum. Distinctio enim quas minima voluptatem nulla dolorum. Velit minus consequuntur eos a neque laborum.',104396.39,'2014-01-22','2017-10-30',15,55,10),(57,'Facilidad','Eos totam optio officiis corporis ut doloribus laudantium. Non et quidem ipsam nulla temporibus. Eos veniam et accusantium perferendis quia rerum.',967056.88,'2018-10-25',NULL,16,56,11),(58,'Nonconsequatur','Ea explicabo sint explicabo repellendus eligendi debitis aut excepturi. Doloremque quam fuga est earum asperiores corrupti inventore. Itaque dolorem et vero incidunt vel ab.',593348.84,'2010-06-20','2013-11-26',17,57,12),(59,'Tamaquasi','Libero qui dolor odit omnis facere reiciendis expedita saepe. Ipsum quaerat dolor dignissimos eum veritatis. Tempora dignissimos dolorem consectetur beatae.',471990.19,'2020-03-02',NULL,18,58,13),(60,'Accountantium','Voluptates voluptatem optio odit sit cupiditate aperiam. Sunt deleniti voluptatem quo doloribus architecto ex et. Ullam accusantium asperiores quos. Voluptates fugiat vitae quasi quos.',546537.26,'2020-08-27',NULL,19,59,14),(61,'Rationale','Corporis deleniti modi eaque dignissimos nemo. Consequatur voluptatibus nisi qui repudiandae ad harum velit vel. Veritatis eligendi voluptas sed numquam provident eos quaerat.',596870.11,'2017-01-20','2020-08-17',20,60,15),(62,'Autoiiste','Voluptatem voluptatem architecto in et asperiores quam adipisci. Dolores voluptas maiores aut earum deserunt voluptatem et. Ut sit voluptatum iure est.',495753.70,'2021-06-20',NULL,21,61,1),(63,'Loremipsum','Ipsam dolorem vel quos accusantium consequatur. Ut incidunt eos exercitationem numquam itaque officia. Ratione incidunt iusto dolor velit consequatur.',779701.56,'2019-08-26',NULL,22,62,2),(64,'Architecto','Asperiores nemo enim tempore possimus non quia eaque. Nostrum molestiae voluptate aut ut sequi. Ut dignissimos veniam aspernatur reiciendis adipisci aliquam quis quisquam.',262930.14,'2022-04-10',NULL,23,63,3),(65,'Thriskopio','Eius aut perspiciatis occaecati et fugiat expedita iusto. Cum placeat occaecati voluptatem officia vero debitis amet voluptate. Quidem maxime quas reiciendis sapiente provident aliquam doloremque sed. Quos omnis iusto voluptas sint omnis quasi quo.',428546.96,'2019-07-02','2022-01-31',24,64,4),(66,'Abcde','Quibusdam nobis quisquam quia amet. Nobis dolore voluptatibus aut at quod aut facere similique. Qui saepe debitis quo animi minima necessitatibus. Laborum veniam tenetur ut fugiat.',466928.52,'2019-06-09',NULL,25,65,5),(67,'Lexepe','Blanditiis numquam quis ut possimus cumque. Ad quas nihil laboriosam incidunt aut. Nam explicabo ab quo a soluta unde error.',167218.03,'2020-09-29',NULL,26,66,6),(68,'Taburiosam','Culpa aut atque enim illum quasi esse. Necessitatibus asperiores et quia et excepturi. Assumenda facilis ut eos recusandae maiores. Molestias cupiditate aut dolores est.',269596.59,'2016-11-07','2019-11-11',27,67,7),(69,'Repellat','Cumque exercitationem sunt dicta necessitatibus omnis explicabo est. In consequatur ratione omnis qui veniam commodi in. Eum consequatur libero aliquid temporibus.\nLaboriosam omnis esse enim fugiat. Ullam dolorem aut est velit. Qui quia incidunt est non.',364973.01,'2021-06-11',NULL,28,68,8),(70,'Kedikelenti','Consequuntur deserunt voluptatem qui reiciendis tenetur corporis. Esse fugit aut et minus. Eius aut molestiae molestias voluptatem.\nRepellendus totam qui voluptatem sequi. Ut quia vel iste qui nulla odit. Provident optio occaecati alias.',722109.60,'2020-06-10',NULL,29,69,9),(71,'Consequatur vel dignissimos','Rem repellat eos blanditiis molestias. Ratione sint nihil repellendus illo assumenda cupiditate. Commodi adipisci quo quis vel molestias et odit.',558169.88,'2021-11-22',NULL,35,28,11),(72,'Et ipsam','Libero nihil alias minus occaecati sunt id modi quo. Et earum suscipit sit nostrum alias repellat. Et distinctio illum qui dolor quidem accusamus quaerat tempore.',168379.13,'2020-02-07',NULL,16,9,1),(73,'Occaecati aut','Quibusdam laborum dolores ut aliquid dolore vel quo. Quia omnis exercitationem eligendi expedita numquam minima ducimus. Voluptatem quia qui rerum tempora aut numquam et illum. Eum sint sunt et voluptatem accusantium ut sequi.',732546.37,'2021-06-03',NULL,38,51,11),(74,'Excepturi error','Rerum distinctio voluptate voluptas rerum molestias. Quidem quia doloremque distinctio voluptatibus maxime. Sed sed quos cupiditate reprehenderit autem non nulla. Aut autem ullam est.',437248.40,'2021-08-12',NULL,21,5,4),(75,'Quidem dolores','Reprehenderit perferendis nisi eum deserunt et. Beatae in molestiae qui dolores quis. Veniam reprehenderit minus non corrupti iusto voluptatibus fugiat.',472628.46,'2022-01-10',NULL,17,82,3),(76,'Fuga consequuntur non','Veniam ipsa necessitatibus dignissimos maxime minus a ab. Vero quaerat voluptas enim doloribus in odio quae. Soluta quo perspiciatis aut voluptatem qui beatae in.',863908.81,'2021-07-18',NULL,3,5,14),(77,'Debitis est','Totam velit soluta officia sint. Deserunt dolorum beatae non. Ut eum tenetur aperiam sit laudantium sit. Et non quidem aut consequuntur voluptatum eum dolorum. Quibusdam nisi dolores dolorem molestias debitis magni autem.',628443.38,'2022-04-09',NULL,27,19,7),(78,'Ipsam reiciendis facilis','Ut aspernatur iure sed ut qui maxime a quis. Similique omnis aspernatur ut tenetur. Aliquid velit porro impedit.\nNam repellendus debitis est qui sed. Quo dolores odio culpa. Aspernatur quo ea asperiores.',854949.75,'2022-03-22',NULL,7,76,15),(79,'Sit eligendi quod','Quos et itaque sed aut. Consequatur non quae ad unde aliquam deserunt aliquid blanditiis. Tenetur soluta eveniet accusamus saepe qui occaecati.',267774.13,'2021-09-19',NULL,32,43,9),(80,'Ullam ut quia','Unde et ad magnam atque omnis deleniti consequuntur. Cum aut esse voluptatem voluptas impedit sint. Nostrum non assumenda et nemo est vel exercitationem consequuntur. Consequatur veniam perspiciatis voluptas voluptas placeat.',984926.91,'2022-04-23',NULL,34,94,15),(81,'Explicabo et','Doloremque in sunt cupiditate omnis ut. Reiciendis voluptas blanditiis quo rem. Maiores numquam sed debitis hic explicabo ab corporis ducimus.',618418.79,'2020-11-29',NULL,18,39,13),(82,'Saepe quaerat','Et tempora consectetur enim et voluptate. Iste rerum rem pariatur minima. Cum tenetur sint quas assumenda nemo minima ducimus.',841133.67,'2022-01-09',NULL,13,51,2),(83,'Cum facilis eaque','Dolore doloribus quam ut maiores. Et vel sunt in placeat. Accusantium enim id distinctio eum nihil quisquam.\nQuae praesentium reiciendis ex quia blanditiis. Illum quis accusamus sit quis assumenda. Aut voluptatum et non ea.',232354.23,'2021-11-25',NULL,8,14,11),(84,'Sit ut','Suscipit placeat quia eum aperiam. Earum consectetur voluptatem vitae et deleniti minima. Esse nesciunt sint enim libero et sed. Deserunt ut animi veritatis reprehenderit libero laboriosam ratione. Suscipit voluptates nihil est dolorum.',956928.63,'2020-01-27',NULL,3,92,7),(85,'Blanditiis placeat','Porro velit neque placeat eos. Id animi nostrum nulla molestias sed voluptas illum. Aperiam dolores rerum est esse et.',701621.59,'2021-12-13',NULL,11,76,9),(86,'Quisquam commodi','Est voluptas doloribus saepe. Qui non et fugiat illum explicabo. Sunt porro aut doloremque eaque et illo sapiente.\nIpsam vitae autem sapiente maxime. Et qui iste nobis quos voluptatem. Culpa voluptas iure ut reiciendis quasi.',887630.52,'2022-02-03',NULL,14,67,11),(87,'Laudantium exercitationem','Aut exercitationem unde consequuntur voluptates quia. Quia dolores vel autem provident modi quibusdam impedit. Doloremque sit tenetur qui ratione officiis quos.',778180.16,'2021-11-06',NULL,38,110,10),(88,'Qui nihil dolorem','Officiis nemo eos est quibusdam cupiditate dolores. Veniam aut nobis quia dolorem similique porro. Nemo dolores est nemo quibusdam.',893286.74,'2020-04-06',NULL,20,107,5),(89,'Blanditiis atque','Ipsam nostrum adipisci est itaque. Adipisci dolores dolores sed sit mollitia ut non. Numquam nesciunt optio veritatis ut. Voluptatem et ducimus necessitatibus velit. Doloremque et nam quis est.',530050.08,'2022-03-20',NULL,30,77,1),(90,'Et qui harum','Voluptatem suscipit in distinctio eos nihil ut voluptas esse. Minima eos nobis dolor dolor. Voluptatem officiis autem laudantium esse quo officiis consectetur.',369494.24,'2021-06-21',NULL,8,18,12),(91,'Nam et illo','Laudantium eos sit ea eaque voluptatum voluptatibus distinctio. Doloribus amet sint et illum enim maiores. Sapiente incidunt dolores suscipit quia ullam cupiditate explicabo. Nesciunt aut deleniti cum reiciendis deserunt debitis repellendus.',285966.26,'2020-09-10',NULL,22,44,9),(92,'Occaecati harum reiciendis','Ratione commodi ab reiciendis eos est perspiciatis. Vel nihil voluptatibus quasi. Velit perspiciatis sit dolorum quasi labore voluptates. Et ratione enim expedita et dolores quia consequatur.',722679.28,'2022-05-19',NULL,40,19,9),(93,'Iure recusandae aperiam','Inventore sequi unde rerum harum accusantium illo perspiciatis. Est voluptatibus in iste iure aut autem. Eius excepturi perferendis accusantium sed porro.',700343.74,'2021-10-31',NULL,22,100,13),(94,'Explicabo beatae','Fuga ad libero mollitia at sed. Excepturi minima repellat laboriosam neque corrupti. Porro voluptas eius deserunt molestiae saepe dolorem sit debitis.',782358.32,'2020-10-15',NULL,20,82,4),(95,'Molestias vero','Optio sapiente qui ut voluptatem. Velit veritatis ipsam delectus nemo sint. Iste maxime itaque ex perferendis quos accusamus.',689424.15,'2019-02-18','2021-10-10',6,42,3),(96,'Laborum expedita corrupti','Sed aliquam vel optio quidem sed reiciendis ea quas. Non et neque quibusdam. Illum quia non quam. Cupiditate est voluptas ut sequi cum.',373491.98,'2017-01-30','2020-05-13',13,71,6),(97,'Voluptatem neque','Autem magni eum vel nihil beatae quia. Deleniti omnis totam quo nesciunt deserunt consequatur. Repellat et praesentium quaerat provident beatae impedit.',892266.85,'2021-12-09',NULL,19,107,13),(98,'Enim minima quia','Quibusdam quaerat eligendi quas voluptates deserunt error. Ad rerum magnam vero molestiae quidem voluptatibus. Quaerat fuga dolores repellendus vitae molestiae error id.',640972.94,'2022-01-10',NULL,8,97,13),(99,'Excepturi laboriosam','Et natus rerum architecto qui ea voluptatem possimus. Omnis quisquam aspernatur ipsum itaque veniam ea. Non ex nemo neque vel. Placeat iure corrupti omnis fugit.',731382.82,'2020-11-26','2022-01-01',1,55,6),(100,'Dolores autem','Expedita voluptatum laudantium aut aut. Nobis vel voluptas ut. Laborum quasi non quam reiciendis.',811788.71,'2022-03-18',NULL,22,79,4),(101,'Cum dolores','Commodi quia sit consectetur quidem earum. Laudantium soluta quibusdam et sit sit repudiandae. Hic et eum velit illo. Mollitia nostrum eveniet non neque ex.',414832.62,'2021-08-31',NULL,13,27,15),(102,'Voluptates delectus recusandae','Tempora debitis provident explicabo aspernatur. Est laudantium quibusdam sit ducimus. Harum aut cumque modi consectetur vel placeat dicta. Quaerat minus sed repellendus ad molestias.',580064.59,'2014-03-06','2017-03-06',16,100,15),(103,'Consequuntur illum','Libero sint veritatis qui quia nam. In quis aliquam culpa asperiores est nisi aut.\nNon rerum distinctio eveniet quis hic a rerum. Enim rem et vitae unde nemo cupiditate. Fuga quas voluptas nisi corporis corrupti eius soluta. Consequatur ratione aut aut.',226166.93,'2021-07-29',NULL,28,40,2),(104,'Ut fugit','Numquam libero eveniet aut et ipsam est temporibus. Dolor et iure sed nemo eius sunt dicta quia. Maxime facilis cupiditate maiores. Possimus explicabo quibusdam id modi vel quae.',754392.98,'2019-08-05','2022-05-13',27,110,1),(105,'Possimus accusamus tenetur','Et eos esse id aut minus. Omnis qui beatae nemo et itaque autem. Sed magnam fuga nihil ducimus laborum.',228620.50,'2022-01-15',NULL,17,56,1),(106,'Omnis nisi ducimus','Cum consequatur quasi ullam magnam officiis. Error alias quis harum iusto laboriosam aut voluptatem. Nesciunt tempore magni nesciunt illo explicabo.',503705.25,'2014-11-11','2016-09-11',10,53,15),(107,'Voluptas voluptatibus','Exercitationem ipsam necessitatibus rem quisquam quo aperiam optio. Maxime quia sed ipsum. Et rerum velit animi repellendus aut. Voluptatem et corrupti molestias facere incidunt incidunt qui quasi.',412364.00,'2021-07-28',NULL,16,16,11),(108,'Quo consectetur','Natus et dolores tenetur exercitationem. Qui perspiciatis eius reprehenderit fuga inventore perspiciatis. Laudantium at voluptatum facere laudantium dicta.',582829.87,'2021-05-12',NULL,27,2,2),(109,'In molestias minima','Quia quibusdam incidunt nam et. Placeat itaque ea et sed enim eos. Animi ab sapiente velit accusamus fugiat placeat quas.',693417.11,'2017-11-24','2020-10-24',10,59,15),(110,'Rerum tempore totam','Mollitia tempore odit vitae natus nulla excepturi earum. Id ex animi quia et laudantium sit. Facere aut sit omnis aut occaecati blanditiis nam. Placeat quo accusamus consequatur atque ab.',676661.19,'2019-12-23',NULL,9,80,10),(111,'Distinctio quaerat laborum','Facere aut in tenetur totam corrupti voluptate. Delectus repellendus in aut qui a impedit. Omnis repudiandae quas sed sunt.',487219.30,'2018-07-03','2022-06-03',4,69,7),(112,'Repellat at','Fugiat in quisquam ut voluptates aut. Provident ipsum officia tenetur sit sapiente. Doloribus ullam quaerat optio voluptatem sapiente temporibus minima. Molestias omnis perferendis enim numquam est consequatur.',636765.76,'2021-03-04',NULL,28,22,4),(113,'Et dolores','Maiores et sint velit corrupti. Et provident natus aut dolore nihil. Soluta voluptatum suscipit et labore voluptates ad.\nEos praesentium nobis accusamus ab. Accusamus sed earum voluptatem. Suscipit sunt est laboriosam est.',817876.01,'2020-04-01','2022-05-12',16,32,4),(114,'Quia quia','Perferendis nostrum voluptas magni ut. Voluptas quas libero ducimus quia quam officia. Sed dolorem consequatur et est molestiae.\nIllum qui nihil eligendi autem a alias. Qui at dicta quod quod dolores quia vitae.',482670.43,'2022-01-11',NULL,26,60,11),(115,'Qui eligendi sint','Consequatur praesentium hic sit qui. Et vero quaerat excepturi eius quidem ipsum odio et.\nAsperiores similique delectus beatae molestias reiciendis nam. Vitae enim ut consequatur. Aut quae reprehenderit placeat impedit autem amet ut.',765904.05,'2021-09-14',NULL,27,34,9),(116,'Voluptatum veniam','Odit possimus est repellendus quia velit eos ipsam. Ea ipsam quasi ex. Voluptatem voluptatem hic quia sed laudantium. Molestiae inventore saepe quia ex.\nUt nulla tempore sed. Reiciendis aliquid quos ipsam maiores maxime. Rerum deserunt est a.',680769.08,'2022-02-19',NULL,35,103,3),(117,'Non dolorem','Et at maxime et eos libero aut. Impedit voluptas vitae et et quo.\nQuaerat repudiandae cumque dolores assumenda animi eveniet consequatur. Tempore dolores nemo hic. Eos dolore et voluptas. Non ex et accusamus et.',673065.96,'2019-11-19','2022-01-19',27,92,4),(118,'Ab esse facilis','Consequatur voluptatibus qui non. Libero eveniet tenetur sapiente aut expedita eligendi. Deleniti ut nihil et et eligendi. Sed consectetur sint voluptatibus dolor laudantium.',314397.44,'2021-12-25',NULL,3,74,7),(119,'Aliquam aut','Dolorem hic perspiciatis non minima maiores totam voluptatum ut. Tempora facere iusto hic voluptate aut. Aut ipsam exercitationem laudantium. Asperiores aut velit voluptas non sed nemo eos.',828863.84,'2021-02-10',NULL,20,8,13),(120,'Id aperiam','Expedita eaque explicabo voluptate. In libero quia est non laborum qui architecto. Atque voluptatem rerum perspiciatis est dolores et. Consequatur sed reprehenderit quam.',931411.55,'2021-07-13',NULL,22,17,12);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `project_information`
--

DROP TABLE IF EXISTS `project_information`;
/*!50001 DROP VIEW IF EXISTS `project_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `project_information` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `description`,
 1 AS `budget`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `duration`,
 1 AS `executiveName`,
 1 AS `programName`,
 1 AS `programAddress`,
 1 AS `researchManagerName`,
 1 AS `researchManagerSurname`,
 1 AS `researchManagerGender`,
 1 AS `researchManagerBirthDate`,
 1 AS `rating`,
 1 AS `ratingDate`,
 1 AS `ratingResearcherName`,
 1 AS `ratingResearcherSurname`,
 1 AS `organizationName`,
 1 AS `organizationAbbreviation`,
 1 AS `organizationStreet`,
 1 AS `organizationStreetNumber`,
 1 AS `organizationPostalCode`,
 1 AS `organizationCity`,
 1 AS `researchFieldName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project_rating`
--

DROP TABLE IF EXISTS `project_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  CONSTRAINT `check_rating` CHECK ((`rating` between 1 and 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Αξιολογήσεις έργων από ερευνητές';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_rating`
--

LOCK TABLES `project_rating` WRITE;
/*!40000 ALTER TABLE `project_rating` DISABLE KEYS */;
INSERT INTO `project_rating` VALUES (1,39,7,'2000-07-22'),(2,47,7,'2010-01-21'),(3,50,6,'1992-07-05'),(4,83,9,'1979-09-10'),(5,96,9,'1977-04-19'),(6,70,9,'1986-07-09'),(7,47,1,'1999-11-16'),(8,29,8,'2012-09-10'),(9,23,2,'1993-05-22'),(10,101,6,'1971-01-22'),(11,89,8,'2016-11-01'),(12,4,10,'1977-03-08'),(13,101,4,'2008-02-04'),(14,23,2,'1981-10-27'),(15,8,8,'2001-03-19'),(16,58,9,'1971-09-23'),(17,32,8,'1991-02-02'),(18,108,7,'1998-03-27'),(19,89,9,'1982-09-10'),(20,42,5,'1970-05-20'),(21,106,4,'1975-02-08'),(22,11,8,'2008-10-01'),(23,109,4,'1975-06-03'),(24,2,9,'2014-06-05'),(25,30,4,'1973-05-15'),(26,61,9,'2016-11-10'),(27,98,1,'1996-02-16'),(28,16,4,'1997-07-18'),(29,38,3,'1997-06-14'),(30,79,4,'2007-10-30'),(31,79,2,'1988-05-07'),(32,77,8,'1992-11-21'),(33,16,3,'1974-04-06'),(34,96,6,'2001-04-28'),(35,50,6,'2007-06-16'),(36,1,8,'2008-09-07'),(37,56,9,'2009-10-04'),(38,96,2,'1971-04-18'),(39,50,8,'1971-10-10'),(40,79,4,'2001-08-23'),(41,87,10,'2003-09-17'),(42,7,3,'2006-10-02'),(43,83,4,'2016-11-02'),(44,78,8,'1997-02-13'),(45,30,1,'2012-06-29'),(46,91,6,'1983-11-08'),(47,26,5,'1972-08-30'),(48,61,7,'2005-12-18'),(49,88,9,'1983-12-13'),(50,4,7,'1998-05-01'),(51,103,10,'1978-01-16'),(52,84,8,'2008-06-22'),(53,14,3,'2018-07-09'),(54,102,9,'1971-05-12'),(55,85,9,'1996-05-05'),(56,44,2,'1987-10-14'),(57,52,3,'1987-05-07'),(58,73,8,'2020-04-27'),(59,59,8,'1982-03-07'),(60,90,7,'1988-02-09'),(61,41,1,'1971-07-16'),(62,27,8,'1983-01-20'),(63,56,1,'2001-10-22'),(64,57,7,'2014-04-18'),(65,13,5,'2021-11-28'),(66,106,7,'1980-10-10'),(67,57,3,'2021-05-27'),(68,69,8,'1974-10-31'),(69,91,9,'2014-07-25'),(70,86,5,'2010-10-18'),(71,2,3,'1982-02-04'),(72,100,8,'2021-12-21'),(73,57,4,'2008-07-08'),(74,25,3,'1996-03-20'),(75,23,7,'2017-11-06'),(76,42,7,'1984-06-30'),(77,103,9,'2009-06-21'),(78,70,10,'1984-03-17'),(79,28,3,'2001-12-06'),(80,67,10,'2022-04-02'),(81,91,4,'1974-03-01'),(82,83,7,'1971-08-26'),(83,93,8,'2017-07-07'),(84,100,7,'2001-01-07'),(85,1,9,'2018-11-23'),(86,32,5,'1973-06-13'),(87,76,9,'2004-12-05'),(88,100,5,'1998-02-08'),(89,97,3,'2005-07-08'),(90,50,6,'2002-07-09'),(91,85,5,'2022-03-19'),(92,89,7,'1990-04-22'),(93,30,3,'2014-11-12'),(94,95,7,'2021-07-06'),(95,109,5,'1971-05-12'),(96,104,6,'1976-07-21'),(97,53,7,'2016-08-17'),(98,28,9,'2012-02-29'),(99,31,5,'2005-04-15'),(100,45,10,'1977-07-12'),(101,103,10,'2006-03-14'),(102,30,10,'1970-07-04'),(103,25,8,'2018-07-15'),(104,31,3,'1978-10-26'),(105,84,9,'1989-02-11'),(106,38,5,'1983-01-17'),(107,77,10,'2005-09-21'),(108,21,10,'1994-02-01'),(109,88,10,'2003-07-21'),(110,41,9,'1978-08-29'),(111,55,8,'1994-05-11'),(112,99,4,'2009-04-16'),(113,19,4,'1996-01-16'),(114,90,6,'1981-10-09'),(115,4,5,'2004-11-25'),(116,32,6,'1983-07-04'),(117,109,9,'2014-04-06'),(118,97,6,'1983-02-11'),(119,6,7,'2017-10-07'),(120,10,10,'1992-09-30');
/*!40000 ALTER TABLE `project_rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_researcher_not_in_organization` BEFORE INSERT ON `project_rating` FOR EACH ROW BEGIN
 IF rating_researcher_in_organization(NEW.projectId, NEW.researcherId) = 1 THEN
 SET NEW.researcherId = NULL;
 END IF;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `project_researchers`
--

DROP TABLE IF EXISTS `project_researchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_researchers` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου',
  `researcherId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του ερευνητή που εργάζεται στο έργο',
  PRIMARY KEY (`projectId`,`researcherId`),
  KEY `works_on` (`researcherId`) /*!80000 INVISIBLE */,
  CONSTRAINT `has_researchers` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `works_on` FOREIGN KEY (`researcherId`) REFERENCES `researcher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ερευνητές σε κάθε έργο';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_researchers`
--

LOCK TABLES `project_researchers` WRITE;
/*!40000 ALTER TABLE `project_researchers` DISABLE KEYS */;
INSERT INTO `project_researchers` VALUES (1,15),(1,20),(1,35),(2,42),(2,103),(3,96),(4,71),(4,74),(4,97),(5,45),(5,74),(6,83),(7,47),(7,91),(7,95),(7,101),(8,53),(9,89),(10,31),(10,40),(10,85),(10,93),(11,29),(11,43),(11,69),(11,74),(12,11),(12,22),(12,96),(12,107),(13,43),(13,54),(14,12),(14,16),(14,44),(14,62),(14,101),(15,16),(15,70),(16,4),(16,27),(16,84),(16,96),(17,22),(17,39),(17,57),(17,58),(17,64),(17,87),(17,108),(18,2),(18,61),(18,100),(19,39),(19,86),(20,47),(21,16),(21,78),(22,6),(23,24),(23,73),(24,4),(24,37),(25,1),(25,8),(25,37),(25,68),(26,110),(27,30),(27,36),(27,68),(27,104),(28,1),(28,57),(28,89),(29,81),(29,98),(30,28),(30,62),(30,96),(31,3),(31,22),(32,1),(32,60),(33,22),(33,47),(33,48),(33,78),(34,13),(34,25),(34,81),(35,46),(35,94),(35,96),(36,6),(37,9),(37,15),(37,16),(37,30),(37,62),(38,60),(38,74),(38,76),(39,3),(39,37),(39,51),(39,79),(39,86),(39,94),(40,94),(41,63),(41,76),(42,6),(42,54),(42,68),(42,80),(43,12),(43,27),(43,42),(43,98),(44,1),(44,35),(44,38),(44,69),(44,78),(44,92),(45,7),(45,48),(45,99),(46,11),(46,31),(46,79),(46,87),(46,98),(47,62),(48,2),(48,26),(49,55),(50,67),(51,69),(52,2),(52,7),(52,54),(52,101),(52,107),(53,33),(54,7),(54,18),(54,89),(55,1),(55,10),(55,24),(55,88),(55,100),(56,38),(57,25),(57,106),(58,11),(58,15),(58,21),(58,51),(58,59),(58,65),(58,83),(58,90),(59,23),(59,40),(59,47),(60,58),(61,13),(61,40),(61,63),(62,32),(62,93),(63,19),(63,32),(63,54),(63,79),(64,56),(64,79),(64,106),(65,30),(65,43),(65,47),(65,84),(66,73),(66,88),(67,6),(67,7),(67,16),(67,29),(67,94),(68,89),(68,104),(69,30),(69,89),(69,94),(69,105),(70,29),(70,46),(71,27),(71,45),(72,12),(72,32),(72,43),(72,96),(72,98),(73,54),(73,60),(74,80),(74,106),(75,53),(75,73),(76,52),(76,65),(76,68),(76,93),(76,100),(76,104),(77,3),(77,5),(77,27),(77,41),(78,18),(78,49),(78,64),(79,45),(79,50),(79,91),(79,92),(79,101),(80,37),(80,85),(81,5),(81,13),(81,23),(81,25),(81,43),(81,61),(81,64),(81,84),(81,107),(81,109),(82,10),(82,16),(82,47),(82,48),(83,4),(83,10),(83,48),(83,86),(84,1),(84,60),(84,66),(84,100),(85,17),(85,56),(86,20),(86,23),(86,28),(86,42),(86,48),(86,63),(86,92),(87,26),(87,40),(87,46),(87,52),(87,56),(88,8),(88,15),(88,17),(88,41),(88,75),(89,15),(89,41),(89,94),(90,1),(90,44),(90,64),(90,73),(90,85),(90,110),(91,11),(91,14),(91,15),(91,20),(91,50),(91,61),(92,2),(92,11),(92,35),(92,41),(92,44),(92,102),(93,3),(93,19),(93,24),(93,75),(93,77),(93,94),(94,78),(95,22),(95,36),(95,66),(96,10),(96,31),(96,86),(96,100),(97,28),(97,57),(98,9),(98,35),(98,48),(98,65),(98,76),(98,98),(99,78),(99,83),(99,97),(99,107),(100,73),(100,96),(101,6),(101,7),(101,11),(101,40),(101,94),(102,67),(102,71),(102,74),(102,96),(103,34),(103,64),(103,70),(103,73),(103,77),(103,110),(104,74),(104,81),(104,99),(105,26),(105,31),(105,37),(105,72),(106,28),(106,36),(107,12),(107,26),(107,57),(107,73),(107,74),(108,15),(108,28),(108,39),(108,100),(108,103),(108,110),(109,8),(109,99),(109,108),(110,10),(110,11),(110,58),(110,96),(111,8),(111,55),(112,10),(112,27),(112,65),(112,67),(113,46),(113,77),(114,8),(114,27),(114,45),(114,59),(115,25),(115,55),(115,85),(115,93),(115,97),(116,6),(117,49),(117,96),(118,21),(118,24),(118,63),(118,105),(119,42),(119,63),(119,69),(120,21),(120,62),(120,65),(120,75),(120,76),(120,96);
/*!40000 ALTER TABLE `project_researchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `projects_per_researcher`
--

DROP TABLE IF EXISTS `projects_per_researcher`;
/*!50001 DROP VIEW IF EXISTS `projects_per_researcher`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projects_per_researcher` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `surname`,
 1 AS `gender`,
 1 AS `birth_date`,
 1 AS `project_title`,
 1 AS `project_budget`,
 1 AS `project_start_date`,
 1 AS `project_end_date`,
 1 AS `project_duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `related_to`
--

DROP TABLE IF EXISTS `related_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_to` (
  `projectId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του έργου',
  `research_fieldName` varchar(100) NOT NULL COMMENT 'Όνομα του επιστημονικού πεδίου με το οποίο συνδέεται',
  PRIMARY KEY (`projectId`,`research_fieldName`),
  KEY `field_to_project` (`research_fieldName`),
  CONSTRAINT `field_to_project` FOREIGN KEY (`research_fieldName`) REFERENCES `research_field` (`name`),
  CONSTRAINT `project_fields` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Σύνδεση έργου με επιστημονικά πεδία';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_to`
--

LOCK TABLES `related_to` WRITE;
/*!40000 ALTER TABLE `related_to` DISABLE KEYS */;
INSERT INTO `related_to` VALUES (3,'Biology'),(7,'Biology'),(10,'Biology'),(12,'Biology'),(37,'Biology'),(44,'Biology'),(45,'Biology'),(54,'Biology'),(58,'Biology'),(59,'Biology'),(66,'Biology'),(67,'Biology'),(71,'Biology'),(74,'Biology'),(77,'Biology'),(81,'Biology'),(86,'Biology'),(89,'Biology'),(98,'Biology'),(104,'Biology'),(105,'Biology'),(109,'Biology'),(110,'Biology'),(112,'Biology'),(113,'Biology'),(2,'Biotechnology'),(10,'Biotechnology'),(11,'Biotechnology'),(13,'Biotechnology'),(16,'Biotechnology'),(22,'Biotechnology'),(26,'Biotechnology'),(27,'Biotechnology'),(32,'Biotechnology'),(39,'Biotechnology'),(42,'Biotechnology'),(57,'Biotechnology'),(63,'Biotechnology'),(73,'Biotechnology'),(76,'Biotechnology'),(89,'Biotechnology'),(94,'Biotechnology'),(95,'Biotechnology'),(99,'Biotechnology'),(108,'Biotechnology'),(111,'Biotechnology'),(114,'Biotechnology'),(116,'Biotechnology'),(3,'Chemistry'),(7,'Chemistry'),(14,'Chemistry'),(18,'Chemistry'),(22,'Chemistry'),(23,'Chemistry'),(25,'Chemistry'),(30,'Chemistry'),(40,'Chemistry'),(44,'Chemistry'),(47,'Chemistry'),(48,'Chemistry'),(49,'Chemistry'),(52,'Chemistry'),(53,'Chemistry'),(73,'Chemistry'),(84,'Chemistry'),(85,'Chemistry'),(87,'Chemistry'),(93,'Chemistry'),(97,'Chemistry'),(99,'Chemistry'),(106,'Chemistry'),(107,'Chemistry'),(110,'Chemistry'),(114,'Chemistry'),(119,'Chemistry'),(120,'Chemistry'),(12,'Clinical medicine'),(18,'Clinical medicine'),(22,'Clinical medicine'),(25,'Clinical medicine'),(26,'Clinical medicine'),(29,'Clinical medicine'),(30,'Clinical Medicine'),(47,'Clinical medicine'),(53,'Clinical medicine'),(56,'Clinical medicine'),(60,'Clinical medicine'),(63,'Clinical medicine'),(68,'Clinical medicine'),(70,'Clinical medicine'),(72,'Clinical medicine'),(75,'Clinical medicine'),(76,'Clinical medicine'),(77,'Clinical medicine'),(82,'Clinical medicine'),(84,'Clinical medicine'),(87,'Clinical medicine'),(91,'Clinical medicine'),(92,'Clinical medicine'),(93,'Clinical medicine'),(94,'Clinical medicine'),(97,'Clinical medicine'),(99,'Clinical medicine'),(104,'Clinical medicine'),(108,'Clinical medicine'),(112,'Clinical medicine'),(115,'Clinical medicine'),(116,'Clinical medicine'),(119,'Clinical medicine'),(1,'Computer Science'),(6,'Computer Science'),(8,'Computer Science'),(9,'Computer Science'),(11,'Computer Science'),(15,'Computer Science'),(16,'Computer Science'),(18,'Computer Science'),(20,'Computer Science'),(36,'Computer Science'),(37,'Computer Science'),(49,'Computer Science'),(57,'Computer Science'),(65,'Computer Science'),(68,'Computer Science'),(69,'Computer Science'),(71,'Computer Science'),(76,'Computer Science'),(83,'Computer Science'),(84,'Computer Science'),(85,'Computer Science'),(86,'Computer Science'),(93,'Computer Science'),(95,'Computer Science'),(96,'Computer Science'),(103,'Computer Science'),(106,'Computer Science'),(107,'Computer Science'),(109,'Computer Science'),(110,'Computer Science'),(112,'Computer Science'),(115,'Computer Science'),(117,'Computer Science'),(4,'Electronics'),(11,'Electronics'),(20,'Electronics'),(26,'Electronics'),(29,'Electronics'),(31,'Electronics'),(35,'Electronics'),(38,'Electronics'),(46,'Electronics'),(62,'Electronics'),(64,'Electronics'),(67,'Electronics'),(71,'Electronics'),(72,'Electronics'),(75,'Electronics'),(77,'Electronics'),(82,'Electronics'),(83,'Electronics'),(85,'Electronics'),(89,'Electronics'),(94,'Electronics'),(95,'Electronics'),(98,'Electronics'),(99,'Electronics'),(102,'Electronics'),(104,'Electronics'),(107,'Electronics'),(111,'Electronics'),(114,'Electronics'),(118,'Electronics'),(119,'Electronics'),(2,'Materials engineering'),(14,'Materials engineering'),(23,'Materials engineering'),(29,'Materials engineering'),(31,'Materials engineering'),(33,'Materials engineering'),(38,'Materials engineering'),(42,'Materials engineering'),(44,'Materials engineering'),(48,'Materials engineering'),(49,'Materials engineering'),(58,'Materials engineering'),(65,'Materials engineering'),(78,'Materials engineering'),(85,'Materials engineering'),(88,'Materials engineering'),(101,'Materials engineering'),(102,'Materials engineering'),(104,'Materials engineering'),(105,'Materials engineering'),(111,'Materials engineering'),(113,'Materials engineering'),(115,'Materials engineering'),(118,'Materials engineering'),(1,'Mathematics'),(5,'Mathematics'),(13,'Mathematics'),(14,'Mathematics'),(15,'Mathematics'),(19,'Mathematics'),(21,'Mathematics'),(26,'Mathematics'),(27,'Mathematics'),(28,'Mathematics'),(32,'Mathematics'),(52,'Mathematics'),(59,'Mathematics'),(79,'Mathematics'),(80,'Mathematics'),(83,'Mathematics'),(87,'Mathematics'),(88,'Mathematics'),(90,'Mathematics'),(92,'Mathematics'),(93,'Mathematics'),(94,'Mathematics'),(95,'Mathematics'),(96,'Mathematics'),(97,'Mathematics'),(103,'Mathematics'),(104,'Mathematics'),(105,'Mathematics'),(106,'Mathematics'),(112,'Mathematics'),(118,'Mathematics'),(2,'Medical engineering'),(6,'Medical engineering'),(7,'Medical engineering'),(16,'Medical engineering'),(25,'Medical engineering'),(26,'Medical engineering'),(29,'Medical engineering'),(30,'Medical Engineering'),(42,'Medical engineering'),(51,'Medical engineering'),(53,'Medical engineering'),(55,'Medical engineering'),(64,'Medical engineering'),(72,'Medical engineering'),(76,'Medical engineering'),(78,'Medical engineering'),(87,'Medical engineering'),(88,'Medical engineering'),(91,'Medical engineering'),(92,'Medical engineering'),(94,'Medical engineering'),(98,'Medical engineering'),(102,'Medical engineering'),(104,'Medical engineering'),(106,'Medical engineering'),(111,'Medical engineering'),(114,'Medical engineering'),(118,'Medical engineering'),(120,'Medical engineering'),(16,'Nano-technology'),(17,'Nano-technology'),(22,'Nano-technology'),(24,'Nano-technology'),(33,'Nano-technology'),(35,'Nano-technology'),(36,'Nano-technology'),(39,'Nano-technology'),(50,'Nano-technology'),(58,'Nano-technology'),(61,'Nano-technology'),(68,'Nano-technology'),(70,'Nano-technology'),(75,'Nano-technology'),(76,'Nano-technology'),(79,'Nano-technology'),(80,'Nano-technology'),(82,'Nano-technology'),(84,'Nano-technology'),(85,'Nano-technology'),(87,'Nano-technology'),(89,'Nano-technology'),(95,'Nano-technology'),(105,'Nano-technology'),(106,'Nano-technology'),(107,'Nano-technology'),(110,'Nano-technology'),(111,'Nano-technology'),(112,'Nano-technology'),(119,'Nano-technology'),(120,'Nano-technology'),(5,'Physics'),(17,'Physics'),(19,'Physics'),(21,'Physics'),(25,'Physics'),(33,'Physics'),(34,'Physics'),(39,'Physics'),(41,'Physics'),(43,'Physics'),(46,'Physics'),(47,'Physics'),(49,'Physics'),(53,'Physics'),(73,'Physics'),(76,'Physics'),(77,'Physics'),(79,'Physics'),(84,'Physics'),(86,'Physics'),(90,'Physics'),(92,'Physics'),(95,'Physics'),(96,'Physics'),(99,'Physics'),(100,'Physics'),(101,'Physics'),(103,'Physics'),(104,'Physics'),(108,'Physics'),(109,'Physics'),(110,'Physics'),(112,'Physics'),(116,'Physics'),(119,'Physics');
/*!40000 ALTER TABLE `related_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_center`
--

DROP TABLE IF EXISTS `research_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_center` (
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα του ερευνητικού κέντρου',
  `ministry_budget` decimal(9,2) NOT NULL COMMENT 'Προϋπολογισμός από Υπουργείο Παιδείας',
  `self_budget` decimal(9,2) NOT NULL COMMENT 'Προϋπολογισμός από ιδιωτικές δράσεις',
  PRIMARY KEY (`organizationName`),
  KEY `is_research_center` (`organizationName`),
  CONSTRAINT `is_research_center` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Σχέση IS_A για οργανισμούς που είναι ερευνητικά κέντρα';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_center`
--

LOCK TABLES `research_center` WRITE;
/*!40000 ALTER TABLE `research_center` DISABLE KEYS */;
INSERT INTO `research_center` VALUES ('Adams, Weissnat and Roob',15000.00,200000.00),('Barton Inc',15000.00,200000.00),('Bergstrom-Huels',15000.00,200000.00),('Emmerich-Braun',15000.00,200000.00),('Fadel, Mills and Senger',15000.00,200000.00),('Fritsch Ltd',15000.00,200000.00),('Heidenreich Inc',15000.00,200000.00),('Hintz PLC',15000.00,200000.00),('Hoppe, Hagenes and Hegmann',15000.00,200000.00),('Jakubowski-Luettgen',15000.00,200000.00),('Kuhlman and Sons',15000.00,200000.00),('Marquardt, Marquardt and Hauck',15000.00,200000.00),('Mayert Group',15000.00,200000.00),('McDermott, Balistreri and Heller',15000.00,200000.00),('McGlynn LLC',15000.00,200000.00);
/*!40000 ALTER TABLE `research_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_field`
--

DROP TABLE IF EXISTS `research_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_field` (
  `name` varchar(100) NOT NULL COMMENT 'Όνομα (μοναδικό) του επιστημονικού πεδίου',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Επιστημονικά πεδία';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_field`
--

LOCK TABLES `research_field` WRITE;
/*!40000 ALTER TABLE `research_field` DISABLE KEYS */;
INSERT INTO `research_field` VALUES ('Biology'),('Biotechnology'),('Chemistry'),('Clinical medicine'),('Computer Science'),('Electronics'),('Materials engineering'),('Mathematics'),('Medical engineering'),('Nano-technology'),('Physics');
/*!40000 ALTER TABLE `research_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researcher`
--

DROP TABLE IF EXISTS `researcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `researcher` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Μοναδικό αναγνωριστικό του ερευνητή',
  `name` varchar(100) NOT NULL COMMENT 'Όνομα',
  `surname` varchar(100) NOT NULL COMMENT 'Επίθετο',
  `gender` varchar(10) NOT NULL COMMENT 'Φύλο (male ή female)',
  `birth_date` date NOT NULL COMMENT 'Ημερομηνία Γέννησης',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_surname` (`surname`),
  CONSTRAINT `check_gender` CHECK ((`gender` in (_utf8mb4'male',_utf8mb4'female')))
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ερευνητές που εργάζονται σε έργα';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researcher`
--

LOCK TABLES `researcher` WRITE;
/*!40000 ALTER TABLE `researcher` DISABLE KEYS */;
INSERT INTO `researcher` VALUES (1,'Brannon','Kassulke','male','1985-01-25'),(2,'Hollis','Wintheiser','female','1986-08-12'),(3,'Brenna','Romaguera','female','1981-03-02'),(4,'Andre','Beahan','female','1981-12-30'),(5,'Donato','Wiza','male','1991-04-01'),(6,'Torrance','Predovic','male','2001-01-06'),(7,'Columbus','Ferry','male','1985-06-14'),(8,'Leo','Murray','male','1989-01-30'),(9,'Ruthie','Reichel','male','1988-05-24'),(10,'Dalton','Ullrich','female','1998-10-20'),(11,'Hosea','Jenkins','male','1987-11-19'),(12,'Jarrod','Berge','female','1984-01-21'),(13,'Judah','Senger','female','1985-06-21'),(14,'Elza','Lueilwitz','female','1981-07-16'),(15,'Janiya','Ritchie','female','1999-01-13'),(16,'Eleonore','Kerluke','female','1988-06-02'),(17,'Theresa','Torp','male','1986-11-08'),(18,'Elaina','McGlynn','male','2000-03-04'),(19,'Curtis','Vandervort','male','1982-06-23'),(20,'Finn','Blick','male','1981-04-02'),(21,'Alfredo','Raynor','male','1986-11-01'),(22,'Rocio','Braun','female','1999-04-19'),(23,'Rosemary','Orn','male','1982-07-27'),(24,'Simeon','Leffler','male','1990-05-24'),(25,'Albin','Beer','female','1995-05-04'),(26,'Adolph','Nikolaus','female','1982-05-18'),(27,'Loren','Schaefer','male','1985-07-07'),(28,'Lauriane','Cassin','male','1986-08-29'),(29,'Kale','Jacobson','female','1994-04-16'),(30,'Rebeca','Hahn','male','1995-07-27'),(31,'Elijah','Corwin','male','1994-03-03'),(32,'Dora','Goodwin','female','1983-03-06'),(33,'Dovie','Hickle','male','1982-02-13'),(34,'Jacey','Witting','female','1986-09-21'),(35,'Eula','Kuhlman','female','1980-01-03'),(36,'Consuelo','Hessel','male','2001-05-05'),(37,'Melody','Ratke','male','1988-10-04'),(38,'Lily','Keeling','female','1989-08-05'),(39,'Imelda','Cummings','female','1981-02-19'),(40,'Geovanni','Jenkins','female','1993-11-16'),(41,'Curt','Buckridge','male','1984-05-27'),(42,'Lonnie','Legros','female','1993-10-05'),(43,'Ada','Botsford','female','1983-03-13'),(44,'Deborah','Sipes','female','1988-05-07'),(45,'Amira','Batz','female','1995-01-09'),(46,'Carolina','Gutkowski','male','2001-08-26'),(47,'Lou','Luettgen','female','1980-02-05'),(48,'Ivory','Walker','female','1983-10-13'),(49,'Maiya','Mann','female','2000-09-18'),(50,'Keely','Bayer','female','1982-08-28'),(51,'Nicolas','Russel','male','1984-03-03'),(52,'Efrain','Hagenes','male','1981-09-11'),(53,'Lexus','Ziemann','female','1981-06-27'),(54,'Adelle','Swift','male','1986-04-26'),(55,'Letitia','Conroy','female','1993-12-18'),(56,'Daisy','Medhurst','male','1982-04-20'),(57,'Ozella','Senger','male','1982-05-19'),(58,'Breanne','Morissette','female','1982-04-20'),(59,'Shanna','Yost','female','1981-09-27'),(60,'Melissa','Greenholt','male','1984-08-04'),(61,'Korbin','Schowalter','female','1985-10-29'),(62,'Tate','Rice','female','2001-09-10'),(63,'Vincenzo','Rowe','female','1980-04-28'),(64,'Keara','Frami','female','1985-10-28'),(65,'Gia','Gerhold','male','1988-01-21'),(66,'Barbara','Grady','female','1982-10-07'),(67,'Marcos','Graham','female','1993-12-25'),(68,'Devyn','Sawayn','female','1981-07-17'),(69,'Leonard','Nicolas','female','1989-03-17'),(70,'Adele','Klein','female','1985-12-10'),(71,'Betsy','Marks','male','1983-08-22'),(72,'Clair','Christiansen','male','1981-10-09'),(73,'Jerel','Harris','female','1998-05-26'),(74,'Esther','Beier','male','1980-12-09'),(75,'Angelica','Greenfelder','female','1987-05-05'),(76,'Lorna','Metz','female','1986-04-22'),(77,'Leo','Hamill','female','1989-02-22'),(78,'Virginia','Rippin','female','1985-07-09'),(79,'Everette','Conroy','female','1984-11-08'),(80,'Edna','Schamberger','female','1999-12-29'),(81,'Sylvan','Beier','male','1983-07-18'),(82,'Amina','Ankunding','male','1982-08-22'),(83,'Chauncey','Heathcote','female','1995-02-22'),(84,'Lera','Johnston','male','1987-10-21'),(85,'Clement','Schuster','male','1980-03-30'),(86,'Milo','VonRueden','male','2000-07-26'),(87,'Marisa','Mills','male','1982-01-31'),(88,'Elizabeth','Kemmer','male','1997-03-01'),(89,'Federico','Osinski','female','1995-04-14'),(90,'Camryn','Barton','male','2001-07-15'),(91,'Helmer','Lynch','female','2000-07-17'),(92,'Roxanne','Schneider','female','1980-05-25'),(93,'Rosalee','Bailey','female','1982-08-09'),(94,'Brittany','Jerde','female','1985-07-07'),(95,'Danika','Ullrich','female','1996-09-09'),(96,'Aryanna','Jacobi','female','1990-11-19'),(97,'Myah','Turcotte','male','1988-10-19'),(98,'Verona','Bins','female','1999-05-31'),(99,'Fanny','Rowe','female','1986-02-22'),(100,'Andy','Quitzon','female','1993-10-16'),(101,'Brooklyn','Russel','female','1983-05-04'),(102,'Breanne','Schuster','female','1999-09-21'),(103,'Filomena','Jerde','female','1987-12-31'),(104,'Kaycee','Grant','male','1986-02-07'),(105,'Joel','Gusikowski','male','1984-09-18'),(106,'Emmet','Hane','male','1982-09-01'),(107,'Mazie','Reynolds','male','1994-12-01'),(108,'Jermaine','Rosenbaum','male','1986-08-21'),(109,'Clara','Botsford','male','1985-07-20'),(110,'Anderson','Feil','female','1990-08-03');
/*!40000 ALTER TABLE `researcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university` (
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα του πανεπιστημίου',
  `ministry_budget` decimal(9,2) NOT NULL COMMENT 'Προϋπολογισμός από Υπουργείο Παιδείας',
  PRIMARY KEY (`organizationName`),
  KEY `is_university` (`organizationName`),
  CONSTRAINT `is_university` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Σχέση IS_A για οργανισμούς που είναι πανεπιστήμια';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES ('Abernathy-Cremin',50000.00),('Brekke LLC',50000.00),('Cummings, Medhurst and Brown',50000.00),('Gleason PLC',50000.00),('Hickle and Sons',50000.00),('Jerde, Grant and O\'Kon',50000.00),('Klocko PLC',50000.00),('Kuhlman-Cole',50000.00);
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_for`
--

DROP TABLE IF EXISTS `works_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_for` (
  `researcherId` int NOT NULL COMMENT 'Μοναδικό αναγνωριστικό του εργαζόμενου ερευνητή',
  `organizationName` varchar(100) NOT NULL COMMENT 'Όνομα του οργανισμού στον οποίο εργάζεται',
  `employment_date` date NOT NULL COMMENT 'Ημερομηνία έναρξης της εργασίας',
  PRIMARY KEY (`researcherId`),
  KEY `employing_organization` (`organizationName`),
  CONSTRAINT `employed_researcher` FOREIGN KEY (`researcherId`) REFERENCES `researcher` (`id`),
  CONSTRAINT `employing_organization` FOREIGN KEY (`organizationName`) REFERENCES `organization` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Υπαλληλική σχέση ερευνητή/οργανισμού';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_for`
--

LOCK TABLES `works_for` WRITE;
/*!40000 ALTER TABLE `works_for` DISABLE KEYS */;
INSERT INTO `works_for` VALUES (1,'Abernathy-Cremin','2004-06-11'),(2,'Adams, Weissnat and Roob','2005-07-23'),(3,'Barton Inc','2012-06-17'),(4,'Bednar Ltd','2006-10-10'),(5,'Bergstrom-Huels','2002-07-13'),(6,'Brekke LLC','1994-03-16'),(7,'Cummings, Medhurst and Brown','2015-04-08'),(8,'Deckow-Smitham','2011-05-16'),(9,'Dooley-Feil','2012-08-20'),(10,'Emmerich-Braun','1990-01-18'),(11,'Fadel, Mills and Senger','1998-06-30'),(12,'Fritsch Ltd','2019-02-09'),(13,'Gleason PLC','1990-06-28'),(14,'Hahn-Smith','1993-05-12'),(15,'Heidenreich Inc','2017-10-12'),(16,'Hickle and Sons','2000-10-01'),(17,'Hintz PLC','2003-04-24'),(18,'Hoppe, Hagenes and Hegmann','2004-11-09'),(19,'Jacobi Group','2016-05-10'),(20,'Jacobi Ltd','2001-01-10'),(21,'Jakubowski-Luettgen','1997-08-11'),(22,'Jerde, Grant and O\'Kon','2012-02-13'),(23,'Klocko PLC','2014-11-20'),(24,'Kreiger-Kozey','2019-05-20'),(25,'Kuhlman and Sons','2006-05-09'),(26,'Kuhlman-Cole','2018-04-18'),(27,'Marquardt, Marquardt and Hauck','2010-02-09'),(28,'Mayert Group','1995-10-14'),(29,'McDermott, Balistreri and Heller','2008-01-29'),(30,'McGlynn LLC','2002-06-12'),(31,'Kuhlman-Cole','2015-11-01'),(32,'Jakubowski-Luettgen','2004-10-06'),(33,'Jacobi Ltd','1997-07-11'),(34,'Heidenreich Inc','2019-07-04'),(35,'Strosin, Hickle and Breitenberg','1997-03-03'),(36,'Deckow-Smitham','2014-05-10'),(37,'Cummings, Medhurst and Brown','2013-10-26'),(38,'Brekke LLC','2013-09-10'),(39,'Barton Inc','2007-12-25'),(40,'Abernathy-Cremin','2017-07-04'),(41,'Abernathy-Cremin','1995-08-17'),(42,'Adams, Weissnat and Roob','1998-04-19'),(43,'Barton Inc','2016-01-09'),(44,'Bednar Ltd','2012-11-26'),(45,'Bergstrom-Huels','2000-09-20'),(46,'Brekke LLC','2019-08-15'),(47,'Cummings, Medhurst and Brown','2003-05-21'),(48,'Deckow-Smitham','2011-06-15'),(49,'Dooley-Feil','2018-03-16'),(50,'Emmerich-Braun','2012-03-06'),(51,'Fadel, Mills and Senger','2011-04-16'),(52,'Fritsch Ltd','2007-03-15'),(53,'Gleason PLC','2019-05-02'),(54,'Hahn-Smith','2012-12-21'),(55,'Heidenreich Inc','2000-02-01'),(56,'Hickle and Sons','2013-01-14'),(57,'Hintz PLC','2003-09-01'),(58,'Hoppe, Hagenes and Hegmann','2000-07-10'),(59,'Jacobi Group','2013-11-20'),(60,'Jacobi Ltd','2013-03-09'),(61,'Jakubowski-Luettgen','2001-02-27'),(62,'Jerde, Grant and O\'Kon','2009-05-12'),(63,'Klocko PLC','2018-04-17'),(64,'Kreiger-Kozey','2001-08-14'),(65,'Kuhlman and Sons','1995-07-02'),(66,'Kuhlman-Cole','2013-02-14'),(67,'Marquardt, Marquardt and Hauck','2010-10-18'),(68,'Mayert Group','2012-08-30'),(69,'McDermott, Balistreri and Heller','1997-06-25'),(70,'McGlynn LLC','2000-09-21'),(71,'Kuhlman-Cole','2017-10-26'),(72,'Jakubowski-Luettgen','2018-05-10'),(73,'Jacobi Ltd','2015-03-26'),(74,'Heidenreich Inc','2003-01-14'),(75,'Strosin, Hickle and Breitenberg','2001-12-11'),(76,'Deckow-Smitham','2000-04-20'),(77,'Cummings, Medhurst and Brown','2012-07-19'),(78,'Brekke LLC','2007-12-07'),(79,'Barton Inc','1999-06-03'),(80,'Abernathy-Cremin','2014-10-23'),(81,'Abernathy-Cremin','2006-09-08'),(82,'Adams, Weissnat and Roob','2003-03-28'),(83,'Barton Inc','2006-10-31'),(84,'Bednar Ltd','2004-01-16'),(85,'Bergstrom-Huels','2003-05-25'),(86,'Brekke LLC','2015-10-03'),(87,'Cummings, Medhurst and Brown','2010-11-30'),(88,'Deckow-Smitham','2005-02-12'),(89,'Dooley-Feil','2009-12-17'),(90,'Emmerich-Braun','2000-07-25'),(91,'Fadel, Mills and Senger','1999-03-09'),(92,'Fritsch Ltd','2015-02-23'),(93,'Gleason PLC','2002-09-19'),(94,'Hahn-Smith','2016-08-30'),(95,'Heidenreich Inc','2007-07-04'),(96,'Hickle and Sons','2017-07-14'),(97,'Hintz PLC','2011-09-11'),(98,'Hoppe, Hagenes and Hegmann','2009-09-21'),(99,'Jacobi Group','2007-10-29'),(100,'Jacobi Ltd','2011-09-06'),(101,'Jakubowski-Luettgen','2012-04-25'),(102,'Jerde, Grant and O\'Kon','1990-11-29'),(103,'Klocko PLC','2012-01-01'),(104,'Kreiger-Kozey','2007-12-13'),(105,'Kuhlman and Sons','2010-05-16'),(106,'Kuhlman-Cole','2011-07-23'),(107,'Marquardt, Marquardt and Hauck','2018-10-07'),(108,'Mayert Group','2005-04-06'),(109,'McDermott, Balistreri and Heller','2002-05-08'),(110,'McGlynn LLC','2007-04-19');
/*!40000 ALTER TABLE `works_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_project'
--
/*!50003 DROP FUNCTION IF EXISTS `rating_researcher_in_organization` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `rating_researcher_in_organization`(newProjectId INT, newResearcherId INT) RETURNS int
    READS SQL DATA
BEGIN RETURN EXISTS (
  SELECT
    m.organizationName
  FROM
    managed_by AS m
    JOIN works_for AS w ON newResearcherId = w.researcherId
    AND m.organizationName = w.organizationName
  WHERE
    m.projectId = newProjectId
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `project_information`
--

/*!50001 DROP VIEW IF EXISTS `project_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_information` AS select `p`.`id` AS `id`,`p`.`title` AS `title`,`p`.`description` AS `description`,`p`.`budget` AS `budget`,`p`.`start_date` AS `startDate`,`p`.`end_date` AS `endDate`,`p`.`duration` AS `duration`,`e`.`name` AS `executiveName`,`pr`.`name` AS `programName`,`pr`.`address` AS `programAddress`,`rm`.`name` AS `researchManagerName`,`rm`.`surname` AS `researchManagerSurname`,`rm`.`gender` AS `researchManagerGender`,`rm`.`birth_date` AS `researchManagerBirthDate`,`rating`.`rating` AS `rating`,`rating`.`rating_date` AS `ratingDate`,`rr`.`name` AS `ratingResearcherName`,`rr`.`surname` AS `ratingResearcherSurname`,`o`.`name` AS `organizationName`,`o`.`abbreviation` AS `organizationAbbreviation`,`o`.`street` AS `organizationStreet`,`o`.`number` AS `organizationStreetNumber`,`o`.`postal_code` AS `organizationPostalCode`,`o`.`city` AS `organizationCity`,`rt`.`research_fieldName` AS `researchFieldName` from ((((((((`project` `p` join `executive` `e` on((`e`.`id` = `p`.`executiveId`))) join `program` `pr` on((`pr`.`id` = `p`.`programId`))) join `researcher` `rm` on((`rm`.`id` = `p`.`researchManagerId`))) join `project_rating` `rating` on((`rating`.`projectId` = `p`.`id`))) join `researcher` `rr` on((`rr`.`id` = `rating`.`researcherId`))) join `managed_by` `mb` on((`mb`.`projectId` = `p`.`id`))) join `organization` `o` on((`o`.`name` = `mb`.`organizationName`))) join `related_to` `rt` on((`rt`.`projectId` = `p`.`id`))) order by `p`.`id`,`rt`.`research_fieldName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projects_per_researcher`
--

/*!50001 DROP VIEW IF EXISTS `projects_per_researcher`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projects_per_researcher` AS select `r`.`id` AS `id`,`r`.`name` AS `name`,`r`.`surname` AS `surname`,`r`.`gender` AS `gender`,`r`.`birth_date` AS `birth_date`,`p`.`title` AS `project_title`,`p`.`budget` AS `project_budget`,`p`.`start_date` AS `project_start_date`,`p`.`end_date` AS `project_end_date`,`p`.`duration` AS `project_duration` from ((`researcher` `r` join `project_researchers` `pr` on((`r`.`id` = `pr`.`researcherId`))) join `project` `p` on((`p`.`id` = `pr`.`projectId`))) order by `r`.`name`,`p`.`start_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-05  5:13:02
