-- =====================================================
-- ANALYSIS 08: AIRLINE-WISE PRICING WITHIN ROUTES
-- Class: Economy
-- =====================================================

SELECT
    CONCAT(source_city, ' -> ', destination_city) AS route,
    airline,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price

FROM airlines_flights_data

WHERE class = 'economy'

GROUP BY
    source_city,
    destination_city,
    airline

ORDER BY
    source_city,
    destination_city,
    avg_price DESC;
