SELECT
	CONCAT( e.FirstName, ' ', COALESCE(e.LastName, '')) as Nama,
    j.Salary
    FROM employees as e
    JOIN jobs as j on j.JobID = e.JobID
    ORDER BY e.FirstName ASC;
    
SELECT
	ShelfID
    FROM products
    group by ShelfID
    order by sum(stock) asc
    limit 3;

SELECT
	j.JobDesc as Jobs,
    count(e.EmployeeID) as "Jumlah Employee"
    FROM employees as e
    JOIN jobs as j ON j.JobID = e.JobID
    GROUP BY j.JobID;
    
SELECT 
	p.productName AS Product
	FROM products as p
	INNER JOIN ( SELECT 
					TypeID
					FROM producttype
					Where LOCATE("METOD", TypeName)!=0
				)as t on t.TypeID = p.TypeID
	UNION SELECT 
		CONCAT("Found ",count(*)," results")
		FROM products as p
		INNER JOIN (SELECT 
						TypeID
						FROM producttype
						Where LOCATE("METOD", TypeName)!=0
					)as t on t.TypeID = p.TypeID;

SELECT
	CONCAT(e.firstName, ' ', COALESCE(e.lastName,'')) as "Nama Manager"
    FROM employees as e
    JOIN jobs as j ON j.JobID = e.JobID
    WHERE j.JobDesc LIKE "Manager" AND e.DeptID IS NOT NULL;

SELECT
	r.F_OrderID as OrderID,
    f.Price AS Price
    FROM restaurant as r
	JOIN forderdetails as f on f.F_OrderID = r.F_OrderID
    WHERE MONTH(r.F_OrderDate) = 1
    GROUP BY r.F_OrderID
    UNION SELECT
		"Total" as OrderID,
        sum(f.Price) as Price
		FROM restaurant as r
		JOIN forderdetails as f on f.F_OrderID = r.F_OrderID
		WHERE MONTH(r.F_OrderDate) = 1;

SELECT
	CONCAT(e.firstName, ' ', COALESCE(e.lastName,'')) as "Nama",
    j.JobDesc as "Job",
    COUNT(o.EmployeeID) as "Work"
    FROM employees as e
    INNER join jobs as j on j.JobID = e.JobID
    INNER join orders as o on o.EmployeeID = e.EmployeeID
    GROUP BY e.EmployeeID
	UNION SELECT
		CONCAT(e.firstName, ' ', COALESCE(e.lastName,'')) as "Nama",
		j.JobDesc as "Job",
		COUNT(r.EmployeeID) as "Work"
		FROM employees as e
        INNER join jobs as j on j.JobID = e.JobID
		INNER join restaurant as r on r.EmployeeID = e.EmployeeID
        GROUP BY e.EmployeeID
        ORDER BY Work desc;

SELECT
	o.OrderID as "ID",
    o.Price as "Total Revenue"
    FROM orderdetails as o
    WHERE Price > 500000
    UNION SELECT
		f.F_OrderID as "ID",
        f.Price as "Total Revenue"
        FROM forderdetails AS f
        WHERE f.Price > 500000;

SELECT
	CONCAT(e.firstName, ' ', COALESCE(e.lastName,'')) as "Nama",
    m.NamaK as "Nama Karyaawan"
	FROM employees as e
    INNER JOIN jobs as j ON j.JobID = e.JobID
    INNER JOIN (
		SELECT
		e.ManagerID as Manager,
		GROUP_CONCAT(CONCAT(e.firstName, ' ', COALESCE(e.lastName,''))) as "NamaK"
		FROM employees as e
		INNER JOIN jobs as j ON j.JobID = e.JobID
        WHERE e.ManagerID IS NOT NULL
		GROUP BY e.ManagerID) AS m on m.Manager = e.EmployeeID;