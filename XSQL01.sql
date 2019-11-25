/*
SQL QUERYING FUNDAMENTALS
DEMO AND ACTIVITY CODE
NOVEMBER 25, 2019
*/

--LESSON 1: EXECUTING A SIMPLE QUERY 

--ACTIVITY 1-1

USE FullerAckerman 




 --TOPIC B

SELECT custname, city
FROM customers
WHERE state = 'NY'




SELECT bktitle, slprice
FROM titles




--ACTIVITY 1-2 

SELECT *
FROM titles




--ACTIVITY 1-3
--Create a new file and save the code below as MyFirstSQL.sql

SELECT *
FROM titles




 --TOPIC D 

SELECT custname, state, city
FROM customers
WHERE city = 'Rochester'




/*
SELECT custname, state, city
FROM customers
WHERE city = 'Rochester'
*/





SELECT custname, state --not city
FROM customers

WHERE city = 'Rochester'




EXEC SP_HELP titles




--ACTIVITY 1-4

EXEC sp_help titles



--Modify MyFirstSQL.sql to include the following code, then save it as MyModifiedQuery.sql

USE FullerAckerman
SELECT partnum, bktitle, slprice 
FROM titles
 --SELECT statement to retrieve a book list for sales representatives.




 --LESSON 2: PERFORMING A CONDITIONAL SEARCH

SELECT ordnum, sldate, qty, partnum, repid
FROM sales
WHERE repid= 'N02'




SELECT partnum, bktitle, slprice
FROM titles
WHERE slprice > 100




SELECT ordnum, sldate, qty, partnum, repid
FROM sales
WHERE repid  = 'N02' AND qty >=400




SELECT partnum, bktitle, slprice
FROM titles
WHERE slprice > 40 AND partnum > 1000




SELECT partnum, bktitle, slprice
FROM titles
WHERE slprice >=30




SELECT ordnum, sldate, qty, partnum, repid
FROM sales
WHERE repid  = 'N02' 




SELECT bktitle, pubdate, slprice + 20
FROM titles
WHERE slprice + 20 > 50




SELECT bktitle, pubdate, slprice + 20 AS 'plus20'
FROM titles
WHERE slprice + 20 > 50




SELECT bktitle, pubdate, slprice + 20 plus20
FROM titles
WHERE slprice + 20 > 50




SELECT bktitle, slprice + slprice * .05 newslprice
FROM titles
WHERE slprice + slprice * .05 > 50




SELECT custnum, city, state
FROM customers
WHERE state = 'TX' AND city = 'Houston'




SELECT custnum, city, state, custname
FROM customers
WHERE state = 'MA' OR state = 'NY' AND custnum > 15000




SELECT custnum, city, state, custname
FROM customers
WHERE (state = 'MA' OR state = 'NY') AND custnum > 15000




SELECT custnum, city, state, custname
FROM customers
WHERE state = 'MA' OR state = 'CA'




SELECT custnum, city, state, custname
FROM customers
WHERE NOT city = 'Ryebrook'




SELECT custnum, city, state, custname
FROM customers
WHERE state = 'NY' AND NOT city = 'Ryebrook'




 --ACTIVITY 2-1

USE FullerAckerman




SELECT partnum, bktitle, slprice
FROM Titles
WHERE slprice > 50




SELECT partnum, bktitle, slprice
FROM Titles
WHERE bktitle = 'Sailing'




--ACTIVITY 2-2 

SELECT bktitle, slprice
FROM Titles
WHERE slprice > 45




SELECT bktitle, slprice, slprice - slprice*0.07 AS 'discounted price'
FROM Titles
WHERE slprice - slprice*0.07 > 45




 --ACTIVITY 2-3

SELECT city, state, custname
FROM Customers
WHERE state = 'NY'




SELECT city, state, custname
FROM customers
WHERE state = 'NY' OR state = 'MA'




SELECT city, state, custname, repid
FROM customers
WHERE (state = 'NY' OR state = 'MA') AND repid = 'S01'




--TOPIC B 

SELECT bktitle, slprice
FROM titles
WHERE slprice NOT BETWEEN 50 and 55




SELECT custname
FROM customers
WHERE state IN ('CA', 'NY', 'MA')




SELECT bktitle, slprice, devcost
FROM titles
WHERE slprice BETWEEN 35 and 45 AND devcost IS NULL




