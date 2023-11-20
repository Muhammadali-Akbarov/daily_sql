-- HAVING Clause

-- Usage: The HAVING clause is used to filter groups based on specified 
    -- conditions after the groupings are made (usually with GROUP BY).

-- Context: It is used exclusively with the SELECT statement, 
    -- particularly in conjunction with the GROUP BY clause.

-- Functionality: The HAVING clause filters groups after aggregate functions are applied. 
    -- It can only be used with aggregate functions.

-- example: This query selects departments from the Employees table that have more than 5 employees.

SELECT Department, COUNT(*) FROM Employees GROUP BY Department HAVING COUNT(*) > 5;
