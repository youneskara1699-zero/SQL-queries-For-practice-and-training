-- 1.	Select all employees 
Select * From Employees;

-- 2.	Select only FirstName and LastName 
Select FirstName, LastName From Employees;

-- 3.	Find employees with salary > 2500
Select FirstName, LastName, MonthlySalary From Employees 
Where MonthlySalary > 2500; 

-- 4.	Find employees with salary < 300
Select FirstName, LastName, MonthlySalary From Employees
Where MonthlySalary < 300;

-- 5.	Get employees hired after 2020 
Select FirstName, LastName , HireDate From Employees
Where Year(HireDate) > 2020;

-- 7.	Get employees hired before 2015 
Select FirstName, LastName , HireDate From Employees
Where Year(HireDate) < 2015;

-- 8.	Sort employees by salary ASC
Select FirstName, LastName, MonthlySalary From Employees
Order By MonthlySalary;

-- 9.	Sort employees by salary DESC 
Select FirstName, LastName, MonthlySalary From Employees
Order By MonthlySalary Desc;

-- 10.	Get top 5 highest salaries 
Select FirstName, LastName, MonthlySalary From Employees
where MonthlySalary IN(Select Distinct top 5 MonthlySalary From Employees
Order By MonthlySalary Desc ) Order By MonthlySalary Desc;

-- 11.	Get top 3 lowest salaries 
Select  FirstName, LastName, MonthlySalary From Employees
Where MonthlySalary IN (Select Distinct Top 3 MonthlySalary From Employees
Order By MonthlySalary) Order by MonthlySalary Asc;

-- 12.	Count total employees 
Select [Total Employees] = Count(FirstName) From Employees; 
-- Also:
Select  Count(FirstName) AS [Total Employees] From Employees; 

-- 12.	Count employees with salary > 2000 
Select Count(MonthlySalary) As [employees with salary > 2000] From Employees
Where MonthlySalary > 2000;

-- 13.	Get max salary 
Select FirstName, LastName, MonthlySalary From Employees
Where MonthlySalary = (Select Max(MonthlySalary) From Employees);

-- 14.	Get min salary 
Select FirstName, LastName, MonthlySalary From Employees
Where MonthlySalary = (Select Min(MonthlySalary) From Employees);

-- 15.	Get average salary 
Select AVG(MonthlySalary) AS AVG_MonthlySalary  From Employees;

-- 16.	Get total salary 
Select Sum_Salaries = Sum(MonthlySalary) From Employees;

-- 17.	Find employees with name starting with ‘A’ 
Select FirstName From Employees
Where FirstName Like 'A%';

-- 18.	Find employees with name ending with ‘n’ 
Select FirstName From Employees
Where FirstName Like '%n';

-- 19.	Find employees with name containing ‘ar’ 
Select FirstName From Employees
Where FirstName Like '%ar%';

-- 20.	Find employees with 5-letter names 
Select FirstName From Employees
Where LEN(FirstName) = 5; 

-- 21.	Find employees whose second letter is ‘a’ 
Select FirstName From Employees
Where FirstName Like '_a%';

-- 22.	Find employees hired in January 
Select Full_Name = FirstName + ' ' + LastName, HireDate From Employees
Where Month(HireDate) = '1'
Order By Year(HireDate) Desc;

-- 23.	Find employees hired in 2022 
Select Full_Name = FirstName + ' ' + LastName, HireDate From Employees
Where Year(HireDate) = '2022';

-- 24.	Get employees from department 3
Select Full_Name = FirstName + ' ' + LastName, MonthlySalary, DepartmentID From Employees
Where DepartmentID = 2;

-- 25.	Get employees not in department 2
Select Full_Name = FirstName + ' ' + LastName, MonthlySalary, DepartmentID From Employees
Where DepartmentID <> 2;

-- 26.	Find employees with salary between 300 and 1000
Select Full_Name = FirstName + ' ' + LastName, MonthlySalary From Employees
Where Monthlysalary between 300 and 1000;

-- 27.	Find employees with salary NOT between 1000 and 1500 
Select Full_Name = FirstName + ' ' + LastName, MonthlySalary From Employees
Where Monthlysalary NOT between 1000 and 1500;

