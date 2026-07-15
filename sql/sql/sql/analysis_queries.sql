-- ==========================================
-- Query 1: Sector-wise Average Return
-- ==========================================
SELECT
    c.sector,
    ROUND(AVG(d.daily_return), 6) AS avg_return
FROM companies c
JOIN daily_prices d
ON c.company_id = d.company_id
GROUP BY c.sector
ORDER BY avg_return DESC;
SELECT
    c.sector,
    SUM(d.volume) AS total_volume
FROM companies c
JOIN daily_prices d
ON c.company_id = d.company_id
GROUP BY c.sector
ORDER BY total_volume DESC;
SELECT
    c.company_name,
    ROUND(AVG(d.daily_return),6) AS avg_return
FROM companies c
JOIN daily_prices d
ON c.company_id=d.company_id
GROUP BY c.company_name
ORDER BY avg_return DESC
LIMIT 5;
-- ==========================================
-- Query 2: Top 3 Companies Per Sector
-- ==========================================
SELECT *
FROM (
    SELECT
        c.sector,
        c.company_name,
        ROUND(AVG(d.daily_return),6) AS avg_return,
        RANK() OVER (
            PARTITION BY c.sector
            ORDER BY AVG(d.daily_return) DESC
        ) AS ranking
    FROM companies c
    JOIN daily_prices d
        ON c.company_id = d.company_id
    GROUP BY c.sector, c.company_name
) ranked_companies
WHERE ranking <= 3
ORDER BY sector, ranking;
-- Sector-wise Trading Volume
SELECT
    c.sector,
    SUM(d.volume) AS total_volume
FROM companies c
JOIN daily_prices d
ON c.company_id = d.company_id
GROUP BY c.sector
ORDER BY total_volume DESC;
-- Top 5 Highest Return Days
SELECT
    c.company_name,
    d.trade_date,
    ROUND(d.daily_return,6) AS daily_return
FROM companies c
JOIN daily_prices d
ON c.company_id = d.company_id
ORDER BY d.daily_return DESC
LIMIT 5;
-- Top 5 Biggest Loss Days
SELECT
    c.company_name,
    d.trade_date,
    ROUND(d.daily_return,6) AS daily_return
FROM companies c
JOIN daily_prices d
ON c.company_id = d.company_id
ORDER BY d.daily_return ASC
LIMIT 5;
-- Companies Performing Above Sector Average
SELECT
    c.company_name,
    c.sector,
    ROUND(AVG(d.daily_return),6) AS avg_return
FROM companies c
JOIN daily_prices d
ON c.company_id = d.company_id
GROUP BY c.company_name, c.sector
HAVING AVG(d.daily_return) >
(
    SELECT AVG(d2.daily_return)
    FROM companies c2
    JOIN daily_prices d2
    ON c2.company_id = d2.company_id
    WHERE c2.sector = c.sector
)
ORDER BY avg_return DESC;
-- Number of Companies Per Sector
SELECT
    sector,
    COUNT(*) AS company_count
FROM companies
GROUP BY sector
ORDER BY company_count DESC;
-- Average Closing Price by Sector
SELECT
    c.sector,
    ROUND(AVG(d.close),2) AS avg_close_price
FROM companies c
JOIN daily_prices d
ON c.company_id = d.company_id
GROUP BY c.sector
ORDER BY avg_close_price DESC;
-- Highest Volume Company in Each Sector
SELECT *
FROM (
    SELECT
        c.sector,
        c.company_name,
        SUM(d.volume) AS total_volume,
        RANK() OVER(
            PARTITION BY c.sector
            ORDER BY SUM(d.volume) DESC
        ) AS rnk
    FROM companies c
    JOIN daily_prices d
        ON c.company_id = d.company_id
    GROUP BY c.sector, c.company_name
) ranked
WHERE rnk = 1;
-- Sector Performance Summary
SELECT
    c.sector,
    COUNT(DISTINCT c.company_id) AS companies,
    ROUND(AVG(d.daily_return),6) AS avg_return,
    ROUND(MAX(d.daily_return),6) AS best_return,
    ROUND(MIN(d.daily_return),6) AS worst_return
FROM companies c
JOIN daily_prices d
ON c.company_id = d.company_id
GROUP BY c.sector
ORDER BY avg_return DESC;
