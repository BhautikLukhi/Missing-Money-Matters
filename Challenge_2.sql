/*
Created By: Bhautik
Create Date: 07/06/2023
Description: List of customers' transaction and the average of it
*/

/*
CHALLENGE 2
More targeted questions that query tables containing data about customers and employees
1. Get a list of customers who made purchases between 2011 and 2012.
2. Get a list of customers, sales reps, and total transaction amounts for each customer 
between 2011 and 2012.
3. How many transactions are above the average transaction amount during the same 
time period?
4. What is the average transaction amount for each year that WSDA Music has been 
in business?
*/

-- 1.)

SELECT
	c.FirstName AS [CustomerFN],
	c.LastName AS [CustomerLN],
	i.total
FROM
	Invoice i 
INNER JOIN 
	Customer c
ON 
	i.CustomerId = c.CustomerId
WHERE 
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
ORDER BY 
	i.total DESC 

	
-- 2.)

SELECT
	c.FirstName AS [CustomerFN],
	c.LastName AS [CustomerLN],
	e.FirstName AS [EmployeeFN],
	e.LastName AS [EmployeeLN],
	i.total
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
ORDER BY 
	i.total DESC 


--3.)

SELECT 
	COUNT(total) AS [Num of Transactions Above Avg]
FROM 
	Invoice
WHERE 
	total > 
		(SELECT	
			ROUND(AVG(total), 2) AS [Avg Transaction Amount]
		FROM 
			Invoice
		WHERE 
			InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31')
AND InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'


--4.)

SELECT
	ROUND(AVG(total), 2) AS [Avg Transaction Amount],
	strftime('%Y', InvoiceDate) AS Year
FROM 
	Invoice
GROUP BY 
	strftime('%Y', InvoiceDate)
