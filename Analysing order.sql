-- How many ROWS are there in order_details?
select * from order_details;

-- How many COLUMNS are there in order_details?
SELECT count(*) AS NUMBEROFCOLUMNS FROM information_schema.columns WHERE table_name ='order_details';

-- Total Revenue:
select round(sum(quantity * price),2) as Total_Revenue
from order_details as od join pizzas as p
on od.pizza_id = p.pizza_id;

-- Average Order Value
select round(sum(quantity * price)/count(distinct od.order_id),2) as Total_Revenue
from order_details as od join pizzas as p
on od.pizza_id = p.pizza_id;

-- Total Pizzas Sold:
select sum(quantity) as 'Total pizza sold' from order_details;

-- Total Orders:
select count(distinct order_id) as 'Total Orders' from orders;

-- Average Pizzas Per Order:
select round(sum(quantity)/count(distinct order_id),2) as 'Avg_pizza/order' from order_details;






