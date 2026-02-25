
# Customer Subscription Churn Analysis Using SQL Server

## Overview

This project presents an end-to-end SQL Server analysis of customer subscription churn. It follows a structured data workflow including data loading, exploratory data analysis (EDA), cleaning, validation, feature engineering, and analytical querying.

The primary objective is to identify churn drivers, measure revenue impact, and demonstrate a production-style SQL ETL and analytics pipeline.

---

## Project Objectives

* Load structured subscription data into SQL Server
* Perform exploratory data analysis to understand data quality
* Clean and standardize inconsistent values
* Validate business rules and data integrity
* Engineer analytical features for churn segmentation
* Identify churn drivers and revenue loss patterns

---

## Technology Stack

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* T-SQL (CTEs, CASE statements, Window Functions, Aggregations)

---

## Dataset Description

The dataset contains customer subscription information including:

* user_id
* signup_date
* plan_type
* monthly_fee
* avg_weekly_usage_hours
* support_tickets
* payment_failures
* tenure_months
* last_login_days_ago
* churn

The churn column indicates whether a customer has left the subscription service.

---

## Project Workflow

### 1. Data Load

* Created database and schema
* Defined table structure
* Loaded CSV file using BULK INSERT
* Verified row counts and schema integrity

### 2. Exploratory Data Analysis (EDA)

* Checked total row count
* Validated schema metadata
* Identified null values and duplicates
* Reviewed categorical distributions
* Checked numeric ranges and outliers

### 3. Data Cleaning

* Removed leading/trailing spaces
* Standardized churn values (Yes/No)
* Standardized plan type formatting
* Removed duplicate records using ROW_NUMBER()
* Enforced business rules on numeric fields

### 4. Data Validation

* Verified logical consistency (date and tenure checks)
* Ensured no invalid categories remained
* Checked for future dates and negative values
* Revalidated cleaned dataset

### 5. Feature Engineering

* Created tenure_group (lifecycle segmentation)
* Created usage_segment (engagement classification)
* Created engagement_level indicator
* Generated high_risk_flag
* Calculated estimated customer lifetime value (LTV)

### 6. Analytical Queries

* Calculated overall churn rate
* Measured revenue lost due to churn
* Identified churn by plan type
* Analyzed churn by tenure group
* Evaluated behavioral drivers such as usage and payment failures

---

## Key Business Insights

* Early tenure customers exhibit higher churn probability
* Low weekly usage strongly correlates with churn
* Payment failures and inactivity increase churn risk
* Revenue loss is concentrated in specific subscription plans

---

## Repository Structure

```
Customer-Churn-SQL-Project/
│
├── 01_Data_Load.sql
├── 02_EDA.sql
├── 03_Cleaning.sql
├── 04_Validation.sql
├── 05_Feature_Engineering.sql
├── 06_Analysis.sql
├── README.md
```

---

## How to Run the Project

1. Place the CSV file in `C:\Temp\customer_subscription.csv`
2. Execute `01_Data_Load.sql`
3. Run scripts sequentially from 02 to 06
4. Review query outputs for analytical insights

---

## Skills Demonstrated

* SQL data modeling
* ETL pipeline structuring
* Data quality validation
* Feature engineering in SQL
* Business-driven analytical storytelling
* Use of window functions and conditional logic

