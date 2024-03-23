CREATE DATABASE PROJECT;
USE PROJECT;



CREATE TABLE USER (
    USER_ID INT NOT NULL ,
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    ADDRESS VARCHAR(255) NOT NULL,
    CONTACT_NUMBER VARCHAR(20) NOT NULL,
    PASSWORD VARCHAR(225) NOT NULL,
    PRIMARY KEY (USER_ID)
);

CREATE TABLE CATEGORY (
  CATEGORY_ID int NOT NULL AUTO_INCREMENT,
  CATEGORY_NAME varchar(100) NOT NULL,
  CATEGORY_TYPE varchar(100) NOT  NULL,
  CATEGORY_DISCOUNT decimal(5,2) NOT NULL,
  PRIMARY KEY (CATEGORY_ID)
);

CREATE TABLE PRODUCT (
  PRODUCT_ID int NOT NULL ,
  CATEGORY_ID INT NOT NULL,
  PRODUCT_NAME varchar(100) NOT NULL,
  QUANTITY int NOT NULL,
  PRICE decimal(10,2) NOT NULL,
  DESCRIPTION text,
  PRIMARY KEY (PRODUCT_ID),
  FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
); 

CREATE TABLE INVENTORY (
  INVENTORY_ID int NOT NULL,
  PRODUCT_ID INT NOT NULL,
  QUANTITY int NOT NULL,
  VENDOR_ID int NOT NULL,
  COST_PER_UNIT decimal(10,2) NOT NULL,
  PRIMARY KEY (INVENTORY_ID),
  FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
); 

CREATE TABLE `ORDER` (
  ORDER_ID int NOT NULL ,
  PRODUCT_ID INT NOT NULL,
  USER_ID INT NOT NULL,
  ORDER_DATE timestamp DEFAULT CURRENT_TIMESTAMP,
  AMOUNT decimal(10,2) NOT NULL,
  PRIMARY KEY (ORDER_ID),
  FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID),
  FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID)
) ;

CREATE TABLE VENDOR (
  VENDOR_ID int NOT NULL,
  ORDER_ID INT NOT NULL,
  PRODUCT_ID INT NOT NULL,
  NAME varchar(100) NOT NULL,
  EMAIL varchar(100) NOT NULL,
  ADDRESS varchar(255) DEFAULT NULL,
  CONTACT_NUMBER varchar(20) DEFAULT NULL,
  PRIMARY KEY (VENDOR_ID),
  FOREIGN KEY (ORDER_ID) REFERENCES `ORDER`(ORDER_ID),
  FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
) ;

CREATE TABLE ADMIN (
  ADMIN_ID int NOT NULL ,
  VENDOR_ID INT NOT NULL,
  INVENTORY_ID INT NOT NULL,
  CATEGORY_ID INT NOT NULL,
  NAME varchar(100) NOT NULL,
  EMAIL varchar(100) NOT NULL,
  CONTACT_NUMBER varchar(20) NOT NULL,
  POSITIONS varchar(100) NOT NULL,
  PRIMARY KEY (ADMIN_ID),
  FOREIGN KEY (VENDOR_ID) REFERENCES VENDOR(VENDOR_ID),
  FOREIGN KEY (INVENTORY_ID) REFERENCES INVENTORY(INVENTORY_ID),
  FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
  );

CREATE TABLE CART (
  PRODUCT_ID INT NOT NULL,
  USER_ID INT NOT NULL,
  ITEMS_AMOUNT int NOT NULL,
  USERNAME varchar(50) NOT NULL,
  BILLING_AMOUNT decimal(10,2) NOT NULL,
  ADDRESS varchar(255) NOT NULL,
  FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID),
  FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID)
);

CREATE TABLE DELIVERY_PARTNER (
  DELIVERY_PARTNER_ID int NOT NULL ,
  ORDER_ID INT NOT NULL,
  NAME varchar(100) NOT NULL,
  EMAIL varchar(100) NOT NULL,
  ADDRESS varchar(255) NOT NULL,
  CONTACT_NUMBER varchar(20) NOT NULL,
  VEHICLE_ID int NOT NULL,
  STATUS varchar(100) NOT NULL,
  PRIMARY KEY (DELIVERY_PARTNER_ID),
  FOREIGN KEY (ORDER_ID) REFERENCES `ORDER`(ORDER_ID)
) ;


CREATE TABLE REVIEW (
  NAME varchar(50) NOT NULL,
  USER_ID INT NOT NULL,
  CUSTOMER_ID int NOT NULL,
  EMAIL varchar(255) NOT NULL,
  ADDRESS varchar(255) NOT NULL,
  CONTACT_NUMBER bigint NOT NULL,
  FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID)
) ;

