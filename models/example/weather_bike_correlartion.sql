WITH CTE AS (

select 

t.*,
w.*

from {{ ref('trip_fact') }} t
LEFT JOIN {{ ref('daily_weather') }} w
ON t.TRIP_DATE = w.DAILY_WEATHER
ORDER BY DAILY_WEATHER
)


SELECT * FROM CTE