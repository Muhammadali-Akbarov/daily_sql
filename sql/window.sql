-- Window functions, also known as analytic functions or 

-- windowed functions, are a category of SQL functions that perform calculations

-- across a set of rows related to the current row within the result set of a query. 

-- These functions allow you to perform calculations and aggregations while maintaining 

-- the individual row-level details. Window functions are typically used in SELECT queries

-- to add additional columns to the result set based on computations involving rows within

-- a "window" of rows.

-- Unlike aggregate functions (e.g., SUM, AVG) used with GROUP BY, 

-- window functions do not group rows; instead, they operate on each row 

-- individually within its window.


SELECT
    SalespersonName,
    Year,
    SalesAmount,
    SUM(SalesAmount) OVER (PARTITION BY Year) AS TotalSalesInYear,
    RANK() OVER (PARTITION BY Year ORDER BY SalesAmount DESC) AS RankInYear
FROM Sales;


-- 1. SalespersonName, Year, SalesAmount: These columns are selected directly from the Sales table. 
    -- They show the name of the salesperson, the year, and the sales amount for each record.

-- 2. SUM(SalesAmount) OVER (PARTITION BY Year) AS TotalSalesInYear: This is a window function 
    -- that calculates the total sales for each year. The PARTITION BY Year clause means the sum is calculated separately 
    -- for each year. So, for each record, it shows the total sales of all salespersons for that year.

-- 3. RANK() OVER (PARTITION BY Year ORDER BY SalesAmount DESC) AS RankInYear: 
    -- This is another window function that ranks the salespersons within each year based on their sales amount (SalesAmount). 
    -- The ORDER BY SalesAmount DESC clause means that the ranking is done in descending order of sales amount, 
    -- so the salesperson with the highest sales in a year gets rank 1.
