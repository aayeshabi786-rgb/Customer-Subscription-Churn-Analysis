/* ============================================================
   FILE: 05_Feature_Engineering.sql
   PROJECT: Customer Subscription Churn Analysis
   PURPOSE: Create analytical features for segmentation
   ============================================================ */

USE ChurnAnalysis;
GO


---------------------------------------------------------------
-- 1. Create Tenure Group
---------------------------------------------------------------
ALTER TABLE analytics.customer_subscription_data
ADD tenure_group VARCHAR(20);

UPDATE analytics.customer_subscription_data
SET tenure_group =
    CASE 
        WHEN tenure_months <= 3 THEN '0-3 Months'
        WHEN tenure_months <= 6 THEN '3-6 Months'
        WHEN tenure_months <= 12 THEN '6-12 Months'
        ELSE '12+ Months'
    END;


---------------------------------------------------------------
-- 2. Create Usage Segment
---------------------------------------------------------------
ALTER TABLE analytics.customer_subscription_data
ADD usage_segment VARCHAR(20);

UPDATE analytics.customer_subscription_data
SET usage_segment =
    CASE 
        WHEN avg_weekly_usage_hours < 5 THEN 'Low Usage'
        WHEN avg_weekly_usage_hours <= 15 THEN 'Medium Usage'
        ELSE 'High Usage'
    END;


---------------------------------------------------------------
-- 3. Create Engagement Level
---------------------------------------------------------------
ALTER TABLE analytics.customer_subscription_data
ADD engagement_level VARCHAR(20);

UPDATE analytics.customer_subscription_data
SET engagement_level =
    CASE
        WHEN last_login_days_ago <= 7 THEN 'Active'
        WHEN last_login_days_ago <= 30 THEN 'At Risk'
        ELSE 'Inactive'
    END;


---------------------------------------------------------------
-- 4. Create High Risk Flag
---------------------------------------------------------------
ALTER TABLE analytics.customer_subscription_data
ADD high_risk_flag VARCHAR(10);

UPDATE analytics.customer_subscription_data
SET high_risk_flag =
    CASE
        WHEN churn = 'No'
             AND avg_weekly_usage_hours < 5
             AND last_login_days_ago > 30
        THEN 'Yes'
        ELSE 'No'
    END;


---------------------------------------------------------------
-- 5. Calculate Estimated LTV
---------------------------------------------------------------
ALTER TABLE analytics.customer_subscription_data
ADD estimated_ltv DECIMAL(12,2);

UPDATE analytics.customer_subscription_data
SET estimated_ltv = monthly_fee * tenure_months;


---------------------------------------------------------------
-- END OF 05_Feature_Engineering.sql
---------------------------------------------------------------
