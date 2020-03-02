DROP PROCEDURE IF EXISTS EmployeParFonction
GO

CREATE PROCEDURE EmployeParFonction
@FunctionName VARCHAR (200)
AS
BEGIN
SELECT COUNT(e.employee_id) AS EmployeeNumber, s.succursale_id
FROM Employee AS e
INNER JOIN Succursale AS s ON e.FK_succursale_id = s.succursale_id
INNER JOIN [Function] AS f ON f.function_id = e.FK_function_id
WHERE @FunctionName = f.name
GROUP BY s.succursale_id
END
GO

DECLARE @EmployeeCountByFuction INT
EXECUTE @EmployeeCountByFuction = EmployeParFonction
@FunctionName = 'Gourou'
PRINT @EmployeeCountByFuction