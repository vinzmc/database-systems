CREATE DATABASE airbnb;

USE airbnb;

CREATE TABLE user(
	user_id INTEGER PRIMARY KEY,
    nama_depan VARCHAR(50),
    nama_belakang VARCHAR(50),
    jenis_kelamin ENUM('M', 'F'),
    email VARCHAR(50),
    password VARCHAR(50),
    nomor_telepon VARCHAR(12),
    nomor_kartu_pemerintahan VARCHAR(12),
    tanggal_pembuatan_akun DATETIME,
    tanggal_lahir DATETIME,
    nomor_telepon_darurat VARCHAR(12),
    alamat VARCHAR(100),
    deskripsi_profil VARCHAR(1000),
    foto_profil VARCHAR(1000)
);

CREATE TABLE room(
	room_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    tipe_kamar VARCHAR(50),
    alamat VARCHAR(100),
    batas_penghuni INTEGER,
    jumlah_kamar INTEGER,
    jumlah_kasur INTEGER,
    jumlah_kamar_mandi INTEGER,
    punya_dapur BOOLEAN,
    punya_internet BOOLEAN,
    punya_ac BOOLEAN,
    punya_tv BOOLEAN,
    punya_peralatan_mandi BOOLEAN,
    harga INTEGER,
    ketersediaan BOOLEAN
);

CREATE TABLE reservation(
	reservation_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    room_id INTEGER,
    tanggal_awal DATETIME,
    tanggal_akhir DATETIME,
    harga_total INTEGER,
    fee_tambahan INTEGER,
    jumlah_tamu INTEGER,
    metode_pembayaran VARCHAR(50),
    tanggal_reservasi DATETIME
);

CREATE TABLE review(
	review_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    reservation_id INTEGER,
    deskripsi VARCHAR(1000),
    tanggal_pembuatan DATETIME,
    rating INTEGER
);

ALTER TABLE room
ADD FOREIGN KEY(user_id)
REFERENCES user(user_id)
ON DELETE SET NULL;

ALTER TABLE reservation
ADD FOREIGN KEY(user_id)
REFERENCES user(user_id)
ON DELETE SET NULL;

ALTER TABLE reservation
ADD FOREIGN KEY(room_id)
REFERENCES room(room_id)
ON DELETE SET NULL;

ALTER TABLE review
ADD FOREIGN KEY(user_id)
REFERENCES user(user_id)
ON DELETE SET NULL;

ALTER TABLE review
ADD FOREIGN KEY(reservation_id)
REFERENCES reservation(reservation_id)
ON DELETE SET NULL;

