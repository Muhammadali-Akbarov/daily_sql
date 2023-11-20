-- A PRIMARY KEY in a database is a fundamental concept used to uniquely 

-- identify each record in a table. It's a type of database constraint that 

-- ensures the uniqueness and integrity of the data in a column or a group of columns. 

-- Here are some key aspects of primary keys.
    -- Unique Identifier.
    -- Each record in the table can be uniquely identified 
        -- by the value in the primary key column or set of columns.
        -- No two rows in a table can have the same primary key value.

    -- Most database systems automatically create an index on the primary key to speed 
        -- up data retrieval. This index is used for faster access to data rows and helps in 
        --efficient query performance.
    
    -- Foreign Key Relationships
        -- A primary key often plays a critical role in relationships between tables. 
            -- In relational databases, a foreign key in one table points to a primary key in another table, 
            -- establishing a link between the two tables.

-- Importance:
    -- Data Integrity: Ensures each record is unique and identifiable.
    -- Performance: Improves query performance through indexing.
    -- Relationships: Enables relational database design by linking tables through foreign keys.

-- example:
    CREATE TABLE Students (
        StudentID int NOT NULL,
        Name varchar(255) NOT NULL,
        Age int,
        PRIMARY KEY (StudentID)
    );
