-- In SQL, a constraint is a rule or condition that is enforced on a database table to ensure the accuracy, 
-- integrity, and consistency of the data stored in the table. Constraints define limits or 
-- requirements that data in a table must meet, and they help maintain the quality and reliability of the database. 
-- There are several types of constraints in SQL, including.

-- Primary Key Constraint
    -- Ensures that each row in a table has a unique identifier (primary key).
    -- Guarantees that the primary key column(s) have no duplicate values.
    -- Automatically enforces data integrity and provides a way to uniquely identify rows.

-- Unique Constraint
    -- Ensures that the values in a column (or a set of columns) are unique across all rows in the table.
    -- Prevents duplicate values in the specified column(s).

-- Check Constraint
    -- Defines a condition that data in a column must satisfy.
    -- Ensures that data added or modified in the column adheres to the specified condition.
    -- For example, you can use a check constraint to ensure that values in a 
    -- "Price" column are always positive.

-- Foreign Key Constraint
    -- Establishes a relationship between two tables by linking a column in one table (the child table) 
    -- to the primary key column in another table (the parent table).

    -- Ensures referential integrity by preventing actions that would violate the relationship, 
    -- such as deleting a parent record that is referenced by a child record.


-- example;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Age INT CHECK (Age >= 18),
    RegistrationDate DATE DEFAULT CURRENT_DATE
);
