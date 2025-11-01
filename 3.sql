SELECT * FROM try.`pizza sale`;

--Each Pizza Count And Each items Revune also top selling 
SELECT pizza_name,SUM(quantity) as Total_qty,
	   SUM(quantity*total_price) as revune
FROM try.`pizza sale`
GROUP BY pizza_name
ORDER BY revune DESC;

--# Most Ordered Products by Quantity
SELECT pizza_name,SUM(quantity) AS Total_orders
FROM try.`pizza sale`
GROUP BY pizza_name
ORDER BY Total_orders DESC;

-- Monthly Sales Trend
SELECT date_format(order_date,'%Y-%m') as monthS,
	   SUM(quantity*unit_price) as monthly_revune
   FROM try.`pizza sale`
   GROUP BY monthS
   ORDER BY monthS;
   
   -- Most Profitable Pizza Type 
   SELECT pizza_category,
           SUM(quantity*unit_price) as monthly_revune
              FROM try.`pizza sale`
              GROUP BY pizza_category
              ORDER BY monthly_revune;
              
	-- Revenue by Size
    SELECT pizza_size,
    SUM(quantity*unit_price) as monthly_revune
    FROM try.`pizza sale`
    GROUP BY pizza_size
    ORDER BY monthly_revune DESC;
    
    -- Average Order Value based on category
    SELECT pizza_category,AVG(quantity*unit_price) AS avg_order_value
    FROM try.`pizza sale`
    group by pizza_category
    ORDER BY avg_order_value;
    
--  Day of Week Performance
SELECT DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS days, 
		SUM(quantity*unit_price) as monthly_revune
       FROM try.`pizza sale`
       GROUP BY days
      ORDER BY FIELD(days, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
