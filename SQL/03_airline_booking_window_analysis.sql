-- =====================================================
-- ANALYSIS 03: AIRLINE-WISE ECONOMY BOOKING ANALYSIS
-- Objective: Compare early and last-minute prices
-- across airlines in Economy class.
-- =====================================================

SELECT
    airline,

    SUM(CASE
        WHEN days_left BETWEEN 31 AND 49 THEN 1
        ELSE 0
    END) AS early_listing_count,

    SUM(CASE
        WHEN days_left BETWEEN 1 AND 7 THEN 1
        ELSE 0
    END) AS last_minute_listing_count,

    ROUND(AVG(CASE
        WHEN days_left BETWEEN 31 AND 49 THEN price
    END), 2) AS avg_early_booking_price,

    ROUND(AVG(CASE
        WHEN days_left BETWEEN 1 AND 7 THEN price
    END), 2) AS avg_last_minute_price,

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
    ) AS price_increase_pct

FROM airlines_flights_data

WHERE class = 'economy'

GROUP BY airline

ORDER BY price_increase_pct DESC;