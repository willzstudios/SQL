use [AdventureWorks2012]
--this database is obtained from Microsoft:
--https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms

--the asterix * or star * means select ALL the columns
--selecting ALL COLUMNS from "humanresources.department"
SELECT * FROM [HumanResources].[Department]

--show all department names
	--apparently you don't need CAPS in SQL, but some people like it because it makes the keywords STAND OUT more
	--i wonder if using lower-case "name" will have any impact - it seems like the column names are NOT case-sensitive but will change how the column names are displayed
	--I don't even need the square brackets around Table Names - so why does SQL copy them over when i copy paste from Object Explorer?
select name from humanresources.department

--show all groups
select groupname from HumanResources.Department

--show all distinct (aka Unique) group names
select distinct groupname from HumanResources.Department

--show "Name"s that are a part of the "GroupName" 'manufacturing'
select Name, GroupName from HumanResources.Department
where GroupName like 'manufacturing' --how does Microsoft SQL know where the command line ends? is this a syntax thing?

--show all employees from employee table -- remember "*" means ALL
select * from HumanResources.Employee

--show list of all employees who have a organizationLevel = 2
select * from HumanResources.Employee where OrganizationLevel = 2

--show list of all employees who have an orglevel = 2 or 3
select * from HumanResources.Employee where OrganizationLevel = 2 OR OrganizationLevel = 3
--or you could do it this way:
select * from HumanResources.Employee where OrganizationLevel in (2,3)

--show list of employees who have a Jobtitle as Facilities Manager
select * from HumanResources.Employee where JobTitle like 'Facilities Manager'
--apparently LIKE matches EACH character, and takes longer BUT you can use wildcards like "_" (simple character wildcard) and "%" (multi-character wildcard).
-- in Aconex this would be ? and *
--with LIKE, it will also detect TRAILING SPACES - which can be an issue sometimes... knowing from Excel experience.
select * from HumanResources.Employee where JobTitle like 'Facilities Manager   ' --trailing space LIKE - no matches 
select * from HumanResources.Employee where JobTitle = 'Facilities Manager   ' --trailing space =, has match (deletes the trailing space?)
--using "=" is faster, and will return EXACT matches - both like and "=" not case sensitive???
--apparently you can change Case-Sensitivity in RDBMS - through settings somewhere.
select * from HumanResources.Employee where JobTitle = 'Facilities Manager'
--using LIKE here with wildcard % to look for jobtitle Facilities Manager, and Facilities Admin Assistant
select * from HumanResources.Employee where JobTitle like 'facilities%'

--find all employees born after 1980
select * from HumanResources.Employee where BirthDate > 1980 --this doesn't work lol
select * from HumanResources.Employee where BirthDate > '1980' -- i think you have to compare it to a string not a number int
select * from HumanResources.Employee where BirthDate > '1/1/1980'
select * from HumanResources.Employee where BirthDate > '01/1/1980'
select * from HumanResources.Employee where BirthDate > '001/1/1980' -- this gives an error - so theres a few of the normal formats used
select * from HumanResources.Employee where BirthDate > '01/13/1980' -- this worked? - AMERICAN DATE SYSTEM
select * from HumanResources.Employee where BirthDate > '13/01/1980' -- this didn't work - american date system! m/d/year
select * from HumanResources.Employee where BirthDate > '01/13/80' --this worked as well - it just uses 1980 - wow that's a lot of error checking done with date formatting.
select * from HumanResources.Employee where BirthDate > '01/13/080' -- doesn't work
select * from HumanResources.Employee where BirthDate > '01/13/0080' -- this works, uses the year 80AD lol

--find all employees born between jan1, 1970 and jan1, 1971
select * from HumanResources.Employee where BirthDate between '1970' and '1971'

--after some googling I've learnt you can put the semicolon at the end of the line of a command if you want, but it doesn't seem to make a difference in Microsoft SQL so why bother?
--apparently in the future Microsoft is trying to make semicolons a REQUIREMENT to match the ANSI SQL standard

-- Calculated Columns
select name, listprice from Production.Product; --i'll just start using semicolons for good habit from here-on

--select col1, col2, col2 + 10 as "new name for col3" from datatable
select name, listprice, listprice + 10 as Adjusted_List_Price from Production.Product;

--into -- inserting data into a newly created permanent table
select name, listprice, listprice + 10 as Adjusted_List_Price into Production.Product_2 from Production.Product;
select * from Production.Product_2;

--inserting data into a temporary table - only visible to you - as soon as you end your "session" the temporary table is deleted. 
select name, listprice, listprice + 10 as Adjusted_List_Price into #tempname from Production.Product;
select * from #tempname;

--deleting data from a table
delete from Production.Product_2 where name like 'bearing ball';

