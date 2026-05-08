# 🛒 Sales Data Analysis — SQL Portfolio Project

**Tools:** SQL (PostgreSQL) | **Level:** Junior Data Analyst | **Domain:** E-commerce

---

## 📌 Project Overview

This project explores sales data from an online retail store to uncover key business insights.  
All analysis is done using pure SQL — aggregations, window functions, CTEs, and date-based logic.

**Business questions answered:**
1. What are the top 10 best-selling products by revenue?
2. How does revenue change month over month?
3. Which countries generate the most orders?
4. What is the average order value per customer segment?
5. Which products are frequently bought together?

---

## 📁 Project Structure

```
sql-sales-analysis/
├── README.md
├── data/
│   └── schema.sql          # Table definitions
├── queries/
│   ├── 01_top_products.sql
│   ├── 02_monthly_revenue.sql
│   ├── 03_sales_by_country.sql
│   ├── 04_avg_order_value.sql
│   └── 05_customer_segments.sql
└── results/
    └── key_findings.md
```

---

## 🗃️ Dataset

- **Source:** [UCI Online Retail Dataset](https://archive.ics.uci.edu/ml/datasets/Online+Retail)
- **Period:** December 2010 – December 2011
- **Records:** ~500,000 transactions
- **Fields:** InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country

---

## 🔍 Key Findings

| Metric | Value |
|--------|-------|
| Total Revenue | $9.7M |
| Top Country | United Kingdom (91% of orders) |
| Best Month | November 2011 |
| Avg Order Value | $22.40 |
| Unique Customers | 4,373 |

---

## 🚀 How to Run

1. Import the dataset into PostgreSQL (or use SQLite)
2. Run `data/schema.sql` to create the table
3. Execute queries from the `queries/` folder in order

```sql
-- Quick start: load schema then run any query
\i data/schema.sql
\i queries/01_top_products.sql
```

---

## 👤 Author

**[Your Name]** — Junior Data Analyst  
📧 your.email@example.com | [LinkedIn](#) | [GitHub](#)