-- 28.	Get employees whose job is 'Database Administrator'  
Select Full_Name = FirstName + ' ' + LastName, JobTitle, MonthlySalary From Employees
Where JobTitle = 'Database Administrator';

-- 29.	Get unique job titles
Select Distinct Employees.JobTitle From Employees;

-- 30.	Get employees whose job is NOT 'Junior Accountant, IT Support, Risk Analyst'
Select Distinct Full_Name = FirstName + ' ' + LastName,JobTitle From Employees
Where JobTitle NOT IN ('Junior Accountant', 'IT Support', 'Risk Analyst');

-- 31.List employees who do not have a bonus assigned
Select Full_Name = FirstName + ' ' + LastName,MonthlySalary, BonusPerc From Employees
Where BonusPerc IS NULL;

-- 32.	Get employees who have a hire date but no termination date (still active)
Select Full_Name = FirstName + ' ' + LastName, HireDate, Jobtitle From Employees
Where ExitDate IS NULL;

-- 33.	Count employees per department 
Select D1.Name AS DeptName, Count(E1.ID) AS TotalEmployees 
From Employees E1 JOIN Departments D1 ON E1.DepartmentID = D1.ID
Group By D1.Name;

-- 34.	Get departments with more than 120 employees  
Select DeptName = D1.Name , Count(E1.ID) AS TotalEmployees From Employees E1
JOIN Departments D1 ON E1.DepartmentID = D1.ID
Group By D1.Name
Having Count(E1.ID) > 120;

-- 35.	Get employees ordered by hire date 
Select  Full_Name = FirstName + ' ' + LastName, HireDate From Employees
Order By HireDate;

-- 36.	Get newest employee 
Select Top 1 Full_Name = FirstName + ' ' + LastName, HireDate From Employees
Order By HireDate Desc;

-- 37.	Get oldest employee 
Select Top 1 Full_Name = FirstName + ' ' + LastName, HireDate From Employees
Order By HireDate Asc;

-- 38.	Find employees hired today 
Select Full_Name = FirstName + ' ' + LastName, HireDate From Employees
Where HireDate = GETDATE();

-- 39.	Find employees hired this year 
Select Full_Name = FirstName + ' ' + LastName, HireDate From Employees
Where Year(HireDate) = Year(GETDATE());

-- 40.	Get employees with yearly salary > 30000
Select Full_Name = FirstName + ' ' + LastName, MonthlySalary, YearlySalary = MonthlySalary * 12 From Employees
Where MonthlySalary * 12 > 30000;

-- 41.	Get employees with yearly salary < 10000 
Select Full_Name = FirstName + ' ' + LastName, MonthlySalary, YearlySalary = MonthlySalary * 12 From Employees
Where MonthlySalary * 12 < 10000;

-- 42.	Get employees with salary >= 2000 
Select Full_Name = FirstName + ' ' + LastName, MonthlySalary From Employees
Where MonthlySalary >= 2000 ;

-- 43.	Get employees with salary <= 250 
Select Full_Name = FirstName + ' ' + LastName, MonthlySalary From Employees
Where MonthlySalary <= 250 ;

-- 44.	Find employees whose First Name is exactly 'John' 
Select FirstName, LastName, JobTitle, MonthlySalary From Employees
Where FirstName = 'John';

-- 45.	Get employees whose last name starts with 'S' 
Select FirstName, LastName, JobTitle, MonthlySalary From Employees
Where LastName Like 'S%';

-- 46.	Get employees whose last name starts with 'K, L, M' 
Select FirstName, LastName, JobTitle, MonthlySalary From Employees
Where FirstName Like '[KLM]%';

-- 47.	Count employees per job 
Select JobTitle, COUNT(ID) AS TotalEmployees From Employees
Group By JobTitle
Order By COUNT(ID) Desc;

-- 48.	Get highest salary per department 
Select  D1.Name AS DeptName, Max(E1.MonthlySalary) As HighestSalary From Employees E1 
INNER JOIN Departments D1 ON E1.DepartmentID = D1.ID
Group By D1.Name;

-- 49.	Get lowest salary per department 
Select D1.Name AS DeptName, Min(E1.MonthlySalary) AS LowestSalary From Employees AS E1
INNER JOIN Departments D1 ON E1.DepartmentID = D1.ID 
Group By D1.Name;