CREATE TABLE TRANSACTIONS (
  TRANSACTION_ID int NOT NULL ,
  USER_ID INT NOT NULL,
  ORDER_ID INT NOT NULL,
  AMOUNT decimal(10,2) NOT NULL,
  PAYMENT_MODE varchar(50) NOT NULL,
  PRIMARY KEY (TRANSACTION_ID),
  FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID),
  FOREIGN KEY (ORDER_ID) REFERENCES `ORDER`(ORDER_ID)
) ;

-- Sample entries for USER table
INSERT INTO USER (USER_ID, NAME, EMAIL, ADDRESS, CONTACT_NUMBER, PASSWORD) 
VALUES
  (1, 'John Doe', 'john.doe@example.com', '123 Main St, City, Country', '1234567890', 'password1'),
  (2, 'Jane Smith', 'jane.smith@example.com', '456 Elm St, City, Country', '0987654321', 'password2'),
  (3, 'Alice Johnson', 'alice.johnson@example.com', '789 Oak St, City, Country', '9876543210', 'password3'),
  (4, 'Bob Williams', 'bob.williams@example.com', '101 Pine St, City, Country', '0123456789', 'password4'),
  (5, 'Emily Brown', 'emily.brown@example.com', '111 Cedar St, City, Country', '5551234567', 'password5'),
  (6, 'Michael Davis', 'michael.davis@example.com', '222 Walnut St, City, Country', '3339876543', 'password6'),
  (7, 'Sarah Wilson', 'sarah.wilson@example.com', '333 Maple St, City, Country', '7890123456', 'password7'),
  (8, 'David Martinez', 'david.martinez@example.com', '444 Birch St, City, Country', '2345678901', 'password8'),
  (9, 'Olivia Anderson', 'olivia.anderson@example.com', '555 Oak St, City, Country', '6789012345', 'password9'),
  (10, 'William Taylor', 'william.taylor@example.com', '666 Elm St, City, Country', '8901234567', 'password10');

-- Sample entries for CATEGORY table
INSERT INTO CATEGORY (CATEGORY_NAME, CATEGORY_TYPE, CATEGORY_DISCOUNT) 
VALUES
  ('Electronics', 'Gadgets', 0.05),
  ('Clothing', 'Apparel', 0.1),
  ('Books', 'Reading', 0.15),
  ('Home & Kitchen', 'Household', 0.07),
  ('Sports', 'Outdoor', 0.1),
  ('Beauty', 'Personal Care', 0.12),
  ('Toys', 'Kids', 0.08),
  ('Food & Groceries', 'Consumables', 0.05),
  ('Furniture', 'Home Decor', 0.1),
  ('Health', 'Wellness', 0.1);

-- Sample entries for PRODUCT table
INSERT INTO PRODUCT (PRODUCT_ID, CATEGORY_ID, PRODUCT_NAME, QUANTITY, PRICE, DESCRIPTION) 
VALUES
  (1, 1, 'Smartphone', 100, 599.99, 'High-end smartphone with advanced features'),
  (2, 2, 'T-shirt', 200, 29.99, 'Cotton t-shirt available in various colors'),
  (3, 3, 'Novel', 50, 14.99, 'Bestselling fiction novel by renowned author'),
  (4, 4, 'Blender', 75, 49.99, 'Powerful blender for smoothies and shakes'),
  (5, 5, 'Soccer Ball', 30, 19.99, 'Official size and weight soccer ball'),
  (6, 6, 'Shampoo', 150, 9.99, 'Moisturizing shampoo for all hair types'),
  (7, 7, 'Action Figure', 100, 14.99, 'Popular superhero action figure for kids'),
  (8, 8, 'Pasta', 50, 3.99, 'Imported pasta made from durum wheat'),
  (9, 9, 'Sofa', 20, 499.99, 'Comfortable sofa for living room'),
  (10, 10, 'Vitamins', 100, 19.99, 'Multivitamin supplements for daily health');

-- Sample entries for INVENTORY table
INSERT INTO INVENTORY (INVENTORY_ID, PRODUCT_ID, QUANTITY, VENDOR_ID, COST_PER_UNIT) 
VALUES
  (1, 1, 50, 1, 499.99),
  (2, 2, 100, 2, 19.99),
  (3, 3, 25, 3, 9.99),
  (4, 4, 40, 4, 39.99),
  (5, 5, 15, 5, 14.99),
  (6, 6, 75, 6, 7.99),
  (7, 7, 50, 7, 9.99),
  (8, 8, 25, 8, 2.99),
  (9, 9, 10, 9, 399.99),
  (10, 10, 50, 10, 14.99);

