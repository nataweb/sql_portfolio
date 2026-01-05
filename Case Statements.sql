---------------- CASE Statements ------------------
/*Generate a report showing the total sales for each category:
-High: if the sakes higher than 50
-Medium: If the sales between 20 and 50
-Low: If sales equal or lower than 20
Sort the result from lowest to highest*/
SELECT 
	Category,
	SUM(Sales) as TotalSales
FROM(
	SELECT 
	OrderId,Sales,
	CASE 
		WHEN Sales > 50 THEN 'Highh'
		WHEN Sales > 20 THEN 'Medium'
		ELSE 'Low'
		END Category 
	FROM Sales.Orders)t 
GROUP BY Category
ORDER BY TotalSales DESC

-------------- Task #2 --------------------
/*	Retrieve employee details 
with gender displayed as full text	*/
SELECT *,
CASE 
	WHEN Gender = 'M' THEN 'Male'
	WHEN Gender = 'F' THEN 'Female'
	ELSE 'Not Available'
END Full_Gender
FROM Sales.Employees
-------------------  Task #3 ---------------
/*	Retrieve customer  details 
with abbreviated country code	*/

SELECT * ,
CASE 
	WHEN Country = 'USA' THEN 'US'
	WHEN Country = 'Germany' THEN 'DE'
	ELSE 'Unknown'
END CountryCode
FROM Sales.Customers
------------------ Task #4 -------------------
/* Find the average scores of customers and treat Null as 0.
And additional provide details such CustomerId & LastName */
SELECT 
	CustomerId,
	LastName,
	Score,
CASE 
	WHEN Score IS NULL THEN 0
	ELSE Score
END ScoreClean,
AVG(CASE 
	WHEN Score IS NULL THEN 0
	ELSE Score
END) OVER() AS AvgCustomerClean,
AVG(Score)  OVER() AS AvgCustomer
FROM Sales.Customers
------------------------------------------------------