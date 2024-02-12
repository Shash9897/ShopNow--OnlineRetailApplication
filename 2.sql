-- MySQL dump 10.13  Distrib 8.0.35, for macos13 (arm64)
--
-- Host: localhost    Database: SHOPPING
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `ADMIN_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `CONTACT_NUMBER` varchar(20) DEFAULT NULL,
  `POSITIONS` varchar(100) DEFAULT NULL,
  `VENDOR_ID` int DEFAULT NULL,
  PRIMARY KEY (`ADMIN_ID`),
  KEY `VENDOR_ID` (`VENDOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (31,'Rameshwar Kumar','rameshwar@example.com','9876543210','Manager',9),(32,'Geeta Devi','geeta@example.com','9087654321','Supervisor',11),(33,'Mohan Lal','mohan@example.com','7890123456','Assistant',14),(34,'Geeta Sharma','geetasharma@example.com','8765432109','Clerk',6),(35,'Rajesh Goswami','rajesh@example.com','7654321098','Assistant Manager',1),(36,'Pooja Patel','pooja@example.com','6543210987','Administrator',1),(37,'Suresh Singh','suresh@example.com','5432109876','Coordinator',1),(38,'Anita Gupta','anita@example.com','4321098765','Director',3),(39,'Vikram Verma','vikram@example.com','3210987654','Manager',11),(40,'Aarti Sharma','aarti@example.com','2109876543','Assistant',15),(41,'Sanjay Kumar','sanjay@example.com','1098765432','Supervisor',11),(42,'Meera Devi','meera@example.com','0987654321','Clerk',10),(43,'Arjun Singh','arjun@example.com','9876543210','Assistant Manager',1),(44,'Pooja Choudhary','pooja@example.com','8765432109','Administrator',7),(45,'Karan Malhotra','karan@example.com','7654321098','Coordinator',15);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CART`
--

DROP TABLE IF EXISTS `CART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CART` (
  `PRODUCT_ID` int DEFAULT NULL,
  `ITEMS_AMOUNT` int DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `BILLING_AMOUNT` decimal(10,2) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CART`
--

