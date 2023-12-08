CREATE SCHEMA if not exists CarDearlershipDatabase;

USE CarDearlershipDatabase;

CREATE TABLE dealerships(
dealership_id int NOT NULL auto_increment,
name varchar(50),
address varchar(50),
phone varchar(12),
primary key (dealership_id)
);

create table vehicles(
vin int NOT NUll,
year int,
make varchar(30),
model varchar(30),
vehicleType varchar(30),
color varchar(30),
odometer int NOT NULL,
price decimal (15,2) check (price > 0),
SOLD bool default false,
primary key (vin)
);

create table inventory(
inventory_id int NOT NULL auto_increment,
dealership_id int NOT NULL,
vin int NOT NULL,
primary key (inventory_id),
foreign key (dealership_id) references dealerships(dealership_id)
ON DELETE cascade on update cascade,
foreign key (vin) references vehicles(vin)
on delete cascade on update cascade
);

create table sales_contracts(
sales_contract_id int NOT NULL auto_increment,
sales_date DATE CHECK (DATE_FORMAT(sales_date, '%Y-%m-%d') = sales_date),
customerName varchar(50) NOT NUll,
customerEmail varchar(100),
vehicle_id int NOT NULL,
total_price DECIMAL(15,2) CHECK(total_price > 0),
monthlyPayment DECIMAL(15,2) CHECK(monthlyPayment > 0),
PRIMARY KEY (sales_contract_id),
FOREIGN KEY (vehicle_id) references vehicles(vin)
on delete cascade on update cascade
);
create table lease_contracts(
lease_contract_id int NOT NULL auto_increment,
lease_date DATE CHECK (DATE_FORMAT(lease_date, '%Y-%m-%d') = lease_date),
customerName varchar(50) NOT NUll,
customerEmail varchar(100),
vehicle_id int NOT NULL,
total_price DECIMAL(15,2) CHECK(total_price > 0),
monthlyPayment DECIMAL(15,2) CHECK(monthlyPayment > 0),
PRIMARY KEY (lease_contract_id),
FOREIGN KEY (vehicle_id) references vehicles(vin)
on delete cascade on update cascade
);

