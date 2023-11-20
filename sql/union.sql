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
