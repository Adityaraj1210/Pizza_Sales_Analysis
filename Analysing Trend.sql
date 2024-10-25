## Identify Trends:

-- Daily Trend for Total Orders:
select dayname(date) as Weekdays, count(order_id) as no_of_order from orders
group by Weekdays
order by no_of_order desc;


-- Daily Trend for Total pizzas sold:
with cte as (select o.date as date, sum(od.quantity) as daily_quantity
from order_details as od join orders as o
on od.order_id = o.order_id
group by o.date)
select x.weekdays, sum(x.daily_quantity) as daily_quantity_ordered
from (select cte.*, dayname(cte.date) as weekdays from cte) as x
group by x.weekdays
order by daily_quantity_ordered desc;

-- Monthly Trend for Total Pizzas sold:
with cte as (select monthname(o.date) as Month, od.quantity as quantity
from order_details as od join orders as o
on od.order_id = o.order_id
)
select cte.Month, sum(cte.quantity) as total_pizzas_sold
from cte
group by cte.Month
order by total_pizzas_sold desc;


-- Monthly Trend for Total Orders:
select monthname(date) as Month, count(order_id) as no_of_order from orders
group by Month
order by no_of_order desc;

-- Hourly Trend for Total Orders:-
select hour(o.time) as 'time(in 24hr)', sum(quantity) as ordered_quantity
from order_details as od join orders as o
on od.order_id = o.order_id
group by hour(o.time)
order by ordered_quantity desc;

-- Total Pizzas Sold by Pizza Category
select pt.category, sum(quantity) as Total_quantity_ordered
from order_details as od join pizzas as p
on p.pizza_id = od.pizza_id
join pizza_types as pt
on pt.pizza_type_id = p.pizza_type_id
group by pt.category
order by Total_quantity_ordered desc;

-- Top 5 Best Sellers by Total Pizzas Sold:-
select name as 'pizza_name(Top 5 sold)', sum(quantity) as Total_quantity_ordered
from order_details as od join pizzas as p
on p.pizza_id = od.pizza_id
join pizza_types as pt
on pt.pizza_type_id = p.pizza_type_id
group by name
order by Total_quantity_ordered desc
limit 5;

-- Top 5 Worst Sellers by Total Pizzas Sold:-
select name as 'pizza_name(worst 5 sold)', sum(quantity) as Total_quantity_ordered
from order_details as od join pizzas as p
on p.pizza_id = od.pizza_id
join pizza_types as pt
on pt.pizza_type_id = p.pizza_type_id
group by name
order by Total_quantity_ordered asc
limit 5;

-- Percentage of sales by Pizza category
select 
	category, sum(quantity) as Total_quantity_ordered, 
	round(sum(quantity)*100/(select sum(quantity) from order_details),0) as percentage_contribution
from 
	order_details as od join pizzas as p
	on p.pizza_id = od.pizza_id
	join pizza_types as pt
	on pt.pizza_type_id = p.pizza_type_id
group by category;

-- Percentage revenue by pizza category
select 
	category, ceil(sum(quantity * price)) as 'revenue/category', 
	round(sum(quantity * price)*100/(select round(sum(quantity * price),2) as Total_Revenue
	from order_details as od join pizzas as p
	on od.pizza_id = p.pizza_id),0) as percentage_revenue_contribution
from order_details as od join pizzas as p
on p.pizza_id = od.pizza_id
join pizza_types as pt
on pt.pizza_type_id = p.pizza_type_id
group by category