-- 50.	Get average salary per department 
Select D1.Name AS DeptName, AVG(E1.MonthlySalary) AS AverageSalary From Employees AS E1
INNER JOIN Departments D1 ON E1.DepartmentID = D1.ID 
Group By D1.Name;

-- 51.	Get departments with avg salary > 1630 
Select D1.Name AS DeptName, AVG(E1.MonthlySalary) AS AverageSalary From Employees AS E1
INNER JOIN Departments D1 ON E1.DepartmentID = D1.ID 
Group By D1.Name
Having AVG(E1.MonthlySalary) > 1630;

-- 52.	Find employees without department 
Select * From Employees
Where DepartmentID IS NULL;

-- 53.	Get employees in departments 1, 2, 3
Select FirstName + ' ' + LastName AS FullName, JobTitle, MonthlySalary, DepartmentID From Employees
Where DepartmentID IN (1,2,3);

-- 54.	Get employees NOT in departments 5, 4 
Select FirstName + ' ' + LastName AS FullName, JobTitle, MonthlySalary, DepartmentID From Employees
Where DepartmentID NOT IN (4,5);

-- 56.	Get employees hired between 2020-01-01 and 2022-03-31
Select FirstName + ' ' + LastName AS FullName, JobTitle, HireDate From Employees
Where HireDate Between '2020-01-01' and '2022-03-31';

-- 57.	Get employees with even ID 
Select FirstName + ' ' + LastName AS FullName, JobTitle, MonthlySalary From Employees
Where ID % 2 = 0 ;
-- 58.	Find employees whose first name contains 'a' twice 
Select FirstName , JobTitle, MonthlySalary From Employees
Where LEN(FirstName) - LEN(REPLACE(FirstName, 'a', '')) = 2;

-- 59.	Get employees sorted by department then salary 
Select E1.FirstName , E1.JobTitle, E1.MonthlySalary, DeptName = D1.Name From Employees E1
INNER JOIN Departments D1 ON E1.DepartmentID = D1.ID
Order By D1.Name , E1.MonthlySalary Desc;

-- 60.	Get employees sorted by name length 
Select FullName = FirstName + ' ' + LastName , JobTitle, MonthlySalary From Employees
Order By LEN(FirstName + ' ' + LastName) ;
;

-- 61.	Join employees with departments 
Select DeptName = D.Name,   COUNT(*) AS EmployeeCount From Employees E
INNER JOIN Departments D ON E.DepartmentID = D.ID ;

-- 62.	Show employee name + department name
Select DeptName = D.Name, FullName = E.FirstName + ' ' + E.LastName From Employees E
INNER JOIN Departments D ON E.DepartmentID = D.ID ;

-- 63. Rank employees by salary   
Select FirstName, MonthlySalary, 
ROW_NUMBER() OVER (Order By MonthlySalary Desc) AS RankSalary
From Employees;

-- 64.	Count employees per department (JOIN) 
Select DeptName = D.Name,   COUNT(*) AS EmployeeCount From Employees E
INNER JOIN Departments D ON E.DepartmentID = D.ID 
GROUP BY D.Name;

-- 65.	Get departments with no employees 
Select Departments.Name AS DeptName, COUNT(*) AS TotalEmployees From Employees
Join Departments ON Employees.DepartmentID = Departments.ID
Group By Departments.Name
Having Count(Employees.ID) = 0;

-- 66.	Get employees without department using LEFT JOIN 
Select *  From Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.ID
Where D.ID IS NULL;

-- 67.	Get employees with departments using INNER JOIN 
Select E.FirstName, E.LastName, DeptName = D.Name From Employees E
INNER JOIN Departments D ON E.DepartmentID = D.ID
Group by E.FirstName, E.LastName, D.Name;

-- 68.	Get all departments including empty ones 
SELECT D.Name AS DeptName,COUNT(E.ID) AS TotalEmployees FROM Departments D
LEFT JOIN Employees E ON D.ID = E.DepartmentID
GROUP BY D.Name;

-- 69.	Get employees with job titles 
Select EmployeeName = FirstName + ' ' + LastName, JobTitle From Employees;

-- 70.	Join employees with jobs and departments 
Select E.FirstName, E.JobTitle, D.Name AS DeptName From Employees E
Join Departments D ON E.DepartmentID = D.ID
Where E.JobTitle IS NOT NULL;

