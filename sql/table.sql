-- Physical Storage: 
    --- A table is a database object that physically stores data in rows and columns. 
    -- It's where the actual data resides.

-- Data Manipulation: 
    -- You can directly insert, update, delete, and select data in a table.

-- Structure and Data: 
    -- Tables define the structure of the data (schema) and also hold the data itself.

-- Performance: 
    -- Operations on tables can be more performant for large data sets, 
        -- as they involve direct data access.

-- Persistence: 
    --Data in tables is persistent until explicitly changed or deleted.


-- Create the 'Employees' table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert data into the 'Employees' table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department)
VALUES
(1, 'John', 'Doe', 'IT'),
(2, 'Jane', 'Smith', 'HR'),
(3, 'Jim', 'Brown', 'Finance');