INSERT INTO user
VALUES
	(0001, 'Agus', 'Nursalim', 'M', 'agus@gmail.com', 'aguskeren123', '08123456789', 'a294nf24be', '2020-09-20', '2001-05-15', '08987654321', 'Jl. Kacang Kapri Muda Kav. 13', 'Nobody', 'www.placeholder.com/img/1'),
    (0002, 'Alan', 'Clark', 'M', 'alan@gmail.com', 'alangokil123', '084531267894', 'a294nf25be', '2020-09-15', '2001-05-20', '08456158794', 'Jl. Kehormatan Blok A No.19', 'Siapa nih', 'www.placeholder.com/img/2'),
    (0003, 'Michelle', 'Loan', 'F', 'michelle@gmail.com', 'michellenih321', '08124569872', 'a204nf24be', '2020-08-10', '2001-06-21', '08781546329', 'Jl. Cinta Boulevard No.3', 'Aku Cantik', 'www.placeholder.com/img/3'),
    (0004, 'Ang', 'Rianti', 'F', 'ang@gmail.com', 'angsiapa123', '08453687126', 'a394nf24be', '2020-08-12', '2001-04-25', '08453612784', 'Jl. Batu Tulis No. 05', 'Aku Keren', 'www.placeholder.com/img/4'),
    (0005, 'Doni', 'Irawan', 'M', 'doni@gmail.com', 'donigoks123', '08453687126', 'a295nf24be', '2020-08-13', '2001-04-27', '087846132590', 'Jl. Batu Ganit No. 06', 'Aku Gokil', 'www.placeholder.com/img/5'),
    (0006, 'Eddy', 'Halim', 'M', 'eddy@gmail.com', 'edifnaf456', '086512345780', 'a295nf35be', '2020-08-15', '2001-05-27', '084510236781', 'Jl. Jalan Buntu No. 16', 'Aku Eddy', 'www.placeholder.com/img/6'),
    (0007, 'Elisabet', 'Lay', 'F', 'eli@gmail.com', 'eliaf4678', '08954123457', 'a305nf35be', '2020-07-15', '2001-09-27', '08621548357', 'Jl. Merdeka No. 15', 'Aku Bukan Eli', 'www.placeholder.com/img/7'),
    (0008, 'Ratu', 'Elizabeth', 'F', 'ratu@gmail.com', 'ratuchill78', '08625413678', 'a314nf35be', '2020-04-15', '2001-10-27', '088451356496', 'Jl. Bukan Jalan No. 17', 'Aku Bukan Ratu', 'www.placeholder.com/img/8'),
    (0009, 'Freddy', 'Agung', 'M', 'freddy@gmail.com', 'freddylol767', '08694521354', 'a314nf45be', '2020-09-15', '2001-10-24', '08451203154', 'Jl. Keren Abis No. 17', 'Aku Chill', 'www.placeholder.com/img/9'),
    (0010, 'Erik', 'Setia', 'M', 'erik@gmail.com', 'eriklol787', '087814562108', 'a318nf65be', '2020-10-15', '2001-03-24', '086120451397', 'Jl. Jalanan No. 27', 'Aku Upset', 'www.placeholder.com/img/10'),
    (0011, 'Verin', 'Helvani', 'F', 'verin@gmail.com', 'verincantik123', '08541321489', 'a287nf24be', '2020-10-25', '2002-12-15', '08612345987', 'Jl. Kacang Kapri No. 13', 'Aku Lebih Cantik', 'www.placeholder.com/img/11'),
    (0012, 'Gunawan', 'Endi', 'M', 'gunawan@gmail.com', 'gungokil123', '08451367814', 'a645nf25bf', '2020-12-15', '2002-05-20', '084513648972', 'Jl. Gak Hormat Blok A No.19', 'Hero For Fun', 'www.placeholder.com/img/12'),
    (0013, 'Elsa', 'Frozen', 'F', 'elsa@gmail.com', 'bukanelsa321', '08987651324', 'b204nf24be', '2020-09-28', '2002-06-21', '08123546213', 'Jl. Cinta Monyet No.3', 'Not Hero', 'www.placeholder.com/img/13'),
    (0014, 'Indah', 'Pertiwi', 'F', 'indah@gmail.com', 'indahsiapa123', '08123456780', 'a394af24be', '2019-08-12', '2003-04-25', '08784561239', 'Jl. Batu Goib No. 15', 'Monster', 'www.placeholder.com/img/14'),
    (0015, 'James', 'Kali', 'M', 'james@gmail.com', 'kalijames123', '08123045609', 'a205af24be', '2018-08-13', '2002-04-27', '08546137894', 'Jl. Batu Batuan No. 06', 'As Always', 'www.placeholder.com/img/15'),
    (0016, 'Carl', 'Bing', 'M', 'carl@gmail.com', 'bingcarl456', '087864519587', 'a279af35ba', '2019-03-17', '2001-12-27', '08651234897', 'Jl. Jalan Lurus No. 20', 'Chill AF', 'www.placeholder.com/img/16'),
    (0017, 'Sarah', 'Less', 'F', 'sarah@gmail.com', 'sarah4678', '087894510326', 'd375af37ba', '2019-10-15', '2002-09-27', '087841369510', 'Jl. Perjuangan No. 15', 'Yuk bisa yuk', 'www.placeholder.com/img/17'),
    (0018, 'Jennie', 'Blackpink', 'F', 'jennie@gmail.com', 'jenniebp78', '087894120365', 'a314af10bs', '2018-11-15', '2003-10-27', '084512369874', 'Jl. Penjajahan No. 17', 'Pasti Bisa', 'www.placeholder.com/img/18'),
    (0019, 'Johan', 'Wijaya', 'M', 'johan@gmail.com', 'johankok767', '084561953718', 'b314af55bf', '2020-12-20', '2002-10-24', '087890123654', 'Jl. Gokil No. 27', 'Just Do It', 'www.placeholder.com/img/19'),
    (0020, 'Kim', 'Bonyok', 'M', 'kim@gmail.com', 'bonyok787', '089651758384', 'c318af75bc', '2017-10-19', '2001-06-12', '089637412580', 'Jl. Warna Warni No. 38', 'Dah Lah Capek', 'www.placeholder.com/img/20');
    
