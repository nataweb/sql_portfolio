USE MyDatabase
GO
/*	Get all customers along with their orders, 
	but only for customers who have placed an order */

SELECT * 
FROM customers 
INNER JOIN orders
ON customers.id = orders.customer_id
-------------------  LEFT JOIN  -----------------------------
/*	Get all customers along their orders,
	including those without orders	*/

SELECT * 
FROM customers as c
LEFT JOIN orders as o
ON c.id = o.customer_id

------------------ RIGHT JOIN --------------------------------
/*	Get all customers along with their orders,
	including orders without matching customers	*/

SELECT * 
FROM customers as c
RIGHT JOIN orders as o
ON c.id = o.customer_id

----------------- FULL JOIN -----------------------------------
/*	Get all customers and all orders, 
	even if there's no match	*/
SELECT * 
FROM customers as c
FULL JOIN orders as o
ON c.id = o.customer_id

------------- LEFT ANTI JOIN -----------------------------------
/*Get all customers who haven't place any order*/

SELECT * 
FROM customers as c
LEFT JOIN orders as o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL

------------------- RIGHT ANTI JOIN -----------------------------
/*	Get all orders without matching customers	*/

SELECT * 
FROM customers as c
RIGHT JOIN orders as o
ON c.id = o.customer_id
WHERE c.id IS NULL


