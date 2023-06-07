/*
Created By: Bhautik
Create Date: 07/06/2023
Description: Performing in-depth analysis on the employees
*/

/*
CHALLENGE 3
Queries that perform in-depth analysis with the aim of finding employees who may have been
financially motivated to commit a crime
1. Get a list of employees who exceeded the average transaction amount from sales they
generated during 2011 and 2012.
2. Create a Commission Payout column that displays each employee’s commission
based on 15% of the sales transaction amount.
3. Which employee made the highest commission?
4. List the customers that the employee identified in the last question.
5. Which customer made the highest purchase?
6. Look at this customer record—do you see anything suspicious?
7. Who do you conclude is our primary person of interest?
*/

--1.)

SELECT 
	e.FirstName, 
	e.LastName,
	SUM(i.total) AS [Total Sales]
FROM
	Invoice i
INNER JOIN 
	Customer c
ON 
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee e 
ON 
	e.EmployeeId = c.SupportRepId
WHERE 
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
AND 
	i.total > 11.66
GROUP BY 
	e.FirstName,
	e.LastName
ORDER BY 
	e.LastName

--2.)

SELECT 
	e.FirstName, 
	e.LastName,
  SUM(i.total) AS [Total Sales],
	ROUND(SUM(i.total) * 0.15, 2) AS [Commmission Payout]
FROM
	Invoice i
INNER JOIN 
	Customer c
ON 
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee e 
ON 
	e.EmployeeId = c.SupportRepId
WHERE 
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
AND 
	i.total > 11.66
GROUP BY 
	e.FirstName,
	e.LastName
ORDER BY 
	e.LastName

--3.) Jane Peacock made the highest commission of $170.65.

--4.) 

SELECT 
	c.FirstName AS [Customer FN],
	c.LastName AS [Customer LN],
	e.FirstName AS [Employee FN], 
	e.LastName AS [Employee LN],
	SUM(i.total) AS [Total Sales],
	ROUND(SUM(i.total) * 0.15, 2) AS [Commmission Payout]
FROM
	Invoice i
INNER JOIN 
	Customer c
ON 
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee e 
ON 
	e.EmployeeId = c.SupportRepId
WHERE 
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
AND 
	e.LastName = 'Peacock'
GROUP BY
 c.FirstName,
 c.LastName,
 e.FirstName,
 e.LastName
ORDER BY 
	[Total Sales] DESC

--5.) John Doeein made the highest purchase of $1000.86.

--6.) 

SELECT 
	*
FROM 
	Customer
WHERE 
	LastName = 'Doeein'

--7.) Jane Peacock is our primary person of interest.
