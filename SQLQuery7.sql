SELECT name
FROM sys.databases;

--List Of Tables
select * from sales.order_items
select * from sales.customers
select * from sales.stores
select * from sales.staffs
select * from sales.orders
select * from production.stocks
select * from production.categories
select * from production.brands
select * from production.products

--Combining the Useful columns for analysis
select ord.order_id , 
concat(cus.first_name,' ',cus.last_name) as 'Full_Name',
cus.city,
cus.state,
ord.order_date,
sum(ite.quantity) as 'Total_Units',
sum(ite.quantity*ite.list_price) as 'Revenue',
pro.product_name ,
cat.category_name,
sto.store_name ,
concat(staff.first_name,' ',staff.last_name) as 'Sales Rep',
bra.brand_name
from sales.orders ord
join sales.customers cus
on ord.customer_id = cus.customer_id
join sales.order_items ite
on ite.order_id = ord.order_id
join production.products pro
on ite.product_id = pro.product_id
join production.categories cat
on pro.category_id = cat.category_id
join sales.stores sto
on sto.store_id = ord.store_id
join sales.staffs staff
on staff.staff_id = ord.staff_id
join production.brands bra
on pro.brand_id = bra.brand_id
group by ord.order_id , 
concat(cus.first_name,' ',cus.last_name),
cus.city,
cus.state,
ord.order_date,
pro.product_name,
cat.category_name,
sto.store_name,
concat(staff.first_name,' ',staff.last_name),
bra.brand_name











