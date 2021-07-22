# SQL
## 20210720 - Learning SQL
- What is SQL?
- Why can't we all just use Microsoft Excel instead of SQL databases?
- In what scenario/case is SQL useful?

SQL is Structured-Query-Language, a programming language designed for managing data within relational database management systems. Originally developed by IBM in the 1970s.   

In the late 1970s, Relational Software, Inc (now Oracle Corporation) saw the potential of SQL and developed their own SQL (Oracle PL/SQL). Now there are many different versions of SQL, Eg. Microsoft's T-SQL.

Apparently SQL databases can handle a LOT more data, faster and more efficiently than Excel can.

Good for speed, and big data. but might be hard for common folk to learn how to get data from these SQL databases.
Then there are "tools" and IDEs that can help common folk easily obtain data from SQL databases.

that's all I know for now.

My resource for learning will be:
- https://www.udemy.com/course/introduction-to-databases-and-sql-querying/
- and good ol Google

.............

**Things I've learnt so far:**
- "--" is how you make notes for a single line
- "/*"... notes in here ..."/\*" is how you make multi-line notes, just like C#


Predefined datatypes in SQL
- Character (can't store Unicode characters)
- National character (can store Unicode characters - and apparently takes up more room sometimes)
- Binary
- Numeric
- Datetime
- Interval
- Boolean
- XML (information wrapped in eXtensible Markup Language tags - kinda like HTML - bit harder to read than JSON, but can do a lot more?)
- JSON (Javascript Object Notation - is a text format for storing/transporting data - easily readable)


## 20210721 Queries ain't hard
"Queries" in sql are requests for data. Although they can do a lot more than that.
When you create a "query" in Microsoft SQL Server Management Studio, you create a .sql file which can contain SQL commands or statements.

These lines of codes can do a lot more than "querying" for data:
- they can CREATE databases, database tables, values
- READ or query database tables for values
- UPDATE and MODIFY data values/tables
- DELETE databases, tables, values

Just like filtering for data in Excel tables, you can filter for data in SQL - but you use the SQL language to "query" the database.

To READ/VIEW data from a database:
- use the SELECT keyword
- specify the data base you want to USE beforehand
- specify the table you want to SELECT data from
- You can do a lot of nifty searches with keywords:
  - * for ALL
  - WHERE for conditions
  - operators such as like, =, <,>, AND, OR

To CREATE data tables:
- you can use INTO: select col1, col2, col3 into "NewTableName" from "ReferencedTableofCol123"
- you can use INTO with temp table: select col1, col2, col3 into #tempTableName from "ReferencedTableofCol123"
- you can use CREATE: create table "NewTableName" (col1name dataType, col2name dataType, col3name, dataType)

To UPDATE data:
- use UPDATE: update "DataTableName" set col1name = 'newCol1Name'

To DELETE data:
- use DELETE: delete from "TableName"

## 20210722
How do we create a SQL database on a server and view it on a website?

Installed MySQL/MariaDB on a server.
used phpMyAdmin to configure the MariaDB SQL database
Created a fun table: "Programming Languages I know about"
- now how do I share it on a webpage? html? .ASP? - WorkInProgress


