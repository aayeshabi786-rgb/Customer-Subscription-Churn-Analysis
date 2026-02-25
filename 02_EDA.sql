/* ============================================================
   FILE: 02_EDA.sql
   PROJECT: Customer Subscription Churn Analysis
   PURPOSE: Perform Exploratory Data Analysis (EDA)
            to understand data structure, quality,
            distributions, and potential issues
   ============================================================ */

USE ChurnAnalysis;
GO


---------------------------------------------------------------
-- 1. Verify Total Number of Records
---------------------------------------------------------------
SELECT COUNT(*) AS total_rows
FROM analytics.customer_subscription_data;


---------------------------------------------------------------
-- 2. Inspect Table Structure (Metadata Validation)
---------------------------------------------------------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer_subscription_data';


---------------------------------------------------------------
-- 3. Preview Sample Data
---------------------------------------------------------------
SELECT TOP 10 *
FROM analytics.customer_subscription_data;


---------------------------------------------------------------
-- 4. Check Distinct Values for Categorical Columns
---------------------------------------------------------------

-- Churn Categories
SELECT DISTINCT churn
FROM analytics.customer_subscription_data;

-- Plan Types
SELECT DISTINCT plan_type
FROM analytics.customer_subscription_data;


---------------------------------------------------------------
-- 5. Check for NULL Values in Critical Columns
---------------------------------------------------------------
SELECT
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
    SUM(CASE WHEN signup_date IS NULL THEN 1 ELSE 0 END) AS null_signup_date,
    SUM(CASE WHEN plan_type IS NULL THEN 1 ELSE 0 END) AS null_plan_type,
    SUM(CASE WHEN monthly_fee IS NULL THEN 1 ELSE 0 END) AS null_monthly_fee,
    SUM(CASE WHEN churn IS NULL THEN 1 ELSE 0 END) AS null_churn
FROM analytics.customer_subscription_data;


---------------------------------------------------------------
-- 6. Check for Duplicate Users
---------------------------------------------------------------
SELECT user_id, COUNT(*) AS duplicate_count
FROM analytics.customer_subscription_data
GROUP BY user_id
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 7. Validate Numeric Ranges (Outlier Detection)
---------------------------------------------------------------

-- Negative Values
SELECT *
FROM analytics.customer_subscription_data
WHERE avg_weekly_usage_hours < 0
   OR monthly_fee < 0
   OR tenure_months < 0
   OR payment_failures < 0
   OR support_tickets < 0;


---------------------------------------------------------------
-- 8. Basic Distribution Overview
---------------------------------------------------------------

-- Churn Distribution
SELECT churn, COUNT(*) AS total_customers
FROM analytics.customer_subscription_data
GROUP BY churn;

-- Plan Distribution
SELECT plan_type, COUNT(*) AS total_customers
FROM analytics.customer_subscription_data
GROUP BY plan_type;


---------------------------------------------------------------
-- 9. Summary Statistics for Key Metrics
---------------------------------------------------------------
SELECT 
    MIN(monthly_fee) AS min_fee,
    MAX(monthly_fee) AS max_fee,
    AVG(monthly_fee) AS avg_fee,
    MIN(avg_weekly_usage_hours) AS min_usage,
    MAX(avg_weekly_usage_hours) AS max_usage,
    AVG(avg_weekly_usage_hours) AS avg_usage
FROM analytics.customer_subscription_data;


---------------------------------------------------------------
-- END OF 02_EDA.sql
---------------------------------------------------------------
