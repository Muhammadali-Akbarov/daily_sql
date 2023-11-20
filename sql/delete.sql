-- The DELETE statement is used to remove specific rows from a table that meet 
    -- a specified condition.

-- DELETE operates at the row level, allowing you to delete individual rows 
    -- or a subset of rows based on a condition.

-- DELETE can be executed within a transaction. You can use a ROLLBACK statement 
    --to undo the changes made by a DELETE if it is executed as part of a transaction.

-- example
DELETE FROM Employees WHERE EmployeeID = 1001;
