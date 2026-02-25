/* ============================================================
   FILE: 01_Data_Load.sql
   PROJECT: Customer Subscription Churn Analysis
   PURPOSE: Create database, schema, table and load raw data
   AUTHOR: [Your Name]
   ============================================================ */


---------------------------------------------------------------
-- 1️⃣ Create Database
---------------------------------------------------------------
CREATE DATABASE ChurnAnalysis;
GO

USE ChurnAnalysis;
GO


---------------------------------------------------------------
-- 2️⃣ Create Schema
---------------------------------------------------------------
CREATE SCHEMA analytics;
GO


---------------------------------------------------------------
-- 3️⃣ Create Table
---------------------------------------------------------------
CREATE TABLE analytics.customer_subscription_data (
    user_id INT,
    signup_date DATE,
    plan_type VARCHAR(50),
    monthly_fee DECIMAL(10,2),
    avg_weekly_usage_hours DECIMAL(5,2),
    support_tickets INT,
    payment_failures INT,
    tenure_months INT,
    last_login_days_ago INT,
    churn VARCHAR(10)
);
GO


---------------------------------------------------------------
-- 4️⃣ Load Data Using BULK INSERT
---------------------------------------------------------------
BULK INSERT analytics.customer_subscription_data
FROM 'C:\Temp\customer_subscription.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A'
);
GO


---------------------------------------------------------------
-- 5️⃣ Basic Data Verification
---------------------------------------------------------------
SELECT COUNT(*) AS total_rows
FROM analytics.customer_subscription_data;

SELECT TOP 10 *
FROM analytics.customer_subscription_data;


---------------------------------------------------------------
-- END OF DATA LOAD SCRIPT
---------------------------------------------------------------
