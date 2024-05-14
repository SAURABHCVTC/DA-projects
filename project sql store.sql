select * from store_data;

-- QUES.1:- customer demographics !
select Gender, round(avg(Age),0) as Avg_age, COUNT(*) as total_customer from store_data
group by Gender
order by gender;

-- QUES.2:- which state customers are ordering the most (top-5) ?
 select concat(ship_city, ', ', ship_state) as Location, COUNT(*) as TotalSales from store_data
group by concat(ship_city, ', ', ship_state)
order by TotalSales desc
limit 5;
 
 -- QUES.3:- which state customers are ordering the least (bottom-5) ?
  
 select concat(ship_city, ', ', ship_state) as Location, count(*) as TotalSales from store_data
group by concat(ship_city, ', ', ship_state)
order by TotalSales asc
limit 5;
 
-- QUES.4:- which month of the year the order is received the most (top-5)?

select month, sum(amount) as total_sales_in_Rs from store_data
where status ="Delivered"
group by month
order by sum(amount) desc;

-- QUES.5:- which age group is ordering in large numbers?

select age_group, count(*) as total_order from store_data
group by age_group
order by count(age_group) desc;

-- QUES.6:- which channel giving maximum businesses to the store?

select channel, count(channel) from store_data
group by channel
order by count(channel) desc ;

-- QUES.7:- customer from which state order the most product in terms of revenue?
select Cust_ID,ship_state, SUM(Amount) as TotalSpent_in_Rs from store_data
group by Cust_ID , ship_state
order by TotalSpent_in_Rs desc
limit 5;

-- QUES.8:- gender wise average order value?
select Gender, round(avg(Amount),2) as AvgOrderValue_in_Rs from store_data
group by Gender;

-- QUES.9:- status of the orders dispatched from the store ?
select Status, COUNT(*) as OrderCount from store_data
group by Status;

-- QUES.10:- Top selling product category
select category,gender,count(*) as total_qty from store_data
group by category ,gender
order by count(category) desc; 