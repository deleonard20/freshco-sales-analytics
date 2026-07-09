-- ============================================================
-- Layer 1 — Category Revenue & Concentration
-- Business question:
--   Which categories generate the most revenue after discount,
--   and how concentrated is FreshCo's revenue?
-- Key result:
--   Confections #1 at $556.9M (13.0% of total);
--   top 5 of 11 categories = 53% of revenue.
-- ============================================================

WITH category_revenue AS (
  SELECT
    c.categoryname,
    ROUND(SUM(s.quantity * p.price * (1 - s.discount)), 0) AS total_revenue
  FROM freshco_ds.sales s
  JOIN freshco_ds.products p    USING (productid)
  JOIN freshco_ds.categories c  USING (categoryid)
  GROUP BY 1
)

SELECT
  categoryname,
  total_revenue,
  ROUND(total_revenue * 100 / SUM(total_revenue) OVER (), 1)   AS revenue_pct,
  ROUND(
    SUM(total_revenue) OVER (ORDER BY total_revenue DESC)
    * 100 / SUM(total_revenue) OVER (), 1
  )                                                            AS cumulative_pct
FROM category_revenue
ORDER BY total_revenue DESC;
