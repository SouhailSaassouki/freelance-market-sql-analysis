# freelance-market-sql-analysis
SQL & Power BI data analysis project using SQL Server and Power BI

## Freelance Market SQL & Power BI Analysis

This project analyzes freelance market data using **SQL Server** and **Power BI** to uncover insights related to geography, experience levels, education, skills, platforms, and compensation.

The workflow follows an end-to-end analytics approach:
- Data modeling and analysis in SQL Server
- Visualization and storytelling in Power BI

---

## Database Overview

The raw dataset was transformed into a **normalized analytical model** (fact and dimension tables) to enable accurate querying and scalable analysis.

### Tables

**fact**
- Core metrics per freelancer (hourly rate, annual income, years of experience)
- Foreign keys to profile and region dimensions

**profile**
- Freelancer category
- Experience level
- Education background

**region**
- Geographic attributes (region and country)

**skills**
- One-to-many relationship between freelancers and skills

---

## Key SQL Analyses

- Freelancer distribution by region and country  
- Average hourly rate and annual income analysis  
- Workforce breakdown by experience level (percentages)  
- Category-based compensation comparison  
- Platform usage analysis  
- Skill demand and skill-based pay insights  

---

## Power BI Reporting

The SQL analytical model was connected to **Power BI** to create an interactive dashboard for data storytelling and insight communication.

### Power BI Insights

- **Geographic distribution** of 500 freelancers across 22 countries using map visuals  
- **Platform usage analysis** (Upwork, Fiverr, Direct Clients, Toptal, LinkedIn) by country  
- **Education background by region**, highlighting the balance between formal education and alternative learning paths  
- **Experience level distribution**, showing a strong dominance of senior freelancers  
- **Skill and category analysis**, focusing on high-demand roles such as Web Development, Full Stack, Cybersecurity, DevOps, and AI/ML  
- **Income analysis**, demonstrating how experience, platform type, and client access influence earnings more than geographic location  

### Key Business Insights

- Freelancing is a **global and mature market**, not limited to traditional tech hubs  
- **Skills and experience matter more than formal education**  
- Senior and specialized freelancers dominate the market  
- Direct client relationships are associated with **higher income**  
- Emerging markets play a major role in the global freelance ecosystem  

---

## Tools & Skills

- SQL (T-SQL): joins, aggregations, window functions, CTEs  
- SQL Server & SSMS  
- Data modeling (fact & dimension tables)  
- Data cleaning and transformation  
- Power BI (data modeling, DAX basics, interactive dashboards)  
- Data visualization & storytelling  
- Analytical problem solving  

---

## Outcome

This project demonstrates an end-to-end analytics workflow, combining **SQL data modeling and analysis** with **Power BI visualization and storytelling**, making it suitable for **Junior Data Analyst, BI Analyst, or Analytics roles**.
```
