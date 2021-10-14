CREATE SCHEMA resto;
USE resto;

CREATE TABLE IF NOT EXISTS kategori(
	IDKategori VARCHAR(5) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS menu(
	IDMenu VARCHAR(5) PRIMARY KEY);
    
CREATE TABLE IF NOT EXISTS `order`(
	IDOrder VARCHAR(5) NOT NULL);
    
ALTER TABLE kategori
	ADD COLUMN Kategori VARCHAR(30);

ALTER TABLE menu
    ADD COLUMN NamaMenu VARCHAR(30),
    ADD COLUMN IDKategori VARCHAR(5),
    ADD COLUMN Harga INT;
    
ALTER TABLE `order`
    ADD COLUMN IDMenu VARCHAR(5) NOT NULL,
    ADD COLUMN NomorMeja INT,
    ADD COLUMN JamMasuk TIME,
    ADD COLUMN JamKeluar TIME;
    
ALTER TABLE menu
	ADD FOREIGN KEY(IDKategori) REFERENCES kategori(`IDKategori`)
			ON DELETE SET NULL;

ALTER TABLE `order`
	ADD CONSTRAINT PRIMARY KEY (IDOrder,IDMenu),
	ADD FOREIGN KEY(IDMenu) REFERENCES menu(IDMenu);

INSERT INTO kategori
VALUES
	('K001', 'Makanan Pokok'),
    ('K002', 'Lauk'),
    ('K003', 'Minuman');
    
INSERT INTO menu
VALUES
	('MN001', 'Nasi Putih', 'K001', 5000),
    ('MN002', 'Tahu Goreng', 'K002', 4000),
    ('MN003', 'Air Mineral', 'K003', 3000),
    ('MN004', 'Ayam Goreng', 'K002', 15000);
    
INSERT INTO `order`
VALUES
	('OD001', 'MN001', 1, '10:00', '11:00'),
    ('OD001', 'MN002', 1, '10:00', '11:00'),
    ('OD001', 'MN003', 1, '10:00', '11:00'),
    ('OD002', 'MN001', 2, '11:00', '13:00'),
    ('OD002', 'MN004', 2, '11:00', '13:00'),
    ('OD003', 'MN002', 1, '15:00', '15:30'),
    ('OD004', 'MN004', 1, '15:00', '15:30');