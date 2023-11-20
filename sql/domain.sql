-- In some database systems, particularly those that support user-defined data types 
-- (e.g., PostgreSQL), a "domain" can refer to a user-defined data type that encapsulates a set of constraints.

-- example
-- In this example, a domain called EmailAddress is defined as a VARCHAR(255) 
-- type with a regular expression check for valid email addresses.

CREATE DOMAIN EmailAddress AS VARCHAR(255)
CHECK (VALUE ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$');
