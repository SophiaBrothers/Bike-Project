use BikesDB

select * from BusinessPartners 
--40 rows


/** checking for new records to determine type of slowly changing dimension) **/
select PARTNER_ID, COMPANYNAME, CREATEDAT, CHANGEDAT
from BusinessPartners
where CREATEDAT != CHANGEDAT
group by PARTNER_ID, COMPANYNAME, CREATEDAT, CHANGEDAT
/** because no records where returned, I assume the create and change dates are the same.  THIS IS A TYPE 2 **/

select PARTNER_ID, COMPANYNAME, CREATEDAT, CHANGEDAT
from BusinessPartners
group by PARTNER_ID, COMPANYNAME, CREATEDAT, CHANGEDAT
-- 40 rows


/** checking for duplicates. determining dimension type  **/
select * from Addresses
where ADDRESS_ID in (select ADDRESS_ID from Addresses GROUP BY ADDRESS_ID having COUNT(*) > 1);
/** every address apears unique **/

select * from Addresses   /** could be a type 2 **/


select top 5 * from Employees

select top 5 * from SalesOrders;   /** THIS IS INFO ABOUT THE ORDER ITSELF **/

select top 5 * from SalesOrderItems   /** THIS IS INFO ABOUT THE ITEM ORDERED **/

SELECT * FROM SalesOrderItems
WHERE SALESORDER_ID = 500000000


/** finding duplicates **/
select * from SalesOrders
where SALESORDER_ID in (select SALESORDER_ID from SalesOrders GROUP BY SALESORDER_ID having COUNT(*) > 1);
/** results show that every id in this table is unique **/

select * from SalesOrderItems
where SALESORDER_ID in (select SALESORDER_ID from SalesOrderItems GROUP BY SALESORDER_ID having COUNT(*) > 1);



select top 5 * from ProductCategories

select top 5 * from ProductCategoryText

select count (distinct PRODCATEGORY_ID) from ProductCategories       --9
select count (distinct PRODCATEGORY_ID) from ProductCategoryText     --9

/**row count **/
SELECT COUNT(*)
FROM ProductCategories    -- 9

SELECT COUNT(*)
FROM ProductCategoryText  --9


/** COULD THESE TABLES JUST BE JOINED??? **/
GO
CREATE VIEW ProductCat_EXT AS
select pc.PRODCATEGORY_ID, pc.CREATEDBY, pc.CREATEDAT, pcs.LANGUAGE,
pcs.SHORT_DESCR, pcs.MEDIUM_DESCR, pcs.LONG_DESCR
from ProductCategories pc
inner join ProductCategoryText pcs on pc.PRODCATEGORY_ID = pcs.PRODCATEGORY_ID
GO

select * from ProductCat_EXT

select top 5 * from Products

select top 5 * from ProductTexts

select count (distinct PRODUCT_ID) from Products       --42
select count (distinct PRODUCT_ID) from ProductTexts    --42

/**row count **/
SELECT COUNT(*)
FROM Products   -- 42

SELECT COUNT(*)
FROM ProductTexts  --44


/** trying to find the rows not found in both **/
SELECT p.PRODUCT_ID
FROM Products p
left outer JOIN ProductTexts pt ON p.PRODUCT_ID = pt.PRODUCT_ID
WHERE pt.PRODUCT_ID IS NULL

/**another aproach. find duplicate ids **/
select * from ProductTexts
where PRODUCT_ID in (select PRODUCT_ID from ProductTexts GROUP BY PRODUCT_ID having COUNT(*) > 1);
/** two of the products have two languages **/


/** COULD THESE TABLES JUST BE JOINED??? **/

/** have to have the go statements for this batch **/

go   
create view Products_EXT
as
select p.*, pt.LANGUAGE, pt.SHORT_DESCR, pt.MEDIUM_DESCR, pt.LONG_DESCR
from Products p
right outer join ProductTexts pt on p.PRODUCT_ID = pt.PRODUCT_ID;
go

/** this new table view has the 44 rows. **/

/** checking that the duplicate product id's are still there with two languanges  **/
select * from Products_EXT
where PRODUCT_ID in (select PRODUCT_ID from Products_EXT GROUP BY PRODUCT_ID having COUNT(*) > 1)

/**  YES, they are there!!!! **/




