-- Active: 1691742045888@@127.0.0.1@5432@interview
-- IN clause

-- Purpose: The IN clause is used to filter the results of a query based on a list of specified values. 
    -- It checks if a value in a column matches any value in a list or a subquery.

-- Usage: It's commonly used to compare a single column against multiple values.

-- Performance: When using IN with a subquery, the subquery is executed once and the 
    -- list of values is compared for each row in the outer query. This can be less efficient
    -- if the list is very large.

-- example:
SELECT * FROM Employees WHERE DepartmentID IN (1, 2, 3);
