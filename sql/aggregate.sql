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
