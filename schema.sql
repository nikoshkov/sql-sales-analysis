-- =============================================
-- Schema: Online Retail Sales
-- Source: UCI Machine Learning Repository
-- =============================================

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    invoice_no    VARCHAR(20),
    stock_code    VARCHAR(20),
    description   VARCHAR(255),
    quantity      INTEGER,
    invoice_date  TIMESTAMP,
    unit_price    DECIMAL(10, 2),
    customer_id   VARCHAR(20),
    country       VARCHAR(100)
);

-- After importing CSV data, add indexes for performance
CREATE INDEX idx_invoice_date ON sales (invoice_date);
CREATE INDEX idx_customer_id  ON sales (customer_id);
CREATE INDEX idx_country      ON sales (country);

-- Sample: load from CSV (PostgreSQL)
-- COPY sales FROM '/path/to/online_retail.csv' DELIMITER ',' CSV HEADER;
