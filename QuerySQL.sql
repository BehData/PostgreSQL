-------------------------------------------------
-----Capacitación POSTGRESQL BÁSICO - PROYECTOS
-----------16 de septiembre de 2023---------------
--------------------------------------------------

--Sentencia DML - SELECT:

--MOSTRAR TODAS LAS TABLAS DE LA BASE DE DATOS [AdventureWorks]
--En SQL Server: SELECT * FROM sys.tables

SELECT * FROM information_schema.tables;

--MOSTRAR LA TABLA 
--En SQL Server: igual

SELECT * FROM Person.Address;
SELECT city FROM Person.Address;
SELECT city, postalcode FROM Person.Address;

--MOSTRAR LOS CAMPOS(AddressID,AddressLine1,City) DE LA TABLA Address
--En SQL Server: igual

SELECT AddressID,
		AddressLine1,
		City
FROM Person.Address;

--Sentencia WHERE para realizar filtros
--MOSTRAR LOS CAMPOS(AddressID,AddressLine1,City) DE LA TABLA Address pero con el WHERE Y CON EL OPERADOR =
--SELECT + WHERE
--En SQL Server: igual

SELECT AddressID,
		AddressLine1,
		City 
FROM Person.Address
WHERE City='Miami';


--Operadores de Comparación (=, <>, <, >)

--SELECT + WHERE + <> + < + > 
--NOS MUESTRA LA CONSULTA QUE SEAN LOS ID MAYORES A 910
--En SQL Server: igual

SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE AddressID > 910;

SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE AddressID <> 910;


SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE city = 'Miami';



--Operador LIKE - permite filtrar la información de formato cadenas o texto (% y _); not like

SELECT * FROM Person.Person
WHERE FirstName LIKE 'C%';


SELECT * FROM Person.Person
WHERE FirstName LIKE '%na%';


SELECT * FROM Person.Person
WHERE BusinessEntityID LIKE '11%';


SELECT * FROM Person.Person
WHERE FirstName LIKE '__a%';


SELECT * FROM Person.Person
WHERE FirstName LIKE 'A__';

SELECT * FROM Person.Person
WHERE FirstName NOT LIKE 'A__';


--Operadores lógicos (AND y OR)


--SELECT + WHERE + AND
--En SQL Server: igual

SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE City='Miami' AND AddressLine1='1 Corporate Center Drive';


--SELECT + WHERE + OR
--En SQL Server: igual

SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE City='Miami' OR City='Paris';


--Operador de intervalos BETWEEN

SELECT * FROM Person.PersonPhone
WHERE ModifiedDate BETWEEN '01-01-2013' AND '30-05-2013';

SELECT * FROM Person.PersonPhone
WHERE PhoneNumberTypeID BETWEEN 3 AND 5;

SELECT * FROM Person.PersonPhone
WHERE BusinessEntityId BETWEEN 10 AND 30;


--Operador IN
--SELECT + WHERE + IN
--En SQL Server: igual
--TEXTO
SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE City IN('Miami','Paris');

--NUMERO ENTEROS
SELECT * FROM Production.Product
WHERE PRODUCTID IN(992,998,1050);

--FECHAS
SELECT * FROM Production.Product
WHERE SellStartDate IN ('30-05-2013','20-08-2012','11-11-2011');

SELECT * FROM Production.Product
WHERE SellStartDate IN ('2013-05-30');


--Operador de negación (NOT)
SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE City NOT IN('Miami','Paris');

--Operador para obtener valores desconocidos (NULL)
SELECT * FROM Person.Person
WHERE MiddleName IS NULL;

SELECT * FROM HumanResources.Employee
WHERE Gender IS NULL;



--Comando DISTINCT. Para evitar redundancia

SELECT FirstName FROM Person.Person
ORDER BY 1 ASC;

SELECT DISTINCT FirstName FROM Person.Person
ORDER BY 1 ASC;


--Comando Order By

--ORDER BY 1 ASC--ORDERNAR ASCEDENTE
SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE AddressID > 910
ORDER BY 1 ASC;

--ORDER BY AddressID ASC--ORDERNAR ASCEDENTE

SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE AddressID > 910
ORDER BY AddressID ASC;

--ORDER BY 1 DESC--ORDERNAR DESCENDENTE

SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE AddressID > 910
ORDER BY 1 DESC;


--ORDER BY AddressID ASC;--ORDERNAR ASCEDENTE
SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE AddressID > 910
ORDER BY AddressID ASC
LIMIT 10;

--Comando LIMIT
--MOSTRAR LOS PRIMEROS 19 REGISTROS DE LA TABLA Address
--En SQL server: SELECT TOP 19 * FROM Person.Address

SELECT * FROM Person.Address LIMIT 100;

SELECT AddressID
	  ,AddressLine1
	  ,City 
FROM Person.Address
WHERE AddressID > 910
ORDER BY AddressID ASC
LIMIT 5;

--Comando AS
SELECT * FROM Person.Person

SELECT FirstName AS Nombre FROM Person.Person


--FUNCIONES DE AGREGADO 

--USE FUNCION SUM
SELECT 1+1 AS SUMA

--USO FUNCION COUNT
SELECT * FROM Person.sales

SELECT COUNT(*) TOTALFILAS
FROM Sales.SalesOrderDetail

SELECT COUNT(*) AS TotalCarrierTrackingNumber
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber IS NULL

SELECT COUNT(*) AS TotalNorthwest
FROM Sales.SalesTerritory
WHERE Name='Northwest'



GROUP BY
SELECT * FROM HumanResources.Employee

SELECT COUNT (*) FROM HumanResources.Employee
GROUP BY MaritalStatus

SELECT COUNT (*) FROM HumanResources.Employee
GROUP BY Gender


HAVING

SELECT COUNT (*), SUM (VacationHours) FROM HumanResources.Employee
GROUP BY Gender
HAVING SUM (VacationHours) > 40


JOIN

SELECT asset.SickLeaveHours, asset.MaritalStatus, pay.Rate
FROM humanresources.Employee as asset
JOIN humanresources.EmployeePayHistory as pay
    	ON pay.businessentityid = asset.businessentityid
WHERE asset.SickLeaveHours > 10
ORDER BY pay.Rate ASC;


SELECT asset.SickLeaveHours, asset.MaritalStatus, pay.rate
FROM humanresources.Employee as asset
JOIN humanresources.EmployeePayHistory as pay
    	ON pay.businessentityid = asset.businessentityid
WHERE asset.SickLeaveHours > (
	SELECT AVG(SickLeaveHours)
	FROM humanresources.Employee;



LEFT & OUTER
	
SELECT *
FROM person.Person as contact
FULL JOIN HumanResources.Employee as employee
ON contact.businessentityid = employee.businessentityid
WHERE contact.businessentityid IS NULL or employee.businessentityid IS NULL


	







