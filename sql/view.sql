-- Active: 1691742045888@@127.0.0.1@5432@interview@public
-- View
-- Virtual Table:
    -- A view is a virtual table created by a query joining one or more tables.
    -- It does not store data physically; it's a stored query.

-- Dynamic Representation:
    -- Views provide a dynamic result set. When the data in the underlying tables changes,
    -- the data presented by the view automatically changes to reflect this.

-- Read-Only (Typically):
    -- While some views are updatable,
    -- they are generally used for read-only purposes.
    -- You can query a view just like a table, but updates are typically 
    -- done on the underlying tables.

-- Security and Simplification:
    -- Views can be used to restrict access to certain data 
    -- within tables or to simplify complex queries by encapsulating them in a view.

-- Now, let's create a view named IT_Department_Employees 
    -- to display only the employees who work in the IT department:


-- Create a view to select only IT department employees
CREATE VIEW IT_Department_Employees AS
SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE Department = 'IT';


-- Select all records from the view
SELECT * FROM IT_Department_Employees;
