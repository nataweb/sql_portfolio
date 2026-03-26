USE SalesDB
-------------- Time Functions --------------
SELECT OrderDate,ShipDate,
Year(ShipDate) as YearShipDate,
Month(ShipDate) as MonthShipDate,
Day(ShipDate) as DayShipDate,
DateTrunc(month,CreationTime) as CreationMonth
FROM Sales.Orders;
-------------- DatePart --------------------
SELECT OrderDate,ShipDate,
Datepart(year,ShipDate) as YearShipDate_dp,
Datepart(month,ShipDate) as MonthShipDate_dp,
Datepart(day,ShipDate) as DayShipDate_dp,
Datepart(week,ShipDate) as WeekShipDate_dp,
Datepart(quarter,ShipDate) as QuarterShipDate_dp
FROM Sales.Orders;
-------------- DateName --------------------
SELECT OrderDate,ShipDate,
Datename(month,ShipDate) as MonthShipDate_dn,
Datename(weekday,ShipDate) as DayShipDate_dn
FROM Sales.Orders;
-------------- DateTrunc --------------------
SELECT OrderDate,ShipDate,
Datetrunc(year,CreationTime) as YearShipDate_dt,
Datetrunc(month,CreationTime) as MonthShipDate_dt,
Datetrunc(day,CreationTime) as DayShipDate_dt
FROM Sales.Orders;
-------------- DateTrunc Use Case --------------
SELECT 
Datetrunc(month,CreationTime) as CreationTime,
Count(*)
FROM Sales.Orders
Group By Datetrunc(month,CreationTime);
------------   EOMONTH -------------------------
SELECT CreationTime,
CAST(Datetrunc(month,CreationTime) AS Date) as StartOfMonth,
EOMONTH(CreationTime) as EndOfMonth
FROM Sales.Orders
------------------- Use Cases --------------------
------How many orders were placed each year?------
SELECT 
Year(OrderDate) as YearOrder,
Count(*) as NrOfOrders
From Sales.Orders
Group By Year(OrderDate);
---------------------------------------------------
SELECT
getdate() as currentDatetime,
year(Getdate()) as currentYear,
month(Getdate()) as currentDate,
datepart(month,getdate()) currentmonth_dp,
datepart(day,getdate()) currentday_dp,
datename(month,getdate()) as MonthName,
datename(weekday,getdate()) as DayName