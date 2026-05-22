-- Question 1: Database Creation
CREATE DATABASE SupermarketManagementSystem;

USE SupermarketManagementSystem;


-- Question 2: Table Design and Creation
CREATE TABLE Supplier(
	supplierId INT PRIMARY KEY IDENTITY(1,1),
	supplierName VARCHAR(100) NOT NULL,
	contactInfo VARCHAR(100),
	phone VARCHAR(20),
	address VARCHAR(150)
);

CREATE TABLE Product(
	productId INT PRIMARY KEY IDENTITY(1,1),
	productName VARCHAR(100) NOT NULL,
	category VARCHAR(50),
	price DECIMAL(10,2),
	stockQuantity INT,
	supplierId INT,
	FOREIGN KEY (supplierId)
	REFERENCES Supplier(supplierId)
);

CREATE TABLE Customer(
	customerId INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100),
	phone VARCHAR(20),
	email VARCHAR(100),
	address VARCHAR(150)
);

CREATE TABLE Orders(
	orderId INT PRIMARY KEY IDENTITY(1,1),
	orderDate DATE,
	totalAmount DECIMAL(10,2),
	customerId INT,
	FOREIGN KEY (customerId)
	REFERENCES Customer(customerId)
);


CREATE TABLE OrderItems(
	orderItemId INT PRIMARY KEY IDENTITY(1,1),
	orderId INT,
	productId INT,
	quantity INT,
	itemPrice DECIMAL(10,2),

	FOREIGN KEY (orderId)
	REFERENCES Orders(orderId), 

	FOREIGN KEY (productId)
	REFERENCES Product(productId) 
);

CREATE TABLE Payment(
	paymentId INT PRIMARY KEY IDENTITY(1,1),
	orderId INT,
	amount DECIMAL(10,2),
	paymentDate DATE,
	paymentMethod VARCHAR(50)

	FOREIGN KEY (orderId)
	REFERENCES Orders(orderId)
);


CREATE TABLE Store(
	storeId INT PRIMARY KEY IDENTITY(1,1),
	storeName VARCHAR(100),
	location VARCHAR(100)
);


CREATE TABLE Inventory(
	invetoryId INT PRIMARY KEY IDENTITY(1,1),
	productId INT,
	storeId INT,
	stocklevel INT,

	FOREIGN KEY (productId)
	REFERENCES Product(productId),

	FOREIGN KEY (storeId)
	REFERENCES Store(storeId)
);



CREATE TABLE Job(
	jobId INT PRIMARY KEY IDENTITY(1,1),
	jobTitle VARCHAR(100),
	salary DECIMAL(10,2)
);



CREATE TABLE Employee(
	empId INT PRIMARY KEY IDENTITY(1,1),
	firstName VARCHAR(50),
	lastName VARCHAR(50),
	phone VARCHAR(20),
	jobId INT,
	storeId INT

	FOREIGN KEY (jobId)
	REFERENCES Job(jobId),

	FOREIGN KEY (storeId)
	REFERENCES Store(storeId)
);



-- Question 3: Data Insertion
INSERT INTO Supplier(supplierName, contactInfo, phone, address)
VALUES 
('Fresh Foods Ltd', 'freshltd@gmail.com', '0701000064', 'Kampala'),
('Prime Suppliers', 'primes@gmail.com', '0765409533', 'Mbarara'),
('Global Distributors', 'globaldist@gmail.com', '0710654923', 'Jinja'),
('City Wholesalers', 'citywhole@gmail.com', '0754810006', 'Jinja'),
('Best Supplies', 'bestsupplies@gmail.com', '071050406', 'Masaka'),
('Agro Supplies Co', 'agrosupplies@gmail.com', '0733467006', 'Jinja'),
('Rainbow Traders', 'rainbow@gmail.com', '0700643943', 'Masaka'),
('Mega Supplies', 'megasup@gmail.com', '0738670496', 'Mbarara'),
('Smart Retailers', 'smartretail@gmail.com', '07380496670', 'Mbale'),
('Elite Distributors', 'elites@gmail.com', '07663970804', 'Entebbe'),
('Capital Wholesalers', 'capitalsalers@gmail.com', '07697630408', 'Mukono'),
('Green Farm Produce', 'greenfarm@gmail.com', '0790123456', 'Mukono'),
('Sunrise Beverages', 'sunrisebev@gmail.com', '0794501236', 'Entebbe'),
('Royal Wholesalers', 'royalsales@gmail.com', '0736901245', 'Iganga'),
('Unity suppliers', 'unitysupp@gmail.com', '0701013004', 'Iganga'),
('Quality Distributors', 'qualitydist@gmail.com', '0775309232', 'Kampala'),
('Victory Traders', 'victorytrads@gmail.com', '0745316920', 'Mbarara'),
('City Bakery Ltd', 'citybakery@gmail.com', '0701113322', 'Mukono'),
('Uganda Electronics', 'ugelectronics@gmail.com', '0775624278', 'Kampala'),
('Healthy Harvest', 'harvest@gmail.com', '0789988776', 'Kabale'),
('Lakeview Fisheries', 'lakefish@gmail.com', '0752233445', 'Jinja'),
('Mountain Fresh Vegetables', 'mountainveg@gmail.com', '0794455667', 'Kabale');


