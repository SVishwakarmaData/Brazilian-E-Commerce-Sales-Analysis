# Brazilian E-Commerce Sales Analysis

A SQL-driven analysis of the Olist Brazilian E-Commerce dataset, covering revenue trends, 
customer retention, delivery performance, and top-selling categories, visualized in a 
Power BI dashboard.

## Overview
This project analyzes ~100K real orders from Olist, a Brazilian e-commerce marketplace, 
using MySQL for data extraction and transformation and Power BI for visualization. 
Built to practice multi-table joins, CTEs, and window functions on real relational data.

## Key Questions Answered
- What are the top 10 highest-revenue product categories?
- How has monthly revenue trended over time, and what's the cumulative growth?
- What is the average delivery time by state, and where are the slowest/fastest regions?
- What percentage of customers make repeat purchases?

## Tech Stack

MySQL (MySQL Workbench), Power BI

## Key SQL Techniques Used
- **Multi-table joins** — connecting orders, order items, products, customers, and payments 
  across 5+ related tables
- **CTEs (Common Table Expressions)** — structuring multi-step aggregations (e.g., customer 
  order counts before calculating repeat-purchase rate)
- **Window functions** — `SUM() OVER (ORDER BY ...)` for calculating running total revenue 
  by month
- **Conditional aggregation** — `CASE WHEN` inside `SUM()` to count repeat customers
- **Date functions** — `DATE_FORMAT`, `DATEDIFF` for time-based grouping and delivery-time 
  calculations

## Dashboard
![Dashboard Overview](https://github.com/user-attachments/assets/cb12f079-13a2-471b-81a2-6a2e5d6c29c3)

- **KPI Cards:** Total Customers (96K), Repeat Purchase Rate (3.12%)
- **Monthly Revenue Trend:** Line chart comparing monthly revenue vs. cumulative running total
- **Top-Selling Categories:** Ranked bar chart of top 10 categories by revenue
- **Average Delivery Time by State:** Ranked bar chart across Brazilian states

## Key Findings
- Repeat purchase rate is low (~3.12%), consistent with Olist's nature as a marketplace 
  where most customers are one-time buyers rather than a subscription/repeat business
- [Add: which state had fastest/slowest delivery, once you note it from your chart]
- [Add: which category drove the most revenue]

## Files in This Repo
- `total_revenue.sql` — Top 10 categories by revenue
- `monthy_revenue_trends.sql` — Monthly revenue trend with running total (window function)
- `Average_deliver_time.sql` — Average delivery time by state
- `Customer_repeat-purchase_rate.sql` — Repeat purchase rate calculation
- `dashboard.pbix` — Power BI dashboard file

## Data Source
[Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle)

## Assumptions & Notes
- Canceled orders were excluded from revenue calculations
- Delivery time only calculated for orders with status `delivered` and a non-null delivery date
- Product category names translated from Portuguese to English using the dataset's provided 
  translation table
