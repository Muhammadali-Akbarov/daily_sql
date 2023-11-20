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
