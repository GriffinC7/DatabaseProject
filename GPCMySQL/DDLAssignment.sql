--DDl Assignment 
-- Query 1 Adds Address1, Address2, City, State as char(2), and Zip as varchar(10)
--a)
Alter Table employees add column Address1 varchar(50);
--b)
Alter table employees add column Address2 varchar(50);
--c)
Alter Table employees add City varchar(30);
--d)
Alter Table employees add State char(2);
--e)
Alter Table employees add Zip varchar(10);

-- Query 2 Changed data type in custName from Varchar(50) to varchar(75)
Alter table customers modify column custName varchar(75);

-- Query 3 Renamed purchasePrice column to Cost 
Alter Table products rename column purchasePrice to Cost

-- Query 4 Creates vendor table and adds columns vendorID, vendorName, and vendorcontactphone 
Create Table Vendors 
( 
vendorID int primary key, 
vendorName varchar(50),
vendorcontactphone varchar(15)
)

-- Query 5 Makes the column venderName in the vendors table Unique and Not Null
Alter Table vendors add unique (vendorName);
Alter Table vendors modify vendorName varchar(50) Not Null;