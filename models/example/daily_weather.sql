WITH  daily_weather as (

SELECT 

date(time) as daily_weather,
weather,
temp,
pressure,
humidity,
clouds


FROM {{ source('demo', 'weather') }}

), 



daily_weather_agg AS(

    SELECT
    daily_weather,
    weather,
    round(avg(temp),2) as AVG_TEMP,
    round(avg(pressure),2) as AVG_PRESSURE,
    round(avg(humidity),2) as AVG_HUMIDITY,
    round(avg(clouds),2) as AVG_CLOUDS
    FROM daily_weather
    GROUP BY daily_weather, weather
    QUALIFY ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(Weather) desc) = 1
)

SELECT * FROM daily_weather_agg

