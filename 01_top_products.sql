-- =============================================
-- Query 1: Top 10 Products by Revenue
-- Question: Which products generate the most revenue?
-- =============================================

SELECT
    stock_code,
    description,
    SUM(quantity)                          AS total_units_sold,
    ROUND(SUM(quantity * unit_price), 2)   AS total_revenue,
    ROUND(AVG(unit_price), 2)              AS avg_unit_price
FROM sales
WHERE
    quantity > 0          -- exclude returns
    AND unit_price > 0    -- exclude adjustments
    AND description IS NOT NULL
GROUP BY stock_code, description
ORDER BY total_revenue DESC
LIMIT 10;

-- Expected output:
-- stock_code | description              | total_units_sold | total_revenue | avg_unit_price
-- -----------|--------------------------|------------------|---------------|---------------
-- 23843      | PAPER CRAFT , LITTLE ...  | 80995            | 168469.60     | 2.08
-- ...