SELECT bktitle, slprice, devcost
FROM titles
WHERE slprice BETWEEN 35 and 45 AND devcost IS NOT NULL





 --ACTIVITY 2-4

SELECT bktitle, slprice
FROM Titles
WHERE slprice BETWEEN 35 and 70




SELECT bktitle, slprice, devcost
FROM Titles
WHERE devcost IS NULL




SELECT bktitle, slprice, devcost
FROM Titles
WHERE devcost IS NOT NULL




--TOPIC C 


SELECT bktitle, slprice, partnum
FROM titles
WHERE bktitle LIKE 'c%'




SELECT bktitle, slprice, partnum
FROM titles
WHERE bktitle LIKE '%art%'




SELECT address, custname, state, city
FROM customers 
WHERE city LIKE '_O%'




 --ACTIVITY 2-5

SELECT bktitle, partnum, slprice
FROM Titles
WHERE bktitle LIKE '%art%'



SELECT bktitle, partnum, slprice
FROM Titles
WHERE bktitle LIKE '[AMC]%'



SELECT bktitle, partnum, slprice
FROM Titles
WHERE bktitle LIKE '[A-G]%'



SELECT custnum, custname, city
FROM Customers
WHERE custnum LIKE '____'



SELECT custnum, custname, city
FROM Customers
WHERE custnum LIKE '___[19]'


 --LESSON 3: WORKING WITH FUNCTIONS

--TOPIC A 

SELECT bktitle, DATEADD(month, 3, pubdate), GETDATE()
FROM titles




SELECT bktitle, DATEADD(month, 3, pubdate) AS new_pubdate, DATEDIFF(year, pubdate, '12-31-2013') AS diff_date
FROM titles



DECLARE
@holiday AS DATE = '2009-12-25',
@time AS TIME = '12:00:00.1345672',
@today AS DATETIME2  = '2009-12-25 12:00:00.1345672',
@local AS DATETIMEOFFSET = '2009-12-25 12:00:00.1345672 -9:00'

SELECT @holiday AS [@holiday], @time as [@time], @today AS [@today], @local AS [@local]



 --ACTIVITY 3-1

EXEC SP_HELP obsolete_titles



SELECT bktitle, DATEPART(YEAR, pubdate) as year, DATEDIFF(YEAR, pubdate, GETDATE()) AS age
FROM Obsolete_Titles
WHERE DATEPART(YEAR, pubdate) BETWEEN 1990 AND 1999




 --TOPIC B

SELECT COUNT(qty) AS total_qty, AVG(qty) AS avg_qty
FROM sales




SELECT DISTINCT city, state
FROM customers




 --ACTIVITY 3-2

SELECT *
FROM Titles
WHERE DATEPART(year, pubdate) = 2013




SELECT COUNT(bktitle) AS title_count, SUM(devcost) AS total_devcost,
AVG(devcost) as average_cost
FROM Titles
WHERE DATEPART(year, pubdate) = 2013




SELECT bktitle, pubdate, devcost
FROM Titles
WHERE DATEPART(year, pubdate) = 2013 AND devcost IS NULL




--TOPIC C
SELECT custname, address, state
FROM customers
WHERE state = 'NY'




SELECT custname, custnum, LEN(custname) AS length
FROM customers




SELECT UPPER(custname), LOWER(custname), city
FROM customers
WHERE state = 'NY'




SELECT repid, lname AS lastname, fname AS firstname
FROM slspers
SELECT repid, LTRIM(lname) AS lastname, RTRIM(fname) AS firstname
FROM slspers




SELECT custnum, custname, 'NEW YORK' AS statename
FROM customers
WHERE state = 'NY'




SELECT custnum, SUBSTRING(custname, 5, 10) AS custname, SUBSTRING('NEW YORK', 5,4) AS statename
FROM customers
WHERE state = 'NY'




SELECT repid, lname + fname AS Name 
FROM slspers




SELECT repid, RTRIM(lname) + fname AS Name 
FROM slspers




SELECT repid, RTRIM(lname) + ', ' + fname AS Name 
FROM slspers




 --ACTIVITY 3-3
SELECT repid, RTRIM(fname) + ' ' + lname AS representative_name
FROM slspers



SELECT custname, RTRIM(address) + ', ' + RTRIM(city) + ', '
+RTRIM(state) + ', ' + RTRIM(zipcode) AS customer_address
FROM customers




--LESSON 4: ORGANIZING DATA 

--TOPIC A


