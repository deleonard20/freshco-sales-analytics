# Data Dictionary — Kaggle Grocery Sales Dataset

**Source:** [kaggle.com/datasets/andrexibiza/grocery-sales-dataset](https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset)
**Loaded into:** Google BigQuery, dataset `freshco_ds`
**Grain:** one row per sales transaction line

## Tables Used

### `freshco_ds.sales` (fact — transaction level, millions of rows)
| Field | Type | Description | Used in Analysis |
|-------|------|-------------|:---:|
| salesid | INT | Unique transaction line ID | ✔ (dedup check) |
| customerid | INT | FK → customers | ✔ (reach, loyalty, LTV) |
| productid | INT | FK → products | ✔ (join key) |
| quantity | INT | Units sold | ✔ (volume, revenue) |
| discount | FLOAT | Discount fraction (0–1) applied to line | ✔ (revenue after discount) |
| salesdate | DATE | Transaction date | — (time trends out of scope) |
| salespersonid | INT | FK → employees | — |
| transactionnumber | STRING | Receipt/transaction reference | ✔ (dedup check) |

### `freshco_ds.products` (dimension)
| Field | Type | Description | Used in Analysis |
|-------|------|-------------|:---:|
| productid | INT | Unique product ID | ✔ |
| productname | STRING | Product name | — |
| price | FLOAT | Unit list price | ✔ (revenue, avg price) |
| categoryid | INT | FK → categories | ✔ (join key) |

### `freshco_ds.categories` (dimension — 11 rows)
| Field | Type | Description | Used in Analysis |
|-------|------|-------------|:---:|
| categoryid | INT | Unique category ID | ✔ |
| categoryname | STRING | Category name (Confections, Meat, Poultry, Cereals, Snails, Produce, Beverages, Grain, Dairy, Seafood, Shellfish) | ✔ (analysis dimension) |

### `freshco_ds.customers` (dimension — ~99K rows)
| Field | Type | Description | Used in Analysis |
|-------|------|-------------|:---:|
| customerid | INT | Unique customer ID | ✔ (reach, LTV ranking) |
| firstname / lastname | STRING | Customer name | — |
| cityid, address | — | Location fields | — (out of scope) |

## Derived Metrics
| Metric | Formula |
|--------|---------|
| Revenue (after discount) | `SUM(quantity × price × (1 − discount))` |
| Revenue contribution % | category revenue ÷ total revenue |
| Customer reach | `COUNT(DISTINCT customerid)` per category |
| Avg realized price/unit | `AVG(price × (1 − discount))` per category |
| Repeat purchase rate | repeat purchasers (>1 purchase) ÷ total purchasers, per category |
| Customer lifetime value | `SUM(quantity × price × (1 − discount))` per customer |

## Data Quality Notes
See [`03_data_preparation/01_data_quality_checks.sql`](../03_data_preparation/01_data_quality_checks.sql):
- No orphan FKs found between sales → products → categories
- Discount values validated within [0, 1]
- Duplicate check on `salesid` and `transactionnumber`
- Negative/zero quantity check
