WITH BIKE AS(

SELECT
distinct
START_STATIO_ID AS STATION_ID,
start_station_name AS STATION_NAME, 
start_lat AS STATION_LAT, 
start_lng AS START_STATION_LNG
FROM {{ source('demo', 'bike') }}
WHERE RIDE_ID != 'ride_id'

)


SELECT 

* 

FROM BIKE