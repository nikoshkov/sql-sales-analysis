-- =============================================
-- Query 3: Sales by Country
-- Question: Which countries drive the most business?
-- =============================================

SELECT
    country,
    COUNT(DISTINCT invoice_no)             AS total_orders,
    COUNT(DISTINCT customer_id)            AS unique_customers,
    ROUND(SUM(quantity * unit_price), 2)   AS total_revenue,
    ROUND(
        SUM(quantity * unit_price)
        / SUM(SUM(quantity * unit_price)) OVER () * 100,
        2
    )                                      AS revenue_share_pct
FROM sales
WHERE quantity > 0 AND unit_price > 0
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 15;

-- Key insight: UK dominates with ~85% of total revenue
-- International expansion opportunities in Germany, France, Netherlands
