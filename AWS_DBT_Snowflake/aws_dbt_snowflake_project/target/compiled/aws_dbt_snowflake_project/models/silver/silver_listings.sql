

SELECT 
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
    

    CASE
        WHEN PRICE_PER_NIGHT < 100 THEN 'low'
        WHEN PRICE_PER_NIGHT < 200 THEN 'medium'
        ELSE 'high'
    END

 AS PRICE_PER_NIGHT_TAG,
    CREATED_AT
FROM 
    AIRBNB.bronze.bronze_listings