WITH daily_weather AS (
    SELECT
        DATE(TIME) AS daily_weather, -- Renamed to avoid conflict with CTE name if any
        weather,
        temp,
        pressure,
        humidity,
        clouds
    FROM
        {{ source('DEMO', 'WEATHER') }}
    ORDER BY TIME -- LIMIT requires an ORDER BY to be deterministic
    

),

daily_weather_agg as (
    SELECT
        daily_weather,
        weather,
        ROUND(avg(temp),2) as avg_temp,
        ROUND(avg(pressure),2) as avg_pressure,
        ROUND(avg(humidity),2) as avg_humidity,
        ROUND (avg(clouds),2) as avg_clouds
        
    FROM
        daily_weather
    GROUP BY
        daily_weather,
        weather
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) = 1
)

SELECT
    *
FROM
    daily_weather_agg