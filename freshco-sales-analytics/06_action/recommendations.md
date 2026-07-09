# Recommendations & Implementation Plan — FreshCo Sales Analytics

**Target: +$74.5M annual revenue (5% lift on top-3 categories) within 6 months**

---

## 1. Targeted Promotions & Bundling — Add up to $74.5M

**Why this happens:**
Reach gaps are often a symptom of promotions not reaching new shoppers, weak cross-category exposure (shoppers stick to habitual aisles), underused bundling between high-loyalty and low-reach categories, and promo budget spread evenly instead of focused on winnable categories.

**Actions:**
- Focus promo & sampling budget on top-3 categories (Confections, Meat, Poultry) to convert their high reach into higher purchase frequency
- Bundle high-loyalty Confections with lower-reach categories to lift units per basket and expose shoppers to new aisles
- Weight inventory & supply planning toward high-volume winners

**Tools:** Category promo calendar + A/B testing · Market-basket analysis in BigQuery

**Risk if unaddressed:** Growth stalls at $4.28B while competitors capture mass-market demand. Every quarter of inaction defers ~$18.6M of the projected annual upside.

---

## 2. Tiered Pricing for Premium Categories — Lift Grain Reach 97.3K → 98.3K+

**Finding:** Grain is priced at $59.6/unit (~18% above portfolio average) but reaches 1,400 fewer customers than mass categories. Price and reach are negatively correlated across the portfolio.

**Actions:**
- Introduce entry-size packs and mid-tier SKUs in Grain and Dairy to widen reach without eroding premium positioning
- Pilot targeted discounts in selected stores and measure reach elasticity before portfolio-wide rollout

**Tools:** Price ladder & pack architecture review · Controlled pricing experiments (test vs control)

**Risk if unaddressed:** Premium categories stay capped at the smallest customer base, leaving mass-market demand open for competitors.

---

## 3. Loyalty Monetization & VIP Top-Customer Program

**Finding:** Repeat purchase rates are uniformly high (Confections 99.85%) — loyalty itself is not the problem; the untapped value lies in monetizing it. Top customer (ID 94800) has contributed $130,324 in lifetime revenue yet receives generic treatment.

**Actions:**
- Launch a points program anchored on Confections to reward frequency and incentivize cross-category redemption
- Identify the top 1% of customers by lifetime value; serve tailored offers, early access, and dedicated service

**Tools:** RFM segmentation in BigQuery · Customer lifetime value ranking + personalized campaigns

**Risk if unaddressed:** High-value customers remain unrecognized and vulnerable to competitor offers. Losing a single top-10 customer erases six figures of reliable annual revenue.

---

## 6-Month Roadmap

| Phase | Timeline | Activities |
|-------|----------|-----------|
| **Implement** | Month 1–2 | Launch promo calendar & bundling pilots · Design tiered pricing pilot · Build loyalty & VIP program |
| **Monitor** | Month 3–4 | Track revenue lift via dashboard · Measure reach & basket size · Validate pricing elasticity hypothesis |
| **Evaluate** | Month 5–6 | Measure revenue lift vs +5% target · Adjust strategies if needed · Report ROI to stakeholders |

## Monitoring KPIs (Dashboard)

| KPI | Baseline | Target |
|-----|----------|--------|
| Top-3 category revenue (annualized) | $1.49B | $1.56B (+5%) |
| Grain unique customer reach | 97,335 | 98,300+ |
| Top category share (Confections) | 13.0% | Maintain / grow |
| Repeat purchase rate (portfolio) | ~99.8% | Maintain + monetize |
| Top-1% customer retention | — | 100% |
