SELECT 
    tz."Zone",
    SUM(gtd.total_amount)
FROM public.green_taxi_data AS gtd
LEFT JOIN public.taxi_zone AS tz
    ON gtd."PULocationID" = tz."LocationID"
WHERE gtd.lpep_pickup_datetime::date = '2019-10-18'
GROUP BY 1
HAVING SUM(gtd.total_amount) > 13000
ORDER BY 2 DESC;