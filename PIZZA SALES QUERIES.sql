-- Daily Trends --
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY order_day;

-- HOURLY TRUNCATE
SELECT 
    HOUR(order_time) AS order_hour, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY order_hour
ORDER BY order_hour;

-- Percentage of Sales by Pizza Category:
SELECT 
    pizza_category, 
    ROUND(SUM(total_price), 2) AS Total_Sales,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS PCT_Sales
FROM pizza_sales
GROUP BY pizza_category;

-- Percentage of Sales by Pizza Size
SELECT 
    pizza_size, 
    ROUND(SUM(total_price), 2) AS Total_Sales,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS PCT_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT_Sales DESC;

-- Total Pizzas sold by Pizza Category
SELECT 
    pizza_category, 
    SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- Top 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT 
    pizza_name, 
    SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;