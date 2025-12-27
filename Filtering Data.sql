
--********************* Filtering Data ************************
----------- Comparison operators: >,<,!=,>=,>= -------------------
--     Retrieve all customers who are not from Germany   --

SELECT * 
FROM customers 
WHERE country != 'Germany';

--- Retrieve all customers with a score greater than 500  ---

SELECT *
FROM customers 
WHERE score > 500;

---  Retrieve all customers with a score of 500 or more  ---
SELECT *
FROM customers 
WHERE score >= 500;

---  Retrieve all customers with a score less than  500  ---

SELECT *
FROM customers 
WHERE score < 500;

---  Retrieve all customers with a score 500 or less  ---

SELECT *
FROM customers 
WHERE score <= 500;

---------------- AND, OR --------------------------
/*  Retrieve all customers who are from 'USA'
	and have a score greater 500   */

SELECT *
FROM customers 
WHERE country = 'USA' 
AND score > 500;

/*  Retrieve all customers who are either 
	from the  'USA' or have a score greater 500  */

SELECT *
FROM customers 
WHERE country = 'USA' 
OR score > 500;
------------------- NOT --------------------------
---  Retrieve all customers with a score not less than 500    ---

SELECT *
FROM customers 
WHERE  NOT score < 500;
---------------  BETWEEN --------------------------
/*      Retrieve all customers whose 
	score falls between 100 and 500     */

SELECT *
FROM customers 
WHERE score BETWEEN 100 AND 500;

SELECT *
FROM customers 
WHERE score >= 100 AND score <=500;
-------------------  IN operator --------------------
/*      Retrieve all customers who
	either from Germany or USA     */

SELECT *
FROM customers 
WHERE country IN('Germany','USA');
-------------------  LIKE operator  -------------------
/*   Find all customers whose 
	first name starts with 'M'    */

SELECT * 
FROM customers 
WHERE first_name LIKE 'M%'

/* Find all customers whose 
	first name ends with 'n' */
SELECT * 
FROM customers 
WHERE first_name LIKE '%n';

/* Find all customers whose 
	first name contains 'r' */
SELECT * 
FROM customers 
WHERE first_name LIKE '%r%';
 