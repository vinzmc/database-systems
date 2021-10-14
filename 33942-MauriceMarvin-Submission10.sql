CREATE VIEW service_and_total as
SELECT
	o.OrderID as 'Order ID',
    date_format(o.OrderDate, "%d %M %Y") as 'Date',
    s.ServiceDesc as 'Service Type',
    s.Price as 'Service',
    oder.Total + s.Price as "Total"
    FROM orders as o
    INNER JOIN servicedetails as sd on sd.OrderID = o.OrderID
    INNER JOIN services as s on s.ServiceID = s.ServiceID
    INNER JOIN 
		(SELECT
        OrderID,
		sum(Price) as "Total"
		from orderdetails
		group by OrderID) as oder on oder.OrderID = o.OrderID
    group by o.OrderID
    order by o.OrderID;

CREATE VIEW sales_by_year_month AS	
SELECT
		Year(o.OrderDate) as "Year",
		Monthname(o.OrderDate) as "Month",
		count(o.OrderID) as "Jumlah Transaksi",
        sum(od.Price) as "Sales"
		FROM orders as o
        INNER JOIN orderdetails as od on od.OrderID = o.OrderID
		Group By `Month`;

CREATE VIEW employees_salary AS	
SELECT
	e.EmployeeID as "ID",
    CONCAT(e.FirstName,' ', COALESCE(e.LastName,'')) as 'Full Name',
    j.JobDesc as "Jobs",
    j.Salary as "Salary"
    FROM employees as e
    INNER JOIN jobs as j ON j.JobID = e.JobID
    ORDER BY `Full Name`;

CREATE VIEW food_sales AS
SELECT
	r.F_OrderID as 'ID',
    r.F_OrderDate as 'Date',
    CONCAT(e.FirstName,' ', COALESCE(e.LastName,'')) as 'Employee Name',
    p.ProductName as 'Order Food',
    p.Price as 'Price',
    f.Qty as 'Quantity',
    f.Price as 'Total'
    FROM restaurant as r
    INNER JOIN forderdetails as f on f.F_OrderID = r.F_OrderID
    INNER JOIN products as p on p.ArticleID = f.ArticleID
    INNER JOIN employees as e on e.EmployeeID = r.EmployeeID;

CREATE USER 'Aldwin'@'localhost' IDENTIFIED BY 'aldsetiawan';
CREATE USER 'Hansen'@'localhost' IDENTIFIED BY 'hnsedrick';
CREATE USER 'Reza'@'localhost' IDENTIFIED BY 'rzasatyaawijaya';
CREATE USER 'Sintya'@'localhost' IDENTIFIED BY 'styoktaviani';

GRANT SELECT ON ikea.sales_by_year_month TO 'Aldwin'@'localhost';
GRANT SELECT ON ikea.food_sales TO 'Aldwin'@'localhost';
GRANT SELECT ON ikea.employees_salary TO 'Hansen'@'localhost';
GRANT SELECT ON ikea.service_and_total TO 'Reza'@'localhost';

SELECT 
	`Year`,
    sum(`Jumlah Transaksi`) as 'Total Transaksi',
    sum(Sales) as 'Pendapatan Bruto'
	FROM sales_by_year_month
    GROUP BY `Year`;

SELECT 
	`Order Food` as 'Food',
    sum(`Total`) as 'Sales'
	FROM food_sales
    GROUP BY `Food`;

SELECT 
	`Full Name` as 'Employee Name',
    Jobs as 'Job',
    Salary
	FROM employees_salary
    ORDER BY Salary desc, `Full Name` ASC
    LIMIT 4;

SELECT
	sum(Total) as 'Total Pendapatan dari Delivery Service'
	FROM service_and_total;

	drop user "Aldwin"@"localhost";
    drop user "Hansen"@"localhost";
    drop user "Reza"@"localhost";
    drop user "Sintya"@"localhost";
    
	drop view service_and_total;
    drop view sales_by_year_month;
    drop view employees_sales;
    drop view food_sales;