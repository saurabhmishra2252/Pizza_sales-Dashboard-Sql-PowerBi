
select * from pizza_sales


                       ---requirements
---total revenue
SELECT ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales;

--avg order value--->total revenue/distinct count order_id
select round(sum(total_price)/count (distinct order_id),2) [avg order_value] from pizza_sales

--total pizza sold--->sum of all qty of pizza sold
select sum(quantity) from pizza_sales[total pizza sold]

----total order placed
select count(distinct order_id)[total orders] from pizza_sales

--avg pizza per order .....*inorder to make decimale we use cast/we can also use round clause
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal (10,2)) as decimal (10,2))from pizza_sales

---daily trend  for total orders
select DATENAME(dw,order_date)[order_day],count(distinct order_id)[total_orders]   --datename used for derive the date of week,dw=day of week as caracter string
from pizza_sales
group by DATENAME(dw,order_date)

--monthly trend total orders
select DATENAME(MONTH,order_date)[month name],count(distinct order_id)[total_orders]
from pizza_sales
group by DATENAME(MONTH,order_date)
order by total_orders desc

--%age of sales by pizza catagory
select pizza_category,round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2)[percentage]
from pizza_sales[total sales]
group by pizza_category

---top 5 best sellers by revenue
select top 5 pizza_name,count(distinct order_id)[total_orders]
from pizza_sales
group by pizza_name
order by total_orders desc

--bottom 5
select top 5 pizza_name,count(distinct order_id)[total_orders]
from pizza_sales
group by pizza_name
order by total_orders 
