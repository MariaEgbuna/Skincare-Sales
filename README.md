# Skincare Sales Project

## 1. Project Overview

The analysis covers the complete calendar year **2022** (from 2022-01-01 to 2022-12-31) using the `skin_care_target` data table.
The product catalog contains **5** major categories, segmented into **17** sub-categories, totaling **3,117** unique product items.

---

## 2. Key Metrics

The company generated a **Total Revenue** of **$1,770,778** from **13,798 orders**, resulting in a **Total Profit** of **$318,675.4**. The total quantity of units sold was **75,358**.

The primary profitability indicators are:

* **Profit Margin %:** **18.0%** (The business retains 18 cents of profit per dollar of revenue).
* **Avg Weighted Discount %:** **14.6%** (Average price markdown across all sales).
* **Total Cost of Discounts:** **$258,712.36** (Total potential revenue sacrificed due to promotions).

---

## 3. Sales Analysis Summary

### Monthly Trends

![Monthly Performance](<Images/1. Monthly Performance.png>)

* **Peak Revenue** occurred in **December** ($217,674).
* **Peak Profit** occurred in **June** ($41,810).
* **Lowest Performance** for both metrics was in **February** (Revenue: $79,783; Profit: $13,584).
* The data shows a general seasonal uptake in revenue starting in May and maintaining high levels through the second half of the year.

### Customer Segment Performance

![Customer Segment Distribution](<Images/3. Customer Segment Distribution.png>)

The **Corporate** segment is the most significant revenue driver, contributing **58.8%** of total sales. The **Consumer** segment follows at **33.0%**, with the **Self-Employed** segment contributing the remaining **8.2%**.

### Geographic Performance (Market)

![Global Market Sales](<Images/2. Global Sales by Market.png>)

The **Asia Pacific** market generates the highest revenue at **$497,173**. Revenue performance is tightly clustered among the middle markets: **LATAM** ($385,098), **USCA** ($375,637), and **Europe** ($373,078). **Africa** is the lowest revenue market ($139,792).

### Product Category Performance

![Product Category Revenue](<Images/4. Product Category Sales.png>)

**Body care** is the dominant product category, generating the highest revenue at **$746,249**. This is followed by Home and Accessories ($332,766) and Hair care ($288,545). **Face care** is the smallest category ($124,432).

## 4.Profitability Summary by Product Subcategory

The analysis of subcategory profitability highlights an **extreme margin disparity** in the product portfolio, ranging from **40.10% profit** to **-18.58% loss**.

### Top & Bottom Margin Performers

![Product Margin %](<Images/5. Product Margin Performance.png>)

Six subcategories consistently achieve a profit margin exceeding **35%**

* Eye shadows and pencils
* Face moisturizing products
* Lipsticks
* Bath oils, bubbles and soaks
* Hand creams
* Vitamins and supplements

Seven product subcategories exhibit a **negative profit margin**, requiring immediate corrective action:

* Fragrances: The highest loss driver, with a margin of **-18.58%**.
* Body Moisturizers
* Brushes and Applicators
* Face masks and Exfoliators
* Accessories
* Hair colors and Toners

### Low Profit / High Volume

* **Shampoos and Conditioners:** This subcategory generated **$174,777** in sales, but its profit margin is only **0.89%**. This high-volume activity contributes negligible profit.

---

## Conclusion

The analysis indicates the overall profit margin (18.00%) is severely suppressed by systemic issues in pricing control and product mix profitability. The company is successfully generating revenue in key segments but simultaneously losing significant capital due to high-discount leakage and a portfolio containing structurally unprofitable subcategories.

## Recommendations: Profitability and Strategy

## 1. Immediate Profit Recovery (Pricing Control)

* **Discount Leakage Stop:** Eliminate all discounts above 30%. This threshold is non-negotiable as the High Discount bracket currently operates at a **-20.65% net loss**.
* **Product Profit Floor:** Immediately re-price the seven identified net-loss subcategories (e.g., fragrances, body moisturizers) to establish and guarantee a minimum positive profit contribution.
* **Volume-to-Profit Conversion:** Adjust pricing for the high-volume **shampoos and conditioners** subcategory to convert its 0.89% near-zero margin into meaningful profit.

## 2. Strategic Resource Protection

* **Protect Core Revenue:** **Prioritize** account management and marketing resources toward the **Corporate segment** ($58.81\%$ revenue share) and the **Body care category** (highest revenue generator) to maintain stability.
* **Leverage High Margin:** **Focus growth efforts** on subcategories with $>35\%$ margins (e.g., Eye shadows and pencils, Lipsticks) to maximize overall profitability and resource efficiency.

---

## Project Documentation

**Analyst:** *Maria Egbuna*  
**Tools Used:** *PostgreSQL, Power BI*  
**Date:** *September 12, 2025*  