SELECT partnum, bktitle, slprice
FROM titles
ORDER BY slprice ASC




SELECT partnum, bktitle, slprice
FROM titles
ORDER BY slprice ASC, partnum DESC




 --ACTIVITY 4-1

SELECT bktitle, slprice
FROM Titles
ORDER BY slprice DESC, bktitle




SELECT bktitle, devcost, slprice, devcost/slprice as break_even_point
FROM Titles
WHERE devcost IS NOT NULL
ORDER BY bktitle




--TOPIC B

SELECT repid, qty, custnum
	, RANK() OVER(PARTITION BY repid ORDER BY qty DESC) AS 'Rank'
FROM sales
WHERE qty > 300




SELECT repid, qty, custnum
	, DENSE_RANK() OVER(PARTITION BY repid ORDER BY qty DESC) AS 'Dense Rank'
FROM sales




SELECT repid, qty, custnum
	, ROW_NUMBER() OVER(PARTITION BY repid ORDER BY qty DESC) AS 'Row Number'
FROM sales




SELECT repid, qty, custnum
	, NTILE(5) OVER(PARTITION BY repid ORDER BY qty DESC) AS 'Ntile'
FROM sales




SELECT TOP 10 partnum, sldate, qty
FROM sales
ORDER BY qty DESC





--ACTIVITY 4-2

SELECT repid, qty, custnum
	, RANK() OVER(PARTITION BY repid ORDER BY qty DESC) AS 'Rank'
	, DENSE_RANK() OVER(PARTITION BY repid ORDER BY qty DESC) AS 'Dense Rank'
	, NTILE(5) OVER(PARTITION BY repid ORDER BY qty DESC) AS 'Ntile'
	, ROW_NUMBER() OVER(PARTITION BY repid ORDER BY qty DESC) AS 'Row Number'

FROM sales
WHERE DATEPART(year, sldate) = 2013




--TOPIC C

SELECT repid, SUM(qty) AS tot_qty
FROM sales
WHERE qty IS NOT NULL
GROUP BY repid




SELECT custnum, repid, SUM(qty) AS total_sales
FROM sales
WHERE DATEPART(YEAR, sldate) = 2008 AND
DATEPART(MONTH, sldate) BETWEEN 1 and 6
GROUP BY GROUPING SETS((custnum, repid), (repid))




SELECT GROUPING_ID(ordnum, custnum)
FROM sales
GROUP BY CUBE(ordnum, custnum)




SELECT GROUPING_ID(ordnum,custnum)
FROM sales
GROUP BY ROLLUP (ordnum, custnum)




SELECT partnum, bktitle
FROM titles
GROUP BY GROUPING SETS ((partnum, bktitle))






 --ACTIVITY 4-3

SELECT repid, SUM(qty) AS tot_qty
FROM SALES
WHERE DATEPART(year, sldate) = 2013 AND qty IS NOT NULL
GROUP BY repid
ORDER BY repid




--TOPIC D

SELECT repid, SUM(qty) AS tot_qty
FROM sales
WHERE qty IS NOT NULL
GROUP BY repid




SELECT repid, SUM(qty) AS tot_qty
FROM sales
WHERE qty IS NOT NULL
GROUP BY repid
HAVING SUM(qty) >= 600




 --ACTIVITY 4-4
SELECT partnum, repid, SUM(qty) AS total_qty
FROM sales
WHERE qty IS NOT NULL
GROUP BY partnum, repid




SELECT partnum, repid, SUM(qty) AS total_qty
FROM sales
WHERE qty IS NOT NULL
GROUP BY partnum, repid
HAVING SUM(qty) >= 500




--TOPIC E

SELECT repid, custnum, SUM(qty) AS total
FROM sales
GROUP BY repid, custnum WITH CUBE




SELECT repid, custnum, SUM(qty) AS total
FROM sales
GROUP BY repid, custnum WITH ROLLUP




 --ACTIVITY 4-5

SELECT repid, custnum, SUM(qty) AS tot_sales
FROM sales
GROUP BY repid, custnum WITH ROLLUP




--TOPIC F

SELECT E01 AS Rep1, E02 AS Rep2, N01 AS Rep3, N02 AS Rep4
FROM (SELECT repid, qty FROM SALES) AS sales_pvt
PIVOT (SUM(qty) FOR repid IN (E01, E02, N01, N02)) AS pvt




