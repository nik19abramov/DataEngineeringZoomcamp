SELECT 
    tzd."Zone",
    MAX(gtd.tip_amount)
FROM public.green_taxi_data AS gtd
LEFT JOIN public.taxi_zone AS tzu
    ON gtd."PULocationID" = tzu."LocationID"
LEFT JOIN public.taxi_zone AS tzd
    ON gtd."DOLocationID" = tzd."LocationID"
WHERE 1=1
	and gtd.lpep_pickup_datetime::date >= '2019-10-01'
	AND gtd.lpep_pickup_datetime::date < '2019-11-01'
	AND tzu."Zone" = 'East Harlem North'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;