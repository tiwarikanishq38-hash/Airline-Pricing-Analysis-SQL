-- =====================================================
-- ANALYSIS 04: ROUTE-LEVEL BOOKING WINDOW ANALYSIS
-- Objective: Identify airline-route combinations with
-- significant early vs last-minute price differences.
-- Class: Economy
-- =====================================================

SELECT
    airline,
    CONCAT(source_city, ' -> ', destination_city) AS route,
    SUM(CASE
        WHEN days_left BETWEEN 31 AND 49 THEN 1
        ELSE 0
    END) AS early_listing_count,
    SUM(CASE
        WHEN days_left BETWEEN 1 AND 7 THEN 1
        ELSE 0
    END) AS last_minute_listing_count,
    ROUND(AVG(CASE
        WHEN days_left BETWEEN 1 AND 7 THEN price
    END), 2) AS avg_last_minute_price,
    ROUND(AVG(CASE
        WHEN days_left BETWEEN 31 AND 49 THEN price
    END), 2) AS avg_early_booking_price,
    ROUND(
        (
            AVG(CASE
                WHEN days_left BETWEEN 1 AND 7 THEN price
            END)
            -
            AVG(CASE
                WHEN days_left BETWEEN 31 AND 49 THEN price
            END)
        )
        /
        AVG(CASE
            WHEN days_left BETWEEN 31 AND 49 THEN price
        END) * 100,
        2
    ) AS price_increase_pct,
    ROUND(
        AVG(CASE
            WHEN days_left BETWEEN 1 AND 7 THEN price
        END)
        -
        AVG(CASE
            WHEN days_left BETWEEN 31 AND 49 THEN price
        END),
        2
    ) AS absolute_price_difference
FROM airlines_flights_data
WHERE class = 'economy'
GROUP BY
    airline,
    source_city,
    destination_city
HAVING
    early_listing_count >= 20
    AND last_minute_listing_count >= 20
ORDER BY absolute_price_difference DESC;
