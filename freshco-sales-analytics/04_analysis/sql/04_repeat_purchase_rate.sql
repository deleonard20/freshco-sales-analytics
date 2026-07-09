-- ============================================================
-- Layer 3b — Repeat Purchase Rate per Category (Loyalty)
-- Business question:
--   How loyal are customers within each category?
-- Key result:
--   Confections holds the highest repeat purchase rate at
--   99.85% (Meat 99.61%) — loyalty is exceptional but
--   unmonetized.
-- ============================================================

WITH customer_category_activity AS (
  SELECT
    c.categoryname,
    s.customerid,
    COUNT(*) AS purchase_count
  FROM freshco_ds.sales s
  JOIN freshco_ds.products p    USING (productid)
  JOIN freshco_ds.categories c  USING (categoryid)
  GROUP BY 1, 2
)

SELECT
  categoryname,
  COUNT(DISTINCT customerid)                                   AS total_customers,
  COUNTIF(purchase_count > 1)                                  AS repeat_customers,
  ROUND(COUNTIF(purchase_count > 1) / COUNT(DISTINCT customerid), 4)
                                                               AS repeat_purchase_rate
FROM customer_category_activity
GROUP BY 1
ORDER BY repeat_purchase_rate DESC;
