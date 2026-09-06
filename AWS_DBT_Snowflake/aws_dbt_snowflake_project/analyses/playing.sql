{% set flag = 3 %}

SELECT *
FROM {{ source('staging', 'listings') }}

{% if flag == 3 %}

    WHERE NIGHTS_BOOKED = 3

{% elif flag > 3 %}

    WHERE NIGHTS_BOOKED > 3

{% endif %}