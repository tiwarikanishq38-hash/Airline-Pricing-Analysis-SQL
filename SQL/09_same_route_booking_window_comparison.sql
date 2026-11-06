select
airline,
concat(source_city,"->",destination_city) as route,
SUM(CASE
    WHEN days_left BETWEEN 31 AND 49 THEN 1
    ELSE 0
END) AS early_listing_count,

SUM(CASE
    WHEN days_left BETWEEN 1 AND 7 THEN 1
    ELSE 0
END) AS last_minute_listing_count,

avg((case
when days_left between 1 and 7 then price END)) AS avg_last_minute_price,
avg((case 
when days_left between 31 and 49 then price end))as avg_early_booking_price,
(avg((case
when days_left between 1 and 7 then price END))-avg((case 
when days_left between 31 and 49 then price end)))/avg((case 
when days_left between 31 and 49 then price end))*100 as price_increase_pct,
(avg((case
when days_left between 1 and 7 then price END))-avg((case 
when days_left between 31 and 49 then price end))) as absolute_price_difference
from airlines_flights_data
where class="economy"  and source_city='kolkata' and destination_city='bangalore'
group by source_city , destination_city,airline
having early_listing_count>=20 and last_minute_listing_count>=20
ORDER BY absolute_price_difference DESC;


