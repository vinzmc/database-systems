DELIMITER $$
CREATE PROCEDURE ediskon ( IN diskon FLOAT)
BEGIN
    SELECT 
		ProductName as 'Product Name',
		Price*diskon as 'Harga Setelah Diskon'
        from products
        order by price asc
        limit 10;
END $$

DELIMITER ;
CALL ediskon(0.5);

DELIMITER $$
CREATE PROCEDURE counting (IN str VARCHAR(255))
BEGIN
    DECLARE output INT Default 1;
    DECLARE i INT;
    SET i = 1;
    
    WHILE(i!=0)
    DO
		SET i=locate(' ', str, i+1);
        IF(i!=0) THEN
			SET output = output+1;
		END IF;
    END WHILE;
    SELECT output as 'Total Kata';
END $$

DELIMITER ;
CALL counting('jumlaah kata dalam string ini adalah 7');

DELIMITER $$
CREATE PROCEDURE primecheck (IN num INT)
BEGIN
    DECLARE output VARCHAR(15) DEFAULT 'Prime';
    DECLARE i INT DEFAULT 2;
    DECLARE lim INT;
    SET lim = sqrt(num);
    
    primeloop : WHILE(i<=lim)
    DO
        IF(num%i=0) THEN
			SET output = 'Not Prime';
            LEAVE primeloop;
		END IF;
        SET i = i+1;
    END WHILE;
    SELECT output as 'jawaban';
END $$

DELIMITER ;
CALL primecheck(10);

DELIMITER $$
CREATE PROCEDURE box (IN x int, y int)
BEGIN
    DECLARE output VARCHAR(2550) DEFAULT '';
    DECLARE i INT;
    DECLARE j INT;
    DECLARE n INT;
    
    SET n = x*y;

	SET j=1;
	xloop : WHILE(j<=n)
	DO
		SET i=1;
		yloop : WHILE(i<=n)
		DO
			IF((i = 1 OR i%y=0) AND(j=1 OR j%y=0)) THEN
				SET output = CONCAT(output,'+');
			ELSEIF(j=1 OR j%y=0) THEN
				SET output = concat(output,'-');
			ELSEIF(i=1 OR i%y=0) THEN
				SET output = CONCAT(output,'|');
			ELSE
				SET output = concat(output,' ');
			END IF;
			SET i = i+1;
		END WHILE;
		SET j=j+1;
		SET output = concat(output,'\n');
	END WHILE;
        
    SELECT output as 'jawaban';
END $$

DELIMITER ;
CALL box(3,5);