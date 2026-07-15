CREATE DATABASE indian_stock_market;
USE indian_stock_market;
-- Companies Table
CREATE TABLE companies ( 
company_id INT AUTO_INCREMENT PRIMARY KEY,
 ticker VARCHAR(20) UNIQUE,
 company_name VARCHAR(100), 
 sector VARCHAR(100) 
 );
 -- Sectors Table
 CREATE TABLE sectors ( 
 sector_id INT AUTO_INCREMENT PRIMARY KEY,
 sector_name VARCHAR(100) UNIQUE
 ); 
 -- Daily Prices Table
CREATE TABLE daily_prices (
 price_id INT AUTO_INCREMENT PRIMARY KEY, 
 company_id INT, trade_date DATE, open DECIMAL(10,2),
 high DECIMAL(10,2), low DECIMAL(10,2), close DECIMAL(10,2),
 volume BIGINT, daily_return DECIMAL(10,6),
 volatility DECIMAL(10,6),
 FOREIGN KEY (company_id) REFERENCES companies(company_id)
 );
 -- Staging Table
CREATE TABLE stock_data (
    Date DATE,
    Open DECIMAL(10,2),
    High DECIMAL(10,2),
    Low DECIMAL(10,2),
    Close DECIMAL(10,2),
    Volume BIGINT,
    Sector VARCHAR(100),
    Ticker VARCHAR(20),
    Company VARCHAR(100),
    `Return` DECIMAL(10,6)
);
