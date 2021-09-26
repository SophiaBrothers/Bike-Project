/************************************************************************************
ETL: JOINING TWO TABLES AND BYPASSING STAGGING TABLES


In SSIS, either use the views as source or utilize command statements below

products_Ext: type 2 


productCat_Ext: type 1


*************************************************************************************/

USE [BikesDB]
GO

select * from ProductCat_EXT
select * from Products_EXT

select * from Products_EXT
where PRODCATEGORY_ID = 'RO'


--Command statements 

--Products_EXT
select p.*, pt.LANGUAGE, pt.SHORT_DESCR, pt.MEDIUM_DESCR, pt.LONG_DESCR
from Products p
right outer join ProductTexts pt on p.PRODUCT_ID = pt.PRODUCT_ID;



/**ProductCat_EXT**/
select pc.PRODCATEGORY_ID, pc.CREATEDBY, pc.CREATEDAT, pcs.LANGUAGE,
pcs.SHORT_DESCR, pcs.MEDIUM_DESCR, pcs.LONG_DESCR
from ProductCategories pc
inner join ProductCategoryText pcs on pc.PRODCATEGORY_ID = pcs.PRODCATEGORY_ID



--AFTER EXECUTING THE PACKAGE IN VISUAL STUDIO, PERFORM TEST



USE BikesDW

SELECT * FROM DimProductCat_EXT





/*****************************************************************************************/


--Seeking ways to convert CREATEDAT column from int to date.


SELECT COL_LENGTH('ProductCAT_EXT', 'CREATEDAT')  
--lenght of this column is 4. must be 8 for data type DT_DBDATE in SSIS


select 
CAST(CREATEDAT AS char(8))
FROM ProductCat_EXT;



select 
CONVERT(date, CAST(CREATEDAT AS char(8)))
FROM ProductCat_EXT;



select pc.PRODCATEGORY_ID, pc.CREATEDBY, CONVERT(date, CAST(pc.CREATEDAT AS char(8))) as CREATEDAT, pcs.LANGUAGE,
pcs.SHORT_DESCR, pcs.MEDIUM_DESCR, pcs.LONG_DESCR
from ProductCategories pc 
inner join ProductCategoryText pcs on pc.PRODCATEGORY_ID = pcs.PRODCATEGORY_ID;

