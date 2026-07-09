-- ============================================================
-- Layer 3a — Pricing vs Customer Reach
-- Business question:
--   Does average unit price limit how many customers a
--   category reaches?
-- Key result:
--   Negative correlation. Grain: highest avg price ($59.6,
--   ~18% above portfolio average) but lowest reach (97,335
--   customers, ~1,400 fewer than top categories).
-- ============================================================

SELECT
  c.categoryname,
  ROUND(AVG(p.price * (1 - s.discount)), 2)  AS avg_price_per_unit,
  COUNT(DISTINCT s.customerid)               AS unique_customers
FROM freshco_ds.sales s
JOIN freshco_ds.products p    USING (productid)
JOIN freshco_ds.categories c  USING (categoryid)
GROUP BY 1
ORDER BY avg_price_per_unit DESC;

-- Optional: price-reach correlation across categories ----------
WITH agg AS (
  SELECT
    c.categoryname,
    AVG(p.price * (1 - s.discount))  AS avg_price,
    COUNT(DISTINCT s.customerid)     AS customers
  FROM freshco_ds.sales s
  JOIN freshco_ds.products p    USING (productid)
  JOIN freshco_ds.categories c  USING (categoryid)
  GROUP BY 1
)
SELECT ROUND(CORR(avg_price, customers), 3) AS corr_price_reach
FROM agg;