-- 71.	Find employees earning more than their manager 

-- 72.	Get second highest salary 
Select Top 1 EmployeeName = FirstName + ' ' + LastName, MonthlySalary From Employees
Where MonthlySalary < (Select  Max(MonthlySalary) From Employees)
Order By MonthlySalary Desc;

-- 73.	Get third highest salary 
Select Top 1 EmployeeName = FirstName + ' ' + LastName, MonthlySalary From Employees
Where MonthlySalary < (Select Top 1 MonthlySalary From Employees
Where MonthlySalary < (Select  Max(MonthlySalary) From Employees) Order By MonthlySalary Desc)
Order By MonthlySalary Desc; 

-- 74.	Get employees with salary above average  
Select CONCAT(FirstName, ' ', LastName) AS EmployeeName, MonthlySalary From Employees
Where MonthlySalary > (Select AVG(MonthlySalary) From Employees)
Order By MonthlySalary Desc;

-- 75.	Get employees with salary below average 
Select CONCAT(Firstname, ' ', LastName) AS EmployeeName, MonthlySalary From Employees
Where MonthlySalary < (Select AVG(MonthlySalary) From Employees)
Order By MonthlySalary;

-- 76.	Find employees with same salary 
Select CONCAT(Firstname, ' ', LastName) AS EmployeeName, MonthlySalary From Employees
Where MonthlySalary IN(
Select MonthlySalary From Employees
Group By MonthlySalary
Having COUNT(*) > 1
) Order By MonthlySalary Desc;

-- 77.	Get employees hired in same year 
Select CONCAT(Firstname, ' ', LastName) AS EmployeeName, Year(HireDate) AS HireYear From Employees
Where Year(HireDate) IN (Select Year(HireDate) From Employees
Group By Year(HireDate) 
Having Count (*) > 1) 
Order By Year(HireDate) Desc;

-- 78.	Get employees with same job title
SELECT CONCAT(FirstName, ' ', LastName) AS EmployeeName,JobTitle FROM Employees
WHERE JobTitle IN (SELECT JobTitle FROM Employees
  GROUP BY JobTitle
  HAVING COUNT(*) > 1
) Order By JobTitle;

-- 79.	Find duplicate job titles
Select JobTitle, Count(*) AS TotalEmployees From Employees
Group By JobTitle
Having Count(*) > 1
Order By Count(*) DESC;

-- 80.	Delete Employees with Job Title unsigned
Delete From Employees
Where JobTitle IS NULL;

-- 81.	Update salary by +10% 
Update Employees
Set MonthlySalary = MonthlySalary * 1.1;

-- 82.	Increase salary of IT employees 
Update Employees
Set MonthlySalary = MonthlySalary * 1.1
Where DepartmentID = 5;

Select * From Departments;
-- 83.	Decrease salary of HR employees by 10% 
UPDATE Employees
SET MonthlySalary = MonthlySalary * 0.9
WHERE DepartmentID = 5;

-- 85.	Delete employees with salary between 250 and 350
Delete From Employees
Where MonthlySalary between 250 and 350;

Select * From Employees;
-- 86.	Insert new employee 
Insert Into Employees 
Values
('Sami', 'Kacem', 'M', '1990-03-09 00:00:00', 1, 2, '2008-07-27 00:00:00', NULL, 2377.1001, 0, 'Frontend Developer');

-- 87.	Insert multiple employees 
Insert Into Employees
Values
('Sami', 'Kacem', 'M', '1990-03-09 00:00:00', 1, 2, '2008-07-27 00:00:00', NULL, 2377.1001, 0, 'Frontend Developer'),
('Lotfi', 'Akrem', 'M', '1993-03-18 00:00:00', 1, 2, '2010-07-15 00:00:00', NULL, 2300.1001, 0, 'Backend Developer'),
('Dina', 'Hamouda', 'F', '1993-03-18 00:00:00', 1, 2, '2010-07-15 00:00:00', NULL, 2300.1001, 0, 'Backend Developer' );

-- 88.	Find employees with max salary per department 
Select DeptName = Departments.Name, Max(MonthlySalary) AS HighestSalary From Employees
Join Departments ON Employees.DepartmentID = Departments.ID
Group By Departments.Name;

