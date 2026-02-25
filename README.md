# Customer-Subscription-Churn-Analysis
SQL-based churn analysis project covering data loading, EDA, cleaning, validation, feature engineering, and business-driven insights.

________________________________________
📊 Project Overview
This project performs an end-to-end Customer Subscription Churn Analysis using Microsoft SQL Server.
The objective is to identify churn drivers, measure financial impact, and build structured ETL and analytical workflows following industry best practices.
The project covers:
•	Data Loading using BULK INSERT
•	Exploratory Data Analysis (EDA)
•	Data Cleaning & Standardization
•	Data Validation & Business Rule Checks
•	Feature Engineering
•	Churn Driver Analysis
________________________________________

🏗 Project Workflow
🔹 Phase 1: Exploratory Data Analysis (EDA)
•	Checked row counts and schema structure
•	Identified null values and duplicates
•	Validated categorical and numeric distributions
🔹 Phase 2: Data Cleaning
•	Standardized categorical values
•	Removed duplicates using ROW_NUMBER()
•	Enforced business rules for numeric fields
🔹 Phase 3: Data Validation
•	Ensured logical consistency
•	Validated date and tenure relationships
•	Verified churn integrity
🔹 Phase 4: Feature Engineering
•	Created tenure groups (Lifecycle segmentation)
•	Created usage segments (Engagement analysis)
•	Created engagement level indicator
•	Generated high-risk customer flag
•	Calculated estimated customer lifetime value (LTV)
🔹 Phase 5: Analytical Queries
•	Calculated churn rate
•	Identified churn by plan type
•	Measured revenue loss
•	Analyzed behavioral churn drivers
________________________________________

💡 Key Insights
•	Early tenure customers show higher churn risk
•	Low weekly usage strongly correlates with churn
•	Payment failures and inactivity increase churn probability
•	Revenue loss is concentrated in specific subscription plans
________________________________________

🛠 Technologies Used
•	Microsoft SQL Server
•	SQL Server Management Studio (SSMS)
•	T-SQL (CASE, CTE, Window Functions)
•	ETL Workflow Design
________________________________________

📈 Business Value
This project demonstrates:
•	Structured SQL data pipeline development
•	Data quality management
•	Feature engineering for churn modeling
•	Business-focused analytical storytelling
________________________________________

