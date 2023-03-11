CREATE TABLE Passenger(
	name VARCHAR(20) BINARY PRIMARY KEY,
    email VARCHAR(20) BINARY UNIQUE,
    balance int(20)
);   

CREATE TABLE Driver(
	name VARCHAR(20) PRIMARY KEY,
    email VARCHAR(20) UNIQUE
);    

CREATE TABLE Stadium(
	name VARCHAR(20) PRIMARY KEY,
    address VARCHAR(20),
    capacity int(20)
);

CREATE TABLE Travel(
	id VARCHAR(20) PRIMARY KEY,
    destination VARCHAR(20),
    driver_name VARCHAR(20),
    passenger_name VARCHAR(20) BINARY,
    FOREIGN KEY (destination) REFERENCES Stadium(name),
    FOREIGN KEY (driver_name) REFERENCES Driver(name),
    FOREIGN KEY (passenger_name) REFERENCES Passenger(name),
    price int(20)
);

INSERT INTO driver ( name, email )
   VALUES
   ( "ali", "ali@gmail.com"),
   ( "mammad", "mammad@gmail.com"),
   ( "reza", "reza@gmail.com"),
   ( "ahmad", "ahmad@gmail.com");

INSERT INTO passenger ( name, email, balance )
   VALUES
   ( "fazel", "fazel@gmail.com", 1000),
   ( "erfan", "erfan@gmail.com", 500),
   ( "Mahdi", "Mahdi@gmail.com", 300),
   ( "mahdi", "mahdi@gmail.com", 2500);   


INSERT INTO stadium ( name, address, capacity )
   VALUES
   ( "azadi", "tehran", 120000),
   ( "newcamp", "barcelona", 200000),
   ( "Santiago Bernabeu", "madrid", 300000);

INSERT INTO travel ( id, destination, driver_name, passenger_name, price )
   VALUES
   ( 1, "azadi", "ali", "fazel", 10),
   ( 2, "newcamp", "mammad", "erfan", 75),
   ( 3, "Santiago Bernabeu", "reza", "Mahdi", 90);

SELECT * from passenger;

SELECT * from stadium;

SET SQL_SAFE_UPDATES=0;
UPDATE stadium SET capacity = capacity - 100;

SELECT * from stadium;

SELECT * from passenger;

UPDATE passenger SET balance = balance + 300 WHERE name = ("Mahdi");

SELECT * from passenger;

UPDATE passenger SET balance = balance + 1000;

SELECT * from passenger;

 
   
   
	