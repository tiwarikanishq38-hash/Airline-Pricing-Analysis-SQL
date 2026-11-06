-- =====================================================
-- ANALYSIS 02: BOOKING WINDOW PRICING ANALYSIS
-- Objective: Compare average listed prices across
-- booking windows for Economy and Business classes.
-- =====================================================

SELECT
    class,

    CASE
        WHEN days_left BETWEEN 1 AND 7 THEN 'Last Minute'
        WHEN days_left BETWEEN 8 AND 14 THEN 'Short Lead Time'
        WHEN days_left BETWEEN 15 AND 30 THEN 'Advance Booking'
        WHEN days_left BETWEEN 31 AND 49 THEN 'Early Booking'
    END AS booking_category,

    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price

FROM airlines_flights_data

GROUP BY
    class,
    booking_category

ORDER BY
    class,
    CASE booking_category
        WHEN 'Last Minute' THEN 1
        WHEN 'Short Lead Time' THEN 2
        WHEN 'Advance Booking' THEN 3
        WHEN 'Early Booking' THEN 4
    END;