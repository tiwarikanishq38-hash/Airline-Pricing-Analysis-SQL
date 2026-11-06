-- =====================================================
-- ANALYSIS 07: ROUTE-WISE ECONOMY PRICING
-- =====================================================

SELECT
    CONCAT(source_city, ' -> ', destination_city) AS route,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price

FROM airlines_flights_data

WHERE class = 'economy'

GROUP BY
    source_city,
    destination_city

ORDER BY
    avg_price DESC;