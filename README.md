# 📈 Indian Stock Market Database Analysis

## 📌 Project Overview

This project demonstrates how to design a normalized MySQL database and perform analytical SQL queries on Indian stock market sector data. The project transforms raw stock market data into a relational database and generates meaningful business insights using SQL.

---

## 🎯 Objectives

- Design a normalized relational database
- Import stock market data into MySQL
- Perform analytical SQL queries
- Generate sector-wise business insights
- Demonstrate intermediate SQL concepts for Data Analyst roles

---

## 📊 Dataset

- **Source:** Yahoo Finance (yFinance)
- **Records:** 23,453 daily stock records
- **Companies:** 48
- **Sectors:** 10

---

## 🛠️ Tech Stack

- MySQL
- SQL
- Python
- Pandas
- yFinance
- Git
- GitHub

---

## 🗄️ Database Schema

The project uses four tables:

- **stock_data** – Staging table for imported CSV data
- **companies** – Company information
- **sectors** – Sector information
- **daily_prices** – Daily stock price records

---

## 📂 Project Structure

```
indian-stock-market-database-analysis/
│
├── data/
│   ├── stock_data.csv
│   └── query_results/
│
├── sql/
│   ├── schema.sql
│   ├── data_loading.sql
│   └── analysis_queries.sql
│
├── README.md
├── requirements.txt
└── LICENSE
```

---

## 📈 SQL Concepts Demonstrated

- INNER JOIN
- GROUP BY
- Aggregate Functions
- Window Functions (RANK)
- Correlated Subqueries
- ORDER BY
- LIMIT

---

## 📊 Business Questions Solved

- Sector-wise average returns
- Top 3 performing companies in each sector
- Highest trading volume by sector
- Highest and lowest return days
- Companies performing above sector average
- Company distribution across sectors
- Average closing price by sector
- Highest volume company in each sector
- Sector performance summary

---

## 🚀 Key Highlights

- Designed a normalized MySQL database
- Imported and managed 23,453 stock market records
- Built analytical SQL queries using joins, aggregations, and window functions
- Generated business insights from financial market data

---

## 🔮 Future Enhancements

- Power BI Dashboard
- Automated ETL Pipeline using Python
- Advanced Financial Metrics
- Interactive Data Visualization

---

## 👩‍💻 Author

**Geethika Kurumoji**

Aspiring Data Analyst | Python | SQL | Power BI | Statistics
