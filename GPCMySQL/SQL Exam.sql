--SQL Exam #1

--1.
select * from products;
Select
CONCAT(productCode, ', ', productName, ', ', productScale, ',', quantityInStock) as "Product
Info" from products;

--2.
Select customerName, phone, city, state, country,
CONCAT(contactLastName, ', ', contactFirstName) as "Contact Name"
from customers;
order by postalCode desc;
--3.
--a)
select textDescription, productCode, productName, quantityInStock, buyPrice, MSRP from 
productlines pl
join products p
on pl.productLine = p.productLine
--b)
where quantityInStock > 400
--c)
added this statement after the MSRP field in the first line in part A
round(MSRP - buyPrice,2) as Profit 
--d)
added this order by statement at the end
order by Profit;

--4)I am allowed to order by the alias-Profit-because I created this alias in the select statement. This
--is before the line where I am ordering my data so it is fair game to use. If I created this alias after my 
--order by statement for some reason it would not work and would give me an error because nothing would be name--d profit.

--5)
select * 
from customers c left join orders o
on c.customerNumber = o.customerNumber
where o.orderNumber is null;

--6)
--a)
select customerName, o.orderNumber, orderDate, status, quantityOrdered
from customers c 
join orders o 
on c.customerNumber = o.customerNumber
join orderdetails od
on o.orderNumber = od.orderNumber
where c.customerNumber = 181
--b)
select customerName, o.orderNumber, orderDate, status, quantityOrdered, productName
from customers c 
join orders o 
on c.customerNumber = o.customerNumber
join orderdetails od
on o.orderNumber = od.orderNumber
join products p
on od.productCode = p.productCode
where c.customerNumber = 181
--c)added this statement to the end of the part b
order by orderDate desc;

--7)Referential integrity means that when you have two tables and one is dependent on the other(parent child relationship), data in the child table must be
-- referenced by the original table. For example, I have a section table that is dependent on a class table and there is 
-- a one to many relationship. I cannot have a value in the section table that does not refernce a value in the class table.