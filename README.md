# freelance-market-sql-analysis
SQL data analysis project using SQL Server

Freelance Market SQL Analysis

This project analyzes freelance market data using **SQL Server** to uncover insights related to geography, experience levels, compensation, and professional categories.

The raw dataset was transformed into a **normalized analytical model** (fact and dimension tables) to enable accurate querying and scalable analysis.

---
Database Overview

The data model consists of the following tables:

- **fact**
  - Core metrics per freelancer (hourly rate, annual income, experience)
  - Foreign keys to profile and region

- **profile**
  - Category, experience level, and education information

- **region**
  - Geographic attributes (region and country)

- **skills**
  - One-to-many relationship between freelancers and skills

---

Key Analyses

- Freelancer distribution by region and country  
- Average hourly and annual income analysis  
- Experience-level workforce breakdown (percentages)  
- Category-based compensation comparison  
- Platform usage analysis  
- Skill demand and skill-based pay insights  

---

Tools & Skills

- SQL (T-SQL): joins, aggregations, window functions, CTEs
- SQL Server & SSMS
- Data modeling (fact & dimension tables)
- Data cleaning and transformation
- Analytical problem solving

---
Outcome

This project demonstrates practical **SQL data analysis and modeling skills**, suitable for junior Data Analyst or BI roles.
