# Pizza sales Analysis

The purpose of this report is to provide a detailed analysis of pizza sales data for a restaurant in the year 2023. The analysis focuses on calculating key performance indicators (KPIs) and identifying trends to gain insights into the business performance.

**About the dataset:**

- This dataset contains 4 tables in CSV format
- The Orders table contains the date & time that all table orders were placed.
- The Order Details table contains the different pizzas served with each order in the Orders table, and their quantities
- The Pizzas table contains the size and price for each distinct pizza in the Order Details table, as well as its broader pizza type
- The Pizza Types table contains details on the pizza types in the Pizzas table, including their name as it appears on the menu, the category it falls under, and its list of ingredients


**Problem Statement:** 

- Analyze pizza sales data to derive meaningful insights.
- Provide a comprehensive understanding of key metrics and trends in pizza sales.
- Analyzing How the Quantity, Orders and days affect the overall revenue. 
- Enable management to make informed decisions on pricing and pitching.
- Enhance business performance through data-driven decision-making.

**Some questions that we'd like to be able to answer:**
- What days and times tend to be busiest?
- How many pizzas are the restaurant making during peak periods?
- What are the best and worst selling pizzas?
- What's the average order value?

**Objectives**

- **Calculate Key Performance Indicators (KPIs):**
    - **Total Revenue**: Sum of the total price of all pizza orders.
    - **Average Order Value**: Average amount spent per order.
    - **Total Pizzas Sold**: Sum of the quantities of all pizzas sold.
    - **Total Orders**: Total number of orders placed.
    - **Average Pizzas Per Order**: Average number of pizzas sold per order.

 
| Business Goal  | Metrics |Level of Details  | 
| ------------- | ------------- | ------------- | 
| Increase Revenue  | Total Revenue, Month Over Month(MOM) Revenue change  | Date(Quarter,Month,Day), Pizza Type,Pizza category, size  | 
| Increase Orders  | Total Orders, MoM sales Change  | Date(Quarter,Month,Day), Pizza Type,Pizza category, size  | 
| Improve Productivity  | Total Orders  | Date(Quarter,Month,Day) - peak Periods  | 
| Understanding cutomers' Purchase behaviour  | Average order Value(AOV)  | Date(Quarter,Month)  | 
| Best and Worst selling Pizzas  | Total Orders, Total Revenue  | Pizza Type,Pizza category, size  |


**Identify Trends:**
- **Daily Trend for Total Orders**: Bar chart showing the daily trend of total orders.
- **Hourly Trend for Total Orders**: Line chart illustrating the hourly trend of total orders.
- **Monthly Trend for Total Orders**: Line chart illustrating the monthly trend of total orders.
- **Total Pizzas Sold by Category**: Funnel chart comparing the sales performance of different pizza categories.
- **Top 5 Best Sellers by Total Pizzas Sold**: Chart highlighting the top 5 selling pizzas.
- **Bottom 5 Worst Sellers by Total Pizzas Sold**: Bar chart showcasing the bottom 5 worst-selling pizzas.
- Percentage Revenue by Pizza Category.
- Percentage Sales By Pizza Category.
