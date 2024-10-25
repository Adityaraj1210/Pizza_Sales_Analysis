-- Advanced
-- Calculate the percentage contribution of each pizza type to total revenue.  /* change .name to .categogy in grp by to know category contribution*/
-- Important query CTE can also be used at next select statment

select pizza_types.Name, round((sum(order_details.quantity*pizzas.price)/(select sum(order_details.quantity*pizzas.price) from pizzas
join order_details on pizzas.pizza_id = order_details.pizza_id))*100, 2)
 as revenue from pizza_types Join pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
Join order_details
On pizzas.pizza_id = order_details.pizza_id
group by pizza_types.Name;


-- Analyze the cumulative revenue generated over time.
select date, round(sum(Per_day_revenue) over(order by date),2) as cum_revenue from (select orders.date, round(sum(order_details.quantity*pizzas.price),2) as Per_day_revenue from pizzas join order_details
On pizzas.pizza_id = order_details.pizza_id
Join orders
On orders.order_id = order_details.order_id
group by orders.date) as revenue_table;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.  /* 2 sub-queries has been used here */
select category,name, rank_by_revenue from (select category, name, revenue, rank() over(partition by category order by revenue desc) as rank_by_revenue from (select pizza_types.category,pizza_types.name,sum(order_details.quantity*pizzas.price) as revenue from pizza_types 
join pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details On pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category,pizza_types.name) as category_revenue) as rank_table
where rank_by_revenue <= 3;

 

