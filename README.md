
Database Interview Questions<br>

<center>
<img style="width:80%;" src="./static/image.jpg">
</center>
<br>
Support Group - <a href="https://t.me/+Ng1axYLNyBAyYTRi">Telegram</a> <br/>


### Interview Questions
- [What the difference between TABLE & VIEW ?](#table_and_view)
- [What the difference between WHERE & HAVING ?](#where_and_having)
- [What the difference between UNION & UNION ALL ?](#union_and_union_all)
- [What the difference between JOIN and SUB QUERY ?](#join_and_subquery)
- [What the difference between AGGREGATE and SCALAR functions?](#aggregate_and_scalar)
- [What is WINDOW functions?](#window_functions)
- [What the difference between IN and EXISTS ?](#in_and_exists)
- [What is PRIMARY KEY?](#primary_key)
- [What is UNIQUE KEY?](#unique_key)
- [What the difference between TYPE & DOMAIN ?](#type_and_domain)
- [What the difference between PROCEDURE & FUNCTIONS ?](#procedure_and_function)
- [What is TRIGGERS?](#triggers)
- [What the difference between DELETE & TRUNCATE & DROP?](#delete_and_drop_drop)
- [What is CONSTRAINT?](#constraint)
- [What is STATEMENTS?](#statements)
- [What is PREPARED?](#prepared)


# Interview Questions

## table_and_view
```sql
-- Physical Storage: 
    --- A table is a database object that physically stores data in rows and columns. 
    -- It's where the actual data resides.

-- Data Manipulation: 
    -- You can directly insert, update, delete, and select data in a table.

-- Structure and Data: 
    -- Tables define the structure of the data (schema) and also hold the data itself.

-- Performance: 
    -- Operations on tables can be more performant for large data sets, 
        -- as they involve direct data access.

-- Persistence: 
    --Data in tables is persistent until explicitly changed or deleted.


-- Create the 'Employees' table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert data into the 'Employees' table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department)
VALUES
(1, 'John', 'Doe', 'IT'),
(2, 'Jane', 'Smith', 'HR'),
(3, 'Jim', 'Brown', 'Finance');

-- View
-- Virtual Table:
    -- A view is a virtual table created by a query joining one or more tables.
    -- It does not store data physically; it's a stored query.

-- Dynamic Representation:
    -- Views provide a dynamic result set. When the data in the underlying tables changes,
    -- the data presented by the view automatically changes to reflect this.

-- Read-Only (Typically):
    -- While some views are updatable,
    -- they are generally used for read-only purposes.
    -- You can query a view just like a table, but updates are typically 
    -- done on the underlying tables.

-- Security and Simplification:
    -- Views can be used to restrict access to certain data 
    -- within tables or to simplify complex queries by encapsulating them in a view.

-- Now, let's create a view named IT_Department_Employees 
    -- to display only the employees who work in the IT department:


-- Create a view to select only IT department employees
CREATE VIEW IT_Department_Employees AS
SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE Department = 'IT';


-- Select all records from the view
SELECT * FROM IT_Department_Employees;

-- Key Differences:
-- Data Storage: Tables physically store data; views do not.
-- Purpose: Tables are used to keep and manipulate data;
    -- views are used to present data in a particular format or filter.
```

## where_and_having
```sql
-- WHERE Clause

-- Usage: The WHERE clause is used to filter rows based on specified conditions
    -- before any groupings are made. It acts on individual rows of a table.

-- Context: It is commonly used in SELECT, UPDATE, and DELETE statements.

-- example 
-- This query selects all employees from the Employees table who work in the IT department.
SELECT * FROM Employees WHERE Department = 'IT';

-- HAVING Clause

-- Usage: The HAVING clause is used to filter groups based on specified 
    -- conditions after the groupings are made (usually with GROUP BY).

-- Context: It is used exclusively with the SELECT statement, 
    -- particularly in conjunction with the GROUP BY clause.

-- Functionality: The HAVING clause filters groups after aggregate functions are applied. 
    -- It can only be used with aggregate functions.

-- example: This query selects departments from the Employees table that have more than 5 employees.

SELECT Department, COUNT(*) FROM Employees GROUP BY Department HAVING COUNT(*) > 5;

-- Key differences

-- Point of Action: 
    -- WHERE filters individual rows before grouping, while HAVING filters groups after grouping.

    -- Aggregate Functions: WHERE cannot be used with aggregate functions, 
        -- but HAVING is specifically designed for use with them.

    -- Necessity of GROUP BY: WHERE does not require GROUP BY, 
        --but HAVING is usually used in conjunction with GROUP BY.
```

## union_and_union_all

```sql
-- UNION

-- Distinct Results: The UNION operator combines the result sets of multiple 
    -- queries and returns only distinct rows in the final result set. 
        -- It eliminates duplicate rows.

-- Performance: Since UNION removes duplicates, it may have a slight performance overhead 
    -- as it needs to check for duplicates.

-- example: The result set will contain unique values from payment1 from both payment1 and payment2.

SELECT * FROM payments1 UNION SELECT * FROM payments2;

-- UNION ALL

-- All Rows: The UNION ALL operator combines the result sets of multiple 
    -- queries and returns all rows, including duplicates. It does not 
        -- eliminate duplicate rows.

-- Performance: UNION ALL is generally faster than UNION because it doesn't 
    -- need to check for duplicates.

-- example: The result set will contain all rows from  from both payment1 and payment2, including duplicates.
SELECT * FROM payments1 UNION ALL SELECT * FROM payments2;


-- Key differences
-- UNION: returns distinct rows (no duplicates),
    -- while UNION ALL returns all rows (including duplicates).

-- UNION: may have a performance overhead due to duplicate elimination, 
    -- while UNION ALL is generally faster because it doesn't remove duplicates.
```

## join_and_subquery

```sql
-- Joins

-- Joins are used to combine rows from two or more tables 
    -- based on a related column between them.

-- Syntax: Joins are typically used in the FROM clause 
    -- of a SQL query, and you specify the join conditions using keywords like 
    -- INNER JOIN, LEFT JOIN, RIGHT JOIN, or FULL JOIN.

-- Performance: Joins are often more efficient than sub queries for 
    -- joining large datasets because they allow the database to optimize 
    --the query execution plan.

-- Readability: Joins can sometimes result in more readable and concise SQL queries, 
    -- especially for complex queries that involve multiple tables.

    -- example: Suppose you have two tables, "Customers" and "Orders," and you want to find the names of customers who have placed orders:

SELECT Customers.CustomerName FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Sub queries (also known as Nested Queries or Inline Queries):

-- Nested Queries: Sub queries are queries embedded within another query.
    
-- They are used to retrieve data that will be used in the main query's conditions 
    -- or as part of the main query's SELECT list.

-- Syntax: Sub queries are enclosed within parentheses and can appear 
    -- in various parts of a SQL query, such as the WHERE clause, FROM clause, or SELECT clause.

-- Performance: Sub queries can have performance overhead, especially if 
    -- they are correlated sub queries (sub queries that reference columns from the outer query). 
    -- They are evaluated for each row in the outer query.

-- Use Cases: Sub queries are useful when you need to perform 
    -- an operation or condition on data from one table based on the results of another query. 
    -- They are also handy when you want to retrieve a single value or a small set of values to use in the main query.

-- example:
SELECT CustomerName FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM Orders);

```

## aggregate_and_scalar
```sql
-- Aggregate Functions

-- Aggregate functions and scalar functions are two types of functions in SQL,
    -- and they serve different purposes

-- Summary Functions: 
    -- Aggregate functions perform operations on sets of values and 
        -- return a single value that summarizes the data in some way.

-- Applied to Multiple Rows: 
    -- They are applied to multiple rows of a column and operate on a
        -- group of values.

-- Used with GROUP BY: Aggregate functions are commonly used in conjunction 
    -- with the GROUP BY clause to group rows into sets and perform aggregate 
        -- operations within each group.


-- Examples: Common aggregate functions include SUM, COUNT, AVG, MAX, and MIN.
SELECT Department, SUM(Salary) AS TotalSalary FROM Employees GROUP BY Department;

-- Scalar Functions

-- Scalar functions operate on a single value or expression and 
    -- return a single value as a result.

-- Applied to Individual Values: 
    -- They are applied to individual values within a row.

-- No GROUP BY Required: Scalar functions do not require 
    -- the use of GROUP BY and are typically used within SELECT statements 
    -- to manipulate or transform data at the row level.

-- Examples: Scalar functions include functions for string manipulation 
    -- (e.g., CONCAT, LENGTH), date and time manipulation (e.g., DATEADD, DATEDIFF), 
    -- and mathematical operations (e.g., ROUND, ABS).

SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Employees;
```

## window_functions
```sql
-- Window functions, also known as analytic functions or 

-- windowed functions, are a category of SQL functions that perform calculations

-- across a set of rows related to the current row within the result set of a query. 

-- These functions allow you to perform calculations and aggregations while maintaining 

-- the individual row-level details. Window functions are typically used in SELECT queries

-- to add additional columns to the result set based on computations involving rows within

-- a "window" of rows.

-- Unlike aggregate functions (e.g., SUM, AVG) used with GROUP BY, 

-- window functions do not group rows; instead, they operate on each row 

-- individually within its window.


SELECT
    SalespersonName,
    Year,
    SalesAmount,
    SUM(SalesAmount) OVER (PARTITION BY Year) AS TotalSalesInYear,
    RANK() OVER (PARTITION BY Year ORDER BY SalesAmount DESC) AS RankInYear
FROM Sales;


-- 1. SalespersonName, Year, SalesAmount: These columns are selected directly from the Sales table. 
    -- They show the name of the salesperson, the year, and the sales amount for each record.

-- 2. SUM(SalesAmount) OVER (PARTITION BY Year) AS TotalSalesInYear: This is a window function 
    -- that calculates the total sales for each year. The PARTITION BY Year clause means the sum is calculated separately 
    -- for each year. So, for each record, it shows the total sales of all salespersons for that year.

-- 3. RANK() OVER (PARTITION BY Year ORDER BY SalesAmount DESC) AS RankInYear: 
    -- This is another window function that ranks the salespersons within each year based on their sales amount (SalesAmount). 
    -- The ORDER BY SalesAmount DESC clause means that the ranking is done in descending order of sales amount, 
    -- so the salesperson with the highest sales in a year gets rank 1.

### Sales Table

| SalespersonName | Year | SalesAmount |
|-----------------|------|-------------|
| Alice           | 2020 | 5000        |
| Bob             | 2020 | 7000        |
| Charlie         | 2020 | 4000        |
| Alice           | 2021 | 6000        |
| Bob             | 2021 | 5000        |
| Charlie         | 2021 | 8000        |

### Resulting Data After Query

| SalespersonName | Year | SalesAmount | TotalSalesInYear | RankInYear |
|-----------------|------|-------------|------------------|------------|
| Alice           | 2020 | 5000        | 16000            | 2          |
| Bob             | 2020 | 7000        | 16000            | 1          |
| Charlie         | 2020 | 4000        | 16000            | 3          |
| Alice           | 2021 | 6000        | 19000            | 2          |
| Bob             | 2021 | 5000        | 19000            | 3          |
| Charlie         | 2021 | 8000        | 19000            | 1          |
```


## in_and_exists
```sql
-- IN clause

-- Purpose: The IN clause is used to filter the results of a query based on a list of specified values. 
    -- It checks if a value in a column matches any value in a list or a subquery.

-- Usage: It's commonly used to compare a single column against multiple values.

-- Performance: When using IN with a subquery, the subquery is executed once and the 
    -- list of values is compared for each row in the outer query. This can be less efficient
    -- if the list is very large.

-- example:
SELECT * FROM Employees WHERE DepartmentID IN (1, 2, 3);

-- Purpose: The EXISTS clause is used to test for the existence of any records 
    -- in a subquery. It returns TRUE if the subquery returns one or more records.

-- Usage:  It's often used with correlated subqueries, where the subquery refers to a column 
    -- in the outer query.

-- Performance: EXISTS can be more efficient in cases of correlated 
    -- subqueries because it stops processing as soon as it finds a matching record. 
    -- It doesn't have to scan all records.

-- example: This query selects all employees who have made at least one sale.
SELECT * FROM Employees E WHERE EXISTS 
(SELECT 1 FROM Sales S WHERE S.EmployeeID = E.ID);
```

## primary_key
```sql
-- A PRIMARY KEY in a database is a fundamental concept used to uniquely 

-- identify each record in a table. It's a type of database constraint that 

-- ensures the uniqueness and integrity of the data in a column or a group of columns. 

-- Here are some key aspects of primary keys.
    -- Unique Identifier.
    -- Each record in the table can be uniquely identified 
        -- by the value in the primary key column or set of columns.
        -- No two rows in a table can have the same primary key value.

    -- Most database systems automatically create an index on the primary key to speed 
        -- up data retrieval. This index is used for faster access to data rows and helps in 
        --efficient query performance.
    
    -- Foreign Key Relationships
        -- A primary key often plays a critical role in relationships between tables. 
            -- In relational databases, a foreign key in one table points to a primary key in another table, 
            -- establishing a link between the two tables.

-- Importance:
    -- Data Integrity: Ensures each record is unique and identifiable.
    -- Performance: Improves query performance through indexing.
    -- Relationships: Enables relational database design by linking tables through foreign keys.

-- example:
    CREATE TABLE Students (
        StudentID int NOT NULL,
        Name varchar(255) NOT NULL,
        Age int,
        PRIMARY KEY (StudentID)
    );
```

## unique_key
```sql
-- A UNIQUE KEY in SQL is a constraint that enforces the uniqueness of the values in a 
    -- column or a set of columns within a database table. This means that no two rows in 
    -- the table can have the same value for the columns that are declared as a UNIQUE KEY. 
    -- Here are some important aspects of the UNIQUE KEY constraint.

-- Uniqueness
    -- The UNIQUE KEY constraint ensures that all values in the column are distinct. 
    -- No duplicate values are allowed in the column or combination of columns on which 
    -- the UNIQUE KEY is defined.

-- Difference from Primary Key
    -- While both PRIMARY KEY and UNIQUE KEY constraints enforce uniqueness, 
    -- there are key differences.

    -- A table can have multiple UNIQUE KEYs, but only one PRIMARY KEY.
    -- The PRIMARY KEY doesn't allow NULL values, but a UNIQUE KEY can allow NULL values. 
    -- However, this can vary with database systems; some systems allow only one NULL value in a 
    -- UNIQUE KEY column.

-- Indexing
    -- Like the PRIMARY KEY, a UNIQUE KEY also creates an index on the column or set of columns. 
    -- This index is used to enforce the uniqueness constraint and can also improve the speed of data retrieval.

-- example:
-- You can define a UNIQUE KEY constraint when you create a table or add it to an existing table.
-- Here's an example of defining a UNIQUE KEY in a CREATE TABLE statement:
-- In this example, Email is set as a UNIQUE KEY. This means no two employees can have the same email address.

CREATE TABLE Employees (
    EmployeeID int NOT NULL,
    Email varchar(255),
    Name varchar(255),
    PRIMARY KEY (EmployeeID),
    UNIQUE KEY (Email)
);
```

#### type_and_domain
```sql
--  In SQL, a "type" refers to a data type or data category that specifies 
-- what kind of data can be stored in a column. Common SQL data types include INTEGER, 
-- VARCHAR, DATE, BOOLEAN, etc.

-- Types enforce basic data validation rules. For example, if a column is of type INTEGER, 
-- it will only allow integer values, and attempting to insert non-integer values will result in an error.

-- In some database systems, particularly those that support user-defined data types 
-- (e.g., PostgreSQL), a "domain" can refer to a user-defined data type that encapsulates a set of constraints.

-- example
-- In this example, a domain called EmailAddress is defined as a VARCHAR(255) 
-- type with a regular expression check for valid email addresses.

CREATE DOMAIN EmailAddress AS VARCHAR(255)
CHECK (VALUE ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$');
```

## procedure_and_function
```sql
-- In SQL both procedures and functions are database objects that contain a set of SQL statements that can be executed. 
-- However, they have some key differences in terms of their purpose and behavior.
-- We can use it with EXECUTE or CALL or SELECT.

CREATE OR REPLACE FUNCTION sp_UpdateEmployeeSalary(
    EmployeeID INT,
    NewSalary DECIMAL(10, 2)
) RETURNS VOID AS $$
BEGIN
    UPDATE Employees
    SET Salary = NewSalary
    WHERE EmployeeID = EmployeeID;
END;
$$ LANGUAGE plpgsql;

SELECT sp_UpdateEmployeeSalary(1, 55000.00);

-- A function in SQL is primarily used to compute and return a single value based on input parameters.
-- it is designed to be used within SQL queries to calculate values that can be part of the result set.
-- Functions cannot control transactions or perform data modification operations. They are read-only.

-- example:
CREATE FUNCTION fn_CalculateTotalPrice
(@ProductID INT, @Quantity INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Price DECIMAL(10, 2);
    SELECT @Price = UnitPrice FROM Products WHERE ProductID = @ProductID;
    RETURN @Price * @Quantity;
END;

-- Purpose: Procedures are used for performing actions and may or 
-- may not return values, while functions are used for calculations 
-- and must return a single value.

-- Usage in Queries: Functions can be used directly in SQL queries to calculate values, 
-- while procedures are not directly used in queries.

-- Return Value: Procedures return values through output parameters or status codes, 
-- while functions return values explicitly.

-- Transaction Control: Procedures can control transactions, but functions cannot.
```

## triggers
```sql
-- In SQL, a trigger is a database object that automatically executes a set 
-- of SQL statements or procedures in response to a specific event or condition that occurs in the database. 
-- Triggers are used to enforce data integrity, automate tasks, and maintain consistency in the database.

-- Event-Driven: Triggers are event-driven, which means they are executed automatically when a predefined event occurs. 
-- These events can include data modification actions like INSERT, UPDATE, DELETE, or specific database events such as logon or logoff.

-- Row-Level Triggers: These triggers are executed once for each affected row in a data modification operation. They can access and manipulate data in the affected row.
-- Statement-Level Triggers: These triggers are executed once for the entire data modification statement. They cannot access individual rows but can perform actions based on the statement as a whole.

-- Use cases
-- Auditing changes to data (e.g., logging changes to a history table).
-- Implementing complex business rules or data validation.
-- Sending notifications or alerts based on data changes.


-- Create the Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATE
);

-- Create the PaymentHistory table to log payment history
CREATE TABLE PaymentHistory (
    PaymentHistoryID INT PRIMARY KEY,
    PaymentID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentStatus VARCHAR(50)
);

-- Create a trigger to validate payment amount
CREATE TRIGGER ValidatePaymentAmount
ON Payments
BEFORE INSERT
AS
BEGIN
    DECLARE @PaymentAmount DECIMAL(10, 2);
    SELECT @PaymentAmount = PaymentAmount FROM INSERTED;
    
    IF @PaymentAmount < 0
    BEGIN
        ROLLBACK; -- Cancel the insert operation if payment amount is negative
        RAISEERROR('Payment amount cannot be negative', 16, 1);
    END
END;

-- Create a trigger to log payment history
CREATE TRIGGER LogPaymentHistory
ON Payments
AFTER INSERT
AS
BEGIN
    INSERT INTO PaymentHistory (PaymentID, PaymentAmount, PaymentDate, PaymentStatus)
    SELECT PaymentID, PaymentAmount, PaymentDate, 'Successful'
    FROM INSERTED;
END;

-- Example INSERT statement that will trigger the above triggers
INSERT INTO Payments (PaymentID, CustomerID, PaymentAmount, PaymentDate)
VALUES (1, 101, 100.00, '2023-11-20');
```

## delete_and_drop_drop
```sql
-- The DELETE statement is used to remove specific rows from a table that meet 
    -- a specified condition.

-- DELETE operates at the row level, allowing you to delete individual rows 
    -- or a subset of rows based on a condition.

-- DELETE can be executed within a transaction. You can use a ROLLBACK statement 
    --to undo the changes made by a DELETE if it is executed as part of a transaction.

-- example
DELETE FROM Employees WHERE EmployeeID = 1001;

-- The DROP statement is used to delete an entire database object, 
    -- such as a table, view, index, or even an entire database.

-- DROP operates at the object level and removes the entire 
    -- object along with all of its data.

-- DROP is a DDL (Data Definition Language) command and cannot be executed within a transaction. 
    -- It is an irreversible operation.

-- example
DROP TABLE Employees;

-- The TRUNCATE statement is used to remove all rows from a table quickly,
    -- effectively emptying the table.

-- TRUNCATE is not typically executed within a transaction. 
    -- It is a minimally logged operation and cannot be rolled back. 
    -- Once executed, the data is permanently removed.

-- TRUNCATE is generally faster than DELETE for removing all 
    -- rows from a table because it doesn't generate individual row delete statements.

-- example
TRUNCATE TABLE Employees;
```


## constraint
```sql
-- In SQL, a constraint is a rule or condition that is enforced on a database table to ensure the accuracy, 
-- integrity, and consistency of the data stored in the table. Constraints define limits or 
-- requirements that data in a table must meet, and they help maintain the quality and reliability of the database. 
-- There are several types of constraints in SQL, including.

-- Primary Key Constraint
    -- Ensures that each row in a table has a unique identifier (primary key).
    -- Guarantees that the primary key column(s) have no duplicate values.
    -- Automatically enforces data integrity and provides a way to uniquely identify rows.

-- Unique Constraint
    -- Ensures that the values in a column (or a set of columns) are unique across all rows in the table.
    -- Prevents duplicate values in the specified column(s).

-- Check Constraint
    -- Defines a condition that data in a column must satisfy.
    -- Ensures that data added or modified in the column adheres to the specified condition.
    -- For example, you can use a check constraint to ensure that values in a 
    -- "Price" column are always positive.

-- Foreign Key Constraint
    -- Establishes a relationship between two tables by linking a column in one table (the child table) 
    -- to the primary key column in another table (the parent table).

    -- Ensures referential integrity by preventing actions that would violate the relationship, 
    -- such as deleting a parent record that is referenced by a child record.


-- example;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Age INT CHECK (Age >= 18),
    RegistrationDate DATE DEFAULT CURRENT_DATE
);
```

## statements
```sql
-- SQL (Structured Query Language) is a powerful language used for 
-- managing and manipulating relational databases. SQL includes a variety of statements that can be 
-- categorized into several groups based on their functionality.


-- Data Query Language (DQL) Statements:
    -- SELECT: Retrieves data from one or more tables.
    -- FROM: Specifies the table(s) from which to retrieve data.
    -- WHERE: Filters data based on specified conditions.
    -- GROUP BY: Groups rows based on specified columns.
    -- HAVING: Filters grouped data based on conditions.
    -- ORDER BY: Sorts the result set based on specified columns.
    -- LIMIT/TOP: Limits the number of rows returned.

-- Data Manipulation Language (DML) Statements:
    -- INSERT INTO: Adds new rows to a table.
    -- UPDATE: Modifies existing data in a table.
    -- DELETE FROM: Removes rows from a table.

-- Data Definition Language (DDL) Statements:
    -- CREATE TABLE: Defines a new table's structure.
    -- ALTER TABLE: Modifies an existing table's structure.
    -- CREATE INDEX: Creates an index on one or more columns for faster data retrieval.
    -- DROP INDEX: Deletes an index.

-- Data Control Language (DCL) Statements:
    -- GRANT: Gives specific privileges to users or roles.
    -- REVOKE: Removes specific privileges from users or roles.

-- Transaction Control Statements:
    -- BEGIN/START TRANSACTION: Begins a new transaction.
    -- COMMIT: Saves changes made during a transaction.
    -- ROLLBACK: Undoes changes made during a transaction.
    -- SAVEPOINT: Sets a savepoint within a transaction.
    -- ROLLBACK TO: Rolls back to a specific savepoint.

-- Other Statements:
    -- USE: Specifies the database to use (database-specific).
    -- SHOW DATABASES/SHOW TABLES: Lists databases or tables (database-specific).
    -- SET: Sets session-specific variables (database-specific).
```

## prepared
```sql
-- In SQL, the PREPARE statement is used to prepare and precompile an SQL statement for execution. 
-- It is often used in conjunction with dynamic SQL to improve performance and security. 
-- Here's how the PREPARE statement works and its main purposes:


-- Preparing SQL Statements
    -- When you use dynamic SQL, you may construct SQL statements 
    -- dynamically based on runtime conditions or user inputs. 
    --These dynamic SQL statements can vary in structure.

-- Security and SQL Injection Prevention
    -- Using prepared statements with parameter binding helps prevent 
    -- SQL injection attacks because the bound values are treated as data 
    -- and not as executable SQL code. This makes it difficult for attackers 
    -- to inject malicious SQL code.


-- Declare a prepared statement with a parameter
PREPARE my_statement (text) AS
    SELECT * FROM Customers WHERE Country = $1;

-- Execute the prepared statement with a parameter value
-- This can be done multiple times with different values
EXECUTE my_statement('USA');

-- Execute the prepared statement with a different parameter value
EXECUTE my_statement('Canada');
```
