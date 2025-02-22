select *
from {{ source('staging', 'yellow_tripdata') }}
