CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_name NOT NULL,
    hire_date DATE
);
CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget NUMERIC(15, 2)
	);
CREATE TABLE Tasks (
    task_id SERIAL PRIMARY KEY,
    task_name VARCHAR(100) NOT NULL,
    project_id INTEGER REFERENCES Projects(project_id),
    employee_id INTEGER REFERENCES Employees(employee_id),
    due_date DATE,
    status VARCHAR(20) DEFAULT 'Pending'
);
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
	);
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200)
);
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INTEGER REFERENCES Customers(customer_id),
    total_amount NUMERIC(15, 2) 
);
CREATE TABLE Suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);
CREATE TABLE Shipments (
    shipment_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES Orders(order_id),
    product_id INTEGER REFERENCES Products(product_id),
    supplier_id INTEGER REFERENCES Suppliers(supplier_id),
    shipment_date DATE,
    quantity INTEGER
);
INSERT INTO Employees (first_name, last_name, email, department_name, hire_date)
VALUES ('Mehrac', 'Azerli', 'mehrac.azerli@gmail.com', 'New York', '2020-01-15');

INSERT INTO Employees (first_name, last_name, email, department_name, hire_date)
VALUES ('George', 'Bush', 'george.bush@gmail.com', 'San Francisco', '2019-05-20');

INSERT INTO Employees (first_name, last_name, email, department_name, hire_date)
VALUES ('John F', 'Kennedy', 'johnf.kennedy@gmail.com', 'Chicago', '2021-03-10');


);
INSERT INTO Projects (project_name, start_date, end_date, budget)
VALUES ('Website Redesign', '2023-01-01', '2023-06-30', 50000.00);

INSERT INTO Projects (project_name, start_date, end_date, budget)
VALUES ('Mobile App Development', '2023-02-15', '2023-09-30', 80000.00);

INSERT INTO Projects (project_name, start_date, end_date, budget)
VALUES ('ERP Implementation', '2023-04-01', '2024-03-31', 120000.00);
);
INSERT INTO Tasks (task_name, project_id, employee_id, due_date, status)
VALUES ('Design UI', 1, 1, '2023-02-28', 'Pending');

INSERT INTO Tasks (task_name, project_id, employee_id, due_date, status)
VALUES ('Backend Development', 2, 2, '2023-06-30', 'In Progress');

INSERT INTO Tasks (task_name, project_id, employee_id, due_date, status)
VALUES ('Testing', 3, 3, '2024-03-15', 'Pending');


);
INSERT INTO Departments (department_name, location)
VALUES ('IT', 'New York');

INSERT INTO Departments (department_name, location)
VALUES ('Finance', 'Chicago');

INSERT INTO Departments (department_name, location)
VALUES ('Marketing', 'San Francisco');


INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES ('Donald', 'Trump', 'donald.trump@gmail.com', '555-1234', '123 Main St, Anytown');

INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES ('Kanye', 'West', 'kanye.west@gmail.com', '555-5678', '456 Elm St, Other Town');

INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES ('Ahmet', 'Sonuc', 'ahmet.sonuc@gmail.com', '555-9876', '789 Oak St, Smalltown');


INSERT INTO Orders (order_date, customer_id, total_amount)
VALUES ('2023-03-10', 1, 150.00);

INSERT INTO Orders (order_date, customer_id, total_amount)
VALUES ('2023-04-05', 2, 250.00);

INSERT INTO Orders (order_date, customer_id, total_amount)
VALUES ('2023-05-20', 3, 180.00);

CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL,
    units_in_stock INTEGER DEFAULT 0
);
INSERT INTO Products (product_name, unit_price, units_in_stock)
VALUES ('Laptop', 1200.00, 50);

INSERT INTO Products (product_name, unit_price, units_in_stock)
VALUES ('Smartphone', 800.00, 100);

INSERT INTO Products (product_name, unit_price, units_in_stock)
VALUES ('Tablet', 500.00, 75);



INSERT INTO Suppliers (supplier_name, contact_name, city, country)
VALUES ('TechGadgets Inc.', 'Koroglu', 'New York', 'USA');

INSERT INTO Suppliers (supplier_name, contact_name, city, country)
VALUES ('MobilePlus Ltd.', 'Dede Qorqud', 'San Francisco', 'USA');

INSERT INTO Suppliers (supplier_name, contact_name, city, country)
VALUES ('TechSupplies Co.', 'Qachaq Nabi', 'Chicago', 'USA');


INSERT INTO Shipments (order_id, product_id, supplier_id, shipment_date, quantity)
VALUES (1, 1, 1, '2023-03-15', 10);

INSERT INTO Shipments (order_id, product_id, supplier_id, shipment_date, quantity)
VALUES (2, 2, 2, '2023-04-10', 20);

INSERT INTO Shipments (order_id, product_id, supplier_id, shipment_date, quantity)
VALUES (3, 3, 3, '2023-05-25', 15);


SELECT DISTINCT department_id FROM Employees;


SELECT * FROM Employees WHERE first_name LIKE 'J%';


SELECT first_name AS name, 'Employee' AS type
FROM Employees
UNION
SELECT department_name AS name, 'Department' AS type
FROM Departments;


SELECT first_name AS name, 'Employee' AS type
FROM Employees
UNION ALL
SELECT department_name AS name, 'Department' AS type
FROM Departments;


SELECT *
FROM Employees
LIMIT 2;


SELECT department_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department_id
HAVING AVG(salary) > 5000;


SELECT *
FROM Employees
WHERE salary > 5000;

	
SELECT *
FROM Employees
WHERE salary > 5000;

	
SELECT e.*, d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;


