-- Display all data of pizza sales!
SELECT * FROM pizza_sales


-- 1. Some of the KPIs: --

-- 1.1. What is the total number of orders?
SELECT 
	COUNT(DISTINCT order_id) AS Total_Orders
FROM 
	pizza_sales


-- 1.2. What is the total revenue of all pizza orders?
SELECT 
	ROUND(SUM(total_price), 2) AS Total_Revenue
FROM 
	pizza_sales


-- 1.3. What is the average amount spent per order?
SELECT 
	ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS Avg_Order_Price
FROM 
	pizza_sales


-- 1.4. What is the total number of pizzas sold?
SELECT 
	SUM(quantity) AS Total_Pizzas_Sold
FROM 
	pizza_sales


-- 1.5. What is the average number of pizzas sold per order?
SELECT 
	ROUND(CAST(SUM(quantity) AS float) / CAST(COUNT(DISTINCT order_id) AS float), 2) AS Avg_pizzas_Per_Order
FROM 
	pizza_sales

--------------------------------------------------------------------------------------------------------------------------------

-- 2. What is the total order by daily trend?
SELECT 
	DATENAME(DW, order_date) AS Day_Name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales
GROUP BY
	DATENAME(DW, order_date)
ORDER BY
	Total_Orders DESC;

--------------------------------------------------------------------------------------------------------------------------------

-- 3. What is the total order by monthly trend?
SELECT 
	DATENAME(M, order_date) AS Month_Name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales
GROUP BY
	DATENAME(M, order_date)
ORDER BY
	Total_Orders DESC;

--------------------------------------------------------------------------------------------------------------------------------

-- 4. What is the total and percentage of sales by pizza category?
SELECT
	pizza_category,
	ROUND(SUM(total_price), 2) AS Total_Sales,
	ROUND((SUM(total_price) / (SELECT SUM(total_price) from pizza_sales) * 100), 2) AS PCT_of_Sales 
FROM	
	pizza_sales
GROUP BY
	pizza_category
ORDER BY
	Total_Sales DESC;

--------------------------------------------------------------------------------------------------------------------------------

-- 5. What is the total and percentage of sales by pizza size?
SELECT
	pizza_size,
	ROUND(SUM(total_price), 2) AS Total_Sales,
	ROUND((SUM(total_price) / (SELECT SUM(total_price) from pizza_sales) * 100), 2) AS PCT_of_Sales 
FROM	
	pizza_sales
GROUP BY
	pizza_size
ORDER BY
	Total_Sales DESC;

--------------------------------------------------------------------------------------------------------------------------------

-- 6. What is the total and percentage number of pizzas sold by pizza category?
SELECT
	pizza_category,
	SUM(quantity) AS Total_Quantity_Sold,
	ROUND((CAST(SUM(quantity) AS float) / (SELECT SUM(quantity) from pizza_sales) * 100), 2) AS PCT_Quantity_Sold 
FROM	
	pizza_sales
GROUP BY
	pizza_category
ORDER BY
	Total_Quantity_Sold DESC;

--------------------------------------------------------------------------------------------------------------------------------

-- 7. What are the highest 5 selling pizzas by total revenue?
SELECT TOP 5
	pizza_name,
	ROUND(SUM(total_price), 2) AS Total_Revenue
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Revenue DESC;

--------------------------------------------------------------------------------------------------------------------------------

-- 8. What are the lowest 5 selling pizzas by total revenue?
SELECT TOP 5
	pizza_name,
	ROUND(SUM(total_price), 2) AS Total_Revenue
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Revenue ASC;

--------------------------------------------------------------------------------------------------------------------------------

-- 9. What are the highest 5 selling pizzas by total quantity?
SELECT TOP 5
	pizza_name,
	SUM(quantity) AS Total_Quantity
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Quantity DESC;

--------------------------------------------------------------------------------------------------------------------------------

-- 10. What are the lowest 5 selling pizzas by total quantity?
SELECT TOP 5
	pizza_name,
	SUM(quantity) AS Total_Quantity
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Quantity ASC;

--------------------------------------------------------------------------------------------------------------------------------

-- 11. What are the highest 5 selling pizzas by total orders?
SELECT TOP 5
	pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Orders DESC;

--------------------------------------------------------------------------------------------------------------------------------

-- 12. What are the lowest 5 selling pizzas by total orders?
SELECT TOP 5
	pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Orders ASC;

--------------------------------------------------------------------------------------------------------------------------------

-- 13. What is the total and percentage of sales by pizza category regarding pizza size?
SELECT
	pizza_category,
	pizza_size,
	ROUND(SUM(total_price), 2) AS Total_Sales,
	ROUND((SUM(total_price) / (SELECT SUM(total_price) from pizza_sales) * 100), 2) AS PCT_of_Sales 
FROM	
	pizza_sales
GROUP BY
	pizza_category,
	pizza_size
ORDER BY
	Total_Sales DESC;


--------------------------------------------------------------------------------------------------------------------------------

-- 14. What is the total sales and percentage by pizza category of 'Classic' regarding pizza size?
SELECT
	pizza_category,
	pizza_size,
	ROUND(SUM(total_price), 2) AS Total_Sales,
	ROUND((SUM(total_price) / (SELECT SUM(total_price) from pizza_sales) * 100), 2) AS PCT_of_Sales 
FROM	
	pizza_sales
WHERE
	pizza_category = 'Classic'
GROUP BY
	pizza_category,
	pizza_size
ORDER BY
	Total_Sales DESC;


