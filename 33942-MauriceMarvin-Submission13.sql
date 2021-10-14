DELIMITER $$
CREATE PROCEDURE search_product( IN namaP VARCHAR(255))
BEGIN
	SELECT
		ProductName as 'Search Result'
        FROM products
        WHERE ProductName LIKE CONCAT('%', namaP, '%');
END $$

DELIMITER ;
call search_product('shelving');

DELIMITER $$
CREATE PROCEDURE search_people( IN id VARCHAR(15))
BEGIN
	SELECT
		IF(
			EmployeeID IS NULL
			,'ID Invalid! Please Try Again'
            ,CONCAT(
				'ID Found', '\n',
				'Employee ID	: ', EmployeeID, '\n',
                'Full Name		: ', CONCAT(FirstName, ' ', COALESCE(LastName, '')), '\n',
                'City			: ', City, '\n',
                'Postal Code	: ', PostalCode, '\n',
                'Phone Number	: ', PhoneNumber
            )
		) AS 'Result'
        FROM employees
        WHERE EmployeeID LIKE CONCAT('%', id, '%');
END $$

DELIMITER ;
CALL search_people('E0001');

SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
DROP FUNCTION IF EXISTS email_special $$
CREATE FUNCTION email_special( f VARCHAR(50), l VARCHAR(100)) RETURNS VARCHAR(255)
BEGIN

	RETURN LOWER(CONCAT( f, COALESCE(l,''), '@ikeamail.com'));
    
END $$

DELIMITER ;
SELECT
	CONCAT(FirstName, ' ', COALESCE(LastName,'')) as 'Full Name',
    email_special( FirstName, LastName) as 'Email'
    FROM employees;

#DROP FUNCTION IF EXISTS email_special;
#SET GLOBAL log_bin_trust_function_creators = 0;

CREATE TABLE IF NOT EXISTS product_history(
	articleid VARCHAR(11),
    productname VARCHAR(50),
    stock INT,
    stock_changes INT,
    update_date DATE);

ALTER TABLE product_history
	ADD PRIMARY KEY (articleid);

DELIMITER $$
DROP TRIGGER IF EXISTS stockCheck$$
CREATE TRIGGER stockCheck BEFORE UPDATE ON products FOR EACH ROW
	INSERT INTO product_history
		VALUES(
			OLD.ArticleID,
            OLD.ProductName,
            OLD.Stock,
            NEW.Stock-OLD.Stock,
            CURDATE()
		);
$$

DELIMITER ;
UPDATE products set stock = 40 where ArticleID = '999.322.72';

SELECT * FROM product_history;