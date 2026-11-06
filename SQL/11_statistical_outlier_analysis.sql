-- =====================================================
-- ANALYSIS 11: STATISTICAL PRICE OUTLIER SCREENING
-- Threshold: Mean + 2 Standard Deviations
-- =====================================================

WITH airline_class_stats AS (

    SELECT
        airline,
        class,
        COUNT(*) AS total_listings,
        AVG(price) AS avg_price,
        STDDEV(price) AS stddev_price,
        MAX(price) AS max_price,
        AVG(price) + 2 * STDDEV(price) AS upper_threshold

    FROM airlines_flights_data

    GROUP BY
        airline,
        class
)

SELECT
    s.airline,
    s.class,
    s.total_listings,
    ROUND(s.avg_price, 2) AS avg_price,
    ROUND(s.stddev_price, 2) AS stddev_price,
    s.max_price,
    ROUND(s.upper_threshold, 2) AS upper_threshold,

    SUM(CASE
        WHEN d.price > s.upper_threshold THEN 1
        ELSE 0
    END) AS flagged_listings,

    ROUND(
        SUM(CASE
            WHEN d.price > s.upper_threshold THEN 1
            ELSE 0
        END) / s.total_listings * 100,
        2
    ) AS flagged_percentage

FROM airline_class_stats s

JOIN airlines_flights_data d
    ON s.airline = d.airline
    AND s.class = d.class

GROUP BY
    s.airline,
    s.class,
    s.total_listings,
    s.avg_price,
    s.stddev_price,
    s.max_price,
    s.upper_threshold

ORDER BY
    flagged_percentage DESC;