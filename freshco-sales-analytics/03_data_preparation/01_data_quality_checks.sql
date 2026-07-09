-- ============================================================
-- FreshCo Sales Analytics — Data Quality Checks
-- Platform : Google BigQuery
-- Purpose  : Validate the Kaggle Grocery Sales dataset before
--            analysis (nulls, duplicates, FK integrity, ranges)
-- ============================================================

-- 1) Row counts per table -------------------------------------
SELECT 'sales'      AS table_name, COUNT(*) AS row_count FROM freshco_ds.sales
UNION ALL
SELECT 'products',   COUNT(*) FROM freshco_ds.products
UNION ALL
SELECT 'categories', COUNT(*) FROM freshco_ds.categories
UNION ALL
SELECT 'customers',  COUNT(*) FROM freshco_ds.customers;

-- 2) Null checks on critical fields ---------------------------
SELECT
  COUNTIF(customerid IS NULL) AS null_customerid,
  COUNTIF(productid  IS NULL) AS null_productid,
  COUNTIF(quantity   IS NULL) AS null_quantity,
  COUNTIF(discount   IS NULL) AS null_discount
FROM freshco_ds.sales;

-- 3) Duplicate transaction check ------------------------------
SELECT
  salesid,
  COUNT(*) AS dup_count
FROM freshco_ds.sales
GROUP BY salesid
HAVING COUNT(*) > 1;

-- 4) Foreign key integrity: sales -> products ------------------
SELECT COUNT(*) AS orphan_product_rows
FROM freshco_ds.sales s
LEFT JOIN freshco_ds.products p USING (productid)
WHERE p.productid IS NULL;

-- 5) Foreign key integrity: products -> categories -------------
SELECT COUNT(*) AS orphan_category_rows
FROM freshco_ds.products p
LEFT JOIN freshco_ds.categories c USING (categoryid)
WHERE c.categoryid IS NULL;

-- 6) Range validation ------------------------------------------
-- Discount must be a fraction between 0 and 1;
-- quantity and price must be positive.
SELECT
  COUNTIF(s.discount < 0 OR s.discount > 1) AS invalid_discount,
  COUNTIF(s.quantity <= 0)                  AS invalid_quantity,
  COUNTIF(p.price    <= 0)                  AS invalid_price
FROM freshco_ds.sales s
JOIN freshco_ds.products p USING (productid);

-- 7) Category coverage: every category has sales ---------------
SELECT
  c.categoryname,
  COUNT(s.salesid) AS transactions
FROM freshco_ds.categories c
LEFT JOIN freshco_ds.products p USING (categoryid)
LEFT JOIN freshco_ds.sales s    USING (productid)
GROUP BY 1
ORDER BY 2 DESC;
