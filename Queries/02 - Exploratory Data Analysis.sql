-- =============================
-- 		(1). KEY METRICS
-- =============================

-- TIME FRAME
SELECT 
	MIN(sct.orderdate) AS "First Order Date", 
	MAX(sct.orderdate) AS "Last Order Date"
FROM skin_care_target AS sct;
-- The dataset spans one calendar year: January 1, 2022, to December 31, 2022.

-- KEY FINANCIAL METRICS
SELECT 
	SUM(sct.sales) AS "Total Revenue",
	ROUND(SUM(sct.profit), 2) AS "Total Profit",
	ROUND((SUM(sct.profit)/SUM(sct.sales)) * 100, 2) AS "Profit Margin %",
	ROUND(SUM(sales) / COUNT(DISTINCT orderid), 2) AS "Average Order Value"
FROM skin_care_target AS sct;
-- Total Revenue: $1,770,778, Total Profit: $318,675.4, Profit Margin %: 17.996% (Approximately 18 cents profit per dollar of revenue), Avg Order Value: $257.27

-- VOLUME METRICS
SELECT 
	COUNT(sct.orderid) AS "Order Count",
	SUM(sct.quantity) AS "Quanties Sold"
FROM skin_care_target AS sct;
-- Order Count: 13,798 total orders processed, Quantities Sold: 75,358 units sold.

-- PRODUCT PORTFOLIO
SELECT 
	COUNT(DISTINCT sct.category) AS "Product Category Count",
	COUNT(DISTINCT sct.subcategory) AS "Product Sub-Category Count",
	COUNT(DISTINCT sct.product) AS "Product Count"
FROM skin_care_target AS sct;
/*The inventory is organized into 5 major, top-level product categories.
These categories are further segmented into 17 distinct sub-categories.
The catalog contains 3,117 unique, individual product items (SKUs).*/

-- CUSTOMER METRICS
SELECT COUNT(DISTINCT sct.customerid) AS "Number of Customers"
FROM skin_care_target AS sct;
-- The number of distinct customers is 6,113.


-- ========================================
-- 	(2). SALES AND PROFIT PERFORMANCE
-- ========================================

-- Monthly Performance: Sales and Profit Overview
SELECT 
	EXTRACT(MONTH FROM sct.orderdate) AS "Month No",
	TO_CHAR(sct.orderdate, 'Month') AS "Months",
	SUM(sct.sales) AS "Total Revenue",
	SUM(sct.profit) AS "Total Profit"
FROM skin_care_target AS sct
GROUP BY 1,2
ORDER BY 1;
/*Month with highest sales: December with $217k
Month with highest profit: June with $41k*/

-- ========================================
-- (3). LOCATIONS AND THEIR PERFORMANCES
-- ========================================

-- Sales And Profit Distribution by Markets
SELECT
	sct.market AS "Market",
	SUM(sct.sales) AS "Total Revenue",
	SUM(sct.profit) AS "Total Profit"
FROM skin_care_target AS sct
GROUP BY 1
ORDER BY 2 DESC;

-- Top 10 Performing Countries
SELECT
	sct.country AS "Countries",
	SUM(sct.sales) AS "Total Revenue",
	SUM(sct.profit) AS "Total Profit",
	SUM(sct.quantity) AS "Qty Sold"
FROM skin_care_target AS sct
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Bottom 10 Performing Countries By Sales
SELECT
	sct.country AS "Countries",
	SUM(sct.sales) AS "Total Revenue",
	SUM(sct.profit) AS "Total Profit",
	SUM(sct.quantity) AS "Qty Sold"
FROM skin_care_target AS sct
GROUP BY 1
ORDER BY 2
LIMIT 10;


-- ===============================
-- 	(4). CUSTOMER INSIGHTS
-- ===============================

-- Customer Segment Sales Share %
SELECT
	sct.segment AS "Customer Segment",
	SUM(sct.sales) AS "Total Revenue",
	ROUND((SUM(sct.sales) * 100.0) / SUM(SUM(sct.sales)) OVER (), 2) AS "Sales Share %"
FROM skin_care_target AS sct
GROUP BY 1
ORDER BY 2 DESC;

-- Top 10 Customers: Sales and Profit 
SELECT
	sct.customerid AS "Customer IDs",
	ROUND(SUM(sct.sales), 2) AS "Total Revenue",
	ROUND(SUM(sct.profit), 2) AS "Total Profit",
	ROUND(AVG(sct.discount), 2) AS "Avg Discount %",
	SUM(sct.quantity) AS "Qty Sold"
FROM skin_care_target AS sct
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Number of Customers per Country
SELECT
	sct.country AS "Countries",
	COUNT(sct.customerid) AS "No of Customers"
FROM skin_care_target AS sct
GROUP BY 1
ORDER BY 2 DESC;


-- =========================================
-- (5). PROFITABILITY AND DISCOUNT ANALYSIS
-- =========================================

-- Avg Discounts, Total cost of discounts
SELECT 
	SUM(sct.discount * sct.sales) / SUM(sct.sales) * 100 AS "Avg Weighted Discount %",
	SUM(sct.sales * sct.discount) AS "Total Cost of Discounts"
FROM skin_care_target AS sct;
-- Avg Weighted Discount %: 14.61%, Total Cost of Discounts: $258,712.36

-- Discounted Sales vs. Full-Price Sales Ratio
SELECT
    -- Count of orders that included any discount
    COUNT(DISTINCT orderid) FILTER (WHERE discount > 0) AS "Discounted Orders",
    -- Count of orders with zero discount
    COUNT(DISTINCT orderid) FILTER (WHERE discount = 0) AS "Full Price Orders",
    -- Total sales generated with discounts
    SUM(sales) FILTER (WHERE discount > 0) AS "Sales with Discount",
    -- Total sales generated without discounts
    SUM(sales) FILTER (WHERE discount = 0) AS "Sales Full Price"
FROM skin_care_target;

-- Discount Buckets and their Metrics
SELECT
    CASE
        WHEN discount = 0 THEN 'A. Full Price (0%)'
        WHEN discount > 0 AND discount <= 0.1 THEN 'B. Low Discount (0.1-10%)'
        WHEN discount > 0.1 AND discount <= 0.3 THEN 'C. Medium Discount (10.1-30%)'
        ELSE 'D. High Discount (>30%)'
    END AS "Discount Bracket",
    SUM(sales) AS "Total Sales",
    SUM(profit) AS "Total Profit",
    SUM(profit) / SUM(sales) * 100 AS "Profit Margin %"
FROM skin_care_target
GROUP BY 1
ORDER BY 1;

-- ================================
-- 	(6). PRODUCT PERFORMANCE
-- ================================

-- Product Categories and Sub-Categories: Sales and their Profits
SELECT
	sct.category AS "Category",
	sct.subcategory AS "Sub-Category",
	SUM(sct.sales) AS "Total Revenue",
	SUM(sct.profit) AS "Total Profit"
FROM skin_care_target AS sct
GROUP BY 1,2
ORDER BY 1;

-- Profit Margin by Subcategory
SELECT
    subcategory,
    SUM(sales) AS "Total Sales",
    ROUND((SUM(profit) * 100.0) / SUM(sales), 2) AS "Profit Margin %"
FROM skin_care_target
GROUP BY 1
ORDER BY 3 DESC;











