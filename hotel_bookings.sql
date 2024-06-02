imported CSV file using import table wizard
	
use project;

select * from hotel_bookings;

-- to get the total number of bookings
select count(*) as total_entries_in_dataset from hotel_bookings; -- 119386  total number of enteries in the datasets

-- list the total number countries from bookings
select count(distinct(country)) from hotel_bookings;  -- total count of country is 177-1 (null) =176 countries
select distinct country from hotel_bookings;

-- number of bookings per hotel type?
select hotel, count(*) from hotel_bookings
group by hotel ; -- Resort Hotel: 40060 bookings, City Hotel :79326 bookings

-- booking made in a specific timeperiod (say January 2016) hotel wise

select hotel,count(*) from hotel_bookings
where Arrival_Month =1 and Arrival_Date_Year= 2016
group by hotel;  -- Resort Hotel: 884 bookings, City Hotel: 1364 bookings in the month of january in 2016

-- count of cancelled and not cancelled bookings?

select hotel, Is_Canceled, count(*) from hotel_bookings
group by hotel,Is_Canceled; -- Cancelled from Resort Hotel= 11122, not cancelled= 28938
                            -- cancelled from City Hotel =  33098, not Cancelled= 46228

-- bookings per market segment?
select market_segment, count(*) from hotel_bookings
group by Market_Segment; -- Direct booking =12605, Corporate booking=5295, Online TA booking= 56476, Offline TA/TO booking= 24219
                        -- Complementary booking= 743, Groups booking =19811, Aviation booking =237
                        
-- special request made is maximum in which tpye of hotels?

select hotel,sum(total_of_special_requests) as special_requests from hotel_bookings
group by hotel;  -- in Resort Hotel the special request made is 24828, and in City hotel it is 43382 (max)

-- Average waiting list in different hotel type ?
select hotel, round(avg(Days_in_waiting_list),2) from hotel_bookings
group by hotel;  -- average waiting in Resort hotel is 0.53 day and in City hotel is 3.23 days

-- room changed by hotel type?
select hotel,is_room_changed, count(*) from hotel_bookings
group by hotel, Is_Room_Changed;  -- In Resort hotel: no change- 32335 , changed-7725
							      -- In city hotel: no change -72134,    changed-7192

-- average baby, children, adults in each hotel type?

select hotel, round(avg(Babies),2) as avg_babies,round(avg(children),2) avg_children, round(avg(adults),2) avg_adults from hotel_bookings
group by hotel;

-- maxium number of tourist coming from which top-4 countries

select country,count(*) from hotel_bookings
group by country
order by count(*) desc limit 4 ; -- top countries are PRT (Portugal)-48586, GBR(great Britain)-12129, FRA(france)-10415, ESP(spain)-8568

-- find bookings where room assigned is different from room booked ?

select hotel,count(*) from hotel_bookings
where Reserved_Room_Type <> Assigned_Room_Type -- total of 14917 cases
group by hotel;   -- resort hotel makes most changes with 7735 cases whereas city hotel did 7192 room change

-- which month of the year attract highest tourist for year 2017?

select arrival_month, count(*) from hotel_bookings
where Arrival_Date_Year =2017
group by  Arrival_Month
order by count(*) desc ;  -- in year 2017, in month may 6313 booking done followed by april, june, july

-- meals preference of the tourist ?
select  meal, count(*) from hotel_bookings
group by meal
order by count(*) desc;   -- most of the tourist preferred Bed and Breakfast- 92306,  followed by breakfast and one meal- 14463 and full meal by 12617

-- customer preference w.r.t advanace payments?

select Deposit_type , count(*) from hotel_bookings
group by Deposit_Type
order by count(*) desc; -- most of the customers are choosing No deposit- 104637, followed by non refund 14587 and refundable by 162

-- number of booking with a specical request of parking?

select count(Required_car_parking_spaces) as request_for_parking from hotel_bookings
where Required_Car_Parking_Spaces<>0;  -- 7416 customers requested for parking spaces

