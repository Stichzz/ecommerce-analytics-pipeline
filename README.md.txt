# 🛒 E-Commerce Sales & Customer Analytics Pipeline

An end-to-end data analytics pipeline demonstrating data cleaning in **Python**, relational database storage in **MySQL**, business queries via **SQL**, and executive visualization in **Power BI**.

---

## 📌 Executive Summary

This project analyzes over **397,000 transaction records** from a UK-based online retail enterprise. The goal was to build a reliable data pipeline from raw, uncleaned transactional data to an interactive executive dashboard that surfaces key business metrics like total revenue, order volume, customer lifetime spending, and regional revenue distribution.

---

## 🛠️ Tech Stack & Architecture

* **Data Cleaning & Preprocessing:** Python (pandas, numpy)
* **Database Management:** MySQL, DBeaver
* **Data Visualization & Analytics:** Power BI Desktop
* **Version Control:** Git & GitHub

[ Raw CSV Data ] -> [ Python Data Cleaning ] -> [ MySQL Database ] -> [ SQL Business Analysis ] -> [ Power BI Dashboard ]

---

## 🧹 Data Cleaning Pipeline (Python)

The raw dataset contained transactional noise, missing values, and corrupted records. The following cleaning procedures were executed in Python:

1. **Schema Definition & Type Conversion:** Converted InvoiceDate to proper datetime64 objects and formatted numeric metrics (Quantity, UnitPrice).
2. **Missing Value Management:** Identified and removed rows with missing CustomerID records where customer attribution was strictly required.
3. **Outlier & Logic Filtering:** Removed cancelled transactions (Invoice numbers starting with 'C') and eliminated non-positive transactions (Quantity <= 0 or UnitPrice <= 0).
4. **Feature Engineering:** Calculated TotalAmount = Quantity * UnitPrice to track exact revenue per row item.

---

## 📊 SQL Business Insights (MySQL)

Key analytical questions executed on MySQL using aggregated queries, window functions, and Common Table Expressions (CTEs):

* **Top Market by Revenue:** The **United Kingdom** generated the highest overall revenue at **£7,308,391.55**.
* **Peak Sales Period:** **November 2011** recorded the highest single-month revenue at **£1,161,817.38**, driven by Black Friday and early holiday shopping.
* **Customer Lifetime Value (CTE Analysis):** Identified VIP accounts based on recency, purchase frequency, and total lifetime spend to aid targeted retention strategies.

---

## 📉 Interactive Power BI Dashboard

The final dataset was ingested into Power BI via **Import Mode** from MySQL to ensure real-time responsiveness.

### Key Visualizations:
* **KPI Header Cards:** Displays real-time aggregate measures (**Total Revenue: $8.91M**, **Unique Orders**, and **Unique Customers**).
* **Monthly Revenue Trend (Line Chart):** Highlights historical trajectory and seasonal volume spikes.
* **Geographic Breakdown (Bar Chart):** Ranks top revenue-generating markets.

---

## 📂 Repository Structure

├── notebook/
│   └── ecommerce_cleaning.ipynb # Jupyter notebook with raw data cleaning
├── scripts/
│   ├── 01_data_cleaning.py      # Standalone Python cleaning pipeline
│   └── 02_business_queries.sql  # MySQL analysis queries
├── dashboard/
│   └── Ecommerce_Sales_Dashboard.pbix
└── README.md

---

## 🚀 How to Reproduce

1. **Clone Repository:**
   git clone https://github.com/Stichzz/ecommerce-analytics-pipeline.git

2. **Run Data Cleaning Script:**
   python scripts/01_data_cleaning.py

3. **Import to MySQL:** Load cleaned_ecommerce.csv into your MySQL instance.

4. **Open Power BI Dashboard:** Open Ecommerce_Sales_Dashboard.pbix and connect to your local MySQL database.