SELECT
	concat(e.FirstName,' ', coalesce(e.LastName,'')) 'Name',
    d.DeptName as 'Department'
	FROM employeeS as e
    INNER JOIN depts as d ON d.DeptID = e.DeptID
    ORDER BY d.DeptName ASC, `Name` ASC;
    
SELECT
	concat(e.FirstName,' ', coalesce(e.LastName,'')) 'Name',
    m.Manager as Manager
	FROM employees as e
    INNER JOIN (
			SELECT
			EmployeeID,
			concat(FirstName,' ', coalesce(LastName,'')) 'Manager'
			FROM employees
			WHERE ManagerID IS NULL
	) AS m ON m.EmployeeID = e.ManagerID
    ORDER BY m.Manager ASC, `Name` ASC;

SELECT
	concat(e.FirstName,' ', coalesce(e.LastName,'')) 'Name',
    group_concat(OrderID
		ORDER BY OrderID
		separator ' - ') as 'Order'
	FROM employeeS as e
    INNER JOIN orders as o ON o.EmployeeID = e.EmployeeID
    GROUP BY `Name`
    ORDER BY  `Name` ASC;

SELECT
	p.ProductName as 'Product Name',
    o.Qty as 'Total Sold'
    FROM products as p
    INNER JOIN orderdetails as o ON o.ArticleID = p.ArticleID
    ORDER BY `Total Sold` DESC, `Product Name` ASC;

SELECT
	p.ProductName as 'Product Name',
    ifnull(O.Qty, 0) as 'Total Sold'
    FROM products as p
    LEFT JOIN orderdetails as o ON o.ArticleID = p.ArticleID
    ORDER BY `Total Sold` DESC, `Product Name` ASC;

SELECT
	od.OrderID as 'Order ID',
    sum(od.Price) as 'Total Price',
    CONCAT(e.FirstName,' ', COALESCE(e.LastName, '')) as 'Name'
    FROM orderdetails as od
    INNER JOIN orders as o ON o.OrderID = od.OrderID
    INNER JOIN employees as e ON e.EmployeeID = o.EmployeeID
    GROUP BY `Order ID`
    ORDER BY `Name` ASC;

SELECT
	tab.`Name`,
    j.Salary0.05 as 'Bonus'
    FROM (SELECT
		od.OrderID as 'Order ID',
		sum(od.Price)0.12 as 'TotalP',
		CONCAT(e.FirstName,' ', COALESCE(e.LastName, '')) as 'Name',
        e.JobID as 'JobID'
		FROM orderdetails as od
		INNER JOIN orders as o ON o.OrderID = od.OrderID
		INNER JOIN employees as e ON e.EmployeeID = o.EmployeeID
		GROUP BY `Order ID`) as tab
	INNER JOIN jobs as j ON j.JobID = tab.JobID
    WHERE tab.TotalP  500000
    ORDER BY `Name` ASC;

SELECT
	CONCAT(
		`Name`,
        lpad('', 20-Length(`Name`),' '),
		`Desc`,
        lpad('', 60-Length(`Desc`),' '),
		`Dept`
	) as 'Employee Information'
    FROM (SELECT
		CONCAT(e.FirstName,' ', COALESCE(e.LastName, '')) as 'Name',
		CONCAT('work ', IF(j.JobDesc = 'IT','as an ', IF(j.JobDesc='Restaurant (IKEA FOOD)', 'in a ', 'as a ')), j.JobDesc) as 'Desc',
		CONCAT('in ', d.DeptName, ' Department') as 'Dept'
		FROM employees as e
		INNER JOIN jobs as j on j.JobID = e.JobID
		INNER JOIN depts as d on d.DeptID = e.DeptID
	) as tab;

SET SQL_SAFE_UPDATES = 0;
set autocommit =0;
START TRANSACTION;

UPDATE jobs
	SET Salary =0;

SAVEPOINT ikea_gaji_nol;

UPDATE employees
	set FirstName ='Tommy';

ROLLBACK TO ikea_gaji_nol;

ROLLBACK;