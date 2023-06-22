
-- Solaj Store Database

-- drop solaj database if it already exist
drop database if exists solaj_store;

--  create solaj database
create database if not exists solaj_store;

-- use solaj database
use solaj_store;


-- ------- STEP 1: CREATE ALL TABLES -------------------------------

-- create a employee table
create table employees (
	EmployeeID int not null auto_increment primary key,
    LastName varchar(255) default null,
    FirstName varchar(255) default null,
    BirthDate date default null,
    Photo varchar(255) default null,
    Notes text
);

-- create a customer table
create table customers(
	CustomerID int not null auto_increment primary key,
    CustomerName varchar(255) default null,
    ContactName varchar(255) default null,
    Address varchar(255) default null,
    City varchar(255) default null,
    PostalCode varchar(255) default null,
    Country varchar(255) default null
);

-- create shippers table
create table shippers(
	ShipperID int not null auto_increment primary key,
    ShipperName varchar(255) default null,
    Phone varchar(255) default null
);


-- create categories table
create table categories(
	CategoryID int not null auto_increment primary key,
    CategoryName varchar(255) default null,
    Description varchar(255) default null
);

-- create suppliers table
create table suppliers(
	SupplierID int not null auto_increment primary key,
    SupplierName varchar(255) default null,
    ContactName varchar(255) default null,
    Address varchar(255) default null,
    City varchar(255) default null,
    PostalCode varchar(255) default null,
    Country varchar(255) default null,
    Phone varchar(255) default null
);



-- create a orders table
create table orders(
	OrderID int not null auto_increment primary key,
    CustomerID int default null,
    EmployeeID int default null,
    OrderDate date default null,
    ShipperID int default null,
    
    constraint foreign key (CustomerID) references customers (customerID),
    constraint foreign key (EmployeeID) references employees (EmployeeID),
    constraint foreign key (ShipperID) references shippers (ShipperID)
);


-- create products table
create table products(
	ProductID int not null auto_increment primary key,
    ProductName varchar(255) default null,
    SupplierID int default null,
    CategoryID int default null,
    Units varchar(255) default null,
    Price double default null,
    
	constraint foreign key (SupplierID) references suppliers (supplierID),
    constraint foreign key (CategoryID) references categories (CategoryID)
);

-- create order_details table
create table order_details(
	OrderDetailID int not null auto_increment primary key,
    OrderID int default null,
    ProductID int default null,
    Quantity int default null,
    
    constraint foreign key (OrderID) references Orders (OrderID),
    constraint foreign key (ProductID) references products (ProductID)
);


-- ------- STEP 2: LOAD ALL DATA INTO TABLES -------------------------------
-- Imported Data Using Load Data Wizard
