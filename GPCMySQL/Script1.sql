select vendor_name, vendor_phone, vendor_state from vendors
where vendor_state = "CA"
and vender_phone is null;

select * from vendors where vendor_phone is not null; 