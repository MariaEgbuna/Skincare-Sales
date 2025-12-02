-- Dataset Overview
SELECT *
FROM skin_care_target AS sct ;

-- Checking for null values
SELECT
    COUNT(*) FILTER (WHERE rowid IS NULL) AS null_rowid,
    COUNT(*) FILTER (WHERE orderid IS NULL) AS null_orderid,
    COUNT(*) FILTER (WHERE orderdate IS NULL) AS null_orderdate,
    COUNT(*) FILTER (WHERE customerid IS NULL) AS null_customerid,
    COUNT(*) FILTER (WHERE segment IS NULL) AS null_segment,
    COUNT(*) FILTER (WHERE city IS NULL) AS null_city,
    COUNT(*) FILTER (WHERE state IS NULL) AS null_state,
    COUNT(*) FILTER (WHERE country IS NULL) AS null_country,
    COUNT(*) FILTER (WHERE latitude IS NULL) AS null_latitude,
    COUNT(*) FILTER (WHERE longitude IS NULL) AS null_longitude,
    COUNT(*) FILTER (WHERE region IS NULL) AS null_region,
    COUNT(*) FILTER (WHERE market IS NULL) AS null_market,
    COUNT(*) FILTER (WHERE subcategory IS NULL) AS null_subcategory,
    COUNT(*) FILTER (WHERE category IS NULL) AS null_category,
    COUNT(*) FILTER (WHERE product IS NULL) AS null_product,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS null_quantity,
    COUNT(*) FILTER (WHERE sales IS NULL) AS null_sales,
    COUNT(*) FILTER (WHERE discount IS NULL) AS null_discount,
    COUNT(*) FILTER (WHERE profit IS NULL) AS null_profit
FROM skin_care_target AS sct;

-- Standardizing Date Column
ALTER TABLE skin_care_target
ALTER COLUMN orderdate TYPE DATE
USING TO_DATE(orderdate, 'DD/MM/YYYY');

-- Dropping Unneccessary columns
ALTER TABLE skin_care_target 
DROP COLUMN rowid;

-- Checking for Duplicates
SELECT
	orderid, orderdate, customerid, segment, city, state, country, latitude, longitude, region, market, subcategory, category, product, quantity, sales, discount, profit,
	COUNT(*) AS "Row Count"
FROM skin_care_target AS sct 
GROUP BY orderid, orderdate, customerid, segment, city, state, country, latitude, longitude, region, market, subcategory, category, product, quantity, sales, discount, profit
HAVING COUNT(*) > 1;

-- Viewing the row with duplicates
SELECT *
FROM skin_care_target AS sct 
WHERE sct.orderid = 'US-2014-JB16045140-41705';

-- Removing the Duplicate
DELETE FROM skin_care_target
WHERE ctid IN (
    SELECT ctid
    FROM (
        SELECT ctid, 
        ROW_NUMBER() OVER 
        (
         	PARTITION BY orderid, orderdate, customerid, segment, city, state, country, latitude, longitude, region, market, subcategory, category, product, quantity, sales, discount, profit
            ORDER BY ctid  -- Keeps the row with the lowest ctid (often the first inserted)
        ) as rn
        FROM skin_care_target
    ) AS duplicates
    WHERE rn > 1
);

-- Cleaned Dataset
SELECT *
FROM skin_care_target AS sct;