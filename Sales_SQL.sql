---Q1 Display all records
SELECT * 
FROM sales_data

---Q2 Show product and price only
SELECT product, price 
FROM sales_data

---Q3 Count total number of orders
SELECT COUNT(*) AS total_orders 
FROM sales_data

---Q4 Calucate Total sales amount
SELECT SUM(quantity * price) AS total_sales 
FROM sales_data

---Q5 Query to display Total sales per region
SELECT region, SUM(quantity * price) AS total_sales
FROM sales_data
GROUP BY region

---Q6 What are the Top 5 highest selling products
SELECT product, SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY product
ORDER BY total_quantity DESC
LIMIT 5

---Q7 Write a query to display Monthly sales trend
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(quantity * price) AS monthly_sales
FROM sales_data
GROUP BY month
ORDER BY month

---Q8 what are the Highest revenue generating product
SELECT product, SUM(quantity * price) AS revenue
FROM sales_data
GROUP BY product
ORDER BY revenue DESC
LIMIT 1

---Q9 The Customers who made purchases above average order value
SELECT customer_name
FROM sales_data
GROUP BY customer_name
HAVING SUM(quantity * price) > (
    SELECT AVG(quantity * price) FROM sales_data
)

---Q10 Display Rank products by sales using window function
SELECT 
    product,
    SUM(quantity * price) AS revenue,
    RANK() OVER (ORDER BY SUM(quantity * price) DESC) AS rank_position
FROM sales_data
GROUP BY product