use BikesDW

select top 5 * from DimProductCat_EXT

select top 5 calendar_date, calendar_year, day_name from DimDate
where calendar_year = 2015
group by day_name, calendar_date, calendar_year

select top 1 * from DimBusinessPartners

--Counting columns in table
SELECT count(*)
FROM information_schema.columns
WHERE table_name = 'DimBusinessPartners'


--CHECKING ETL EXECUTION
SELECT TOP 5 * FROM stagging_BusinessPartners

--SUCCESS!!

SELECT TOP 5 * FROM stagging_Addresses
SELECT TOP 5 * FROM stagging_Employees
SELECT TOP 5 * FROM stagging_ProductCategories
SELECT TOP 5 * FROM stagging_ProductCategoryText
SELECT TOP 5 * FROM stagging_Products
SELECT TOP 5 * FROM stagging_ProductTexts
SELECT TOP 5 * FROM stagging_SalesOrderItems
SELECT TOP 5 * FROM stagging_SalesOrders

--Will need to figure out how to tranfer data from multiple tables to each stagging table
-- without creating an ETL package for each