/***************************  ENABLE CHANGE TRACKING   *************************/


-- Enable on Database level
USE master;
GO

ALTER DATABASE BikesDB
SET CHANGE_TRACKING = ON
(CHANGE_RETENTION = 7 DAYS, AUTO_CLEANUP = ON); 


ALTER DATABASE BikesDB
SET ALLOW_SNAPSHOT_ISOLATION ON;   -- to allows users to continue working without being blocked
GO



--Enable on Table level
USE BikesDB
GO
ALTER TABLE BusinessPartners
ENABLE CHANGE_TRACKING
WITH (TRACK_COLUMNS_UPDATED = ON);


USE BikesDB
GO
ALTER TABLE Addresses
ENABLE CHANGE_TRACKING
WITH (TRACK_COLUMNS_UPDATED = ON);


/********************************************************************************************/

-- To get initial data and the current version 
DECLARE @current_version Bigint
SET @current_version = CHANGE_TRACKING_CURRENT_VERSION();

select * from BusinessPartners;
select * from Addresses;


UPDATE stg.ExtractLog
SET LastExtractedVersion = @current_version
WHERE SourceName = BusinessPartners;
GO


UPDATE stg.ExtractLog
SET LastExtractedVersion = @current_version
WHERE SourceName = Addresses;
GO



/********************************************************************************************/

-- to get the changes
SET TRANSACTION ISOLATION LEVEL SNAPSHOT

DECLARE @previous_version BigInt
SELECT @previous_version = MAX(LastExtractedVersion)
FROM stg.ExtractLog
WHERE SourceName = 'BusinessPartners'

DECLARE @current_version BigInt
SET @current_version = CHANGE_TRACKING_CURRENT_VERSION();
 
SELECT @previous_version 'Previously retrieved Version',
	@current_version 'Current Version',
	CT.PARTNER_ID,
	p.PARTNERROLE,
	p.EMAILADDRESS,
	p.FAXNUMBER,
	p.WEBADDRESS
	p.COMPANYNAME
	p.LEGALFORM
FROM 
CHANGETABLE (CHANGES BusinessPartners, @previous_version) CT
INNER JOIN BusinessPartners p ON CT.PARTNER_ID = p.PARTNER_ID;


UPDATE stg.ExtractLog
SET LastExtractedVersion = @current_version
WHERE SourceName = 'BusinessPartners';


SET TRANSACTION ISOLATION LEVEL READ COMMITED;
GO

/***********************************************************


