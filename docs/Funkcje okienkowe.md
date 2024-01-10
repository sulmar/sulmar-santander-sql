
# Funkcje rankingowe

## Funkcja _ROW_NUMBER_
- Liczba porządkowa
~~~ sql
select 
	ROW_NUMBER() OVER (ORDER BY OperationDate) as RowNumber,
	Account,
	OperationDate
from [Santander].[AccountOperations] 
where OperationTypeId = 1 and OperationStatus = 'OK'
and OperationDate between '2020-05-01' and '2020-05-10'
order by RowNumber
~~~ 

- Liczbą porządkowa w ramach grupy
~~~ sql
select 
	ROW_NUMBER() OVER (
		PARTITION BY OperationTypeId
		ORDER BY OperationDate) as RowNumber,
	Account,
	OperationDate,
	OperationTypeId
from [Santander].[AccountOperations] 
where  OperationStatus = 'OK'
and OperationDate between '2020-05-01' and '2020-05-10'
order by OperationTypeId, RowNumber
~~~ 

~~~ sql
select
	ROW_NUMBER() OVER (
		PARTITION BY Account
		ORDER BY AccountOperationId
		) as RowNumber,
	Account,
	OperationDate
 from  [Santander].[AccountOperations] 
 order by Account, RowNumber
~~~

## Funkcja _RANK_

 select 
	RANK() OVER (
		ORDER BY SubTotal DESC) as [Rank],
	SubTotal,
	TerritoryID
from Sales.SalesOrderHeader
order by SubTotal desc
~~~


 ~~~ sql
 select 
	RANK() OVER (
		PARTITION BY TerritoryID
		ORDER BY SubTotal DESC) as [Rank],
	SubTotal,
	TerritoryID
from Sales.SalesOrderHeader
order by TerritoryID, SubTotal desc
~~~

## Funkcja _DENSE_RANK_
~~~ sql
-- select 
--	DENSE_RANK() OVER (
--		PARTITION BY TerritoryID
--		ORDER BY SubTotal DESC) as [Rank],
--	SubTotal,
--	TerritoryID
--from Sales.SalesOrderHeader
--order by TerritoryID, SubTotal desc
~~~

## Funkcja NTILE

~~~ sql
SELECT 
	sp.FirstName,
	sp.LastName,
	sum(soh.SubTotal) as TotalSales,
	NTILE(2) OVER (ORDER BY sum(soh.SubTotal) ASC) as Bonus
 from
	 Sales.SalesOrderHeader as soh
	inner join Sales.vSalesPerson as sp
		on sp.BusinessEntityID = soh.SalesPersonID
where
	soh.OrderDate between '2010-06-01' and '2011-06-30'
group by
	sp.FirstName,
	sp.LastName

-- 1000
-- 2000
-- 3000
-- 4000
~~~ 

## Aggregate
 funkcje agreguj¹ce okna
~~~ sql
select
	SubTotal,
	sum(SubTotal) OVER (ORDER BY SalesOrderId) as RunningTotal
from 
	 Sales.SalesOrderHeader
~~~

~~~ sql	 
select
	SubTotal,
	TerritoryId,
	sum(SubTotal) OVER (
		PARTITION BY TerritoryId
		ORDER BY SalesOrderId) as RunningTotal
from 
	 Sales.SalesOrderHeader
~~~

~~~ sql
select
	SubTotal,
	TerritoryId,
	sum(SubTotal) OVER (
		PARTITION BY TerritoryId
		ORDER BY SalesOrderId) as RunningTotal,
	count(SubTotal) OVER (
		PARTITION BY TerritoryId
		ORDER BY SalesOrderId) as RunningCount,
	avg(SubTotal) OVER (
		PARTITION BY TerritoryId
		ORDER BY SalesOrderId) as RunningAvg

from 
	 Sales.SalesOrderHeader
~~~

-- Offsetowe funkcje okna


--- Poprzednik

SELECT
	CustomerID,
	OrderDate,
	SalesOrderID,
	LAG(SalesOrderID) OVER(ORDER BY SalesOrderID) AS PrevOrderId,
	SubTotal,
	LAG(SubTotal) OVER(ORDER BY SalesOrderID) AS PrevSubTotal,
	LAG(SubTotal) OVER(ORDER BY SalesOrderID) - SubTotal  AS DeltaSubTotal 
 from 
	 Sales.SalesOrderHeader
order by OrderDate
	

SELECT
	CustomerID,
	OrderDate,
	SalesOrderID,
	LAG(SalesOrderID) OVER(ORDER BY SalesOrderID) AS PrevOrderId,
	LAG(SalesOrderID, 5, 0) OVER(ORDER BY SalesOrderID) AS PrevPrevOrderId,
	SubTotal,
	LAG(SubTotal) OVER(ORDER BY SalesOrderID) AS PrevSubTotal,
	LAG(SubTotal) OVER(ORDER BY SalesOrderID) - SubTotal  AS DeltaSubTotal 
 from 
	 Sales.SalesOrderHeader
order by OrderDate

--- Nastêpnik

SELECT
	CustomerID,
	OrderDate,
	SalesOrderID,
	LEAD(SalesOrderID) OVER(ORDER BY SalesOrderID) AS NextOrderId,
	SubTotal,
	LEAD(SubTotal) OVER(ORDER BY SalesOrderID) AS NextSubTotal,
	LEAD(SubTotal) OVER(ORDER BY SalesOrderID) - SubTotal  AS DeltaSubTotal 
 from 
	 Sales.SalesOrderHeader
order by OrderDate
	
	
SELECT
	CustomerID,
	OrderDate,
	SalesOrderID,
	LEAD(SalesOrderID) OVER(ORDER BY SalesOrderID) AS NextOrderId,
	LEAD(SalesOrderID, 2, null) OVER(ORDER BY SalesOrderID) AS NextNextOrderId
 from 
	 Sales.SalesOrderHeader
order by OrderDate