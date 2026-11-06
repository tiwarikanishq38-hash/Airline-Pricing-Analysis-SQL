-- =====================================================
-- ANALYSIS 05: FLIGHT DURATION VS TICKET PRICING
-- =====================================================

SELECT
    class,

    CASE
        WHEN duration < 2 THEN 'Short'
        WHEN duration >= 2 AND duration < 5 THEN 'Medium'
        WHEN duration >= 5 AND duration <= 10 THEN 'Long'
        ELSE 'Very Long'
    END AS duration_category,

    COUNT(*) AS total_listings,
    ROUND(AVG(duration), 2) AS avg_duration,
    ROUND(AVG(price), 2) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price

FROM airlines_flights_data

GROUP BY
    class,
    duration_category

ORDER BY
    class,
    CASE duration_category
        WHEN 'Short' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'Long' THEN 3
        WHEN 'Very Long' THEN 4
    END;