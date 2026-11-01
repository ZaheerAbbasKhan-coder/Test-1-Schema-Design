CREATE DATABASE company_training;
USE company_training;

CREATE TABLE departments (
    department_id INT NOT NULL,
    dept_name VARCHAR(80) NOT NULL,
    city VARCHAR(60)
);

CREATE TABLE employees (
    employee_id INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(120),
    department_id INT NOT NULL,
    salary DECIMAL(10,2),
    status VARCHAR(20)
);


ALTER TABLE departments
ADD CONSTRAINT pk_departments PRIMARY KEY (department_id);

ALTER TABLE employees
ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);

ALTER TABLE departments
ADD COLUMN location VARCHAR(100);

ALTER TABLE departments
RENAME COLUMN dept_name TO department_name;

SELECT * FROM employees WHERE salary IS NULL;

ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;

ALTER TABLE employees
ALTER COLUMN status SET DEFAULT 'Active';


ALTER TABLE employees
ADD CONSTRAINT uq_employees_email UNIQUE (email);

RENAME TABLE employees TO staff;

ALTER TABLE staff
ADD CONSTRAINT fk_staff_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE staff
DROP INDEX uq_employees_email;

ALTER TABLE staff
DROP FOREIGN KEY fk_staff_department;

ALTER TABLE staff
DROP PRIMARY KEY;

ALTER TABLE staff
ADD CONSTRAINT pk_staff PRIMARY KEY (employee_id);

ALTER TABLE departments
DROP COLUMN location;

CREATE DATABASE company_management;

RENAME TABLE
company_training.departments
TO company_management.departments,
company_training.staff
TO company_management.staff;

DROP DATABASE company_training;

USE company_management;

SHOW TABLES;

DESCRIBE departments;

DESCRIBE staff;

SHOW CREATE TABLE departments;

SHOW CREATE TABLE staff;