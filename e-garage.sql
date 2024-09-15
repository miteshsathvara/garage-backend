-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: e-garage
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `image` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_charges`
--

DROP TABLE IF EXISTS `garage_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_charge` varchar(200) DEFAULT NULL,
  `day_time_slot` varchar(200) DEFAULT NULL,
  `night_charge` varchar(200) DEFAULT NULL,
  `night_time_slot` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  `bank_name` varchar(200) DEFAULT NULL,
  `ifsc_code` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_charges`
--

LOCK TABLES `garage_charges` WRITE;
/*!40000 ALTER TABLE `garage_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `garage_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_mechnic_details`
--

DROP TABLE IF EXISTS `garage_mechnic_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_mechnic_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `garage_request_accepted` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `mobile_number` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `garage_request_accepted` (`garage_request_accepted`),
  CONSTRAINT `garage_mechnic_details_ibfk_1` FOREIGN KEY (`garage_request_accepted`) REFERENCES `garage_request_accepted` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_mechnic_details`
--

LOCK TABLES `garage_mechnic_details` WRITE;
/*!40000 ALTER TABLE `garage_mechnic_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `garage_mechnic_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_payment_tranfer_status`
--

DROP TABLE IF EXISTS `garage_payment_tranfer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_payment_tranfer_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `garage_request_accepted` int(11) DEFAULT NULL,
  `payment_status` tinyint(4) DEFAULT NULL,
  `trasaction_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `garage_request_accepted` (`garage_request_accepted`),
  CONSTRAINT `garage_payment_tranfer_status_ibfk_1` FOREIGN KEY (`garage_request_accepted`) REFERENCES `garage_request_accepted` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_payment_tranfer_status`
--

LOCK TABLES `garage_payment_tranfer_status` WRITE;
/*!40000 ALTER TABLE `garage_payment_tranfer_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `garage_payment_tranfer_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_request_accepted`
--

DROP TABLE IF EXISTS `garage_request_accepted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_request_accepted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requested_by` int(11) DEFAULT NULL,
  `requested_accepted_by` int(11) DEFAULT NULL,
  `user_service_request` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_request_is_confirm` tinyint(4) DEFAULT NULL,
  `garage_accept_reject_status` tinyint(4) DEFAULT NULL,
  `is_request_completed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requested_by` (`requested_by`),
  KEY `requested_accepted_by` (`requested_accepted_by`),
  KEY `user_service_request` (`user_service_request`),
  CONSTRAINT `garage_request_accepted_ibfk_1` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`),
  CONSTRAINT `garage_request_accepted_ibfk_2` FOREIGN KEY (`requested_accepted_by`) REFERENCES `users` (`id`),
  CONSTRAINT `garage_request_accepted_ibfk_3` FOREIGN KEY (`user_service_request`) REFERENCES `user_service_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_request_accepted`
--

LOCK TABLES `garage_request_accepted` WRITE;
/*!40000 ALTER TABLE `garage_request_accepted` DISABLE KEYS */;
/*!40000 ALTER TABLE `garage_request_accepted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` tinyint(4) NOT NULL,
  `role_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_types`
--

DROP TABLE IF EXISTS `service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `image` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_types`
--

LOCK TABLES `service_types` WRITE;
/*!40000 ALTER TABLE `service_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address_details`
--

DROP TABLE IF EXISTS `user_address_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `street_address` text,
  `apartment` text,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `garage_name` varchar(200) DEFAULT NULL,
  `owner_name` varchar(200) DEFAULT NULL,
  `is_notification` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_address_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address_details`
--

LOCK TABLES `user_address_details` WRITE;
/*!40000 ALTER TABLE `user_address_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_card_details`
--

DROP TABLE IF EXISTS `user_card_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_card_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `card_name` varchar(200) DEFAULT NULL,
  `card_number` varchar(200) DEFAULT NULL,
  `expire_date` varchar(200) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_card_save` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_card_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_card_details`
--

LOCK TABLES `user_card_details` WRITE;
/*!40000 ALTER TABLE `user_card_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_card_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `last_login_ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mobile_verification`
--

DROP TABLE IF EXISTS `user_mobile_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_mobile_verification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `otp` int(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_mobile_verification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mobile_verification`
--

LOCK TABLES `user_mobile_verification` WRITE;
/*!40000 ALTER TABLE `user_mobile_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mobile_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_payment`
--

DROP TABLE IF EXISTS `user_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,7) DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `trasaction_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_payment`
--

LOCK TABLES `user_payment` WRITE;
/*!40000 ALTER TABLE `user_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_payment_log`
--

DROP TABLE IF EXISTS `user_payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_payment_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_payment_id` int(11) DEFAULT NULL,
  `log` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_payment_id` (`user_payment_id`),
  CONSTRAINT `user_payment_log_ibfk_1` FOREIGN KEY (`user_payment_id`) REFERENCES `user_payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_payment_log`
--

LOCK TABLES `user_payment_log` WRITE;
/*!40000 ALTER TABLE `user_payment_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_payment_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_service_request`
--

DROP TABLE IF EXISTS `user_service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_service_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_company_id` int(11) DEFAULT NULL,
  `vehicle_modal_id` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_type_id` (`service_type_id`),
  KEY `user_id` (`user_id`),
  KEY `vehicle_company_id` (`vehicle_company_id`),
  KEY `vehicle_modal_id` (`vehicle_modal_id`),
  CONSTRAINT `user_service_request_ibfk_1` FOREIGN KEY (`service_type_id`) REFERENCES `service_types` (`id`),
  CONSTRAINT `user_service_request_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_service_request_ibfk_3` FOREIGN KEY (`vehicle_company_id`) REFERENCES `vehicle_company` (`id`),
  CONSTRAINT `user_service_request_ibfk_4` FOREIGN KEY (`vehicle_modal_id`) REFERENCES `vehicle_modal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_service_request`
--

LOCK TABLES `user_service_request` WRITE;
/*!40000 ALTER TABLE `user_service_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_service_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vehicle_issues`
--

DROP TABLE IF EXISTS `user_vehicle_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_vehicle_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_issue` text,
  `user_service_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_service_request_id` (`user_service_request_id`),
  CONSTRAINT `user_vehicle_issues_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `user_vehicle_issues_ibfk_2` FOREIGN KEY (`user_service_request_id`) REFERENCES `user_service_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vehicle_issues`
--

LOCK TABLES `user_vehicle_issues` WRITE;
/*!40000 ALTER TABLE `user_vehicle_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vehicle_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `mobile_no` BIGINT(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `role` tinyint(4) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehichle_type`
--

DROP TABLE IF EXISTS `vehichle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehichle_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_type_title` varchar(200) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehichle_type`
--

LOCK TABLES `vehichle_type` WRITE;
/*!40000 ALTER TABLE `vehichle_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehichle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_company`
--

DROP TABLE IF EXISTS `vehicle_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_type_id` (`service_type_id`),
  CONSTRAINT `vehicle_company_ibfk_1` FOREIGN KEY (`service_type_id`) REFERENCES `service_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_company`
--

LOCK TABLES `vehicle_company` WRITE;
/*!40000 ALTER TABLE `vehicle_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_modal`
--

DROP TABLE IF EXISTS `vehicle_modal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_modal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `vehicle_company_id` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_company_id` (`vehicle_company_id`),
  CONSTRAINT `vehicle_modal_ibfk_1` FOREIGN KEY (`vehicle_company_id`) REFERENCES `vehicle_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_modal`
--

LOCK TABLES `vehicle_modal` WRITE;
/*!40000 ALTER TABLE `vehicle_modal` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_modal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-22 11:19:28
