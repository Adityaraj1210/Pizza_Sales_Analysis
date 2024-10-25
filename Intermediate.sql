-- Intermediate
-- ##Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT pizza_types.category,sum(quantity) as total_quantity from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
group by pizza_types.category
order by total_quantity desc;


-- Determine the distribution of orders by hour of the day.
select hour(orders.time) as hour, count(order_id) as count_order from orders
group by hour(orders.time)
order by count_order desc;

-- Group the orders by date and calculate the average number of pizzas ordered per day. -- ##BEST QUESTION SUBQUERIES used here
select round(avg(Total_quantity),0) as avg_pizza_ordered_per_Day from (select orders.date, sum(order_details.quantity) as Total_quantity from orders join order_details
ON orders.order_id = order_details.order_id
group by orders.date) as quantity_with_date; -- using as is must

-- Determine the top 3 most ordered pizza types with category based on revenue.
select pizza_types.name, pizza_types.category, sum(order_details.quantity*pizzas.price) as Revenue from pizza_types join pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
ON order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name,pizza_types.category 
order by revenue desc
limit 3;





