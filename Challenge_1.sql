/*
Created By: Bhautik
Create Date: 07/06/2023
Description: Searching transaction between 2011 and 2012 and the amount of the money during that time
*/

/*
CHALLENGE 1
General queries that begin to give you some high-level context
1. How many transactions took place between the years 2011 and 2012?
2. How much money did WSDA Music make during the same period?
*/

--1.)

SELECT 
	COUNT(*) AS [2011-2012 Transaction]
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
	
--2.)

SELECT 
	SUM(total) AS [2011-2012 Money]
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'


