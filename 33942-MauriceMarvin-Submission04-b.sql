USE company;

INSERT INTO department
VALUES ('D0001', 'Accounting', 'E0002', NULL);

INSERT INTO department
VALUES ('D0002', 'IT', 'E0004', NULL);

INSERT INTO department
VALUES ('D0003', 'Human Resource', 'E0005', NULL);

INSERT INTO department
VALUES ('D0004', 'Marketing', 'E0010', NULL);

INSERT INTO location
VALUES ('L0001', 'Grand Indonesia Lt. 9, Jalan M.H. Thamrin No 1, Jakarta Pusat', '10310', 'Jakarta');

INSERT INTO location
VALUES ('L0002', 'Pacific Place Lt. 7, Jalan Jenderal Sudirman Kav. 52-53, Jakarta Selatan', '12190', 'Jakarta');

UPDATE department
SET location_id = 'L0002'
WHERE department_id = 'D0001' OR department_id = 'D0004';

UPDATE department
SET location_id = 'L0001'
WHERE department_id = 'D0002' OR department_id = 'D0003';

INSERT INTO job
VALUES ('J0001', 'President', 10000000, 15000000);

INSERT INTO job
VALUES ('J0002', 'Accountant', 3000000, 4500000);

INSERT INTO job
VALUES ('J0003', 'Accounting Manager', 5000000, 7000000);

INSERT INTO job
VALUES ('J0004', 'IT Support', 3500000, 5000000);

INSERT INTO job
VALUES ('J0005', 'Programmer', 4000000, 5500000);

INSERT INTO job
VALUES ('J0006', 'Marketing Manager', 6000000, 8000000);

INSERT INTO job
VALUES ('J0007', 'Marketing Representative', 4500000, 5500000);

INSERT INTO job
VALUES ('J0008', 'HR Manager', 5000000, 6500000);

INSERT INTO job
VALUES ('J0009', 'HR Representative', 3500000, 4500000);

INSERT INTO employee
VALUES ('E0001', 'Hideyoshi', 'Konishita', '1975-12-24', 'Hideyoshi.kino@gmail.com', '081689231099', '2002-01-11', 5000000, 'J0004', 'D0002');

INSERT INTO employee
VALUES ('E0002', 'Sara', NULL, '1970-01-11', 'Sara@rocketmail.com', '089281849321', '2000-12-10', 5500000, 'J0003', 'D0001');

INSERT INTO employee
VALUES ('E0003', 'Kazuyoshi', NULL, '1968-02-28', 'Kazuyoshi@gmail.com', '085252778438', '1999-07-25', 4500000, 'J0009', 'D0003');

INSERT INTO employee
VALUES ('E0004', 'Shoichiro', 'Yukimura', '1967-02-01', 'Shoichiro.yuki@yahoo.com', '089928317822', '2000-04-17', 4500000, 'J0005', 'D0002');

INSERT INTO employee
VALUES ('E0005', 'Chibi', 'Usa', '1950-06-30', 'Chibi.usa@gmail.com', '081329883547', '2001-08-10', 5000000, 'J0008', 'D0003');

INSERT INTO employee
VALUES ('E0006', 'Yoshika', 'Saehara', '1977-10-21', 'Yoshika.sae@yahoo.com', '081299284628', '2005-11-28', 4500000, 'J0008', 'D0003');

INSERT INTO employee
VALUES ('E0007', 'Kagami', 'Mikage', '1970-10-08', 'Kagami.mikage@rocketmail.com', '089628371298', '2002-05-15', 12500000, 'J0001', NULL);

INSERT INTO employee
VALUES ('E0008', 'Reiko', 'Shindo', '1948-11-14', 'Reiko.shindo@live.com', '085290802938', '2002-09-01', 3500000, 'J0004', 'D0002');

INSERT INTO employee
VALUES ('E0009', 'Youko', 'Kuriki', '1970-03-19', 'Youko.kuriki@hotmail.com', '089922781924', '2007-04-8', 5500000, 'J0002', 'D0001');

INSERT INTO employee
VALUES ('E0010', 'Mana', 'Ichihashi', '1976-11-21', 'Mana.ichihashi@gmail.com', '087888291322', '2003-11-20', 6000000, 'J0006', 'D0004');

INSERT INTO employee
VALUES ('E0011', 'Kyoko', 'Aoi', '1965-09-30', 'Kyoko.aoi@gmail.com', '081290208851', '2005-05-13', 8000000, 'J0009', 'D0003');