
      
  
    

create or replace transient table AIRBNB.gold.dim_listings
    
    
    
    
    

    as (
    

    select *,
        md5(coalesce(cast(LISTING_ID as varchar ), '')
         || '|' || coalesce(cast(LISTING_CREATED_AT as varchar ), '')
        ) as dbt_scd_id,
        LISTING_CREATED_AT as dbt_updated_at,
        LISTING_CREATED_AT as dbt_valid_from,
        
  
  coalesce(nullif(LISTING_CREATED_AT, LISTING_CREATED_AT), to_date('9999-12-31'))
  as dbt_valid_to
from (
        with __dbt__cte__obt as (






SELECT

    

        SILVER_bookings.*

        ,

    

        SILVER_listings.HOST_ID,
                     SILVER_listings.PROPERTY_TYPE,
                     SILVER_listings.ROOM_TYPE,
                     SILVER_listings.CITY,
                     SILVER_listings.COUNTRY,
                     SILVER_listings.ACCOMMODATES,
                     SILVER_listings.BEDROOMS,
                     SILVER_listings.BATHROOMS,
                     SILVER_listings.PRICE_PER_NIGHT,
                     SILVER_listings.PRICE_PER_NIGHT_TAG,
                     SILVER_listings.CREATED_AT AS LISTING_CREATED_AT

        ,

    

        SILVER_hosts.HOST_NAME,
                     SILVER_hosts.HOST_SINCE,
                     SILVER_hosts.IS_SUPERHOST,
                     SILVER_hosts.RESPONSE_RATE,
                     SILVER_hosts.RESPONSE_RATE_TAG,
                     SILVER_hosts.CREATED_AT AS HOST_CREATED_AT

        

    

FROM

    

        

            AIRBNB.SILVER.SILVER_BOOKINGS AS SILVER_bookings

        

    

        

            LEFT JOIN AIRBNB.SILVER.SILVER_LISTINGS AS SILVER_listings

            ON SILVER_bookings.LISTING_ID = SILVER_listings.LISTING_ID

        

    

        

            LEFT JOIN AIRBNB.SILVER.SILVER_HOSTS AS SILVER_hosts

            ON SILVER_listings.HOST_ID = SILVER_hosts.HOST_ID

        

    
),  __dbt__cte__listings as (


WITH listings AS
(
    SELECT
        LISTING_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        PRICE_PER_NIGHT_TAG,
        LISTING_CREATED_AT
    FROM 
    __dbt__cte__obt
)
SELECT * FROM listings
) select * from __dbt__cte__listings
    ) sbq



    )
;


  
  