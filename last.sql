-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: last
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int NOT NULL,
  `username` varchar(70) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(70) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `role` text NOT NULL,
  `member_status` enum('working','not working') DEFAULT 'working',
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `supervisor` varchar(100) DEFAULT NULL,
  `total_leavecount` int DEFAULT '10',
  PRIMARY KEY (`faculty_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (202021,'anusha','123','anusha@codegnan.com','12312312','vijayawada','professor','working','1998-06-09','Female','cse','2022-11-02','B+','anusha',10),(202022,'ram','123','badithaanusha206@gmail.com','123458765','vijayawada','assistant professor','working','1998-06-22','Male','cse','2023-05-25','B+','anusha',10),(202123,'anusha','1234','anushabaditha1999@gmail.com','6677889911','maruthinagar','professor','working','1998-03-02','Female','ece','2022-04-12','A-','sudheer',10);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveapplications`
--

DROP TABLE IF EXISTS `leaveapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaveapplications` (
  `leave_id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `application_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `response_date` timestamp NULL DEFAULT NULL,
  `leave_type` enum('Annual','Sick','Maternity','Paternity','Unpaid','Other') DEFAULT 'Annual',
  `allocated_leaves` int NOT NULL DEFAULT '0',
  `taken_leaves` int DEFAULT NULL,
  PRIMARY KEY (`leave_id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `leaveapplications_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveapplications`
--

LOCK TABLES `leaveapplications` WRITE;
/*!40000 ALTER TABLE `leaveapplications` DISABLE KEYS */;
INSERT INTO `leaveapplications` VALUES (19,202021,'2024-05-23','2024-05-24','pending','2024-05-22 04:16:40',NULL,'Sick',0,NULL),(20,202021,'2024-05-26','2024-05-28','pending','2024-05-22 06:55:36',NULL,'Other',0,NULL),(21,202022,'2024-05-24','2024-05-25','pending','2024-05-22 08:13:14',NULL,'Sick',0,NULL);
/*!40000 ALTER TABLE `leaveapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthlyleaveallocations`
--

DROP TABLE IF EXISTS `monthlyleaveallocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthlyleaveallocations` (
  `allocation_id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int NOT NULL,
  `month_year` varchar(7) NOT NULL,
  `total_leavecount` int NOT NULL,
  `assigned_leavecount` int DEFAULT NULL,
  PRIMARY KEY (`allocation_id`),
  UNIQUE KEY `unique_month_faculty` (`faculty_id`,`month_year`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthlyleaveallocations`
--

LOCK TABLES `monthlyleaveallocations` WRITE;
/*!40000 ALTER TABLE `monthlyleaveallocations` DISABLE KEYS */;
INSERT INTO `monthlyleaveallocations` VALUES (12,202021,'2024',5,5),(13,202022,'2024-05',5,5),(14,202021,'2024 05',1,1);
/*!40000 ALTER TABLE `monthlyleaveallocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workload`
--

DROP TABLE IF EXISTS `workload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workload` (
  `workload_id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int NOT NULL,
  `submission_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `dept` varchar(100) DEFAULT NULL,
  `response_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `leave_id` int DEFAULT NULL,
  `workload_description` text,
  PRIMARY KEY (`workload_id`),
  KEY `faculty_id` (`faculty_id`),
  KEY `l_id` (`leave_id`),
  CONSTRAINT `l_id` FOREIGN KEY (`leave_id`) REFERENCES `leaveapplications` (`leave_id`),
  CONSTRAINT `workload_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workload`
--

LOCK TABLES `workload` WRITE;
/*!40000 ALTER TABLE `workload` DISABLE KEYS */;
INSERT INTO `workload` VALUES (15,202021,'2024-05-22 04:16:40','pending','cse','2024-05-22 04:16:40',19,'i need to complete cse shedule'),(16,202021,'2024-05-22 06:55:36','pending','cse','2024-05-22 06:55:36',20,NULL),(17,202022,'2024-05-22 08:13:14','pending','cse','2024-05-22 08:13:14',21,NULL);
/*!40000 ALTER TABLE `workload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workload_assignment`
--

DROP TABLE IF EXISTS `workload_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workload_assignment` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `from_faculty_id` int DEFAULT NULL,
  `to_faculty_id` int DEFAULT NULL,
  `workload_id` int DEFAULT NULL,
  `assignment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`assignment_id`),
  KEY `from_faculty_id` (`from_faculty_id`),
  KEY `to_faculty_id` (`to_faculty_id`),
  KEY `workload_id` (`workload_id`),
  CONSTRAINT `workload_assignment_ibfk_1` FOREIGN KEY (`from_faculty_id`) REFERENCES `faculty` (`faculty_id`),
  CONSTRAINT `workload_assignment_ibfk_2` FOREIGN KEY (`to_faculty_id`) REFERENCES `faculty` (`faculty_id`),
  CONSTRAINT `workload_assignment_ibfk_3` FOREIGN KEY (`workload_id`) REFERENCES `workload` (`workload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workload_assignment`
--

LOCK TABLES `workload_assignment` WRITE;
/*!40000 ALTER TABLE `workload_assignment` DISABLE KEYS */;
INSERT INTO `workload_assignment` VALUES (22,202022,202021,17,'2024-05-22 08:44:10');
/*!40000 ALTER TABLE `workload_assignment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-25 15:57:32
