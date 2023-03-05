-- selects a database
use ap;

--Selects all rows and columns from vendors table
select * from vendors;

-- renames fields in sql but not in the database
-- makes easy to read and understand data better
select 
vendor_name as VendorName, 
vendor_city as City
from vendors;
-- calculates and adds 10% late fee to the invoice total 
-- renames those fields to  Late Fee and Late Fee + Invoice total
select 
invoice_due_date,
invoice_total Total,
invoice_total * .10 as "Late Fee",
invoice_total * (1 + .10) as "Invoice Total + Fees"
from 
invoices;
--Selects fields and immediatly changes their name in sql but not in the database
select
concat(vendor_city, ',', vendor_state) as "City, State"
from vendors;

--Selects invoive date and hanges the format fo the data in that field
select 
invoice_date,
date_format(invoice_date, '%m,%d,%y') as "MM/DD/YY",
date_format(invoice_date, '%e,%b,%Y') as "DD-Mon-YYYY"

-- selects a certain range of data that is stored in a field or fields
WHERE invoice_total between 500 and 1000
order by invoice_due_date desc;