-- 93.	Find employees with min salary per department 
Select DeptName = Departments.Name, Min(MonthlySalary) AS LowestSalary From Employees
Join Departments ON Employees.DepartmentID = Departments.ID
Group By Departments.Name;

-- 94.	Build salary report 

SELECT 
    ID,
    FirstName + ' ' + LastName AS FullName,
    JobTitle,
    MonthlySalary,
    BonusPerc,
    MonthlySalary + BonusPerc AS TotalSalary
FROM Employees
ORDER BY MonthlySalary DESC;

-- 95.	Category employees by salary 
Select FirstName, JobTitle, MonthlySalary,
CASE 
When  MonthlySalary > 2500 Then 'High'
When  MonthlySalary between 1500 and 2500 Then 'Medium'
Else 'Small'
End AS SalaryCategory
From Employees;

-- 96.	Row number for employees 
Select FirstName, MonthlySalary, RowNumber =
ROW_NUMBER() over (Order By MonthlySalary Desc) 
From Employees;

-- 97.	Get top 3 salaries per department 
Select * 
From (
Select
 D.Name AS DeptName,E.FirstName, E.MonthlySalary, ROW_NUMBER() OVER (PARTITION By E.DepartmentID Order By E.MonthlySalary Desc ) AS rn
 From Employees E
 Join Departments D ON E.DepartmentID = D.ID 
) t

Where rn <= 3;

-- 98.	Get employees who joined same day 
Select FirstName + ' ' + LastName AS EmployeeName, HireDate From Employees
Where HireDate IN (Select HireDate From Employees 
Group By HireDate Having COUNT(*) > 1)
Order By HireDate Desc;

-- 99.	Find employees with same last name 
Select  LastName, FirstName, JobTitle From Employees
Where LastName IN (Select LastName From Employees
Group By LastName Having COUNT(*) > 1)
Order By LastName ;

-- 100.	Get department with highest avg salary 
Select Top 1 DeptName = D.Name, AVG(E.MonthlySalary) AS HigestSalary From Employees E
Join Departments D ON E.DepartmentID = D.ID
Group By D.Name
Order By AVG(E.MonthlySalary) Desc;

-- 101.	Get department with lowest avg salary 
Select Top 1 DeptName = D.Name, AVG(E.MonthlySalary) AS HigestSalary From Employees E
Join Departments D ON E.DepartmentID = D.ID
Group By D.Name
Order By AVG(E.MonthlySalary) Asc;

-- 102.	Find employees working more than 5 years 
Select FirstName + ' ' + LastName As EmployeeName, HireDate, JobTitle From Employees
Where DATEADD(Year, 5, HireDate) <= GETDATE()
Order By HireDate Desc;

-- 103.	Get employees earning same as someone else
Select FirstName + ' ' + LastName As EmployeeName, JobTitle, MonthlySalary From Employees
Where MonthlySalary IN (Select MonthlySalary From Employees
Group By MonthlySalary
Having Count(*) >= 2
)Order By MonthlySalary Desc;

-- 104.	Get employees with highest salary in company 
Select FirstName + ' ' + LastName As EmployeeName, JobTitle, MonthlySalary From Employees
Where MonthlySalary = (Select Max(MonthlySalary) From Employees);

-- 105.	Get employees with lowest salary in company 
Select FirstName + ' ' + LastName As EmployeeName, JobTitle, MonthlySalary From Employees
Where MonthlySalary = (Select Min(MonthlySalary) From Employees);

-- 106.	Get employees hired last month 
Select FirstName + ' ' + LastName As EmployeeName, JobTitle, HireDate From Employees
Where HireDate >= DATEADD(MONTH, -1, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))
  AND HireDate < DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1);

-- 107.	Get employees hired last year 
SELECT FirstName + ' ' + LastName AS EmployeeName,JobTitle,HireDate FROM Employees
WHERE HireDate >= DATEFROMPARTS(YEAR(GETDATE()) - 1, 1, 1)  
  AND HireDate < DATEFROMPARTS(YEAR(GETDATE()), 1, 1); 

-- 108.	Get employees with salary above department avg 
SELECT DeptName = Departments.Name,FirstName + ' ' + LastName AS EmployeeName,JobTitle,Employees.MonthlySalary  FROM Employees
Join Departments ON Employees.DepartmentID = Departments.ID
Where MonthlySalary > (Select AVG(MonthlySalary) From Employees
Where DepartmentID = Employees.DepartmentID)
Order By DepartmentID Desc;

