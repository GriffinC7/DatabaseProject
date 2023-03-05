Summary Queries Assignment
1
--a)
select count(*) from customers;
--b)
select count(*) from orders;
--c)
select count(*) from orderdetails;

2
--a)
select (quantityOrdered * priceEach) from orderdetails;
--b)
select sum(quantityOrdered * priceEach) from orderdetails; --returns us one row
--c)
select concat('$', format(sum(quantityOrdered * priceEach),2)) 
as TotalOrder from orderdetails;

3
select concat('$', format(sum(quantityOrdered * priceEach),2)) as TotalOrder,
concat('$', format(avg(quantityOrdered * priceEach),2)) as Average
from orderdetails;

4
select orderNumber, concat('$', format(sum(quantityOrdered * priceEach),2)) as TotalOrder,
concat('$', format(avg(quantityOrdered * priceEach),2)) as Average
from orderdetails
group by orderNumber
--a)add this order by clause ot the end
order by orderNumber desc;

5
-- added having clause and removed formatting from TotalOrder 
select orderNumber, sum(quantityOrdered * priceEach) as TotalOrder,
concat('$', format(avg(quantityOrdered * priceEach),2)) as Average
from orderdetails
group by orderNumber
having TotalOrder > 10000
order by orderNumber desc;