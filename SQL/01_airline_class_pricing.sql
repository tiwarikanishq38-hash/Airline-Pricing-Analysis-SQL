-- =====================================================
-- ANALYSIS 01: AIRLINE-WISE PRICING BY CLASS
-- Objective: Compare listed ticket prices across
-- airlines and travel classes.
-- =====================================================

SELECT
    airline,
    class,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM airlines_flights_data
GROUP BY
    airline,
    class
ORDER BY
    class,
    avg_price DESC;