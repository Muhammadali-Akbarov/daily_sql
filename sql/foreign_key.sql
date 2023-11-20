--  A Foreign Key in a database is a key used to link two tables together. 
    -- It is a field (or collection of fields) in one table that refers to the 
    -- PRIMARY KEY in another table. The table containing the foreign key is called 
    -- the child table, and the table containing the candidate key is called the referenced or parent table.

-- Constraints and Actions

-- Cascading Actions: Actions like CASCADE DELETE or CASCADE UPDATE ensure that changes in the parent table 
-- (like deletion or update of a primary key) are automatically reflected in the child table.


-- example: In this example, DepartmentID in the Employees table is a foreign key that references the DepartmentID in the Departments table.
CREATE TABLE Employees (
    EmployeeID int NOT NULL,
    Name varchar(255),
    DepartmentID int,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
