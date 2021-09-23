-- TESTING THE ETL SYSTEM FOR SCD TYPE 2

use BikesDB
GO;

select * from dbo.Addresses;

--make sure change is not permanent with rollback
BEGIN transaction
UPDATE dbo.Addresses
set COUNTRY = 'CA'
where ADDRESS_ID = '1000000034';

rollback;




--check 
select * from dbo.Addresses
where ADDRESS_ID = '1000000034'



--Execute the SCD.Address package in Visual studio



--CHECK THE DW
USE BikesDW
GO;

SELECT * FROM stagging_Addresses
where ADDRESS_ID = '1000000034'
