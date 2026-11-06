-- =====================================================
-- ANALYSIS 10: DEPARTURE TIME VS TICKET PRICING
-- =====================================================

SELECT
    class,
    departure_time,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price

FROM airlines_flights_data

GROUP BY
    class,
    departure_time

ORDER BY
    class,
    avg_price DESC;