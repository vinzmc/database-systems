CREATE DATABASE IF NOT EXISTS Restoran ;
USE Restoran;

CREATE TABLE IF NOT EXISTS Menu(
	Menu_ID varchar(5) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS Paket(
	ID_Paket varchar(5) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS Employee(
	ID_Employee varchar(5) PRIMARY KEY);

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
	('E0001', 'Sax', 'Fucelli', 'Manager', '04 Numero Quatro', 'sax@yahoo.com', '084-4444-4444', 10000000),
    ('E0002', 'Smitty', 'Werbenmanjensen', 'Customer Service', '01 Under Sea', 'smitty@gmail.com', '081-111-1111', 5000000),
    ('E0003', 'Maximillion', 'Pegasus', 'Cashier', '18 Duelist Kingdom', 'maximillion@live.com', '083-171-1377', 2000000),
    ('E0004', 'Oktavia', 'Seckendorff', 'Chef', '70 Under World', 'oktavia@yahoo.com', '085-120-8753', 3000000),
    ('E0005', 'Frejya', 'Wion', 'Chef', '05 Walkure Space', 'frejya@gmail.com', '088-237-6718', 3500000),
    ('E0006', 'Won', NULL, 'Chef', '23 Harvest Moon', 'won@live.com', '089-671-0283', 3750000),
    ('E0007', 'Barney', NULL, 'Cashier', '45 Dino Street', 'barney@yahoo.com', '087-332-9716', 2500000);
    
INSERT INTO Customer
VALUES
	('C0001', 'Santa', 'Monica', '232 Database Annex', 'santa@live.com', '083-221-8762'),
    ('C0002', 'Sil', 'Eighty', '80 Downhill Building', 'sil@gamil.com', '082-123-0938'),
    ('C0003', 'Chandra', 'Nalaar', '191 Magic Land', 'chandra@yahoo.com', '089-382-8371'),
    ('C0004', 'Gideon', 'Zura', '202 Indes Annex', 'gideon@live.com', '084-829-3882'),
    ('C0005', 'Strygwyr', NULL, '147 Bloody Annex', 'strygwyr@gmail.com', '081-826-2372'),
    ('C0006', 'Mogul', 'Kahn', '182 ex Building', 'mogul@yahoo.com', '085-562-7782'),
    ('C0007', 'John', 'Cena', '82 Smack Land', 'john@live.com', '086-829-9283'),
    ('C0008', 'Budi', NULL, '141 Wonder Land', 'budi@gmail.com', '087-927-8263'),
    ('C0009', 'Immelman', NULL, '220 Plane Building', 'immelman@yahoo.com', '088-283-9372'),
    ('C0010', 'Datboi', NULL, '31 Frog Annex', 'datboi@gmail.com', '081-028-0373');

INSERT INTO Paket
VALUES
	('P0001', 3000000),
    ('P0002', 2500000),
    ('P0003', 2000000);
    
INSERT INTO Menu
VALUES
	('M0001', 'Nasi Kecap', 'Makanan', NULL),
    ('M0002', 'Soda Mentos', 'Minuman', NULL),
    ('M0003', 'Es Krim Panas', 'Dessert', NULL),
    ('M0004', 'Ayam Om', 'Makanan', NULL),
    ('M0005', 'Teh Pedas', 'Minuman', NULL),
    ('M0006', 'Giga Pudding', 'Dessert', NULL),
    ('M0007', 'Nasi UMN', 'Makanan', NULL),
    ('M0008', 'Kopi Setarbak', 'Minuman', NULL),
    ('M0009', 'Kue Rebus', 'Dessert', NULL),
    ('M0010', 'Gudetama', 'Dessert', NULL);

UPDATE Menu SET ID_Paket = 'P0001' 
    WHERE Menu_ID = 'M0001' OR Menu_ID = 'M0005' OR Menu_ID = 'M0009' OR Menu_ID = 'M0010';
    
UPDATE Menu SET ID_Paket = 'P0002' 
	WHERE Menu_ID = 'M0002' OR Menu_ID = 'M0004' OR Menu_ID = 'M0006';
    
UPDATE Menu	SET ID_Paket = 'P0003' 
	WHERE Menu_ID = 'M0003' OR Menu_ID = 'M0007' OR Menu_ID = 'M0008';
    
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

SELECT 
	CONCAT(`Nama Depan`, ' ', COALESCE(`Nama Belakang`,'')) 
	FROM Customer 
	ORDER BY `Nama Depan` ASC;

SELECT 
	MONTHNAME(`Transaction Date`) AS 'Month', 
	COUNT(`Transaction Date`) AS 'Total Transaction'  
	FROM `Transaction` 
	GROUP BY MONTH(`Transaction Date`);

SELECT 
	CONCAT(`Nama Depan`, ' ', COALESCE(`Nama Belakang`,'')) AS Nama, Gaji  
	FROM Employee 
	WHERE LOCATE('gmail', Email, 1)>0 
	ORDER BY GAJI ASC LIMIT 1;

/*11*/
SELECT
	ID_Employee AS 'Kode Pekerja',
    COUNT(ID_Employee) AS 'Jumlah Transaksi',
    group_concat(date_format(`Transaction Date`, '%d %M %Y') SEPARATOR', ') AS 'Tanggal Transaksi'
    FROM `Transaction`
    GROUP BY ID_Employee;
    
SELECT
	COUNT(IF(LOCATE('gmail',Email,1)>0,1,NULL)) AS Google,
    COUNT(IF(LOCATE('yahoo',Email,1)>0,1,NULL)) AS Yahoo,
    COUNT(IF(LOCATE('live.',Email,1)>0,1,NULL)) AS Live
	FROM Employee;

SELECT 
	DISTINCT CONCAT(e.`Nama Depan`, ' ', COALESCE(e.`Nama Belakang`,'')) AS Nama
	FROM Employee e INNER JOIN `Transaction` t
	ON (e.ID_Employee = t.ID_Employee);

SELECT 
	date_format(`Transaction Date`, '%d %M %Y') AS 'Waktu Transaksi',
	IF(MONTH(`Transaction Date`) <= 8 AND MONTH(`Transaction Date`) > 4, 'Transaksi Baru','Transaksi Lama') AS 'Kategori Transaksi'
	FROM `Transaction` 
    WHERE MONTH(`Transaction Date`) < 9 ORDER BY `Transaction Date` ASC;

SET @max =(SELECT MAX(LENGTH(CONCAT(`Nama Depan`, ' ', COALESCE(`Nama Belakang`,'')))) FROM Customer);
SELECT
	CONCAT(`Nama Depan`, ' ', COALESCE(`Nama Belakang`,'')) AS Nama
    FROM Customer
    WHERE LENGTH(CONCAT(`Nama Depan`, ' ', COALESCE(`Nama Belakang`,''))) = @max
    LIMIT 1;

SELECT
	CONCAT(`Nama Depan`, ' ', COALESCE(`Nama Belakang`,'')) AS Nama
    FROM Customer
    ORDER BY LENGTH(CONCAT(`Nama Depan`, COALESCE(`Nama Belakang`,''))) ASC;

SELECT 
	CONCAT(e.`Nama Depan`, ' ', COALESCE(e.`Nama Belakang`,'')) AS 'Nama Karyawan',
	group_concat(CONCAT(c.`Nama Depan`, ' ', COALESCE(c.`Nama Belakang`,'')) SEPARATOR', ') as 'Customer',
    SUM(p.`Harga Paket`) as 'Harga'
    FROM `Transaction` t
		INNER JOIN Employee e on e.ID_Employee = t.ID_Employee
        INNER JOIN Customer c on c.ID_Customer = t.ID_Customer
        INNER JOIN Paket p on p.ID_Paket = t.ID_Paket
    GROUP BY t.ID_Employee
    ORDER BY COUNT(*) DESC LIMIT 1;
    
SELECT
	LOWER(CONCAT(
		(REVERSE(LEFT(`Nama Depan`,3))),
		(IF((length(`Nama Depan`)+length(COALESCE(`Nama Belakang`,'')))%3=0, 
			'pen', 
			IF((length(`Nama Depan`)+length(COALESCE(`Nama Belakang`,'')))%3=1,
			'apple',
			'pineapple'
			)
		)),
		(IF((LENGTH(MID(Alamat, LOCATE(' ', Alamat, 1), LOCATE(' ', Alamat, LOCATE(' ', Alamat, 1)+1)-LOCATE(' ', Alamat, 1))))%3=0,
			REVERSE(MID(Alamat, LOCATE(' ', Alamat, 1), LOCATE(' ', Alamat, LOCATE(' ', Alamat, 1)+1)-LOCATE(' ', Alamat, 1))),
			MID(Alamat, LOCATE(' ', Alamat, 1), LOCATE(' ', Alamat, LOCATE(' ', Alamat, 1)+1)-LOCATE(' ', Alamat, 1))
		))
	)) AS 'Hashing'
    FROM Customer;