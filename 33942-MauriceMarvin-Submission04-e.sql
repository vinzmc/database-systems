CREATE SCHEMA IF NOT EXISTS `company` ;
USE company;

CREATE TABLE job(
job_id VARCHAR(5) NOT NULL,
job_title VARCHAR(30) NOT NULL,
min_salary INT UNSIGNED NOT NULL,
max_salary INT UNSIGNED NOT NULL,
PRIMARY KEY(job_id));

CREATE TABLE location(
location_id VARCHAR(5) NOT NULL,
address VARCHAR(100) NOT NULL,
postal_code INT NOT NULL,
city VARCHAR(20) NOT NULL,
PRIMARY KEY(location_id));

CREATE TABLE department(
department_id VARCHAR(5) NOT NULL,
department_name VARCHAR(30) NOT NULL,
manager_id VARCHAR(5) NULL,
location_id VARCHAR(5) NULL,
FOREIGN KEY(location_id) REFERENCES location(location_id) ON DELETE SET NULL,
PRIMARY KEY(department_id));

CREATE TABLE employee(
employee_id VARCHAR(5) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NULL,
birth_date DATE NULL,
email VARCHAR(60) NULL,
phone_number VARCHAR(20) NOT NULL,
hire_date DATE NOT NULL,
salary INT UNSIGNED NULL,
job_id VARCHAR(5) NULL,
department_id VARCHAR(5) NULL,
FOREIGN KEY(job_id) REFERENCES job(job_id) ON DELETE SET NULL,
FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE SET NULL,
PRIMARY KEY(employee_id));

ALTER TABLE department
ADD FOREIGN KEY(manager_id)
REFERENCES employee(employee_id)
ON DELETE SET NULL;
