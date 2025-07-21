WITH BIKE AS (

SELECT
DISTINCT
START_STATIO_ID AS station_id,
start_station_name as station_name,
start_lat as station_lat,
start_lng as start_station_lng

FROM {{ source('DEMO', 'BIKE') }}

where RIDE_ID != 'ride_id'

LIMIT 10

)

SELECT*
FROM BIKE