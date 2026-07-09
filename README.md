# 🛒 FreshCo Sales Analytics
### Sales Analytics Project — FreshCo Retail
![BigQuery](https://img.shields.io/badge/Google%20BigQuery-4285F4?style=flat&logo=googlebigquery&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-025E8C?style=flat&logo=databricks&logoColor=white)
![PowerBI](https://img.shields.io/badge/Power%20BI%20(concept)-F2C811?style=flat&logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
---
## 📌 Project Overview
This project analyzes transaction-level grocery sales at **FreshCo Retail**, a fictional multi-store grocery chain selling **11 product categories** to nearly **99,000 active customers**, built on the public [Grocery Sales Dataset](https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset) from Kaggle.

With **$4.28B in annual revenue** concentrated in just 5 categories (53%), and premium categories reaching **1,400 fewer customers** than mass categories, FreshCo's leadership lacks visibility into which levers — volume, reach, or price — actually drive category performance.

This analysis identifies what drives category revenue, where pricing limits customer reach, and delivers actionable recommendations projected to **add $74.5M annually**.
---
## ❓ Problem Statement
FreshCo's $4.28B revenue is concentrated in a handful of categories, with 53% coming from the top 5 of 11 categories — and no clear playbook for what drives category growth. Without structured revenue-driver analysis, promo budgets are spread evenly instead of focused on winnable categories, and premium categories quietly leave mass-market demand untapped.
---
## 🎯 SMART Objective
To identify the key drivers of category revenue (volume, reach, price, loyalty) and deliver data-driven recommendations projected to grow top-3 category revenue by **5% (+$74.5M) within 6 months**, monitored via a real-time dashboard.
---
## 🔍 Key Findings
| # | Finding | Impact |
|---|---------|--------|
| 1 | **Revenue is concentrated** — top 5 of 11 categories generate 53% of revenue, led by Confections at $556.9M (13.0%) | Protecting and growing winners is the fastest path to growth |
| 2 | **Volume & reach drive revenue** — strong positive correlation between units sold, unique customers, and revenue | Confections: 11.08M units, 98,743 unique customers, both #1 |
| 3 | **Premium pricing limits reach** — Grain has the highest avg price at $59.6 (~18% above portfolio average) but the lowest reach at 97,335 customers | ~1,400 fewer customers than mass categories; negative price-reach correlation |
| 4 | **Loyalty is exceptional but unmonetized** — Confections repeat purchase rate is 99.85%; top customer (ID 94800) contributes $130,324 lifetime revenue | High-value customers receive generic treatment, retention left to chance |
---
## 💡 Recommendations
**1. Targeted Promotions & Bundling — Add up to $74.5M**
- Focus promo & sampling budget on top-3 categories (Confections, Meat, Poultry) to convert high reach into higher purchase frequency
- Bundle high-loyalty Confections with lower-reach categories to lift units per basket
- Tool: category promo calendar + A/B testing, market-basket analysis in BigQuery

**2. Tiered Pricing for Premium Categories — Lift Grain reach 97.3K → 98.3K+**
- Introduce entry-size packs and mid-tier SKUs in Grain and Dairy to widen reach without eroding premium positioning
- Pilot targeted discounts in selected stores and measure reach elasticity before portfolio-wide rollout
- Tool: price ladder & pack architecture review, controlled pricing experiments (test vs control)

**3. Loyalty Monetization & VIP Program — Protect six-figure accounts**
- Launch a points program anchored on Confections (99.85% repeat rate) with cross-category redemption
- Identify the top 1% of customers by lifetime value and serve tailored offers, early access, and dedicated service
- Tool: RFM segmentation & customer lifetime value ranking in BigQuery
---
## 💰 Business Impact
| Metric | Value |
|--------|-------|
| Total Annual Revenue (after discount) | $4.28B |
| Top-5 Category Revenue Share | 53% ($2.29B) |
| Top-3 Category Revenue Base (Confections, Meat, Poultry) | $1.49B |
| Projected Lift Target | 5% on top-3 categories |
| **Estimated Annual Upside** | **+$74.5M** |
| Cost of Inaction (per quarter) | ~$18.6M deferred upside |

*(Upside assumes a 5% revenue lift on the top-3 categories through reach, pricing, and loyalty initiatives)*
---
## 🛠 Tools & Methodology
| Stage | Tool | Activity |
|-------|------|----------|
| Business Problem Definition | SMART framework | Problem statement, objective, scope definition |
| Data Quality Checks | Google BigQuery | Null checks, duplicate detection, FK integrity, discount range validation |
| Revenue Analysis | Google BigQuery | Revenue after discount per category, contribution %, Pareto concentration |
| Driver Analysis | Google BigQuery | Volume & reach correlation (units, `COUNT(DISTINCT customerid)`), price vs reach |
| Loyalty Analysis | Google BigQuery | Repeat purchase rate via multi-step CTE, customer lifetime value ranking |
| Dashboard | Power BI (concept) | 1-page monitoring dashboard concept: KPI cards, category bar, price-reach scatter, top customer table |
---
## 📊 Analysis Deep Dive
### Layer 1 — Category Revenue & Concentration
| Metric | Value |
|--------|-------|
| Total Revenue (after discount) | $4.28B |
| #1 Category | Confections — $556.9M (13.0%) |
| Top-5 Share | 53% (Confections, Meat, Poultry, Cereals, Snails) |
| #2–#5 | Meat $492.9M · Poultry $440.0M · Cereals $427.4M · Snails $372.1M |

![Revenue Pareto](05_communication/charts/01_revenue_pareto.png)

**Critical Insight:** Revenue is concentrated in a few winning categories. Promo and inventory investment should be weighted toward these winners rather than spread evenly across the portfolio.
---
### Layer 2 — Volume & Customer Reach
Both drivers show a strong positive correlation with category revenue: categories that sell more units and reach more unique customers consistently outperform.

| Category | Units Sold | Unique Customers | Revenue |
|----------|-----------|------------------|---------|
| Confections | 11.08M | 98,743 | $556.9M |
| Meat | 9.72M | 98,701 | $492.9M |
| Grain (lowest reach) | 5.74M | 97,335 | $342.0M |

![Revenue vs Units](05_communication/charts/03_revenue_vs_units.png)

**Critical Insight:** Volume and reach are the two primary levers for category revenue growth — they should anchor promotional and acquisition strategy.
---
### Layer 3 — Pricing vs Reach & Loyalty
Negative correlation between average unit price and customer reach: as price rises, unique customers fall.

![Price vs Reach](05_communication/charts/05_price_vs_reach.png)

**Root Cause — Premium Accessibility Gap:**
Grain is priced ~18% above portfolio average ($59.6 vs ~$50.4) and reaches the fewest customers (97,335). Premium categories lack entry-level price points for the mass market.

**Loyalty Signal:**
Repeat purchase rates are uniformly high (Confections 99.85%, Meat 99.61%), so loyalty itself is not the problem — the untapped value lies in monetizing it through structured programs and VIP treatment of top customers (up to $130,324 lifetime value).
---
## 📊 Dashboard Concept
![Dashboard Mockup](05_communication/charts/06_dashboard_mockup.png)

**Dashboard Features (concept, designed for Power BI):**
- **KPI Cards:** Total Revenue, Product Categories, Top Category Share, Repeat Purchase Rate
- **Bar Chart:** Revenue by category — identify winners and underperformers instantly
- **Scatter:** Price vs reach — monitor pricing accessibility
- **Table:** Top customers by lifetime value — loyalty & retention watchlist
---
## 📁 Data Model
**Relational model — 1 transaction table + 3 master tables (Kaggle Grocery Sales Dataset)**
```
categories ──┐
             ├──  products ──┐
                             ├──  sales  (transaction-level, millions of rows)
customers ───────────────────┘
```
| Table | Description |
|-------|-------------|
| sales | Transaction-level: quantity, discount, salesdate, customerid, productid |
| products | Product master: productname, price, categoryid |
| categories | 11 product categories |
| customers | Customer master (~99K active customers) |

**Revenue formula:** `quantity × price × (1 − discount)` (after discount)
**Dataset:** Public, from Kaggle — see [`data/README.md`](data/README.md) for download & load instructions
---
## 🔑 SQL Techniques Used
| Technique | Applied In |
|-----------|-----------|
| Multi-table `JOIN` (sales–products–categories–customers) | All analysis layers |
| `SUM() OVER ()` window function | Revenue contribution % per category |
| `COUNT(DISTINCT ...)` | Unique customer reach per category |
| Multi-step CTEs (`WITH`) | Repeat purchase rate pipeline, top customer ranking |
| `COUNTIF` conditional aggregation | Repeat purchaser flagging |
| `RANK()` window function | Customer lifetime value ranking |
| `ROUND` / `AVG` with discount adjustment | Average realized price per unit |
---
## 📁 Project Structure
```
freshco-sales-analytics/
├── 01_define/
│   └── business_brief.md
├── 02_data_discovery/
│   └── data_dictionary.md
├── 03_data_preparation/
│   └── 01_data_quality_checks.sql
├── 04_analysis/
│   └── sql/
│       ├── 01_revenue_by_category.sql
│       ├── 02_volume_reach_correlation.sql
│       ├── 03_pricing_vs_reach.sql
│       ├── 04_repeat_purchase_rate.sql
│       └── 05_top_customers.sql
├── 05_communication/
│   ├── charts/
│   │   ├── 01_revenue_pareto.png
│   │   ├── 02_top5_revenue.png
│   │   ├── 03_revenue_vs_units.png
│   │   ├── 04_revenue_vs_customers.png
│   │   ├── 05_price_vs_reach.png
│   │   └── 06_dashboard_mockup.png
│   └── deck/
│       └── Sales_Analytics_FreshCo_Retail.pptx
├── 06_action/
│   └── recommendations.md
├── data/
│   └── README.md
├── .gitignore
└── README.md
```
---
## 🎯 6-Month Implementation Roadmap
**Phase 1: Implement (Month 1–2)**
- Launch promo calendar & bundling pilots on top-3 categories
- Design tiered pricing pilot for Grain & Dairy
- Build loyalty & VIP top-customer program

**Phase 2: Monitor (Month 3–4)**
- Track revenue lift via dashboard
- Measure reach & basket size movement
- Validate pricing elasticity hypothesis

**Phase 3: Evaluate (Month 5–6)**
- Measure revenue lift vs +5% target
- Adjust strategies if needed
- Report ROI to stakeholders
---
## ⚠️ Disclaimer
FreshCo Retail is a **fictional company** created for analytical and portfolio purposes. The underlying data is the public [Grocery Sales Dataset](https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset) from Kaggle; monetary values follow the dataset's original units.
---
## 🔗 Connect
**Deleonard Simanjorang**
Data Analyst | Sales Analytics & People Analytics
📧 deleonard20@gmail.com
💼 [LinkedIn](https://www.linkedin.com/in/deleonard-simanjorang)
📱 WhatsApp: +62 812 4154 4992
🐙 [GitHub](https://github.com/deleonard20)
---
**⭐ If you found this analysis helpful, please consider starring this repository!**
