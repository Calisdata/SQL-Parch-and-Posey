--DAY 9 SQL BASICS
SELECT *
FROM accounts

--DAY 10 SORTING DATA
SELECT name
FROM accounts
ORDER BY name

--DAY 11 JOINING TABLES
SELECT
FROM








---DAY 13
SELECT o.account_id,
       SUM(total_amt_usd) AS Total_sales_amt,
	   SUM(total) AS total_sales_quantity,
	   ROUND(AVG(total_amt_usd), 2) AS Avg_sales_amt,
	   ROUND(AVG(total),2) AS Avg_sales_quantity,
	   ROUND(SUM(total_amt_usd)/ SUM (total), 2) AS Avg_order_value
FROM orders o
LEFT JOIN accounts a ON o.account_id =a.id
GROUP BY o.account_id
HAVING(SUM(total_amt_usd)/SUM(total)) >=6.30;

--DAY 14
SELECT SUM(total_amt_usd) AS total_sales, w.channel
FROM orders o
RIGHT JOIN web_events w ON o.id=w.id
GROUP BY w.channel
ORDER BY total_sales DESC

--DAY 15
SELECT SUM(total_amt_usd) AS sales_amt, SUM(total) AS quantity_amt, 
a.name AS customers_name, s.name AS sales_rep,r.name AS region
FROM orders o
LEFT JOIN accounts a ON a.id=o.account_id
LEFT JOIN sales_reps s ON s.id=a.sales_rep_id
JOIN region r ON r.id=s.region_id
GROUP BY a.name, s.name,r.name
ORDER BY Sales_amt DESC
LIMIT 5;




SELECT id, name
FROM sales_reps
LIMIT 10

--write a query to view the first 6 rows in the orders table
SELECT *
FROM orders
LIMIT 6

--identify the highest order of standard paper
SELECT standard_qty
FROM orders
ORDER BY standard_qty desc


---Alphabetically what are the last 5 account names
SELECT name
FROM accounts ascending
LIMIT 5 

SELECT name
FROM accounts 
ORDER BY name desc

LIMIT 5 


SELECT name
FROM accounts
WHERE name LIKE '%a'
LIMIT 5

--LIKE
--wildcards used: _ and %
- : single Character
% : any given number of characters

_b%
A%
A__%


SELECT *
FROM accounts
WHERE id NOT IN (1031, 1081, 2371, 2401, 506)

SELECT *
FROM accounts
WHERE id= 1001 or name = 'Apple'

SELECT *
FROM accounts
WHERE id= 1001 AND name = 'Walmart'

SELECT *
FROM accounts
WHERE id BETWEEN 1001 AND 1051


SELECT name
FROM accounts
WHERE name LIKE '%e'
ORDER BY name desc

'%one%'

SELECT *
FROM orders
GROUP BY 



---DAY 13
--- find customers who made orders above the average order value.

SELECT a.name, o.total_amt_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE total_amt_usd >(SELECT AVG(total_amt_usd)FROM orders)
ORDER BY total_amt_usd asc





-----DAY 14
SELECT w.channel, SUM(total_amt_usd)total_sales, 
   CASE
   WHEN SUM(total_amt_usd)> 300000000 THEN 'High value'
   WHEN SUM(total_amt_usd)< 50000000 THEN 'Low value'
   ELSE 'Medium value'
   END AS Sales_categories
FROM orders o
JOIN web_events w ON w.account_id = o.account_id
GROUP BY w.channel
ORDER BY total_sales desc