-- 109.	Get employees with salary below department avg 
SELECT DeptName = Departments.Name,FirstName + ' ' + LastName AS EmployeeName,JobTitle,Employees.MonthlySalary  FROM Employees
Join Departments ON Employees.DepartmentID = Departments.ID
Where MonthlySalary < (Select AVG(MonthlySalary) From Employees
Where DepartmentID = Employees.DepartmentID)
Order By DepartmentID Desc;

-- 110.	Get count of employees per job 
Select JobTitle, Count(*) AS TotalJobEmployees From Employees
Group By JobTitle
Order By  TotalJobEmployees Desc;

-- 111.	Get most common job 
Select Top 1 JobTitle, Count(*) AS TotalJobEmployees From Employees
Group By JobTitle
Order By  TotalJobEmployees Desc;

-- 112.	Get least common job
Select Top 1 JobTitle, Count(*) AS TotalJobEmployees From Employees
Group By JobTitle
Order By  TotalJobEmployees Asc;

-- 113.	Get employees in largest department 
Select  Departments.Name AS DeptName, FirstName , LastName  From Employees
Join Departments ON Employees.DepartmentID = Departments.ID
Where DepartmentID = (Select top 1 DepartmentID From Employees
Group By DepartmentID
Order By COUNT(*) Desc);

-- 114.	Get employees in smallest department 
Select Departments.Name AS DeptName, FirstName , LastName  From Employees
Join Departments ON Employees.DepartmentID = Departments.ID
Where DepartmentID = (Select Top 1 DepartmentID From Employees
Group By DepartmentID
Order By Count(*));

-- 115.	Get employees without job 
Select Concat(FirstName, ' ', LastName) AS EmployeeName, JobTitle, MonthlySalary From Employees
Where JobTitle IS NULL;

-- 116.	Get employees hired on weekend 
Select Concat(FirstName, ' ', LastName) AS EmployeeName, HireDate, MonthlySalary From Employees
Where DateName(WeekDay,HireDate) IN ('Friday', 'Saturday');

-- 117.	Get employees hired on Monday 
Select Concat(FirstName, ' ', LastName) AS EmployeeName, HireDate, MonthlySalary From Employees
Where dateName (WeekDay, HireDate) = 'Monday';

-- 118.	Get employees older than 30
Select Concat(FirstName, ' ', LastName) AS EmployeeName, Age = DateDiff(Year,DateOfBirth,GETDATE()) From Employees
Where DateDiff(Year,DateOfBirth,GETDATE()) > 30
Order By DateDiff(Year,DateOfBirth,GETDATE()) Desc;

-- 119.	Get employees younger than 25 
Select Concat(FirstName, ' ', LastName) AS EmployeeName, Age = DateDiff(Year,DateOfBirth,GETDATE()) From Employees
Where DateDiff(Year,DateOfBirth,GETDATE()) <25
Order By DateDiff(Year,DateOfBirth,GETDATE()) Desc;

-- 120.	Get employees with birthday today 
Select Concat(FirstName, ' ', LastName) AS EmployeeName, Age = DateDiff(Year,DateOfBirth,GETDATE()) From Employees
Where Month(DateOfBirth) = Month(GETDATE()) and Day(DateOfBirth) = Day(GETDATE())
Order By DateDiff(Year,DateOfBirth,GETDATE()) Desc;

-- 121.	Get employees with birthday this month 
Select Concat(FirstName, ' ', LastName) AS EmployeeName, Age = DateDiff(Year,DateOfBirth,GETDATE()) From Employees
Where Month(DateOfBirth) = Month(GETDATE()) 
Order By DateDiff(Year,DateOfBirth,GETDATE()) Desc;

-- 122.	Get employees grouped by hire year 
Select Concat(FirstName, ' ', LastName) AS EmployeeName, Age = DateDiff(Year,DateOfBirth,GETDATE()), Year(HireDate) AS HireYear From Employees
ORDER BY HireYear DESC, EmployeeName;

-- 123.	Get number of hires per year 
Select Year(HireDate) AS HireYear, Count(*) AS HireYearEmployees From Employees
Group by Year(HireDate)
ORDER BY HireYear DESC;

