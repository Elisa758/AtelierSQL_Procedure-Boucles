CREATE PROCEDURE CreateTestInfo
AS
BEGIN
INSERT INTO Employee ([name],[age], years_worked, FK_superior_id,FK_function_id,FK_succursale_id)
VALUES ('Raël',45, 30, 1, 1, 1)

DECLARE @EmployeeCounter INT =1, @NbSuccursale INT=1, @NbFunction INT =1

WHILE @EmployeeCounter<=250 AND @NbSuccursale>0 AND @NbFunction>0
BEGIN
DECLARE @superior INT
SELECT @superior = employee_id FROM Employee ORDER BY NEWID()
DECLARE @function INT
SELECT @function=function_id FROM [Function] ORDER BY NEWID()
DECLARE @succursale INT
SELECT @succursale =succursale_id FROM Succursale ORDER BY NEWID()

	INSERT INTO Employee ([name],[age], years_worked, FK_superior_id,FK_function_id,FK_succursale_id)
	VALUES (CONCAT('Skippy',@EmployeeCounter), FLOOR(RAND()*100),0, @superior, @function,@succursale);

	SET @EmployeeCounter=@EmployeeCounter+1
	
	SELECT COUNT(employee_id)
	FROM Employee
	GROUP BY FK_succursale_id
	HAVING COUNT(employee_id)<50
	SELECT @NbSuccursale = @@ROWCOUNT

	SELECT COUNT(employee_id)
	FROM Employee
	GROUP BY FK_function_id
	HAVING COUNT(employee_id)<50
	SELECT @NbFunction=@@ROWCOUNT
END
END
GO

DROP PROCEDURE IF EXISTS EmployeParAdresse
GO
CREATE PROCEDURE EmployeParAdresse
@StreetNumber INT,
@StreetName VARCHAR (200)
AS
BEGIN
RETURN (
SELECT COUNT(e.employee_id) AS EmployeeNumber
FROM Employee AS e
INNER JOIN Succursale AS s ON e.FK_succursale_id = s.succursale_id
INNER JOIN [Address] AS a ON s.FK_address_id = a.address_id
WHERE @StreetNumber = street_number AND @StreetName = street_name)
END
GO

DECLARE @EmployeeCountByAdress INT
EXECUTE @EmployeeCountByAdress = EmployeParAdresse 
@StreetNumber = 1, 
@StreetName = 'rue du Concombre'
PRINT @EmployeeCountByAdress


