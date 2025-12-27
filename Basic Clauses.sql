------------ORDER BY -----------------
Select * 
from customers
order by score asc; 
---------- ORDER BY Nested -------------
Select * 
from customers
order by country asc,score desc; 
-------------GROUP BY -----------------

select 
	country,
	sum(score) as total_score
from customers
group by country
order by total_score DESC
-------------- GROUP BY ----------------------
select
	country,
	sum(score) as total_score,
	count(id) as total_customers
from customers
group by country;
---------------HAVING-----------------------
select
	country,
	avg(score) as avg_score
from customers
where score != 0
group by country
having avg(score) > 430;
-------------- Distinct ------------------------
select distinct country 
from customers
----------------- TOP -----------------------
--Retrieve top 3 customers with highest score based on the score--

Select top 3 *
from customers
order by score desc; 

--Retrieve lowest 2 customers with based on the score--
Select top 2 *
from customers
order by score asc; 

--Get the 2 most recent orders --
select top 2 *
from orders
order by order_date desc
