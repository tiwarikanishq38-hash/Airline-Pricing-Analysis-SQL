-- AIRLINE-WISE STOPS ANALYSIS

SELECT
    airline,
    class,
    stops,
    COUNT(*) AS total_listings,
    ROUND(AVG(duration), 2) AS avg_duration,
    ROUND(AVG(price), 2) AS avg_price

FROM airlines_flights_data

GROUP BY
    airline,
    class,
    stops

ORDER BY
    class,
    airline,
    CASE stops
        WHEN 'zero' THEN 1
        WHEN 'one' THEN 2
        WHEN 'two_or_more' THEN 3
    END;