-- ACTIVITY 4-6
--RUN THIS FIRST:
USE FullerAckerman
GO
CREATE TABLE Sales_Report (rep_name varchar(15), product varchar(10), quantity int)


INSERT INTO sales_report VALUES('Kent','Monitor',5)
INSERT INTO sales_report VALUES('Kent','CPU',5)
INSERT INTO sales_report VALUES('Amelia','CPU',3)
INSERT INTO sales_report VALUES('Amelia','Monitor',8)
INSERT INTO sales_report VALUES('Kent','Monitor',4)
INSERT INTO sales_report VALUES('Kent','CPU',6)
INSERT INTO sales_report VALUES('Amelia','CPU',8)
INSERT INTO sales_report VALUES('Amelia','Monitor',7)



SELECT pvt.* INTO sales_pvt
FROM Sales_Report
PIVOT (SUM(quantity) FOR product IN (Monitor, CPU)) AS pvt
 --If you get the message "Invalid object name 'Sales_report', make sure to execute
 --the CREATE and INSERT statements above




SELECT *
FROM sales_pvt




SELECT unpvt.rep_name, unpvt.product, unpvt.quantity 
FROM sales_pvt
UNPIVOT (quantity FOR product IN (Monitor, CPU)) AS unpvt




--LESSON 5: RETRIEVING DATA FROM MULTIPLE TABLES

--TOPIC A

SELECT bktitle, devcost, slprice
FROM titles
UNION 
SELECT bktitle, devcost, slprice
FROM obsolete_titles




SELECT bktitle, devcost, slprice
FROM titles
UNION ALL
SELECT bktitle, devcost, slprice
FROM obsolete_titles




 --ACTIVITY 5-1

SELECT bktitle AS book_title, pubdate AS publishing_date
FROM Titles




SELECT bktitle AS book_title, pubdate AS publishing_date
FROM Obsolete_Titles
ORDER BY bktitle




SELECT bktitle AS book_title, pubdate AS publishing_date
FROM Titles
UNION
SELECT bktitle AS book_title, pubdate AS publishing_date
FROM Obsolete_Titles




SELECT bktitle
FROM Titles
INTERSECT
SELECT bktitle
FROM Obsolete_Titles




--TOPIC B

SELECT bktitle
FROM titles
EXCEPT
SELECT bktitle
FROM obsolete_titles




SELECT bktitle
FROM titles
INTERSECT
SELECT bktitle
FROM obsolete_titles




 --ACTIVITY 5-2

SELECT bktitle
FROM Titles
INTERSECT
SELECT bktitle
FROM Obsolete_Titles




SELECT bktitle
FROM Titles
EXCEPT
SELECT bktitle
FROM Obsolete_Titles




--TOPIC C

SELECT fname, lname, partnum, bktitle, slprice
FROM slspers
CROSS JOIN titles
ORDER BY lname, partnum




SELECT custnum, fname, lname
FROM sales
INNER JOIN slspers ON sales.repid = slspers.repid
ORDER BY custnum




SELECT custnum, fname, lname
FROM sales
JOIN slspers ON sales.repid = slspers.repid
ORDER BY custnum




SELECT bktitle, SUM(qty) AS total_qty 
FROM titles
LEFT OUTER JOIN sales ON titles.partnum = sales.partnum
GROUP BY bktitle




SELECT DISTINCT ot.bktitle, ot.devcost, t.devcost, t.slprice
FROM obsolete_titles AS ot, titles AS t
WHERE ot.slprice = t.slprice




SELECT c1.custname AS CustName, c2.custname AS RefByName
FROM potential_customers AS c1
INNER JOIN potential_customers c2 ON c1.referredby = c2.custnum
WHERE c2.referredby IS NOT NULL
ORDER BY c1.custname




SELECT ordnum, qty, bktitle, custname
FROM sales
INNER JOIN customers
ON sales.custnum = customers.custnum
INNER JOIN titles
ON sales.partnum = titles.partnum




 --ACTIVITY 5-3

SELECT ordnum, sldate, qty, fname, lname
FROM Sales
INNER JOIN Slspers ON SALES.repid = Slspers.repid
ORDER BY qty DESC




SELECT bktitle, SUM(qty) AS quantity
FROM Titles LEFT OUTER JOIN Sales
ON Titles.partnum = Sales.partnum
GROUP BY bktitle




SELECT p.custname, r.custname AS referred_by
FROM Potential_Customers AS p 
INNER JOIN Potential_Customers AS r
ON p.referredby = r.custnum
