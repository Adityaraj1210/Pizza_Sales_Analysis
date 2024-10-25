-- Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;

-- Calculate the total revenue generated from pizza sales.
select sum(order_details.quantity*pizzas.price) as total_sales from
order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza.
select pizza_id, price from pizzas
order by price desc
limit 1; 

select pizza_types.name, pizzas.price from pizza_types
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc
limit 1;

-- Identify the most common pizza size ordered.
SELECT pizzas.size,sum(order_details.quantity) as Total_quantity from pizzas
join order_details ON pizzas.pizza_id = order_details.pizza_id
group by pizzas.size
order by Total_quantity desc;

-- List the top 5 most ordered pizza types along with their quantities.
select pizzas.pizza_type_id, sum(quantity) as Total_quantity_ordered from pizzas join order_details
On pizzas.pizza_id = order_details.pizza_id
group by pizza_type_id
order by Total_quantity_ordered Desc
limit 5;

-- mam
select pizza_types.name,sum(order_details.quantity) as quantity from pizzas join order_details
ON pizzas.pizza_id = order_details.pizza_id
Join pizza_types ON
pizzas.pizza_type_id = pizza_types.pizza_type_id
group by pizza_types.name
order by quantity desc
limit 5;

select pizza_types.name,sum(order_details.quantity) as quantity from pizza_types join pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
Join order_details ON
order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by quantity desc
limit 5;

