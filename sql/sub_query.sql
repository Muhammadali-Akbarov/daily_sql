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
