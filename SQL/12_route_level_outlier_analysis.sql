-- =====================================================
-- ANALYSIS 12: ROUTE-LEVEL PRICE OUTLIER SCREENING
-- Threshold: Airline-Class Mean + 2 SD
-- Minimum route sample: 150 listings
-- =====================================================

WITH upper_threshold AS (

    SELECT
        airline,
        class,
        AVG(price) + 2 * STDDEV(price) AS threshold

    FROM airlines_flights_data

    GROUP BY
        airline,
        class
),

flagged_threshold AS (

    SELECT
        d.airline,
        d.class,
        CONCAT(d.source_city, ' -> ', d.destination_city) AS route,

        COUNT(*) AS total_listings,

        SUM(CASE
            WHEN d.price > u.threshold THEN 1
            ELSE 0
        END) AS flagged_listings

    FROM airlines_flights_data d

    JOIN upper_threshold u
        ON d.airline = u.airline
        AND d.class = u.class

    GROUP BY
        d.airline,
        d.class,
        d.source_city,
        d.destination_city

    HAVING COUNT(*) >= 150
)

SELECT
    airline,
    class,
    route,
    total_listings,
    flagged_listings,

    ROUND(
        flagged_listings / total_listings * 100,
        2
    ) AS flagged_rate

FROM flagged_threshold

ORDER BY
    flagged_rate DESC;