INSERT INTO Product(productName, category, price, stockQuantity, supplierId)
VALUES 
('Sugar', 'Food', 4500, 100, 1),
('Beans', 'Food', 5500, 110, 10),
('Bread', 'Bakery', 2500, 90, 4),
('Biscuits', 'Snacks', 2500, 100, 5),
('Hand Sanitizer', 'Health', 6000, 120, 16),
('Cooking Oil', 'Food', 32000, 80, 6),
('Honey', 'Food', 13000, 35, 19),
('Coffee', 'Drinks', 10000, 50, 8),
('Soda', '	Drinks', 2500, 200, 9),
('Fish Fillet', 'Sea Food', 18000, 30, 21),
('Detergent', 'Cleaaning', 15000, 35, 15),
('Matches', 'Food', 11000, 40, 17),
('Maize Flour', 'Food', 4000, 130, 11),
('Banana', 'Fruit', 6000, 150, 12),
('Butter', 'Dairy', 7000, 80, 20),
('Peanut Butter', 'food', 9500, 55, 14),
('Corn Flakes', 'Food', 14000, 45, 15),
('Popcorn', 'Snacks', 3000, 95, 19),
('Notebook', 'Stationery', 5000, 100, 17),
('Air Freshener', 'Cleaning', 9000, 50, 16),
('Bread', 'Bakery', 3000, 70, 18),
('Rice', 'Food', 6000, 120, 2),
('Soap', 'Cleaning', 3500, 200, 3),
('Orange Juice', 'Drink', 12000, 60, 13),
('Mineral Water', 'Drink', 1000, 300, 21),
('Yoghurt', 'Dairy', 3500, 75, 20),
('Tea Leaves', 'Drinks', 8000, 70, 7),
('Fresh Vegetables', 'Food', 4000, 150, 22);

INSERT INTO Customer(name, phone, email, address)
VALUES
('Ivan', '0771000563', 'ivan@gmail.com', 'Kampala'),
('Aisha', '0771098563', 'aisha@gmail.com', 'Mbale'),
('Patricia', '0710750063', 'patu@gmail.com', 'Mbarara'),
('Atuha', '0776053100', 'atuha12@gmail.com', 'Mbale'),
('Allen', '0771000563', 'allen89@gmail.com', 'Jinja'),
('Divas', '0717365563', 'davi@gmail.com', 'Jinja'),
('Hama', '0771011678', 'ham@gmail.com', 'Kampala'),
('Nuwe', '0710750360', 'nuwe2@gmail.com', 'Mukono'),
('Precious', '0736571063', 'preci@gmail.com', 'Entebbe'),
('Hillary', '0740234563', 'hiiary@gmail.com', 'Masaka'),
('Gumisiriza', '0706300715', 'guma@gmail.com', 'Mbarara'),
('Eunice', '0774918465', 'euni34@gmail.com', 'Iganga'),
('Crescent', '0774918465', 'cresc@gmail.com', 'Kampala'),
('Sabila', '0717844965', 'sabil@gmail.com', 'Mukono'),
('Rinah', '0753965234', 'rinah@gmail.com', 'Kabale'),
('Innocent', '0754396523', 'inno@gmail.com', 'Mukono'),
('Ahmed', '0755239346', 'ahmed78@gmail.com', 'Jinja'),
('Cribon', '0753965234', 'cribon@gmail.com', 'Kabale'),
('Anyine', '0718474659', 'anyine@gmail.com', 'Mbale'),
('Siima', '0755239634', 'siima@gmail.com', 'Masaka'),
('Tracy', '0756345239', 'trac@gmail.com', 'Kampala'),
('Sharrote', '0774691845', 'sharrot34@gmail.com', 'Iganga'),
('Bakeine', '0754218095', 'bakeine@gmail.com', 'Entebbe'),
('Agaba', '0759518420', 'agaba@gmail.com', 'Mbarara'),
('Mutoni', '0709425518', 'mutonio98@gmail.com', 'Iganga');


