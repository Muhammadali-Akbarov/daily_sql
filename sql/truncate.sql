-- The TRUNCATE statement is used to remove all rows from a table quickly,
    -- effectively emptying the table.

-- TRUNCATE is not typically executed within a transaction. 
    -- It is a minimally logged operation and cannot be rolled back. 
    -- Once executed, the data is permanently removed.

-- TRUNCATE is generally faster than DELETE for removing all 
    -- rows from a table because it doesn't generate individual row delete statements.

-- example
TRUNCATE TABLE Employees;