-- 124.	Get most hiring year 
Select Top 1 Year(HireDate) AS HireYear, Count(*) AS HireYearEmployees From Employees
Group by Year(HireDate)
ORDER BY HireYearEmployees DESC;

-- 125.	Get least hiring year 
Select Top 1 Year(HireDate) AS HireYear, Count(*) AS HireYearEmployees From Employees
Group by Year(HireDate)
ORDER BY HireYearEmployees;

-- 126.	Get employees whose name appears more than once
Select  Concat(FirstName, ' ', LastName) AS EmployeeName, Count(*) AS NameCount From Employees
Group By FirstName, LastName
Having Count(FirstName) > 1;

-- 127.	Get employees with special characters in name 
SELECT CONCAT(FirstName, ' ', LastName) AS EmployeeName FROM Employees
WHERE PATINDEX('%[^a-zA-Z0-9 ]%', FirstName + LastName) > 0;

-- 128.	Get employees hired in last 7 days 
SELECT  CONCAT(FirstName, ' ', LastName) AS EmployeeName,HireDate,JobTitle,MonthlySalary FROM Employees
Where HireDate >= DATEADD(Day,-7,GETDATE())
ORDER BY HireDate DESC;

-- 129.	Get employees hired in last 30 days 
SELECT  CONCAT(FirstName, ' ', LastName) AS EmployeeName,HireDate,JobTitle,MonthlySalary FROM Employees
Where HireDate >= DATEADD(Day, -30, GETDATE())
ORDER BY HireDate DESC;

-- 130. Get employees hired in last year 
SELECT  CONCAT(FirstName, ' ', LastName) AS EmployeeName,HireDate,JobTitle,MonthlySalary FROM Employees
Where HireDate >= DATEADD(Year, -1, GETDATE())
ORDER BY HireDate DESC;

-- 131.	Get salary difference between max and min 
Select SalaryDifference = Max(MonthlySalary) - Min(MonthlySalary) From Employees;

-- 132.	Get avg salary difference between departments 
Select AVG(DeptSalaryDiff) AS AvgSalaryDifference
From(
  Select DepartmentID, Max(MonthlySalary) - Min(MonthlySalary) AS DeptSalaryDiff From Employees
  Group By DepartmentID
) AS DeptDifferences;

-- 133.	Get employees with highest salary in each job 
SELECT E.JobTitle,CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,E.MonthlySalary FROM Employees E
Where E.MonthlySalary = (
Select Max(MonthlySalary) From Employees
Where JobTitle = E.JobTitle
)
Order By E.JobTitle;

-- 134.	Get employees with lowest salary in each job 
SELECT E.JobTitle,CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,E.MonthlySalary FROM Employees E
Where E.MonthlySalary = (
Select Min(MonthlySalary) From Employees
Where JobTitle = E.JobTitle
)
Order By E.JobTitle;

-- 135.	Find employees working in multiple departments 
Select CONCAT(FirstName, ' ', LastName) AS EmployeeName From Employees
Group By FirstName, LastName
Having COUNT(Distinct DepartmentID) > 1;

-- 136.	Find employees with missing data 
SELECT 
    CONCAT(FirstName, ' ', LastName) AS EmployeeName,
    FirstName,
    LastName,
    Gender,
    DateOfBirth,
    CountryID,
    DepartmentID,
    HireDate,
    ExitDate,
    JobTitle,
    MonthlySalary,
    BonusPerc
    
FROM Employees
WHERE FirstName IS NULL
   OR LastName IS NULL
   OR JobTitle IS NULL
   OR HireDate IS NULL
   OR MonthlySalary IS NULL
   OR DepartmentID IS NULL
   OR Gender IS NULL
   OR DateOfBirth IS NULL
   OR CountryID IS NULL
   OR BonusPerc IS NULL
   OR  ExitDate IS NULL;

-- 137.	Get employees with salary not matching job range between 1500 and 3000
Select FirstName, LastName, MonthlySalary From Employees
Where MonthlySalary NOT between 1500 and 3000;

-- 138.	Get top 25% earners 
Select Top 25 Percent FirstName,MonthlySalary From Employees
Order By MonthlySalary Desc;
 
 -- 139.	Get bottom 25% earners 
