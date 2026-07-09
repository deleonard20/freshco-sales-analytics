-- ============================================================
-- Layer 2 — Volume & Customer Reach vs Revenue
-- Business question:
--   Do units sold and unique-customer reach correlate with
--   category revenue?
-- Key result:
--   Strong positive correlation on both. Confections leads with
--   11.08M units and 98,743 unique customers.
-- ============================================================

SELECT
  c.categoryname,
  SUM(s.quantity)                                              AS total_units_sold,
  COUNT(DISTINCT s.customerid)                                 AS unique_customers,
  ROUND(SUM(s.quantity * p.price * (1 - s.discount)), 0)       AS total_revenue
FROM freshco_ds.sales s
JOIN freshco_ds.products p    USING (productid)
JOIN freshco_ds.categories c  USING (categoryid)
GROUP BY 1
ORDER BY total_revenue DESC;

-- Optional: correlation coefficients across categories ---------
WITH agg AS (
  SELECT
    c.categoryname,
    SUM(s.quantity)                                        AS units,
    COUNT(DISTINCT s.customerid)                           AS customers,
    SUM(s.quantity * p.price * (1 - s.discount))           AS revenue
  FROM freshco_ds.sales s
  JOIN freshco_ds.products p    USING (productid)
  JOIN freshco_ds.categories c  USING (categoryid)
  GROUP BY 1
)
SELECT
  ROUND(CORR(units,     revenue), 3) AS corr_units_revenue,
  ROUND(CORR(customers, revenue), 3) AS corr_customers_revenue
FROM agg;