LOCK TABLES `CART` WRITE;
/*!40000 ALTER TABLE `CART` DISABLE KEYS */;
/*!40000 ALTER TABLE `CART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORY`
--

DROP TABLE IF EXISTS `CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORY` (
  `CATEGORY_ID` int NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(100) DEFAULT NULL,
  `CATEGORY_TYPE` varchar(100) DEFAULT NULL,
  `CATEGORY_DISCOUNT` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` VALUES (1,'Electronics','Gadgets',10.00),(2,'Clothing','Apparel',15.00),(3,'Books','Literature',20.00),(4,'Home Appliances','Electronics',12.50),(5,'Furniture','Home Decor',18.00),(6,'Sports Equipment','Fitness',10.00),(7,'Toys','Kids',15.00),(8,'Beauty','Health & Wellness',20.00),(9,'Grocery','Food & Beverage',5.00),(10,'Stationery','Office Supplies',8.00),(11,'Jewelry','Accessories',25.00),(12,'Automotive','Vehicles',12.00),(13,'Pet Supplies','Animals',10.00),(14,'Tools','Hardware',15.00),(15,'Music','Entertainment',20.00);
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_partner`
--

DROP TABLE IF EXISTS `delivery_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partner` (
  `DELIVERY_PARTNER_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(20) DEFAULT NULL,
  `VEHICLE_ID` int DEFAULT NULL,
  `DELIVERY_ID` int DEFAULT NULL,
  `STATUS` varchar(100) DEFAULT NULL,
  `ORDER_ID` int DEFAULT NULL,
  PRIMARY KEY (`DELIVERY_PARTNER_ID`),
  KEY `DELIVERY_ID` (`DELIVERY_ID`),
  KEY `delivery_partner_ibfk_2` (`ORDER_ID`),
  CONSTRAINT `delivery_partner_ibfk_2` FOREIGN KEY (`ORDER_ID`) REFERENCES `order` (`ORDER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partner`
--

LOCK TABLES `delivery_partner` WRITE;
/*!40000 ALTER TABLE `delivery_partner` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVENTORY`
--

DROP TABLE IF EXISTS `INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVENTORY` (
  `PRODUCT_ID` int NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `VENDOR_ID` int DEFAULT NULL,
  `COST_PER_UNIT` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVENTORY`
--

LOCK TABLES `INVENTORY` WRITE;
/*!40000 ALTER TABLE `INVENTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER`
--

DROP TABLE IF EXISTS `ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDER` (
  `ORDER_ID` int NOT NULL AUTO_INCREMENT,
  `ORDER_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AMOUNT` decimal(10,2) DEFAULT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  `CUSTOMER_ID` int DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER`
--

LOCK TABLES `ORDER` WRITE;
/*!40000 ALTER TABLE `ORDER` DISABLE KEYS */;
INSERT INTO `ORDER` VALUES (46,'2024-02-11 21:00:00',120.00,1,1),(47,'2024-02-11 21:15:00',85.00,2,2),(48,'2024-02-11 21:30:00',150.00,3,3),(49,'2024-02-11 21:45:00',70.00,4,4),(50,'2024-02-11 22:00:00',200.00,5,5),(51,'2024-02-11 22:15:00',90.00,6,6),(52,'2024-02-11 22:30:00',110.00,7,7),(53,'2024-02-11 22:45:00',75.00,8,8),(54,'2024-02-11 23:00:00',130.00,9,9),(55,'2024-02-11 23:15:00',95.00,10,10),(56,'2024-02-11 23:30:00',160.00,11,11),(57,'2024-02-11 23:45:00',115.00,12,12),(58,'2024-02-12 00:00:00',140.00,13,13),(59,'2024-02-12 00:15:00',180.00,14,14),(60,'2024-02-12 00:30:00',100.00,15,15);
/*!40000 ALTER TABLE `ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT` (
  `PRODUCT_ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `CATEGORY_ID` int DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `fk_product_category` (`CATEGORY_ID`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (16,'Laptop',1,50,800.00,'Powerful laptop with high performance specifications'),(17,'T-Shirt',2,100,20.00,'Comfortable cotton T-shirt available in various colors and sizes'),(18,'Book',3,75,15.00,'Best-selling novel by a renowned author'),(19,'Smartphone',1,30,600.00,'Latest smartphone model with advanced features'),(20,'Sofa',4,80,500.00,'Comfortable and stylish sofa for your living room'),(21,'Dumbbells',6,45,50.00,'Set of dumbbells for home workouts'),(22,'Football',7,60,25.00,'High-quality football suitable for outdoor play'),(23,'Face Cream',8,25,10.00,'Moisturizing face cream for all skin types'),(24,'Rice',9,55,10.00,'Premium quality basmati rice for cooking'),(25,'Notebook',10,70,5.00,'Spiral-bound notebook for writing notes and sketches'),(26,'Necklace',11,40,100.00,'Elegant necklace with intricate design'),(27,'Car Wax',12,90,15.00,'Car wax for shining and protecting your vehicle'),(28,'Dog Food',13,65,30.00,'Nutritious dog food for your furry friend'),(29,'Hammer',14,20,8.00,'Durable hammer for various household tasks'),(30,'Headphones',15,50,50.00,'High-quality headphones for immersive audio experience');
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEW`
--

DROP TABLE IF EXISTS `REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEW` (
  `NAME` varchar(50) NOT NULL,
  `CUSTOMER_ID` int DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CONTACT_NUMBER` bigint DEFAULT NULL,
  KEY `fk_review_customer` (`CUSTOMER_ID`),
  CONSTRAINT `fk_review_customer` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `USER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEW`
--

LOCK TABLES `REVIEW` WRITE;
/*!40000 ALTER TABLE `REVIEW` DISABLE KEYS */;
INSERT INTO `REVIEW` VALUES ('John Doe',1,'john@example.com','123 Main St',1234567890),('Jane Smith',2,'jane@example.com','456 Elm St',9876543210),('Michael Johnson',3,'michael@example.com','789 Oak St',3456789012),('Emily Brown',4,'emily@example.com','101 Pine St',6789012345),('Daniel Wilson',5,'daniel@example.com','202 Maple St',5432109876),('Jessica Lee',6,'jessica@example.com','303 Cedar St',8765432109),('Christopher Davis',7,'christopher@example.com','404 Birch St',2109876543),('Amanda Martinez',8,'amanda@example.com','505 Walnut St',3210987654),('Matthew Taylor',9,'matthew@example.com','606 Cherry St',4321098765),('Olivia Anderson',10,'olivia@example.com','707 Pineapple St',5432109876),('Andrew Thomas',11,'andrew@example.com','808 Orange St',6543210987),('Sophia White',12,'sophia@example.com','909 Banana St',7654321098),('William Harris',13,'william@example.com','1010 Strawberry St',8765432109),('Isabella Thompson',14,'isabella@example.com','1111 Mango St',9876543210),('Ethan Robinson',15,'ethan@example.com','1212 Kiwi St',1098765432);
/*!40000 ALTER TABLE `REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSACTIONS`
--

DROP TABLE IF EXISTS `TRANSACTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRANSACTIONS` (
  `TRANSACTION_ID` int NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int DEFAULT NULL,
  `AMOUNT` decimal(10,2) DEFAULT NULL,
  `PAYMENT_MODE` varchar(50) DEFAULT NULL,
  `CUSTOMER_ID` int DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACTIONS`
--

LOCK TABLES `TRANSACTIONS` WRITE;
/*!40000 ALTER TABLE `TRANSACTIONS` DISABLE KEYS */;
INSERT INTO `TRANSACTIONS` VALUES (16,1001,120.00,'Credit Card',1),(17,1002,85.00,'PayPal',2),(18,1003,150.00,'Debit Card',3),(19,1004,70.00,'Cash',4),(20,1005,200.00,'Credit Card',5),(21,1006,90.00,'PayPal',6),(22,1007,110.00,'Credit Card',7),(23,1008,75.00,'Debit Card',8),(24,1009,130.00,'Credit Card',9),(25,1010,95.00,'Cash',10),(26,1011,160.00,'Credit Card',11),(27,1012,115.00,'Debit Card',12),(28,1013,140.00,'PayPal',13),(29,1014,180.00,'Credit Card',14),(30,1015,100.00,'Cash',15);
/*!40000 ALTER TABLE `TRANSACTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `CUSTOMER_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'Rajesh Kumar','rajesh@example.com','123 Main St, Bangalore','+91 98765 43210'),(2,'Priya Sharma','priya@example.com','456 Elm St, Mumbai','+91 87654 32109'),(3,'Amit Patel','amit@example.com','789 Oak St, Delhi','+91 76543 21098'),(4,'Anjali Singh','anjali@example.com','101 Pine St, Kolkata','+91 65432 10987'),(5,'Vivek Mishra','vivek@example.com','202 Maple St, Chennai','+91 54321 09876'),(6,'Meera Reddy','meera@example.com','303 Cedar St, Hyderabad','+91 43210 98765'),(7,'Sneha Gupta','sneha@example.com','404 Birch St, Pune','+91 32109 87654'),(8,'Rahul Sharma','rahul@example.com','505 Walnut St, Ahmedabad','+91 21098 76543'),(9,'Kiran Malhotra','kiran@example.com','606 Cherry St, Jaipur','+91 10987 65432'),(10,'Pooja Choudhary','pooja@example.com','707 Pineapple St, Lucknow','+91 09876 54321'),(11,'Rajni Verma','rajni@example.com','808 Orange St, Chandigarh','+91 98765 43210'),(12,'Aditya Kapoor','aditya@example.com','909 Banana St, Indore','+91 87654 32109'),(13,'Neha Jain','neha@example.com','1010 Strawberry St, Bhopal','+91 76543 21098'),(14,'Aryan Gupta','aryan@example.com','1111 Mango St, Surat','+91 65432 10987'),(15,'Nisha Shah','nisha@example.com','1212 Kiwi St, Varanasi','+91 54321 09876');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `VENDOR_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(20) DEFAULT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  `ORDER_ID` int DEFAULT NULL,
  PRIMARY KEY (`VENDOR_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `ORDER_ID` (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (46,'ABC Electronics','abc@example.com','123 Main St, Bangalore','+91 98765 43210',1,1),(47,'XYZ Fashion','xyz@example.com','456 Elm St, Mumbai','+91 87654 32109',2,2),(48,'PQR Books','pqr@example.com','789 Oak St, Delhi','+91 76543 21098',3,3),(49,'LMN Mobiles','lmn@example.com','101 Pine St, Kolkata','+91 65432 10987',4,4),(50,'GHI Furniture','ghi@example.com','202 Maple St, Chennai','+91 54321 09876',5,5),(51,'DEF Sports','def@example.com','303 Cedar St, Hyderabad','+91 43210 98765',6,6),(52,'JKL Grocery','jkl@example.com','404 Birch St, Pune','+91 32109 87654',7,7),(53,'MNO Jewelry','mno@example.com','505 Walnut St, Ahmedabad','+91 21098 76543',8,8),(54,'QRS Auto','qrs@example.com','606 Cherry St, Jaipur','+91 10987 65432',9,9),(55,'STU Pet Supplies','stu@example.com','707 Pineapple St, Lucknow','+91 09876 54321',10,10),(56,'VWX Tools','vwx@example.com','808 Orange St, Chandigarh','+91 98765 43210',11,11),(57,'YZA Beauty','yza@example.com','909 Banana St, Indore','+91 87654 32109',12,12),(58,'BCD Kitchenware','bcd@example.com','1010 Strawberry St, Bhopal','+91 76543 21098',13,13),(59,'EFG Watches','efg@example.com','1111 Mango St, Surat','+91 65432 10987',14,14),(60,'HIJ Home Decor','hij@example.com','1212 Kiwi St, Varanasi','+91 54321 09876',15,15);
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-12 19:06:15
