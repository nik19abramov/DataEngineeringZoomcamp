with cte as (
SELECT 
  --timestamp_diff(pickup_datetime, affiliated_base_number, second)  as trip_duration
  *
FROM `ny-rides-nikolay.dbt_nabramov.fhv_tripdata` 
order by pickup_datetime desc
)
select
  DISTINCT
  EXTRACT(YEAR FROM pickup_datetime)
  , EXTRACT(MONTH FROM pickup_datetime)
  , pickup_locationid
  , dropoff_locationid
  , PERCENTILE_CONT(trip_duration, 0.90) OVER(PARTITION BY 
      EXTRACT(YEAR FROM pickup_datetime)
      , EXTRACT(MONTH FROM pickup_datetime)
      , pickup_locationid
      , dropoff_locationid
      ) AS p90,
from cte
where 1=1
  and EXTRACT(YEAR FROM pickup_datetime) = 2019
  and EXTRACT(MONTH FROM pickup_datetime) = 11
LIMIT 1000