INSERT INTO Orders(orderDate, totalAmount, customerId)
VALUES
('2026-05-01', 50000, 1),
('2026-04-29', 65000, 17),
('2025-12-12', 40000, 18),
('2026-03-31', 38000, 5),
('2026-04-09', 48000, 3),
('2026-05-17', 52000, 11),
('2025-12-05', 67000, 12),
('2026-01-24', 80000, 13),
('2025-12-28', 90000, 14),
('2026-05-20', 78000, 7),
('2025-12-30', 75000, 8),
('2025-12-21', 56000, 20),
('2026-05-01', 46000, 19),
('2026-04-19', 570000, 9),
('2025-12-16', 60000, 10),
('2025-12-11', 65000, 2),
('2025-12-09', 75000, 15),
('2026-02-10', 70000, 16),
('2025-12-22', 40000, 4),
('2026-04-10', 50000, 22),
('2025-12-15', 30000, 6),
('2026-02-16', 55000, 21),
('2026-03-15', 70000, 8),
('2026-05-19', 60000, 11),
('2026-03-12', 60000, 17),
('2026-04-21', 62000, 4),
('2025-12-31', 50000, 5);


INSERT INTO OrderItems(orderId, productId, quantity, itemPrice)
VALUES
(1, 1, 2, 9000),
(2, 1, 3, 4500),
(3, 10, 4, 5500),
(20, 17, 1, 5000),
(21, 16, 6, 9000),
(22, 18, 5, 3000),
(23, 2, 1, 6000),
(4, 4, 2, 2500),
(5, 5, 5, 2500),
(14, 11, 2, 4000),
(15, 12, 3,  6000),
(7, 6, 4, 32000),
(8, 19, 2, 13000),
(18, 15, 3, 14000),
(19, 19, 4, 3000),
(24, 3, 3, 3500),
(25, 13, 2, 12000),
(26, 21, 4, 1000),
(9, 8, 1, 10000),
(10, 9, 6, 2500),
(11, 21, 2, 18000),
(16, 20, 7, 7000),
(17, 14, 8, 9500),
(6, 16, 3, 6000),
(12, 15, 3, 15000),
(13, 17, 5, 11000),
(27, 20, 5, 3500),
(4, 7, 3, 8000),
(17, 22, 1, 4000);



INSERT INTO Payment(orderId, amount, paymentDate, paymentMethod)
VALUES
(1, 50000, '2026-05-01',  'Cash'),
(2, 65000, '2026-04-29',  'Mobile Money'),
(22,  55000, '2026-02-16', 'Card'),
(13, 46000, '2026-05-01',  'Card'),
(14, 57000, '2026-04-19',  'Cash'),
(23, 70000, '2026-03-15',  'Cash'),
(24, 60000, '2026-05-19',  'Card'),
(5, 48000, '2026-04-09', 'Cash'),
(6, 52000, '2026-05-17', 'Mobile Money'),
(7, 67000, '2025-12-05',  'Cash'),
(3, 40000, '2025-12-12',  'Card'),
(4, 38000, '2026-03-31',  'Cash'),
(25, 60000, '2026-03-12',  'Mobile Money'),
(26,  62000, '2026-04-21', 'Cash'),
(15, 60000, '2025-12-16',  'Cash'),
(16, 65000, '2025-12-11',  'Card'),
(17, 75000, '2025-12-09', 'Mobile Money'),
(18, 70000, '2026-02-10',  'Card'),
(11, 75000, '2025-12-30',  'Mobile Money'),
(12, 56000, '2025-12-21', 'Card'),
(8, 80000, '2026-01-24',  'Card'),
(9, 90000, '2025-12-28',  'Cash'),
(19, 40000, '2025-12-22',  'Cash'),
(20, 50000, '2026-04-10',  'Cash'),                                                                                                                                                     
(21, 30000, '2025-12-15',  'Card'),
(27, 50000, '2025-12-31',  'Cash'),
(10, 78000, '2026-05-20',  'Card');



