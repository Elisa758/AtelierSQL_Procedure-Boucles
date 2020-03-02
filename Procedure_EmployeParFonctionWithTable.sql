DROP PROCEDURE IF EXISTS EmployeParFonctionWithTable
GO

CREATE PROCEDURE EmployeParFonctionWithTable
@FunctionName VARCHAR (200)
AS
BEGIN
DECLARE @t table(nbEmployee INT, succursale INT)

INSERT INTO @t (nbEmployee, succursale)
SELECT COUNT(e.employee_id) AS EmployeeNumber, s.succursale_id
FROM Employee AS e
INNER JOIN Succursale AS s ON e.FK_succursale_id = s.succursale_id
INNER JOIN [Function] AS f ON f.function_id = e.FK_function_id
WHERE @FunctionName = f.name
GROUP BY s.succursale_id

select * from @t
END
GO

DECLARE @t table(nbEmployee INT, succursale INT)
insert @t exec EmployeParFonctionWithTable 'Gourou'

SELECT * from @t WHERE succursale = 1
/*
DECLARE @EmployeeCountByFuction INT
EXECUTE @EmployeeCountByFuction = EmployeParFonction
@FunctionName = 'Gourou'
PRINT @EmployeeCountByFuction
*/