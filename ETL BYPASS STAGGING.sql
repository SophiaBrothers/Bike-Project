/**ETL PROCESS OF JOINING TWO TABLES AND BYPASSING STAGGING TABLES**/


USE [BikesDB]
GO

/**ETL SCRIPT**/

/**Products_EXT**/
select p.*, pt.LANGUAGE, pt.SHORT_DESCR, pt.MEDIUM_DESCR, pt.LONG_DESCR
from Products p
right outer join ProductTexts pt on p.PRODUCT_ID = pt.PRODUCT_ID;



/**ProductCat_EXT**/
select pc.PRODCATEGORY_ID, pc.CREATEDBY, pc.CREATEDAT, pcs.LANGUAGE,
pcs.SHORT_DESCR, pcs.MEDIUM_DESCR, pcs.LONG_DESCR
from ProductCategories pc
inner join ProductCategoryText pcs on pc.PRODCATEGORY_ID = pcs.PRODCATEGORY_ID