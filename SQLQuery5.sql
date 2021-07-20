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


