{{
    config(
        materialized='table'
    )
}}

with fhv_tripdata as (
    select *
    from {{ ref('stg_fhv_tripdata') }}
)
, dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)

select
    dispatching_base_num,
    t.pickup_locationid, 
    t.pickup_datetime,
    EXTRACT(YEAR FROM t.pickup_datetime) as year_pickup_datetime,
    EXTRACT(MONTH FROM t.pickup_datetime) as month_pickup_datetime,
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
    t.dropoff_locationid,
    t.dropoff_datetime,
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone, 
    t.affiliated_base_number 
from fhv_tripdata as t 
inner join dim_zones as pickup_zone
on t.pickup_locationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on t.dropoff_locationid = dropoff_zone.locationid