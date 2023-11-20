-- A function in SQL is primarily used to compute and return a single value based on input parameters.
-- it is designed to be used within SQL queries to calculate values that can be part of the result set.
-- Functions cannot control transactions or perform data modification operations. They are read-only.

-- example:
CREATE FUNCTION fn_CalculateTotalPrice
(@ProductID INT, @Quantity INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Price DECIMAL(10, 2);
    SELECT @Price = UnitPrice FROM Products WHERE ProductID = @ProductID;
    RETURN @Price * @Quantity;
END;
