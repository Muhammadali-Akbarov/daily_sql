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
