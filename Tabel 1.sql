CREATE SCHEMA penduduk;
USE penduduk;

CREATE TABLE IF NOT EXISTS calon(
	ID_Calon VARCHAR(5) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS pemilih(
	ID_Pemilih VARCHAR(5) PRIMARY KEY);

ALTER TABLE calon
	ADD COLUMN Nama_Calon VARCHAR(30);
    
ALTER TABLE pemilih
	ADD COLUMN ID_Calon VARCHAR(5),
    ADD COLUMN Nama_Pemilih VARCHAR(30),
    ADD COLUMN NoTelp VARCHAR(7);

ALTER TABLE pemilih
	ADD FOREIGN KEY(ID_Calon) REFERENCES calon(`ID_Calon`)
			ON DELETE SET NULL;

INSERT INTO calon
VALUES
	('PR001', 'Dennis Wicaksana'),
    ('PR002', 'Arya Gunawan');

INSERT INTO pemilih
VALUES
	('PD001', 'PR001', 'Anna', '2031203'),
    ('PD002', 'PR001', 'Sukijah', '2301223'),
    ('PD003', 'PR002', 'Kana', '2334059'),
    ('PD004', 'PR001', 'Kiri', '2033012'),
    ('PD005', 'PR002', 'Okta', '9332333');
