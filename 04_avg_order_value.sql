-- =============================================
-- Query 4: Average Order Value (AOV)
-- Question: What is the typical order size?
-- =============================================

WITH order_totals AS (
    SELECT
        invoice_no,
        customer_id,
        country,
        MIN(invoice_date)                        AS order_date,
        SUM(quantity * unit_price)               AS order_value
    FROM sales
    WHERE quantity > 0 AND unit_price > 0
    GROUP BY invoice_no, customer_id, country
)
SELECT
    country,
    COUNT(invoice_no)                            AS total_orders,
    ROUND(AVG(order_value), 2)                   AS avg_order_value,
    ROUND(MIN(order_value), 2)                   AS min_order_value,
    ROUND(MAX(order_value), 2)                   AS max_order_value,
    ROUND(PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY order_value), 2)  AS median_order_value
FROM order_totals
GROUP BY country
HAVING COUNT(invoice_no) >= 50   -- only countries with enough data
ORDER BY avg_order_value DESC;