--updating data
update Production.Product_2
set name = 'blade_new'
where name like 'blade';
---------------------------------------------------------------------------------------------------
--JOINs, joining tables
-- inner, outer (left, right and full), cross (think venn diagrams)
-- will look for common column and the respective rows to join tables into one.

--creating a table "myemployee" with col1 int, col2 varchar limit 20, col3 varchar limit 20
create table myemployee (EmployeeID int, FirstName varchar(20), LastName varchar(20)); -- i've noted it's created the table name as "dbo.myemployee", - default schema in SQL Server - automatically groups things to a schema named "dbo"

--inserting data into our table as values (col1 value = 1, col2 = Michael, col3 = Scott)
insert into myemployee values (1, 'Michael', 'Scott');
insert into myemployee values (2, 'Willz', 'Studios');
insert into myemployee values (3, 'Scott', 'Morrison');
insert into myemployee values (5, 'The', 'Graduate');

select * from myemployee;

create table MySalary (EmployeeID int, Salary float);
insert into MySalary values (1, 60000);
insert into MySalary values (2, 70000);
insert into MySalary values (3, 50000);
insert into MySalary values (4, 99999);

select * from MySalary;
select * from myemployee;

-- INNER JOIN
-- select all from "myemployee" alias "a" INNER JOIN with "MySalary" alias "b", ON the common column EmployeeID
select * from myemployee a inner join MySalary b on a.EmployeeID = B.EmployeeID;

-- LEFT OUTER JOIN
select * from myemployee a left join MySalary b on a.EmployeeID = B.EmployeeID;

-- RIGHT OUTER JOIN
select * from myemployee a right join MySalary b on a.EmployeeID = B.EmployeeID;

-- FULL OUTER JOIN
select * from myemployee a full join MySalary b on a.EmployeeID = B.EmployeeID;

-- CROSS JOIN
select * from myemployee cross join MySalary; -- oh this is weird -- don't need to specify the matching column anymore.
select * from myemployee, MySalary; -- same result as above - seems like CROSS JOIN might be for producing ALL possible COMBINATIONS - for statistics?

-------------------------------------------------------MANIPULATING DATES in SQL
select GETDATE(); -- provides current date
select GETDATE() - 2; -- provides current date MINUS 2 days



--DATEPART -- getting a part of the date string
select DATEPART(yyyy, getdate()) as YearNumber;
select DATEPART(mm, getdate()) as Month; -- weird month is a keyword? but it still works
select DATEPART(dd, getdate()) as Day;

--DATEADD
select DATEADD(day, 4, getdate());
select getdate() + 4; -- same thing

---
select top 10 * from Production.WorkOrder;
--interesting you can use column names as variables for the DATEDIFF() function here
select workOrderID, productid, startdate, enddate, DATEDIFF(day, startdate, enddate) as DateDifference from Production.WorkOrder;

--get the first day of this month
-- using DATEADD() function, incrementing by days "dd", increment amount = current day of this month + 1, add is to the current date
select DATEADD(dd, -(DATEPART(day, getdate())) +1, getdate());

------------------------------------------

--------------------------------------- TSQL aggregation and STRING functions
--AGGREGATE functions:
select * from MySalary;
select avg(salary) from MySalary; --AVERAGE
select count(salary) from MySalary;--COUNT, just like Excel
select count(*) from MySalary;
select sum(salary) from MySalary; --SUM
select min(salary) from MySalary; -- MIN
select max(salary) from MySalary; -- MAX

-- CONCATENATING strings - ahh more Excel things
select CONCAT('String 1','string 2'); -- printed as a VALUE within a temporary table? -- i guess select is also kind of VIEW/SHOW
print concat('Hello',' World!!'); -- PRINTS as a message -- I guess you could make a console app using print. wonder if there's a System.Console.ReadLine()?

--this is a weird one. uses RAND() for random number (float between 0,1)
select EmployeeID, Salary, CONCAT(employeeID, ' ', RAND()) as ConcatenatedText from MySalary;

--more microsoft Excel functions for strings
--LEFT, RIGHT, MID?
print LEFT('12345',2);
print RIGHT('12345',2);
--seems like no MID exists.
print substring('12345',2,5); -- i guess this is the MID equivalent, "SUBSTRING", i think Powershell also uses this function name.
print 'HELLO WORLD';
print LOWER('HELLO WORLD'); -- lowercase - very useful - although searching in microsoft SQL seems to be case-insensitive so far.
print UPPER('hey everybody!');
print LEN('123456789'); -- LENGTH - same as excel LEN
print ('    a sentence with lots of spaces     ');
print LTRIM('    a sentence with lots of spaces     '); -- left trim
print RTRIM('    a sentence with lots of spaces     '); -- right trim
print LTRIM(RTRIM('    a sentence with lots of spaces     ')); -- left and right trim

--CRUD = create, read, update, delete.


