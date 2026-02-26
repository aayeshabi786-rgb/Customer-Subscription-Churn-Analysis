/* ============================================================
   FILE: 03_Cleaning.sql
   PROJECT: Customer Subscription Churn Analysis
   PURPOSE: Clean and standardize dataset for analysis
   ============================================================ */

USE ChurnAnalysis;
GO


---------------------------------------------------------------
-- 1. Remove Leading and Trailing Spaces
---------------------------------------------------------------
UPDATE analytics.customer_subscription_data
SET 
    plan_type = LTRIM(RTRIM(plan_type)),
    churn = LTRIM(RTRIM(churn));


---------------------------------------------------------------
-- 2. Standardize Churn Values (Yes / No)
---------------------------------------------------------------
UPDATE analytics.customer_subscription_data
SET churn = 'Yes'
WHERE LOWER(churn) IN ('yes', 'y');

UPDATE analytics.customer_subscription_data
SET churn = 'No'
WHERE LOWER(churn) IN ('no', 'n');


---------------------------------------------------------------
-- 3. Standardize Plan Type Formatting
---------------------------------------------------------------
UPDATE analytics.customer_subscription_data
SET plan_type = UPPER(plan_type);


---------------------------------------------------------------
-- 4. Remove Duplicate Records (Keep Latest by signup_date)
---------------------------------------------------------------
WITH cte_duplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY user_id
               ORDER BY signup_date DESC
           ) AS rn
    FROM analytics.customer_subscription_data
)
DELETE FROM cte_duplicates
WHERE rn > 1;


---------------------------------------------------------------
-- 5. Remove Invalid Numeric Records
---------------------------------------------------------------
DELETE FROM analytics.customer_subscription_data
WHERE avg_weekly_usage_hours < 0
   OR monthly_fee < 0
   OR tenure_months < 0
   OR payment_failures < 0
   OR support_tickets < 0;


---------------------------------------------------------------
-- END OF 03_Cleaning.sql
---------------------------------------------------------------
