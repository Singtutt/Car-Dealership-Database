# MySQL Project: car_dealership #

CREATE DATABASE IF NOT EXISTS car_dealership;

-- DROP DATABASE IF EXISTS car_dealership;

USE car_dealership;

CREATE TABLE dealerships (
    DealershipID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    Phone VARCHAR(12)
);

CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Price DECIMAL(10 , 2 ),
    Sold BOOLEAN DEFAULT false
);

CREATE TABLE inventory (
    DealershipID INT,
    VIN VARCHAR(17),
    FOREIGN KEY (DealershipID)
        REFERENCES dealerships (DealershipID),
    FOREIGN KEY (VIN)
        REFERENCES vehicles (VIN)
);

CREATE TABLE sales_contracts (
    ContractID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    DealerID INT,
    VIN VARCHAR(17),
    FOREIGN KEY (VIN)
        REFERENCES vehicles (VIN)
);

CREATE TABLE lease_contracts (
	LeaseID INT AUTO_INCREMENT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE,
    DealerID INT,
    VIN VARCHAR(17),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES('Dealership 1', '123 Abc Ln', '123-456-789');
INSERT INTO dealerships (name, address, phone) VALUES('Dealership 2', '456 Def Ct', '123-789-1011');
INSERT INTO dealerships (name, address, phone) VALUES('Dealership 3', '789 Ghi Rd', '456-789-1011');
INSERT INTO dealerships (name, address, phone) VALUES('Dealership 4', '1011 Jkl Ln', '789-101-1121');

INSERT INTO vehicles (VIN, Make, Model, Year, Price, Sold) VALUES('12345678912345678', 'Nissan', 'Altima', 2020, 20000.00, false);
INSERT INTO vehicles (VIN, Make, Model, Year, Price, Sold) VALUES('12345678901234567', 'Ford', 'Mustang', 2017, 25000.00, false);
INSERT INTO vehicles (VIN, Make, Model, Year, Price, Sold) VALUES('12345678998765432', 'Chevrolet', 'Cruze', 2016, 12500.00, false);
INSERT INTO vehicles (VIN, Make, Model, Year, Price, Sold) VALUES('12345678909876543', 'Honda', 'Accord', 2019, 18500.00, false);

INSERT INTO inventory (DealershipID, VIN) VALUES(3, '12345678912345678');
INSERT INTO inventory (DealershipID, VIN) VALUES(2, '12345678901234567');
INSERT INTO inventory (DealershipID, VIN) VALUES(1, '12345678998765432');
INSERT INTO inventory (DealershipID, VIN) VALUES(4, '12345678909876543');

INSERT INTO sales_contracts (Date, DealerID, VIN) VALUES('2023-01-01', 3, '12345678912345678');
INSERT INTO sales_contracts (Date, DealerID, VIN) VALUES('2023-02-15', 2, '12345678901234567');
INSERT INTO sales_contracts (Date, DealerID, VIN) VALUES('2023-05-16', 1, '12345678998765432');
INSERT INTO sales_contracts (Date, DealerID, VIN) VALUES('2023-04-10', 4, '12345678909876543');

INSERT INTO lease_contracts (StartDate, EndDate, DealerID, VIN) VALUES('2023-01-01','2024-01-01','3','12345678912345678');
INSERT INTO lease_contracts (StartDate, EndDate, DealerID, VIN) VALUES('2023-02-15','2024-02-15','2','12345678901234567');
INSERT INTO lease_contracts (StartDate, EndDate, DealerID, VIN) VALUES('2023-05-16','2024-05-16','1','12345678998765432');
INSERT INTO lease_contracts (StartDate, EndDate, DealerID, VIN) VALUES('2023-04-10','2024-04-10','4','12345678909876543');