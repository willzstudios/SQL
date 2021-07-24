# SQL adventure - Learning SQL, PHP and HTML in 4 days


## 20210725 - Finally made a webpage displaying a HTML table from a MariaDB database using PHP to make SQL connection and query
What a learning experience and a lot of headache.
1. When making a connection to your database with PHP it's easier if you use localhost as the server if nobody is going to remotely connect to it - this means your MySQL/MariaDB database should be on the same server as your webpage/website.
2. Choose you database column names wisely - weird names such as "Experience/Applications" with the foward-slash symbol will require special syntax when writing a SQL Query - it will require the use of BACKQUOTES for MariaDB SQL database (that's the key to the left of the number 1 on your keyboard).
3. Debug with phpMyAdmin for SQL queries, or a proper IDE
4. Debug with errorlog created from running the PHP file on your webserver (cPanel, FileManager for me)
5. Format HTML properly within your PHP file - makes it a lot easier to read
6. Make sure to name your columns correctly in PHP code, and instead of using cPanel's FileManager to edit the PHP file, use a proper IDE!

**This is the result:**
https://www.willzstudios.com/nonwordpress/MyProgrammingLanguages/connectdisplayDB.php
- php file attached, renamed db, user, pass, etc.

**Multiple resources were used to figure out this  mini-project**
- It would've been great if I had found them earlier!
- w3schools was a great help
- https://www.w3schools.com/php/php_mysql_intro.asp
- https://www.w3schools.com/php/php_mysql_select.asp
- - https://tryphp.w3schools.com/showphpfile.php?filename=demo_db_select_oo_table
- reading through SQL, HTML and PHP through w3schools was also great to understand what was going on in the example codes

## 20210724
To share and show your datatable to the world securely - a simple way is to create a webpage on the same server as your database and use some PHP! PHP is a programming language that can be processed by the web server and tell the server to do many things: it can give SQL commands to the server (querying our MariaDB database), it can create a webpage structure using HTML, you write other web development languages like CSS and JavaScript within a PHP file as well - or you could reference these within a separate script.  

- there's a few ways to connect to a database using PHP
- the key is to identify the servername as "localhost" if you're sending the query from your webserver
- usually you will not be able to connect remotely to your MySQL database if it is hosted on a cheaper shared server (security reasons)


## 20210722 - How to create a SQL database on webserver and configure/manipulate it?

Install MySQL/MariaDB on a webserver.
Use phpMyAdmin to configure the MariaDB SQL database with SQL queries 
- you can edit data tables with phpMyAdmin, but for the edit button to show up you have to assign a "primary key" to one of the columns. You can assign a primary key by going into "Structure" tab of phpMyAdmin for your table. The primary key should be assigned to a column with UNIQUE values - usually something like a "ID" column - this is how phpMyAdmin will "index" your table and make it editable through GUI.
Created a fun table: "Programming Languages I know about"
- now how do I share it on a webpage? html? .ASP? - WorkInProgress

## 20210721 Queries ain't hard
"Queries" in sql are requests for data. Although they can do a lot more than that.
When you create a "query" in Microsoft SQL Server Management Studio, you create a .sql file which can contain SQL commands or statements.

These lines of codes can do a lot more than "querying" for data:
- they can CREATE databases, database tables, values
- READ or query database tables for values
- UPDATE and MODIFY data values/tables
- DELETE databases, tables, values

Just like filtering for data in Excel tables, you can filter for data in SQL - but you use the SQL language to "query" the database.

**To READ/VIEW data from a database:**
- use the SELECT keyword
- specify the database you want to USE beforehand
- specify the table you want to SELECT data from
- You can do a lot of nifty searches with keywords:
  - \* for ALL
  - WHERE for conditions
  - operators such as like, =, <,>, AND, OR
**
To CREATE data tables:**
- you can use INTO to create from existing data/tables: select col1, col2, col3 into "NewTableName" from "ReferencedTableofCol123"
- you can use INTO to create a "temporary table" from existing data: select col1, col2, col3 into #tempTableName from "ReferencedTableofCol123"
- you can use CREATE to create a table from scratch: create table "NewTableName" (col1name dataType, col2name dataType, col3name, dataType)

**To UPDATE data:**
- use UPDATE: update "DataTableName" set col1name = 'newCol1Name'
- 

**To DELETE data:**
- use DELETE: delete from "TableName"

## 20210720 - Learning SQL
- What is SQL?
- Why can't we all just use Microsoft Excel on Sharepoint instead of SQL databases?
- In what scenario/case is SQL useful?

SQL is Structured-Query-Language, a programming language designed for managing data within relational database management systems. Originally developed by IBM in the 1970s. In the late 1970s, Relational Software, Inc (now Oracle Corporation) saw the potential of SQL and developed their own SQL (Oracle PL/SQL). Now there are many different versions of SQL, Eg. Microsoft's T-SQL, MySQL bought by Oracle, and it's fork MariaDB, etc.

**SQL databases:**
- can handle a LOT more data and more efficiently than Excel can (mainly because you are not requesting to view all the data at once usually, and there is no GUI overhead - making it very efficient for webservers)
- are SECURE - if made to be - requiring a USERNAME, PASSWORD and SERVERNAME
- have a lot of CONTROL - on what DATA TYPES can be inserted/inputted into data tables (eg. Integer, Variable Characters up to a specified limit such as max 20: "varchar(20)"
- have GUI for editing data within tables - known as tools (separate software) - such as phpMyAdmin


**Microsoft Excel on Sharepoint:**
- Very easy to implement being a "All-in-two package" - Excel for database and GUI, sharepoint for security and sharing)
- Requires nearly no programming knowledge, very user friendly
- is good if there's not much data to be manipulated (won't be too slow)
- can not be used to provide data for websites easily and quickly (I think)

**My resource for learning will be:**
- https://www.udemy.com/course/introduction-to-databases-and-sql-querying/
- and good ol Google

.............

**Things I've learnt so far:**
- "--" is how you make notes for a single line
- "/*"... notes in here ..."/\*" is how you make multi-line notes, just like C#


**Predefined datatypes in SQL**
- Character (can't store Unicode characters)
  - char = fixed length non-unicode character(s) - eg. a column specifying datatype of "char(8)" will only allow data input with characters with length of 8
  - varchar = variable length non-unicode characters - eg. "varchar(20)" specifies max length of 20 characters
  - adding an n in front (national characters); nchar, nvarchar - refers to Unicode characters - which includes extended characters such as Chinese characters, Latin, Cryllic, Greek, etc. These national characters take up a bit more memory - usually 2 bytes compared to 1 byte of non-Unicode character - so don't use it if you don't need extended characters 
- text = for holding large amounts of text (char/varchar can usually only hold up a maximum of 8000 and 4000 characters respectively, whereas text can hold string size of 65,535 bytes = 65,535 non-Unicode characters)
- there's also other string sizes: MEDIUMTEXT, LONGTEXT, similarly larger Binary sizes: BLOB, MEDIUMBLOB, LONGBLOB
- Binary 
- Numeric
- Datetime
- Interval
- Boolean
- XML (information wrapped in eXtensible Markup Language tags - kinda like HTML - bit harder to read than JSON, but can do a lot more?)
- JSON (Javascript Object Notation - is a text format for storing/transporting data - easily readable)






