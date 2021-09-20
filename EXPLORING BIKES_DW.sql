use BikesDW

select top 5 * from DimProductCat_EXT

select top 5 calendar_date, calendar_year, day_name from DimDate
where calendar_year = 2015
group by day_name, calendar_date, calendar_year