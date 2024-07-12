create database salesdb;
use salesdb;

create table productlines
(
productLine varchar(50) primary key,
textDescription varchar(4000),
htmlDescription mediumtext,
image mediumblob
);
insert into productlines(productLine, textDescription)
values ('Classic Cars', 'Cars from the 1950s and 1960s'),
('Motorcycles', 'A range of motorcycles');

create table products
(
productCode varchar(15) primary key,
productName varchar(70) not null,
productLine varchar(50),
productScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock smallint not null,
buyPrice decimal(10,2) not null,
MSRP decimal(10,2) not null,
constraint fp foreign key (productLine) references productlines(productLine)
);

insert into products
values ('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 'This replica features working kickstand, front suspension, gear-shift lever.', 7933, 48.81, 95.70);

create table orderdetails
(
orderNumber int,
productCode varchar(15),
quantityOrdered int not null,
priceEach DECIMAL(10, 2) not null,
orderLineNumber SMALLINT NOT NULL,
primary key(orderNumber, productCode),
constraint fs foreign key (orderNumber) references orders(orderNumber),
constraint fa foreign key (productCode) references products(productCode)
);

create table orders
(
orderNumber INT PRIMARY KEY,
orderDate DATE NOT NULL,
requiredDate DATE NOT NULL,
shippedDate date,
status1 VARCHAR(15) NOT NULL,
comments text,
customerNumber int
);

create table employees
(
employeeNumber INT PRIMARY KEY,
lastName VARCHAR(50) NOT NULL,
firstName VARCHAR(50) NOT NULL,
extension VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL,
officeCode VARCHAR(10),
reportsTo int,
jobTitle VARCHAR(50) NOT NULL,
constraint fd foreign key (reportsTo) references employees(employeeNumber)
);

create table office
(
officeCode VARCHAR(10) PRIMARY KEY,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50) NOT NULL,
postalCode VARCHAR(15) NOT NULL,
territory VARCHAR(10) NOT NULL
);
ALTER TABLE employees
ADD CONSTRAINT ff
FOREIGN KEY (officeCode)
REFERENCES office(officeCode);

create table customers
(
customerNumber INT PRIMARY KEY,
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalCode VARCHAR(15),
country VARCHAR(50) NOT NULL,
salesRepEmployeeNumber int,
creditLimit DECIMAL(10, 2),
constraint fg foreign key (salesRepEmployeeNumber) references employees(employeeNumber)
);

create table payments
(
customerNumber int,
checkNumber VARCHAR(50) PRIMARY KEY,
paymentDate DATE NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
constraint fh foreign key (customerNumber) references customers(customerNumber)
);











