-------- DDL (Data Definition Language) ----

USE MyDatabase

Create table persons(
  id INT NOT NULL,
  person_name VARCHAR(50) NOT NULL,
  birth_date DATE,
  phone VARCHAR(15) NOT NULL,
  CONSTRAINT pk_pesons PRIMARY KEY (id)

)

--Add new column email to to the persons table--
ALTER TABLE persons 
ADD email VARCHAR(50)NOT NULL;

-- Remove the column phone from persons table--
ALTER TABLE persons
DROP COLUMN phone;

--Delete the table persons from the database--
DROP TABLE persons

--------------DML(Data Manipulation Language------------------

INSERT INTO customers(id,first_name,country,score) 
VALUES
	 (101, 'Layney', null, 320),
	 (102, 'Arin', 'Tunisia', 306),
	 (103, 'Madelin', 'China', 642),
	 (104, 'Eleni', 'China', 877),
	 (105, 'Gladys', 'Kazakhstan', null),
	 (106, 'Shannon', 'China', 838);

-- copy data from table 'customers' to table 'persons'---

INSERT INTO persons(id,person_name,birth_date,phone)
SELECT TOP 10 id,first_name,NULL,'UNKNOWN'
FROM customers
--------------------------------------------------------
-------- Change the customer score where id is 6 -------

UPDATE customers
SET score = 0
WHERE id = 6

select * from customers
--------------------------------------------------------
	 /*  Change the score of customer with id
		10 to 0 and update the country yo 'UK'   */ 
UPDATE customers 
SET
	score = 0,
    country = 'UK'
WHERE id = 10
----------------------------------------------------------
	 /*  Update all customers with a NULL 
	score by setting their score to 0   */

UPDATE customers 
SET score = 0
WHERE score IS NULL
------------------------------------------------------------

select *
from customers
where country = 'Ukraine' 

------------------------------------------------------------