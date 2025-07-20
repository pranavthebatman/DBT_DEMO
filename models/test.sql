select*
frrom {{ source('demo', 'bike') }}

limit 10