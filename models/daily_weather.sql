WITH daily_weather AS (


SELECT
*
FROM {{ source('DEMO', 'WEATHER') }}


)

SELECT* FROM DAILY_WEATHER;