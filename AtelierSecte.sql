CREATE DATABASE Multinationale;
USE Multinationale;

CREATE TABLE [Address] (
	address_id INT PRIMARY KEY IDENTITY (1,1),
	street_number INT NOT NULL,
	street_name VARCHAR(200) NOT NULL,
	zipcode INT NOT NULL
	);

CREATE TABLE Succursale (
	succursale_id INT PRIMARY KEY IDENTITY (1,1),
	FK_address_id INT,
	CONSTRAINT FK_address_id FOREIGN KEY (FK_address_id) REFERENCES [Address](address_id)
	);

CREATE TABLE [Function](
	function_id INT PRIMARY KEY IDENTITY(1,1),
	[name] VARCHAR(20),
	base_salary INT NOT NULL
	);

CREATE TABLE Employee(
	employee_id INT PRIMARY KEY IDENTITY(1,1),
	[name] VARCHAR(25) NOT NULL,
	[age] INT NOT NULL,
	years_worked INT,
	FK_superior_id INT,
	FOREIGN KEY (FK_superior_id) REFERENCES Employee(employee_id),
	FK_function_id INT,
	FOREIGN KEY (FK_function_id) REFERENCES [Function](function_id),
	FK_succursale_id INT,
	FOREIGN KEY (FK_succursale_id) REFERENCES Succursale(succursale_id)
	);


INSERT INTO [Function] ([name], base_salary) VALUES ('Gourou', 20000),
													('Prêcheur', 10000),
													('Recruteur',10000),
													('Croyant', 1000),
													('Comptable', 15000)

INSERT INTO [Address] (street_number,street_name,zipcode) VALUES
(1, 'rue du Concombre', 12531),
(2, 'rue du Cornichon', 68546),
(3, 'rue du Concombre de mer', 34001),
(4, 'rue de la Courgette', 55432),
(5,'rue de la Pastèque',69121)

INSERT INTO Succursale (FK_address_id) VALUES
(1),(2),(3),(4),(5)


