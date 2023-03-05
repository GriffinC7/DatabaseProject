--SQL Assignment 1
-- Query 1 Selects all shipping data from the shippers table
select * from shippers

-- Query 2 Selects the fields CatagoryName and Description from catagories table
select CategoryName, Description from categories

-- Query 3 
-- a)Selects all from employees table
Select * from employees
-- b)added this to select all employees who are sales representatives
where Title = "Sales Representative"
-- c)added this to put the Employees hire dates in ascending order
order by HireDate asc;

-- Query 4  Selects employees that are sales representatives in the United States
select * from employees
where Title = "Sales Representative" 
and Country = "USA"

-- Query 5 Lists First name, last name, and initials separated by either a comma or a space in one field
Select FirstName, LastName from employees;
Select
CONCAT(FirstName,' ', LastName, ',', ' ', CONCAT(LEFT(FirstName, 1 ) ,LEFT(LastName, 1))) as FirstLastInitials 
from employees;

-- Query 6 Shows us supplier ids and contact name and titles of suppliers who are not Marketing Managers
select * from suppliers;
Select SupplierID, ContactName, ContactTitle from suppliers 
where not ContactTitle = "Marketing Manager";

-- Query 7 Selects all te suppliers who region is not a null
select * from suppliers
where not region = "null";

-- Query 8 Selects all orders that were shipped to either France or Belgium 
select * from orders
where ShipCountry = "France" or ShipCountry = "Belgium";

-- Query 9 Shows the order id, customer id, and shipping country from orders in Argentina, Brazil, Mexico, and Venezuela
select OrderID, CustomerID, ShipCountry from orders
where ShipCountry in ("Argentina", "Brazil", "Mexico", "Venezuela");

-- Query 10  Combines TitleOfCourtesy, FirstName, and LastName fields and shows it under a column labeled FullName
Select
CONCAT(TitleOfCourtesy, ' ', FirstName,' ', LastName) as FullName
from employees;

