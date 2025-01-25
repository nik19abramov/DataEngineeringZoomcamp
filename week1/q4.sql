SELECT 
	lpep_pickup_datetime::date
	, MAX(trip_distance) as max_trip_distance
FROM public.green_taxi_data
group by 1
order by 2 desc
limit 1