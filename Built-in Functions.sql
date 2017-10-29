-- Home Work --

--Problem 1
--Find names of all employees by first name

SELECT e.FirstName, e.LastName
  FROM Employees AS e
 WHERE e.FirstName LIKE 'SA%'

-- Problem 2
-- Find Names of All Employees by Last Name

SELECT e.FirstName, e.LastName
FROM Employees AS e
WHERE e.LastName LIKE '%ei%'

-- Problem 03. Find First Names of All Employess

SELECT e.FirstName
FROM Employees AS e
WHERE e.DepartmentID IN (3,10) 
AND (DATEPART(YEAR,e.HireDate) >=1995
 OR   DATEPART(YEAR,e.HireDate) <=2005)

-- Problem 04. Find All Employees Except Engineers

SELECT e.FirstName, e.LastName
  FROM Employees as e
 WHERE e.JobTitle NOT LIKE '%engineer%'

-- Problem 05. Find Towns with Name Length

SELECT t.Name
FROM Towns AS t
WHERE LEN(t.Name)=5 OR LEN(t.Name) = 6
ORDER BY t.Name

-- Problem 06. Find Towns Starting With

SELECT t.TownID, t.Name
FROM Towns AS t
WHERE t.Name LIKE '[MKBE]%'
ORDER BY t.Name

-- Problem 07. Find Towns Not Starting With

SELECT t.TownID, t.Name
FROM Towns AS t
WHERE t.Name NOT LIKE '[RBD]%'
ORDER BY t.Name
GO
--Problem 08. Create View Employees Hired After

CREATE VIEW v_EmployeesHiredAfter2000 
AS
SELECT e.FirstName, e.LastName
FROM Employees AS e
WHERE DATEPART(YEAR, e.HireDate)>2000

-- Problem 09. Length of Last Name

SELECT e.FirstName, e. LastName
FROM Employees AS e
WHERE LEN(e.LastName) = 5

-- Problem 10. Countries Holding 'A'

USE Geography
GO

SELECT c.CountryName, c.IsoCode
FROM Countries AS c
WHERE c.CountryName LIKE '%A%A%A%'
ORDER BY c.IsoCode

-- Problem 11.Mix of Peak and River Names

SELECT	p.PeakName, 
		r.RiverName, 
		CONCAT( LOWER(p.PeakName) ,
				LOWER(RIGHT(r.RiverName, LEN(r.RiverName)-1))
			  ) AS Mix
FROM Peaks AS p, Rivers AS r


-- Problem 12. Games From 2011 and 2012 Year
USE Diablo
GO

SELECT TOP 50 
		g.Name, 
		FORMAT(g.Start,'yyyy-MM-dd') AS [Start]
FROM Games AS g
WHERE DATEPART(YEAR,Start) >=2011 
AND   DATEPART(YEAR,Start) <=2012
ORDER BY Start,Name

-- Problem 13. User Email Providers
SELECT Username, SUBSTRING(Email,CHARINDEX('@',Email,1)+1,LEN(Email)) 
AS 'Email Provider' 
FROM Users
ORDER BY [Email Provider], Username

--Problem 14. Get Users with IPAddress Like Pattern

