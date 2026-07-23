select * from cleaned_ecommerce;

SELECT 
    Country,
    ROUND(SUM(TotalAmount), 2) AS total_revenue,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    COUNT(DISTINCT CustomerID) AS total_customers
FROM cleaned_ecommerce
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;

ALTER TABLE cleaned_ecommerce MODIFY COLUMN InvoiceDate DATETIME;

SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS sales_month,
    ROUND(SUM(TotalAmount), 2) AS monthly_revenue,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM cleaned_ecommerce
GROUP BY sales_month
ORDER BY sales_month ASC;

SELECT 
    CustomerID,
    Country,
    ROUND(SUM(TotalAmount), 2) AS total_spent,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM cleaned_ecommerce
GROUP BY CustomerID, Country
ORDER BY total_spent DESC
LIMIT 5;

WITH customer_summary AS (
    SELECT 
        CustomerID,
        MAX(InvoiceDate) AS last_purchase_date,
        COUNT(DISTINCT InvoiceNo) AS total_orders,
        ROUND(SUM(TotalAmount), 2) AS lifetime_value
    FROM cleaned_ecommerce
    GROUP BY CustomerID
)
SELECT * 
FROM customer_summary
ORDER BY lifetime_value DESC
LIMIT 10;