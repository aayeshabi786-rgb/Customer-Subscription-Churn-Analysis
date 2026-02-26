/* ============================================================
   FILE: 06_Analysis.sql
   PROJECT: Customer Subscription Churn Analysis
   PURPOSE: Generate business insights and churn metrics
   ============================================================ */

USE ChurnAnalysis;
GO


---------------------------------------------------------------
-- 1. Overall Churn Rate
---------------------------------------------------------------
SELECT 
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) 
    AS churn_rate_percentage
FROM analytics.customer_subscription_data;


---------------------------------------------------------------
-- 2. Revenue Lost Due to Churn
---------------------------------------------------------------
SELECT SUM(monthly_fee) AS revenue_lost
FROM analytics.customer_subscription_data
WHERE churn = 'Yes';


---------------------------------------------------------------
-- 3. Churn by Plan Type
---------------------------------------------------------------
SELECT 
    plan_type,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) AS churned_customers,
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate
FROM analytics.customer_subscription_data
GROUP BY plan_type
ORDER BY churn_rate DESC;


---------------------------------------------------------------
-- 4. Churn by Tenure Group
---------------------------------------------------------------
SELECT 
    tenure_group,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) AS churned_customers,
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate
FROM analytics.customer_subscription_data
GROUP BY tenure_group
ORDER BY churn_rate DESC;


---------------------------------------------------------------
-- 5. Churn by Usage Segment
---------------------------------------------------------------
SELECT 
    usage_segment,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) AS churned_customers,
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate
FROM analytics.customer_subscription_data
GROUP BY usage_segment
ORDER BY churn_rate DESC;


---------------------------------------------------------------
-- END OF 06_Analysis.sql
---------------------------------------------------------------
