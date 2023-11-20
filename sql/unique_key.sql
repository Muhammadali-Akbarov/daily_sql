-- A UNIQUE KEY in SQL is a constraint that enforces the uniqueness of the values in a 
    -- column or a set of columns within a database table. This means that no two rows in 
    -- the table can have the same value for the columns that are declared as a UNIQUE KEY. 
    -- Here are some important aspects of the UNIQUE KEY constraint.

-- Uniqueness
    -- The UNIQUE KEY constraint ensures that all values in the column are distinct. 
    -- No duplicate values are allowed in the column or combination of columns on which 
    -- the UNIQUE KEY is defined.

-- Difference from Primary Key
    -- While both PRIMARY KEY and UNIQUE KEY constraints enforce uniqueness, 
    -- there are key differences.

    -- A table can have multiple UNIQUE KEYs, but only one PRIMARY KEY.
    -- The PRIMARY KEY doesn't allow NULL values, but a UNIQUE KEY can allow NULL values. 
    -- However, this can vary with database systems; some systems allow only one NULL value in a 
    -- UNIQUE KEY column.

-- Indexing
    -- Like the PRIMARY KEY, a UNIQUE KEY also creates an index on the column or set of columns. 
    -- This index is used to enforce the uniqueness constraint and can also improve the speed of data retrieval.

-- example:
-- You can define a UNIQUE KEY constraint when you create a table or add it to an existing table.
-- Here's an example of defining a UNIQUE KEY in a CREATE TABLE statement:
-- In this example, Email is set as a UNIQUE KEY. This means no two employees can have the same email address.

CREATE TABLE Employees (
    EmployeeID int NOT NULL,
    Email varchar(255),
    Name varchar(255),
    PRIMARY KEY (EmployeeID),
    UNIQUE KEY (Email)
);
