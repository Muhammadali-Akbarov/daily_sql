-- In SQL, a trigger is a database object that automatically executes a set 
-- of SQL statements or procedures in response to a specific event or condition that occurs in the database. 
-- Triggers are used to enforce data integrity, automate tasks, and maintain consistency in the database.

-- Event-Driven: Triggers are event-driven, which means they are executed automatically when a predefined event occurs. 
-- These events can include data modification actions like INSERT, UPDATE, DELETE, or specific database events such as logon or logoff.

-- Row-Level Triggers: These triggers are executed once for each affected row in a data modification operation. They can access and manipulate data in the affected row.
-- Statement-Level Triggers: These triggers are executed once for the entire data modification statement. They cannot access individual rows but can perform actions based on the statement as a whole.

-- Use cases
-- Auditing changes to data (e.g., logging changes to a history table).
-- Implementing complex business rules or data validation.
-- Sending notifications or alerts based on data changes.


-- Create the Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATE
);

-- Create the PaymentHistory table to log payment history
CREATE TABLE PaymentHistory (
    PaymentHistoryID INT PRIMARY KEY,
    PaymentID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentStatus VARCHAR(50)
);

-- Create a trigger to validate payment amount
CREATE TRIGGER ValidatePaymentAmount
ON Payments
BEFORE INSERT
AS
BEGIN
    DECLARE @PaymentAmount DECIMAL(10, 2);
    SELECT @PaymentAmount = PaymentAmount FROM INSERTED;
    
    IF @PaymentAmount < 0
    BEGIN
        ROLLBACK; -- Cancel the insert operation if payment amount is negative
        RAISEERROR('Payment amount cannot be negative', 16, 1);
    END
END;

-- Create a trigger to log payment history
CREATE TRIGGER LogPaymentHistory
ON Payments
AFTER INSERT
AS
BEGIN
    INSERT INTO PaymentHistory (PaymentID, PaymentAmount, PaymentDate, PaymentStatus)
    SELECT PaymentID, PaymentAmount, PaymentDate, 'Successful'
    FROM INSERTED;
END;

-- Example INSERT statement that will trigger the above triggers
INSERT INTO Payments (PaymentID, CustomerID, PaymentAmount, PaymentDate)
VALUES (1, 101, 100.00, '2023-11-20');
