-- TESTING THE ETL SYSTEM FOR SCD TYPE 2

use BikesDB
GO

select * from dbo.Addresses;


BEGIN transaction
UPDATE dbo.Addresses
set COUNTRY = 'CA'
where ADDRESS_ID = '1000000034'

--pick one
rollback;
--OR
Commit transaction;


--check 
select * from dbo.Addresses
where ADDRESS_ID = '1000000034'



--Execute the SCD.Address package in Visual studio



--CHECK THE DW
USE BikesDW
GO

SELECT * FROM stagging_Addresses
where ADDRESS_ID = '1000000034'


-- WHEN UPDATING RECORDS WITH TRANSACTION, YOU HAVE TO COMMIT CHANGES IN ORDER FOR THE ETL PROCESS TO WORK.
-- OTHER WISE VISUAL STUDIO WILL GET STUCK WAITING ON RESPONSE

