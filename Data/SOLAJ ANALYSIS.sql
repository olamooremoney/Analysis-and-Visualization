
-- Total number of products sold so far.
select count(*) as "Total Number of Products"
from products;

-- 2. Total Revenue So far.
select * from products;
select * from order_details;

select round(sum(price * quantity),2) as "Total Revenue"
from order_details as od
inner join products as p on p.ProductID = od.ProductID;