create database Ola;
use Ola;

#1 Retrive all successful bookings
create view Successful_Booking As
select * from booking
where Booking_Status = 'Success';

select * from Successful_Booking;

#2 find the avg ride dist for each vehical type
create view ride_distance_for_each_vehicle As
select Vehicle_Type, avg(Ride_Distance )
as avg_ride_dist from booking
group by Vehicle_Type;

select * from  ride_distance_for_each_vehicle;

#3 get the total number of canceled rides by customers
create view rides_cancled_by_customers As
select count(*) from booking
where Booking_Status ="Canceled by Customer";

select * from  rides_cancled_by_customers;

#4 list the top 5 customers who booked the highest number of rides
create view top_5_customers_who_booked_the_highest_number_of_rides As
select Customer_ID, count(Booking_ID) as total_rides
from booking
group by Customer_ID 
order by total_rides desc limit 5; 

#5 get the number of rides canceled by drivers due to personal and car-related issues:
select count(*) from booking 
where Canceled_Rides_by_Driver ="Personal & Car related issue";

#6 find the maximum and minimum driver ratings for Prime Sedan Bookings
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating from booking 
where Vehicle_Type= "Prime Sedan";

#7 retrive all rides where payment was made using UPI
select *from booking
where Payment_Method = 'UPI';

#8 find the avg customer rating per vehicle type
select Vehicle_Type, avg(Customer_Rating ) as avg_cust_rating
from booking 
group by  Vehicle_Type;

#9 calculate the total booking value of rides completed successfully
select sum(Booking_Value) from booking
where Booking_Status ="Success";

#10 list all the incomplete rides along with the reason 
select Booking_ID, Incomplete_Rides, Incomplete_Rides_Reason from booking 
where Incomplete_Rides="Yes";

