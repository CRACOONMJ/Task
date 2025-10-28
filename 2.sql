SELECT * FROM try.onlinesalesdata;

-- 1.count total transaction
select count(*) as total_transaction
from try.onlinesalesdata;

-- 2. list of unique product 
SELECT DISTINCT`Product Category`
FROM try.onlinesalesdata;

-- 3. list of unique product 
SELECT sum(`Total Revenue`) as total_revenue
FROM try.onlinesalesdata;

-- 4. revenue by product category 
SELECT `Product Category` , SUM(`Total Revenue`) as total_revune
FROM try.onlinesalesdata
GROUP BY `Product Category` 
ORDER BY total_revune DESC;

-- 5.MONTHALY Revenue Trend 
 SELECT
    EXTRACT(YEAR FROM Date) AS year,
    EXTRACT(MONTH FROM Date) AS month,
    SUM(`Total Revenue`) AS Monthly_Revenue
FROM try.onlinesalesdata
GROUP BY EXTRACT(YEAR FROM Date), EXTRACT(MONTH FROM Date)
ORDER BY year, month;

-- .6.top selling product
SELECT `Product Name`, SUM(`Total Revenue`) AS product_revenue
FROM try.onlinesalesdata
GROUP BY `Product Name`
ORDER BY product_revenue DESC
LIMIT 10;

-- 7.most unit sold
SELECT `Product Name`, SUM(`Units Sold`) AS total_units
FROM try.onlinesalesdata
GROUP BY `Product Name`
ORDER BY total_units DESC
LIMIT 10;

-- 8.revune by region
SELECT Region, SUM(`Total Revenue`) AS region_revenue
FROM try.onlinesalesdata
GROUP BY Region
ORDER BY region_revenue DESC;

-- 9.Payment method usage by region
SELECT Region, `Payment Method`, COUNT(*) AS method_count
FROM try.onlinesalesdata
GROUP BY Region, `Payment Method`
ORDER BY Region, method_count DESC;

-- 10.Transactions in Q1 2024
SELECT * FROM try.onlinesalesdata
WHERE Date BETWEEN '01-01-2024' AND '31-03-2024';


-- 11. Average revenue per transaction
SELECT AVG(`Total Revenue`) AS avg_transaction_revenue 
FROM try.onlinesalesdata;

-- 12.Volume of orders per month
SELECT
  EXTRACT(YEAR FROM Date) AS year,
  EXTRACT(MONTH FROM Date) AS month,
  COUNT(DISTINCT `Transaction ID`) AS order_volume
FROM try.onlinesalesdata
GROUP BY EXTRACT(YEAR FROM Date),EXTRACT(MONTH FROM Date)
ORDER BY year, month;

-- 13. Best-selling product per category
SELECT `Product Category`, `Product Name`, SUM(`Units Sold`) AS units
FROM try.onlinesalesdata
GROUP BY `Product Category`, `Product Name`
ORDER BY `Product Category`DESC, units DESC;

-- 14.Products with revenue over 1000
SELECT `Product Name`, SUM(`Total Revenue`) AS revenue
FROM try.onlinesalesdata
GROUP BY `Product Name`
HAVING revenue > 1000
ORDER BY revenue DESC;

-- 15.Monthly Revenue and distinct tranction happend
SELECT
    EXTRACT(YEAR FROM Date) AS order_year,
    EXTRACT(MONTH FROM Date) AS order_month,
    SUM(`Total Revenue`) AS total_monthly_revenue,
    COUNT(DISTINCT `Transaction ID`) AS total_orders
FROM
    try.onlinesalesdata
WHERE
    Date BETWEEN '01-01-2024' AND '30-06-2024'  -- ⏳ Limit to specific time period
GROUP BY
    EXTRACT(YEAR FROM Date),
    EXTRACT(MONTH FROM Date)
ORDER BY
    order_year ASC,
    order_month ASC;
    
    select* from try.onlinesalesdata