-- Sample entries for ORDER table
INSERT INTO `ORDER` (ORDER_ID, PRODUCT_ID, USER_ID, AMOUNT) 
VALUES
  (1, 1, 1, 599.99),
  (2, 2, 2, 59.98),
  (3, 3, 3, 74.97),
  (4, 4, 4, 199.96),
  (5, 5, 5, 29.98),
  (6, 6, 6, 19.98),
  (7, 7, 7, 14.99),
  (8, 8, 8, 79.92),
  (9, 9, 9, 999.98),
  (10, 10, 10, 199.90);

-- Sample entries for VENDOR table
INSERT INTO VENDOR (VENDOR_ID, ORDER_ID, PRODUCT_ID, NAME, EMAIL, ADDRESS, CONTACT_NUMBER) 
VALUES
  (1, 1, 1, 'TechCorp', 'info@techcorp.com', '123 Tech Blvd, TechCity, Techland', '1234567890'),
  (2, 2, 2, 'FashionHub', 'info@fashionhub.com', '456 Fashion St, FashionCity, Fashionland', '0987654321'),
  (3, 3, 3, 'BookWorld', 'info@bookworld.com', '789 Book Ave, BookCity, Bookland', '9876543210'),
  (4, 4, 4, 'KitchenEssentials', 'info@kitchenessentials.com', '101 Kitchen Rd, KitchenCity, Kitchenland', '0123456789'),
  (5, 5, 5, 'SportsZone', 'info@sportszone.com', '111 Sports Blvd, SportsCity, Sportsland', '5551234567'),
  (6, 6, 6, 'BeautyEmporium', 'info@beautyemporium.com', '222 Beauty St, BeautyCity, Beautyland', '3339876543'),
  (7, 7, 7, 'ToyWorld', 'info@toyworld.com', '333 Toy Rd, ToyCity, Toyland', '7890123456'),
  (8, 8, 8, 'FoodMart', 'info@foodmart.com', '444 Food Ave, FoodCity, Foodland', '2345678901'),
  (9, 9, 9, 'FurnitureHouse', 'info@furniturehouse.com', '555 Furniture Blvd, FurnitureCity, Furnitureland', '6789012345'),
  (10, 10, 10, 'HealthCorner', 'info@healthcorner.com', '666 Health Rd, HealthCity, Healthland', '8901234567');

-- Sample entries for ADMIN table
INSERT INTO ADMIN (ADMIN_ID, VENDOR_ID, INVENTORY_ID, CATEGORY_ID, NAME, EMAIL, CONTACT_NUMBER, POSITIONS) 
VALUES
  (1, 1, 1, 1, 'TechCorp Admin', 'admin@techcorp.com', '1112223333', 'Administrator'),
  (2, 2, 2, 2, 'FashionHub Admin', 'admin@fashionhub.com', '2223334444', 'Manager'),
  (3, 3, 3, 3, 'BookWorld Admin', 'admin@bookworld.com', '3334445555', 'Supervisor'),
  (4, 4, 4, 4, 'KitchenEssentials Admin', 'admin@kitchenessentials.com', '4445556666', 'Coordinator'),
  (5, 5, 5, 5, 'SportsZone Admin', 'admin@sportszone.com', '5556667777', 'Assistant'),
  (6, 6, 6, 6, 'BeautyEmporium Admin', 'admin@beautyemporium.com', '6667778888', 'Associate'),
  (7, 7, 7, 7, 'ToyWorld Admin', 'admin@toyworld.com', '7778889999', 'Executive'),
  (8, 8, 8, 8, 'FoodMart Admin', 'admin@foodmart.com', '8889990000', 'Director'),
  (9, 9, 9, 9, 'FurnitureHouse Admin', 'admin@furniturehouse.com', '9990001111', 'Manager'),
  (10, 10, 10, 10, 'HealthCorner Admin', 'admin@healthcorner.com', '0001112222', 'Coordinator');

-- Sample entries for CART table
INSERT INTO CART (PRODUCT_ID, USER_ID, ITEMS_AMOUNT, USERNAME, BILLING_AMOUNT, ADDRESS) 
VALUES
  (1, 1, 2, 'John Doe', 1199.98, '123 Main St, City, Country'),
  (2, 2, 3, 'Jane Smith', 89.97, '456 Elm St, City, Country'),
  (3, 3, 1, 'Alice Johnson', 14.99, '789 Oak St, City, Country'),
  (4, 4, 4, 'Bob Williams', 199.96, '101 Pine St, City, Country'),
  (5, 5, 1, 'Emily Brown', 29.98, '111 Cedar St, City, Country'),
  (6, 6, 2, 'Michael Davis', 39.96, '222 Walnut St, City, Country'),
  (7, 7, 1, 'Sarah Wilson', 14.99, '333 Maple St, City, Country'),
  (8, 8, 5, 'David Martinez', 19.95, '444 Birch St, City, Country'),
  (9, 9, 2, 'Olivia Anderson', 1999.96, '555 Oak St, City, Country'),
  (10, 10, 3, 'William Taylor', 59.97, '666 Elm St, City, Country');

