-- =============================================
-- Query 2: Monthly Revenue with Month-over-Month Growth
-- Question: How does revenue trend over time?
-- =============================================

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', invoice_date)        AS month,
        ROUND(SUM(quantity * unit_price), 2)     AS revenue
    FROM sales
    WHERE quantity > 0 AND unit_price > 0
    GROUP BY DATE_TRUNC('month', invoice_date)
)
SELECT
    TO_CHAR(month, 'YYYY-MM')                    AS month,
    revenue,
    LAG(revenue) OVER (ORDER BY month)           AS prev_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month))
        / NULLIF(LAG(revenue) OVER (ORDER BY month), 0) * 100,
        1
    )                                            AS mom_growth_pct
FROM monthly_revenue
ORDER BY month;

-- Key insight: November 2011 shows the highest revenue peak (holiday season effect)
