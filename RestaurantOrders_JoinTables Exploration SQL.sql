--Combine the menu_items and order_items tables into single table
select* from RestaurantOrders..menu_items;
select* from RestaurantOrders..order_details;

select* 
from RestaurantOrders..order_details od left join RestaurantOrders..menu_items mi 
	on od.item_id=mi.menu_item_id;


--least and most ordered items? What categories?
select item_name, count(order_details_id) as num_purchases
from RestaurantOrders..order_details od left join RestaurantOrders..menu_items mi 
	on od.item_id=mi.menu_item_id
group by item_name
order by num_purchases;

select item_name, category, count(order_details_id) as num_purchases
from RestaurantOrders..order_details od left join RestaurantOrders..menu_items mi 
	on od.item_id=mi.menu_item_id
group by item_name, category
order by num_purchases;

--Top 5 orders that spent the most money
select order_id, sum(price) as Total_spend
from RestaurantOrders..order_details od left join RestaurantOrders..menu_items mi 
	on od.item_id=mi.menu_item_id
	group by order_id
	order by Total_spend desc;


--View the details of the highest paid spend order. Gather insights
select category, count(item_id) as num_items
from RestaurantOrders..order_details od left join RestaurantOrders..menu_items mi 
	on od.item_id=mi.menu_item_id
where order_id = 440
group by category;

--View the details of the top 5 highest spend orders. Gather insights
select order_id, category, count(item_id) as num_items
from RestaurantOrders..order_details od left join RestaurantOrders..menu_items mi 
	on od.item_id=mi.menu_item_id
where order_id in (440, 2075, 1957, 330, 2675)
group by order_id, category;