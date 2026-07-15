-- ==========================================
-- Populate Sectors
-- ==========================================
INSERT INTO sectors (sector_name)
SELECT DISTINCT sector
FROM stock_data;
-- ==========================================
-- Populate Companies
-- ==========================================
INSERT INTO companies (ticker, company_name, sector)
SELECT DISTINCT ticker, company, sector
FROM stock_data;
-- ==========================================
-- Populate Daily Prices
-- ==========================================
INSERT INTO daily_prices (
    company_id,
    trade_date,
    open,
    high,
    low,
    close,
    volume,
    daily_return
)
SELECT
    c.company_id,
    s.Date,
    s.Open,
    s.High,
    s.Low,
    s.Close,
    s.Volume,
    s.Return
FROM stock_data s
JOIN companies c
ON s.Ticker = c.ticker;
SELECT COUNT(*) AS total_rows
FROM daily_prices;
