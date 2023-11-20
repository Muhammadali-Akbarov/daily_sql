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
