-- In SQL both procedures and functions are database objects that contain a set of SQL statements that can be executed. 
-- However, they have some key differences in terms of their purpose and behavior.
-- We can use it with EXECUTE or CALL or SELECT.

CREATE OR REPLACE FUNCTION sp_UpdateEmployeeSalary(
    EmployeeID INT,
    NewSalary DECIMAL(10, 2)
) RETURNS VOID AS $$
BEGIN
    UPDATE Employees
    SET Salary = NewSalary
    WHERE EmployeeID = EmployeeID;
END;
$$ LANGUAGE plpgsql;

SELECT sp_UpdateEmployeeSalary(1, 55000.00);
