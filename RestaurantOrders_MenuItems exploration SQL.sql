--view the menu items table.
select*
from RestaurantOrders..menu_items

--find the number of items on the menu
select count (*) 
from RestaurantOrders..menu_items

--what are the least and most expensive itmes on the menu?
select*
from RestaurantOrders..menu_items
order by price

select*
from RestaurantOrders..menu_items
order by price desc;

--how many Italian dishes are on the menu?
select count(*)
from RestaurantOrders..menu_items
where category='italian'

--what are the least and most expensive Italian dishes on the menu?
select *
from RestaurantOrders..menu_items
where category='italian'
order by price

select*
from RestaurantOrders..menu_items
where category='italian'
order by price desc;

--how many dishes are in each category?
select category, count(menu_item_ID) as num_dishes
from RestaurantOrders..menu_items
group by category;

--Average dish price within each category
select category, avg(price) as avg_price
from RestaurantOrders..menu_items
group by category;