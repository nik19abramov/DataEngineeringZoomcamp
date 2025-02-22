{{ config(materialized='table') }}

with trips_data as (
    select * from {{ ref('fact_trips') }}
)

select distinct
  EXTRACT(YEAR FROM pickup_datetime) as year,
  EXTRACT(MONTH FROM pickup_datetime) as month,
  service_type,
  PERCENTILE_CONT(fare_amount, 0.97) OVER(PARTITION BY service_type, EXTRACT(YEAR FROM pickup_datetime), EXTRACT(MONTH FROM pickup_datetime)) AS p97,
  PERCENTILE_CONT(fare_amount, 0.95) OVER(PARTITION BY service_type, EXTRACT(YEAR FROM pickup_datetime), EXTRACT(MONTH FROM pickup_datetime)) AS p95,
  PERCENTILE_CONT(fare_amount, 0.90) OVER(PARTITION BY service_type, EXTRACT(YEAR FROM pickup_datetime), EXTRACT(MONTH FROM pickup_datetime)) AS p90
from trips_data
where 1=1
    and fare_amount > 0
    and trip_distance > 0
    and payment_type_description in ('Cash', 'Credit Card')
    --and EXTRACT(YEAR FROM pickup_datetime) = 2020
    --and EXTRACT(MONTH FROM pickup_datetime) = 4


