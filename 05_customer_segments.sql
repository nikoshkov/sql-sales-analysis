-- =============================================
-- Query 5: Customer Segmentation (RFM Analysis)
-- Question: Who are our best customers?
-- RFM = Recency, Frequency, Monetary
-- =============================================

WITH rfm_base AS (
    SELECT
        customer_id,
        MAX(invoice_date)                                 AS last_purchase_date,
        COUNT(DISTINCT invoice_no)                        AS frequency,
        ROUND(SUM(quantity * unit_price), 2)              AS monetary
    FROM sales
    WHERE
        quantity > 0
        AND unit_price > 0
        AND customer_id IS NOT NULL
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT
        customer_id,
        DATE_PART('day', '2011-12-31'::date - last_purchase_date) AS recency_days,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY last_purchase_date DESC)  AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC)            AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC)             AS m_score
    FROM rfm_base
)
SELECT
    customer_id,
    recency_days,
    frequency,
    monetary,
    r_score,
    f_score,
    m_score,
    (r_score + f_score + m_score)                         AS rfm_total,
    CASE
        WHEN (r_score + f_score + m_score) >= 13 THEN 'Champions'
        WHEN (r_score + f_score + m_score) >= 10 THEN 'Loyal Customers'
        WHEN (r_score + f_score + m_score) >= 7  THEN 'Potential Loyalists'
        WHEN r_score >= 4                         THEN 'New Customers'
        WHEN r_score <= 2                         THEN 'At Risk'
        ELSE 'Needs Attention'
    END                                                   AS segment
FROM rfm_scores
ORDER BY rfm_total DESC;

-- Summary by segment
-- SELECT segment, COUNT(*) AS customers, ROUND(AVG(monetary),2) AS avg_spend
-- FROM ( ... above query ... ) rfm
-- GROUP BY segment ORDER BY avg_spend DESC;
