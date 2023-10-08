select * from pizza_sales;
-- Hourly trend for Total pizzas sold -- 
select DATEPART(hour,order_time) as order_hour , SUM(quantity) as Total_pizzas_sold from pizza_sales
group by DATEPART(hour,order_time)
order by order_hour asc;

-- Weekly trend for Total orders--
select DATEPART(ISO_WEEK, order_date) as Week_number , YEAR(order_date) as Order_year , count(distinct order_id) as Total_order from pizza_sales
group by DATEPART(ISO_WEEK, order_date), YEAR(order_date)
order by DATEPART(ISO_WEEK, order_date), YEAR(order_date);

-- Percentage of sales by pizza category --
select pizza_category,round(sum(total_price),2) as total_sales,round(SUM(total_price)*100/(select sum(total_price) from pizza_sales),2)as pct from pizza_sales 
group by pizza_category;

-- Percentage of sales by pizza size --
select pizza_size,round(sum(total_price),2) as total_sales,round(SUM(total_price)*100/(select sum(total_price) from pizza_sales where datepart(QUARTER,order_date)=1),2)as pct from pizza_sales 
where datepart(QUARTER,order_date)=1
group by pizza_size
order by pct desc

--Top 5 Best Sellers by Revenue, Total Quantity and Total Orders--
select top 5 pizza_name, SUM(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue desc
-- bottom 5
select top 5 pizza_name, SUM(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue Asc

-- Top 5 by qty --
select top 5 pizza_name, SUM(quantity) as Total_qty from pizza_sales
group by pizza_name
order by Total_qty Desc
-- Bottom 5--
select top 5 pizza_name, SUM(quantity) as Total_qty from pizza_sales
group by pizza_name
order by Total_qty ASC

-- Top 5 by orders --
select top 5 pizza_name, COUNT(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc

-- bottom 5--
select top 5 pizza_name, COUNT(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders ASC





select  pizza_category, COUNT(distinct order_id) from pizza_sales
group by pizza_category

select  pizza_category, SUM(quantity) from pizza_sales
group by pizza_category