Select Top 25 Percent FirstName,MonthlySalary From Employees
Order By MonthlySalary;

-- 140.	Find median salary 
SELECT  top 1 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY MonthlySalary) OVER () AS MedianSalary FROM Employees;

-- 141. Split employees into salary bands
Select FirstName, JobTitle, MonthlySalary,
CASE 
When MonthlySalary Between 0 and 1000 THEN 'Entry'
When  MonthlySalary Between 1001 and 1700 THEN 'Mid'
When  MonthlySalary Between 1701 and 2500 THEN 'Senior'
Else 'Executive'
END AS BandName
From Employees;

-- 142. Show a single list of: 
-- (1) employees with salary > 2500 
-- (2) employees hired after 2020

Select FirstName, LastName, CAST(MonthlySalary AS varchar) AS Info, 'High Salary' AS Type From Employees
Where MonthlySalary > 2500
UNION 
Select FirstName, LastName, CAST(HireDate AS varchar) AS Info, 'Recent Hire' AS Type From Employees
Where Year(HireDate) > 2020;

Select FirstName, LastName, CAST(MonthlySalary AS varchar) AS Info, 'High Salary' AS Type From Employees
Where MonthlySalary > 2500
UNION ALL
Select FirstName, LastName, CAST(HireDate AS varchar) AS Info, 'Recent Hire' AS Type From Employees
Where Year(HireDate) > 2020;

-- 143. Show ALL departments and any employees in them using Left Join
Select DeptName = Departments.Name, FullName = Employees.FirstName + ' ' + Employees.LastName, Employees.MonthlySalary From Departments
Left Join Employees ON Departments.ID = Employees.DepartmentID 
Order By Departments.Name;

-- 143. Show ALL departments and any employees in them using Right Join
Select DeptName = Departments.Name, FullName = Employees.FirstName + ' ' + Employees.LastName, Employees.MonthlySalary From Employees
Right Join Departments ON Departments.ID = Employees.DepartmentID 
Order By Departments.Name;

-- 144.  Show ALL departments AND ALL employees, even if no match exists (Full Join)
Select DeptName = Departments.Name, FullName = Employees.FirstName + ' ' + Employees.LastName, Employees.MonthlySalary From Departments
Full Join Employees ON Departments.ID = Employees.DepartmentID 
Order By Departments.Name;

-- 145. For each employee, show salary comparison with next higher and next lower paid
SELECT 
    CONCAT(FirstName, ' ', LastName) AS EmployeeName,
    MonthlySalary,
    LEAD(MonthlySalary)Over(Order By MonthlySalary) AS NextHigherSalary,
    LAG(MonthlySalary)Over(Order By MonthlySalary) AS NextLowerSalary

From Employees;

-- 146. Find all employees who work in departments where the average salary > 2000
SELECT 
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,
    D.Name AS DepartmentName,
    E.MonthlySalary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.ID
WHERE EXISTS (
   Select 1
   From Employees E2
   Where E2.DepartmentID = E.DepartmentID
   Group By E2.DepartmentID
   Having AVG(E2.MonthlySalary) > 2000
);

-- 147. Find departments that have NO employees assigned
SELECT D.Name AS DepartmentName
FROM Departments D
WHERE NOT EXISTS (
    SELECT 1 
    FROM Employees E
    WHERE E.DepartmentID = D.ID
);

-- 148. Find employees who earn more than ANY employee in department 5 (IT)
SELECT FirstName, LastName, DepartmentID, MonthlySalary
FROM Employees
WHERE DepartmentID <> 5
AND MonthlySalary > ANY (
    SELECT MonthlySalary
    FROM Employees
    WHERE DepartmentID = 5
);

-- 149. Find employees who earn the same salary as someone in department 'IT'
SELECT FirstName, LastName, DepartmentID, MonthlySalary
FROM Employees
WHERE MonthlySalary IN (
    SELECT MonthlySalary
    FROM Employees
    WHERE DepartmentID = 5
);

-- 150. Find departments with more than 3 employees earning above 2000
SELECT Name AS DepartmentName
FROM Departments D
WHERE (
    SELECT COUNT(*)
    FROM Employees E
    WHERE E.DepartmentID = D.ID
    AND E.MonthlySalary > 2000
) > 3;




