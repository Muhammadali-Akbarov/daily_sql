-- Active: 1691742045888@@127.0.0.1@5432@interview
-- WHERE Clause

-- Usage: The WHERE clause is used to filter rows based on specified conditions
    -- before any groupings are made. It acts on individual rows of a table.

-- Context: It is commonly used in SELECT, UPDATE, and DELETE statements.

-- example 
-- This query selects all employees from the Employees table who work in the IT department.
SELECT * FROM Employees WHERE Department = 'IT';