INSERT INTO Store(storeName,location)
VALUES
('Main Branch', 'Kampala'), 
('West Branch', 'Mbarara'),
('East Branch', 'Jinja'),
('Central Branch', 'Masaka'),
('Town Branch', 'Mukono'),
('Eastern Branch', 'Iganga'),
('Lakeview Branch', 'Entebbe'),
('Eastern Branch', 'Iganga'),
('Hilltop Branch', 'Mbale'),
('Southern Branch', 'Kabale');



INSERT INTO Inventory(productId, storeId, stockLevel)
VALUES
(1, 1, 110),
(2, 2, 90),
(3, 3, 100),
(4, 3, 120),
(5, 4, 80),
(6, 3, 35),
(7, 4, 50),
(8, 2, 200),
(9, 9, 30),
(10, 7, 35),
(11,  5, 40),
(12, 5, 130),
(13, 7, 150),
(14, 8, 80),
(15, 8, 55),
(16, 1, 45),
(17, 2, 95),
(18, 5, 100),
(19, 1, 50),
(20, 10, 70),
(21, 3, 120),
(22, 10, 200),
(23, 1, 60),
(24, 6, 300),
(25, 7, 75),
(26, 2, 70),
(27, 8, 150);


INSERT INTO Job(jobTitle, salary)
VALUES
('Manager', 1200000),
('Assistant Manager', 1000000),
('Cashier', 1200000),
('Senior Cashier', 1200000),
('Supervisor', 1200000),
('Stock Manager', 1200000),
('Salesperson', 1200000),
('Procurement Officer', 1200000),
('Acountant', 1200000),
('Store Keeper', 1200000),
('Cleaner', 1200000),
('Security Guard', 1200000),
('IT Spport Officer', 1200000),
('Customer Care Officer', 1200000),
('Delivery Coordinator', 1200000),
('Inventory Clerk', 550000),
('Marketing Officer', 950000),
('Human Resource Officer', 1000000),
('Operations Manager', 1300000),
('Branch Administrator', 1050000);



INSERT INTO Employee(firstName, lastName, phone, jobId, storeId)
VALUES
('James','Kato','0781000001',1,1),
('Sarah','Namara','0781000002',3,1),
('Daniel','Mugisha','0781000003',6,2),
('Mariam','Achan','0781000004',7,3),
('Peter','Okello','0781000005',5,4),
('Isaac','Tumusiime','0781000006',8,5),
('Linda','Nakato','0781000007',11,6),
('Ronald','Ssenfuma','0781000008',12,7),
('Sharon','Aine','0781000009',13,8),
('Henry','Okot','0781000010',15,9),
('Faith','Namirembe','0781000011',2,10),
('Chris','Mugerwa','0781000012',4,2),
('Janet','Auma','0781000013',9,3),
('Paul','Kisembo','0781000014',10,2),
('Diana','Kemigisa','0781000015',14,4),
('Kevin','Byaruhanga','0781000016',16,5),
('Sandra','Kansiime','0781000017',17,1),
('Micheal','Turyakira','0781000018',18,2),
('Joy','Nabirye','0781000019',19,3),
('Ronah','Aciro','0781000020',20,10);




-- Question 4: SQL Queries
--1. Display all records from a table
SELECT*
FROM Product;


--2. Retrieve records using WHERE
SELECT*
FROM Product
WHERE category = 'Food';

--3. Use ORDER BY
SELECT*
FROM Product
ORDER BY productName ASC;

/* 4. Use aggregate functions such as: 
COUNT()*/
SELECT COUNT(*) AS total_customers
FROM Customer;

--SUM()
SELECT SUM(amount) AS total_payments
FROM Payment;

--AVG()
SELECT AVG(price) AS average_price
FROM Product;

--5. Perform an INNER JOIN between at least two tables
SELECT 
	Orders.orderId,
	Customer.name,
	Orders.totalAmount
FROM Orders
INNER JOIN Customer
ON Orders.customerId = Customer.customerId;

-- 6. Update records using UPDATE
UPDATE Product
SET price = 5000
WHERE productName ='Sugar';

--Question 5: Advanced Database Feature 
CREATE VIEW CustomerOrders AS
SELECT 
	Customer.name,
    Orders.orderId,
    Orders.totalAmount
FROM Customer
INNER JOIN Orders
ON Customer.customerId = Orders.customerId;

SELECT* 
FROM CustomerOrders;