INSERT INTO room
VALUES 
	(1001, 0002, 'SINGLE', 'Jl. Kehormatan Blok A No.19', 1, 1, 1, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 500000, TRUE),
    (1002, 0004, 'DOUBLE', 'Jl. Batu Tulis No. 05', 2, 1, 2, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 1000000, TRUE),
    (1003, 0006, 'TRIPLE', 'Jl. Jalan Buntu No. 16', 3, 1, 3, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 1500000, TRUE),
    (1004, 0008, 'QUAD', 'Jl. Bukan Jalan No. 17', 4, 1, 3, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 2000000, TRUE),
    (1005, 0010, 'QUAD', 'Jl. Jalanan No. 27', 4, 1, 3, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 2000000, TRUE),
    (1006, 0012, 'DOUBLE', 'Jl. Gak Hormat Blok A No.19', 2, 1, 2, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 1000000, TRUE),
    (1007, 0014, 'DOUBLE', 'Jl. Batu Goib No. 15', 2, 1, 2, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 1000000, TRUE),
    (1008, 0016, 'TRIPLE', 'Jl. Jalan Lurus No. 20', 3, 1, 3, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 1500000, TRUE),
    (1009, 0018, 'QUAD', 'Jl. Penjajahan No. 17', 4, 1, 3, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 2000000, TRUE),
    (1010, 0020, 'SINGLE', 'Jl. Warna Warni No. 38', 1, 1, 1, 1, TRUE, TRUE, TRUE, TRUE, TRUE, 500000, TRUE);
    
INSERT INTO reservation
VALUES
	(2001, 0001, 1001, '2020-10-12', '2020-10-15', 500000, 100000, 1, 'Debit', '2020-10-10'),
    (2002, 0003, 1002, '2020-10-12', '2020-10-15', 1000000, 200000, 2, 'Kredit', '2020-10-11'),
    (2003, 0005, 1003, '2020-10-12', '2020-10-15', 1500000, 300000, 2, 'Kredit', '2020-10-09'),
    (2004, 0007, 1004, '2020-10-12', '2020-10-15', 2000000, 400000, 3, 'Paypal', '2020-10-08'),
    (2005, 0009, 1005, '2020-10-15', '2020-10-18', 2000000, 400000, 2, 'Debit', '2020-10-10'),
    (2006, 0011, 1006, '2020-10-15', '2020-10-18', 1000000, 200000, 1, 'Debit', '2020-10-11'),
    (2007, 0013, 1007, '2020-10-18', '2020-10-21', 1000000, 200000, 3, 'Kredit', '2020-10-09'),
    (2008, 0015, 1008, '2020-10-15', '2020-10-18', 1500000, 300000, 2, 'Paypal', '2020-10-10'),
    (2009, 0017, 1009, '2020-10-12', '2020-10-15', 2000000, 400000, 3, 'Paypal', '2020-10-08'),
    (2010, 0019, 1010, '2020-10-18', '2020-10-21', 500000, 100000, 2, 'Debit', '2020-10-11');
    
INSERT INTO review
VALUES
	(3001, 0001, 2001, 'kamarnya bagus dan nyaman', '2020-10-15', 5),
    (3002, 0003, 2002, 'kamarnya bersih', '2020-10-15', 4),
    (3003, 0005, 2003, 'pelayanan bagus', '2020-10-15', 5),
    (3004, 0007, 2004, 'kamarnya bagus, nyaman, dan bersih', '2020-10-15', 4),
    (3005, 0009, 2005, 'kamarnya kerenn', '2020-10-15', 5),
    (3006, 0011, 2006, 'kamarnya bagus dan nyaman', '2020-10-15', 5),
    (3007, 0013, 2007, 'kamar mandinya agak sedikit kotor', '2020-10-15', 3),
    (3008, 0015, 2008, 'kamarnya bagus', '2020-10-15', 4),
    (3009, 0017, 2009, 'kamarnya bagus, pelayanan mantap', '2020-10-15', 5),
    (3010, 0019, 2010, 'kamarnya bagus, nyaman, dan murah meriah', '2020-10-15', 4);

