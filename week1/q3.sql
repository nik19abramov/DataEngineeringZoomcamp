SELECT 
	CASE 
		WHEN trip_distance <= 1 then '0. <= 1'
		WHEN trip_distance > 1 and trip_distance <=3 then '2. 1 - 3'
		WHEN trip_distance > 3 and trip_distance <=7 then '3. 3 - 7'
		WHEN trip_distance > 7 and trip_distance <=10 then '4. 7 - 10'
		WHEN trip_distance > 10 then '5. > 10'
	end as trip_length
	, count(distinct index) as cnt
FROM public.green_taxi_data
where 1=1
	and lpep_pickup_datetime::date between '2019-10-01' and '2019-11-01'
group by 1