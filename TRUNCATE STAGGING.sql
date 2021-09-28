/**************************  CLEARING STAGGING AFTER USE  ********************************/


use BikesDW

select top 5 * from [dbo].[stagging_Addresses]

TRUNCATE TABLE [dbo].[stagging_Addresses]