DELIMITER $$
DROP PROCEDURE if exists search_reserv$$
CREATE PROCEDURE search_reserv( IN namaP VARCHAR(255))
BEGIN
	SELECT
		u.nama as 'Nama Customer',
		date_format(r.tanggal_reservasi, "%d %M %Y") as 'Tanggal Reservasi',
        r.harga_total as 'Total Biaya',
        ro.tipe_kamar as 'Tipe Ruangan',
        date_format(r.tanggal_awal, "%d %M %Y") as 'Tanggal Masuk',
        date_format(r.tanggal_akhir, "%d %M %Y") as 'Tanggal Keluar'
        FROM reservation as r
        INNER JOIN (SELECT
			user_id,
			CONCAT(nama_depan, ' ', COALESCE(nama_belakang, '')) as nama
			FROM user) as u ON u.user_id = r.user_id
        INNER JOIN room as ro on ro.room_id = r.room_id
        WHERE u.nama LIKE CONCAT('%', namaP, '%');
END $$

DELIMITER ;
CALL search_reserv('agus nursalim');

DELIMITER $$
DROP PROCEDURE if exists available$$
CREATE PROCEDURE available(IN tanggal DATE)
BEGIN
	SELECT
		r.*
        FROM ROOM as r
        LEFT JOIN reservation as re on re.room_id = r.room_id
        WHERE 
            IF((re.tanggal_awal <= tanggal and re.tanggal_akhir >= tanggal), 1, 0) = 0;
END $$

DELIMITER ;
call available('20201013');

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
DROP FUNCTION if exists pw$$
CREATE FUNCTION pw(nama VARCHAR(255)) RETURNS VARCHAR(255)
NOT DETERMINISTIC
BEGIN
    RETURN 
		CONCAT(
			CEIL(CURDATE()/CHAR_LENGTH('Agus')),
			FLOOR(RAND(FLOOR(CURDATE()/CHAR_LENGTH('Agus')))),
            FLOOR(rand()*(1000-500+1)+500)
		);
END $$


DELIMITER ;
#reset password user dengan user_id = 1
UPDATE `user`
SET
	password = pw(CONCAT(nama_depan, ' ', COALESCE(nama_belakang, '')))
	WHERE user_id = 1;

DELIMITER $$
DROP FUNCTION if exists chEmail$$
CREATE FUNCTION chEmail(fn VARCHAR(255), ln VARCHAR(255),domain VARCHAR(255)) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN LOWER(CONCAT( fn, COALESCE(ln,''), domain));
END $$


DELIMITER ;
SET SQL_SAFE_UPDATES=0;
UPDATE `user`
SET
	email = chEmail(nama_depan, nama_belakang, '@rocketmail.com');

SET SQL_SAFE_UPDATES=1;
SET GLOBAL log_bin_trust_function_creators = 0;

DELIMITER $$
DROP TRIGGER IF EXISTS reservCheck$$
CREATE TRIGGER reservCheck BEFORE INSERT ON reservation FOR EACH ROW
	 IF(EXISTS(SELECT 1
					FROM reservation
					WHERE(
						(((tanggal_awal <= NEW.tanggal_awal and tanggal_akhir >= NEW.tanggal_awal) OR (tanggal_awal <= NEW.tanggal_akhir and tanggal_akhir >= NEW.tanggal_akhir))
						AND
						room_id = NEW.room_id)
                        OR
                        curdate() > new.tanggal_awal
					)
		)
	)THEN 
		signal SQLSTATE '11122' SET message_text = "Ruangan Tidak Teresedia!";
	END IF;
$$

DELIMITER ;
INSERT INTO reservation
VALUES
	(2045, 0001, 1001, '2020-12-9', '2020-12-11', 500000, 100000, 1, 'Debit', '2020-10-10');

DELIMITER $$
DROP TRIGGER IF EXISTS cancelReserv$$
CREATE TRIGGER cancelReserv BEFORE DELETE ON reservation FOR EACH ROW
	IF((curdate() >= OLD.tanggal_awal AND curdate() <= OLD.tanggal_akhir) OR curdate() > OLD.tanggal_akhir)
    THEN
		signal SQLSTATE '11123' SET message_text = "Tidak Dapat membatalkan Reservasi yang sudah berjalan!";
    END IF;
$$

DELIMITER ;
DELETE FROM reservation
	WHERE reservation_id = 2045;