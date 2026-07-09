-- ============================================================
-- Layer 3c — Top Customers by Lifetime Value
-- Business question:
--   Who are FreshCo's highest-value customers, and how much
--   revenue do they represent?
-- Key result:
--   Customer ID 94800 is #1 with $130,324 lifetime revenue
--   (ID 95972 is #2 with $123,005) — candidates for a VIP
--   top-customer program.
-- ============================================================

WITH customer_revenue AS (
  SELECT
    cu.customerid,
    SUM(s.quantity * p.price * (1 - s.discount)) AS customer_total_revenue
  FROM freshco_ds.sales s
  JOIN freshco_ds.products p    USING (productid)
  JOIN freshco_ds.customers cu  USING (customerid)
  GROUP BY 1
),

customer_ranking AS (
  SELECT
    customerid,
    ROUND(customer_total_revenue, 2)                        AS customer_revenue,
    RANK() OVER (ORDER BY customer_total_revenue DESC)      AS revenue_rank,
    ROUND(
      customer_total_revenue * 100
      / SUM(customer_total_revenue) OVER (), 4
    )                                                       AS pct_of_total_revenue
  FROM customer_revenue
)

SELECT *
FROM customer_ranking
WHERE revenue_rank <= 10
ORDER BY revenue_rank;
