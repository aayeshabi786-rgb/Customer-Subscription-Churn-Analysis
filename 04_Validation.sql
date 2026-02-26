/* ============================================================
   FILE: 04_Validation.sql
   PROJECT: Customer Subscription Churn Analysis
   PURPOSE: Validate logical consistency and business rules
   ============================================================ */

USE ChurnAnalysis;
GO


---------------------------------------------------------------
-- 1. Ensure No NULLs in Critical Fields
---------------------------------------------------------------
SELECT *
FROM analytics.customer_subscription_data
WHERE user_id IS NULL
   OR signup_date IS NULL
   OR plan_type IS NULL
   OR churn IS NULL;


---------------------------------------------------------------
-- 2. Validate Date Integrity
---------------------------------------------------------------
SELECT *
FROM analytics.customer_subscription_data
WHERE signup_date > GETDATE();


---------------------------------------------------------------
-- 3. Validate Tenure Consistency
---------------------------------------------------------------
SELECT *
FROM analytics.customer_subscription_data
WHERE tenure_months < 0;


---------------------------------------------------------------
-- 4. Cross-Check Churn Distribution
---------------------------------------------------------------
SELECT churn, COUNT(*) AS total_customers
FROM analytics.customer_subscription_data
GROUP BY churn;


---------------------------------------------------------------
-- END OF 04_Validation.sql
---------------------------------------------------------------
