DROP database CODAR;

CREATE database CODAR;


-- Use Codar Store Schema database,
use codar;


----- CREATE TABLES----------------------------------


-- create a employee table,
	create table employee(
	EmployeeID int not null,
	LastName varchar(255) default null,
	FirstName Varchar(255) default null,
	BirthDate date default null,
    Photo varchar(255) default null,
    Notes TEXT);

-- Create a Customers table,
	create table customers(
    CustomerID int not null,
    CustomerName varchar(255) default null,
    ContactName varchar(255) default null,
    Address varchar(255) default null,
    City varchar(255) default null,
    PostalCode varchar(255) default null,
    Country varchar(255) default null);
    
-- Create a Order Table,
	create table orders(
    OrderID int not null,
    CustomerID int default null,
    EmployeeID int default null,
    OrderDate date,
    ShipperID int default null);
    
    
-- create shippers table
create table shippers(
	ShipperID int not null,
    ShipperName varchar(255) default null,
    Phone varchar(255) default null);


-- create order_details table
create table order_details(
	OrderDetailID int not null,
    OrderID int default null,
    ProductID int default null,
    Quantity int default null);


-- Create a product table,
	create table products(
    ProductID int not null,
    ProductName varchar(255) default null,
    SupplierID int default null,
    CategoryID int default null,
    Unit varchar(255) default null,
    Price double default null);
    
    -- create suppliers table
create table suppliers(
	SupplierID int not null,
    SupplierName varchar(255) default null,
    ContactName varchar(255) default null,
    Address varchar(255) default null,
    City varchar(255) default null,
    PostalCode varchar(255) default null,
    Country varchar(255) default null,
    Phone varchar(255) default null);

-- create categories table
create table categories(
	CategoryID int not null,
    CategoryName varchar(255) default null,
    Description varchar(255) default null);

--- STEP 2: LOAD ALL DATA INTO TABLES -----------------
-- Impoted Data using load data wizard

insert into products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
values (77, " Original Frankfurter grüne Soße", 12, 2, "12 boxes", 13);

------- STEP 3: ADD CONSTRAINT TO ALL TABLES


-- add a primary key to employee table
alter table employee
add primary key (EmployeeID);

-- add a primary key to Categories table
alter table categories
add primary key (CategoryID);

-- add a primary key to customer table
alter table customers
add primary key (customerID);

-- add a primary key to order_details table
alter table order_details
add primary key (OrderDetailID);

-- add a primary key to orders table
alter table orders
add primary key (orderID);

-- add a primary key to products table
alter table products
add primary key (productID);

-- add a primary key to shippers table
alter table shippers
add primary key (shipperID);

-- add a primary key to suppliers table
alter table suppliers
add primary key (supplierID);


-- add foreign keys to table orders
alter table orders
add key CustomerID (CustomerID),
add key employeeID (employeeID),
add key shipperID (shipperID);




desc orders;


-- add a foreign
alter table orders
add constraint foreign key (CustomerID) references customers (CustomerID),
add constraint foreign key (EmployeeID) references employee (EmployeeID),
add constraint foreign key (ShipperID) references shippers (ShipperID);

desc orders;

-- adding an index order_details
alter table order_details
add key OrderID (OrderID),
add key ProductID (ProductID);

-- add a foreign
alter table order_details
add constraint foreign key (OrderID) references Orders (OrderID),
add constraint foreign key (ProductID) references products (ProductID);order_details

alter table products
add key SupplierID (SupplierID),
add key CategoryID (CategoryID);


alter table products
add constraint foreign key (SupplierID) references suppliers (SupplierID),
add constraint foreign key (CategoryID) references categories (CategoryID);



select *
from products


