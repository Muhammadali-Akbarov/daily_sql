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
