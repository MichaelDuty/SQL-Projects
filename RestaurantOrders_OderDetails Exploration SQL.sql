--view the order_details table 
select* 
from RestaurantOrders..order_details;

--Date range for the table
select min(order_date) as Min_OrderDate, max(order_date) as Max_OrderDate
from RestaurantOrders..order_details

--Number of orders made within the date range
select count(distinct order_id)from RestaurantOrders .. order_details

--Number of items ordered within the date range 
select count(*) as Total_items
from RestaurantOrders..order_details 

--Orders that had the most number of items
select order_id, count(item_id) as num_items
from RestaurantOrders..order_details
group by order_id 
order by num_items desc

--number of orders that had more than 12 items
(select order_id, count(item_id) as num_items
from RestaurantOrders..order_details
group by order_id
having num_items > 12) as num_orders