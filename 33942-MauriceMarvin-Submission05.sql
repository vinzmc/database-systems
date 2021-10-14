CREATE DATABASE IF NOT EXISTS Restoran ;
USE Restoran;

CREATE TABLE IF NOT EXISTS Menu(
	Menu_ID varchar(5) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS Paket(
	ID_Paket varchar(5) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS Employee(
	ID_Employee varchar(5) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS product(
	id_product int PRIMARY KEY);
    
CREATE TABLE IF NOT EXISTS Customer(
	ID_Customer VARCHAR(5) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS `Transaction`(
	`Transaction Date` DATE NOT NULL);

ALTER TABLE Employee
	ADD COLUMN `Nama Depan` VARCHAR(30),
	ADD COLUMN `Nama Belakang` VARCHAR(30) NULL,
	ADD COLUMN `Jabatan` VARCHAR(30),
	ADD COLUMN `Alamat` VARCHAR(50),
	ADD COLUMN `Email` VARCHAR(50),
	ADD COLUMN `Nomor Telepon` VARCHAR(15),
	ADD COLUMN `Gaji` INT;

ALTER TABLE product
	ADD COLUMN `name` VARCHAR(30),
	ADD COLUMN `SC` INT,
	ADD COLUMN `LP` INT,
	ADD COLUMN `minOrder` INT,
	ADD COLUMN `Category` VARCHAR(15);
    
ALTER TABLE Customer
	ADD COLUMN `Nama Depan` VARCHAR(30),
	ADD COLUMN `Nama Belakang` VARCHAR(30),
	ADD COLUMN `Alamat` VARCHAR(50),
	ADD COLUMN `Email` VARCHAR(50),
	ADD COLUMN `Nomor Telepon` VARCHAR(15);

ALTER TABLE Paket
	ADD COLUMN `Harga Paket` INT NOT NULL;

ALTER TABLE Menu
	ADD COLUMN `Nama Menu` VARCHAR(30),
	ADD COLUMN `Jenis Menu` VARCHAR(30),
	ADD COLUMN ID_Paket VARCHAR(5),
		ADD FOREIGN KEY(ID_Paket) REFERENCES Paket(`ID_Paket`)
			ON DELETE SET NULL;

AlTER TABLE `Transaction`
    ADD ID_Paket VARCHAR(5) FIRST,
		ADD FOREIGN KEY(ID_Paket) REFERENCES Paket(ID_Paket)
			ON DELETE SET NULL,
    ADD ID_Employee VARCHAR(5) FIRST,
		ADD FOREIGN KEY(ID_Employee) REFERENCES Employee(ID_Employee)
			ON DELETE SET NULL,
    ADD ID_Customer VARCHAR(5) FIRST,
		ADD FOREIGN KEY(ID_Customer) REFERENCES Customer(ID_Customer)
			ON DELETE CASCADE;

INSERT INTO Employee
VALUES 
	('E0001', 'Anthony', NULL, 'Manager', '70 Cool Guy', 'anthony@umn.ac.id', '123-456-4565', 5000000),
	('E0002', 'Akino', 'Archiles', 'Chef', '21 Kino Kino', 'akino@student.com', '354-124-5786', 3500000),
    ('E0003', 'Kevin', 'Alexander', 'Cashier', '34 Nishinoya', 'alex@yahoo.com', '098-123-7832', 3000000),
    ('E0004', 'Ivy', 'Marcia', 'Chef', '06 Wall Street', 'ivy@yahoo.com', '846-732-8427', 3500000),
    ('E0005', 'Martha', 'Saphia', 'Customer Service', '78 Ruby Fort', 'martha@umn.ac.id', '718-298-2873', 3200000),
    ('E0006', 'Nofiandy', NULL, 'Cashier', '03 Smooth Hair', 'nofiandy@gmail.com', '516-927-9268', 3250000),
    ('E0007', 'Octavany', NULL, 'Cashier', '23 Relaxing Cafe', 'octa@iseng.com', '654-876-1928', 3150000);

INSERT INTO product
Values
	(1,"Chai", 13.5, 18, 10, "Beverages"),
    (2, "Syrup", 7.5, 10, 25, "Condiments"),
    (3, "Cajun Seasoning", 16.5, 22, 10, "Condiments"),
    (4, "olive oil", 16.0125, 21.35, 10, "Oil"),
    (5, "boispreead", 18.75, 25, 25, "Jams"),
    (6, "dried pears", 22.5, 30, 10, "Dried Fruit"),
    (7, "curry wsauce", 30, 40, 10, "Sauces"),
    (8, "nuts", 17.4375, 23.25, 10, "Dried Fruit"),
    (9, "Cock", 29.25, 39, 10, "Canned Fruit"),
    (10, "Chocolate", 6.9, 9.2, 5, "Baked Goods"),
    (11, "Marmalade", 60.75, 81, 10, "Jams"),
    (12, "Scones", 7.5, 10, 5, "Baked Goods"),
    (13, "Beer", 10.5, 14, 15, "Beverages");
    
INSERT INTO Customer
VALUES
	('C0001', 'Michael', 'Oswin', '125 Laugh Land', 'oswin@yahoo.com', '745-387-2874'),
    ('C0002', 'Anna', 'Jeane', '163 Lolita Land', 'anna@gamil.com', '982-397-4862'),
    ('C0003', 'Raymond', NULL, '287 Chucky Suburb', 'raymond@gmail.com', '917-376-4672'),
    ('C0004', 'Theodore', 'Mulia', '287 Idea Annex', 'mulia@gmail.com', '122-187-1111'),
    ('C0005', 'Niki', 'Emersan', '297 Cult Annex', 'niki@yahoo.com', '198-292-2223'),
    ('C0006', 'Christine', 'Liviani', '175 Love Annex', 'liviani@live.com', '000-198-2836'),
    ('C0007', 'Hermawan', NULL, '212 Tall Building', 'hermawan@yahoo.com', '192-168-1001'),
    ('C0008', 'Agung', NULL, '293 Short Building', 'agung@yahoo.com', '192-168-1993'),
    ('C0009', 'Samuel', 'Sandro', '206 Oppa Annex', 'sam@live.com', '192-168-2973'),
    ('C0010', 'Kennard', 'Alcander', '202 Brother Annex', 'ken@live.com', '198-782-3864');

INSERT INTO Paket
VALUES
	('P0001', 3000000),
    ('P0002', 2500000),
    ('P0003', 2000000);
    
INSERT INTO Menu
VALUES
	('M0001', 'Nasi Goreng Cinta', 'Makanan', 'P0001'),
    ('M0002', 'Ayam Bumbu PHP', 'Makanan', 'P0002'),
    ('M0003', 'Soto Daging CPP', 'Makanan', 'P0003'),
    ('M0004', 'Siomay Pak BoBi', 'Makanan', 'P0001'),
    ('M0005', 'Blue Integer', 'Minuman', 'P0001'),
    ('M0006', 'Mocha Float', 'Dessert', 'P0003'),
    ('M0007', 'Choco Banana Split', 'Dessert', 'P0002'),
    ('M0008', 'Es Teh Panas', 'Minuman', 'P0002'),
    ('M0009', 'Nasi Micin', 'Makanan', 'P0002'),
    ('M0010', 'Sapi Chabe', 'Makanan', 'P0003');

INSERT INTO `Transaction`
VALUES
	('C0001', 'E0002', 'P0003', '2016-02-25'),
    ('C0002', 'E0001', 'P0002', '2016-03-12'),
    ('C0003', 'E0002', 'P0002', '2016-04-10'),
    ('C0004', 'E0004', 'P0001', '2016-06-28'),
    ('C0005', 'E0001', 'P0002', '2016-03-30'),
    ('C0006', 'E0003', 'P0003', '2016-03-10'),
    ('C0007', 'E0005', 'P0001', '2016-03-01'),
    ('C0008', 'E0002', 'P0002', '2016-08-30'),
    ('C0009', 'E0002', 'P0003', '2016-11-02'),
    ('C0010', 'E0005', 'P0001', '2016-08-18');

SELECT * FROM restoran.menu;

SELECT `Nama Depan`,`Nama Belakang` FROM restoran.employee WHERE Jabatan='Cashier';

SELECT 
	ID_Paket AS 'ID Paket', 
	`Harga Paket` AS 'Harga Awal',
    truncate(`Harga Paket`*0.7,0) AS 'Harga Akhir'
    FROM restoran.paket;

SELECT
	SUM(Gaji) AS 'Total Gaji Karyawan' From Restoran.Employee;
    
SELECT
	`Nama Depan`,`Nama Belakang`, Jabatan, Email FROM Restoran.Employee WHERE RIGHT(Email,9)='yahoo.com';
    
SELECT
	`Nama Depan`,`Nama Belakang`, Jabatan, Gaji FROM Restoran.Employee WHERE Gaji<3800000;

SET SQL_SAFE_UPDATES = 0;
UPDATE Employee
	SET Email = LOWER(CONCAT(`Nama Depan`,'@restoswin.rs.id'));
SET SQL_SAFE_UPDATES = 1;

SELECT
	TRIM(
		CONCAT(LEFT(`Nama Depan`,4),
			IF(LOCATE(' ',`Alamat`,4)=0,
				MID(`Alamat`,5),
				MID(`Alamat`,5,LOCATE(' ',`Alamat`,5)-4)
			)
		)
	)
    AS `Nama Gabungan`
    FROM Customer WHERE (MID(`Nomor Telepon`,5,1)=1 OR MID(`Nomor Telepon`,5,1)=7) ;
    
SELECT
	CONCAT(LOWER(CONCAT(LEFT(`Nama Menu`,2),RIGHT(`Nama Menu`, 2))),
		REVERSE(LOWER(CONCAT(LEFT(`Nama Menu`,2),RIGHT(`Nama Menu`, 2)))
        )
	)
    AS Hashing
    FROM Menu;

SELECT
	`Nama Depan` AS Nama,
    IF(MOD(Gaji, 200000)=0,
		LPAD('',(Gaji DIV 200000),'$'),
		CONCAT(
			LPAD('',(Gaji DIV 200000),'$'),
			LPAD('',((MOD(Gaji,200000)) DIV 10000),'#')
		)
	) AS Gaji
	FROM Employee WHERE `Nama Belakang` IS NOT NULL;
update employee
	set gaji = gaji +10000
    where ID_Employee = "E0002";
    
SELECT
	ID_Employee
    FROM Employee
    WHERE gaji = ( Select MAX(gaji)
					FROM employee
					WHERE gaji < (SELECT MAX(gaji)
									FROM employee));

SELECT
	Category,
	SUM(ListPrice-StandardCost) as Profit
    FROM Products
    where MinimumReorderQuantity>=9 and 
			MinimumReorderQuantity<=22 and 
            sum(ListPrice-StandardCost)!= 9 and
            sum(ListPrice-StandardCost)!= 22
    group by Category;

SELECT
	ID_Paket
	FROM paket
    LIMIT 2 OFFSET 1;
    
SELECT 
	EmployeeID,
    salary
    FROM Employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1;
    
SELECT
	ID_Employee,
    
    
    