-- Sample entries for DELIVERY_PARTNER table
INSERT INTO DELIVERY_PARTNER (DELIVERY_PARTNER_ID, ORDER_ID, NAME, EMAIL, ADDRESS, CONTACT_NUMBER, VEHICLE_ID, STATUS) 
VALUES
  (1, 1, 'Delivery Express', 'delivery@express.com', '123 Delivery St, City, Country', '1234567890', 101, 'In Transit'),
  (2, 2, 'Fast Delivery', 'fast@delivery.com', '456 Speedy Rd, City, Country', '0987654321', 102, 'Delivered'),
  (3, 3, 'Swift Deliveries', 'swift@deliveries.com', '789 Quick St, City, Country', '9876543210', 103, 'Out for Delivery'),
  (4, 4, 'Prime Logistics', 'prime@logistics.com', '101 Prime Ave, City, Country', '0123456789', 104, 'Delivered'),
  (5, 5, 'Rapid Couriers', 'rapid@couriers.com', '111 Rapid Blvd, City, Country', '5551234567', 105, 'In Transit'),
  (6, 6, 'Express Deliveries', 'express@deliveries.com', '222 Express Rd, City, Country', '3339876543', 106, 'Delivered'),
  (7, 7, 'Speedy Shipping', 'speedy@shipping.com', '333 Speedy St, City, Country', '7890123456', 107, 'Out for Delivery'),
  (8, 8, 'Quick Transport', 'quick@transport.com', '444 Quick Ave, City, Country', '2345678901', 108, 'In Transit'),
  (9, 9, 'Swift Dispatch', 'swift@dispatch.com', '555 Dispatch Rd, City, Country', '6789012345', 109, 'Delivered'),
  (10, 10, 'Fast Freight', 'fast@freight.com', '666 Fast St, City, Country', '8901234567', 110, 'Out for Delivery');

-- Sample entries for REVIEW table
INSERT INTO REVIEW (NAME, USER_ID, CUSTOMER_ID, EMAIL, ADDRESS, CONTACT_NUMBER) 
VALUES
  ('John Doe', 1, 101, 'john.doe@example.com', '123 Main St, City, Country', 1234567890),
  ('Jane Smith', 2, 102, 'jane.smith@example.com', '456 Elm St, City, Country', 0987654321),
  ('Alice Johnson', 3, 103, 'alice.johnson@example.com', '789 Oak St, City, Country', 9876543210),
  ('Bob Williams', 4, 104, 'bob.williams@example.com', '101 Pine St, City, Country', 0123456789),
  ('Emily Brown', 5, 105, 'emily.brown@example.com', '111 Cedar St, City, Country', 5551234567),
  ('Michael Davis', 6, 106, 'michael.davis@example.com', '222 Walnut St, City, Country', 3339876543),
  ('Sarah Wilson', 7, 107, 'sarah.wilson@example.com', '333 Maple St, City, Country', 7890123456),
  ('David Martinez', 8, 108, 'david.martinez@example.com', '444 Birch St, City, Country', 2345678901),
  ('Olivia Anderson', 9, 109, 'olivia.anderson@example.com', '555 Oak St, City, Country', 6789012345),
  ('William Taylor', 10, 110, 'william.taylor@example.com', '666 Elm St, City, Country', 8901234567);

-- Sample entries for TRANSACTIONS table
INSERT INTO TRANSACTIONS (TRANSACTION_ID, USER_ID, ORDER_ID, AMOUNT, PAYMENT_MODE) 
VALUES
  (1, 1, 1, 599.99, 'Credit Card'),
  (2, 2, 2, 59.98, 'Debit Card'),
  (3, 3, 3, 74.97, 'PayPal'),
  (4, 4, 4, 199.96, 'Credit Card'),
  (5, 5, 5, 29.98, 'Debit Card'),
  (6, 6, 6, 19.98, 'Credit Card'),
  (7, 7, 7, 14.99, 'PayPal'),
  (8, 8, 8, 79.92, 'Credit Card'),
  (9, 9, 9, 999.98, 'Debit Card'),
  (10, 10, 10, 199.90, 'PayPal');
  




