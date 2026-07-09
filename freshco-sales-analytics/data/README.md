# Data — FreshCo Sales Analytics

Raw data is **not committed to this repository** (multi-million-row public dataset; redistribution left to the original source).

## Source
**Grocery Sales Dataset** (public)
📦 [kaggle.com/datasets/andrexibiza/grocery-sales-dataset](https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset)

Files used: `sales.csv`, `products.csv`, `categories.csv`, `customers.csv`

## Reproduce the Analysis

**1. Download from Kaggle**
```bash
kaggle datasets download -d andrexibiza/grocery-sales-dataset
unzip grocery-sales-dataset.zip -d data/raw/
```

**2. Load into BigQuery** (dataset `freshco_ds`)
```bash
bq mk --dataset freshco_ds

bq load --autodetect --source_format=CSV freshco_ds.sales      data/raw/sales.csv
bq load --autodetect --source_format=CSV freshco_ds.products   data/raw/products.csv
bq load --autodetect --source_format=CSV freshco_ds.categories data/raw/categories.csv
bq load --autodetect --source_format=CSV freshco_ds.customers  data/raw/customers.csv
```

**3. Validate** — run [`03_data_preparation/01_data_quality_checks.sql`](../03_data_preparation/01_data_quality_checks.sql)

**4. Analyze** — run queries in [`04_analysis/sql/`](../04_analysis/sql/) in order (01 → 05)

## Schema
See the full field-level reference in [`02_data_discovery/data_dictionary.md`](../02_data_discovery/data_dictionary.md).
