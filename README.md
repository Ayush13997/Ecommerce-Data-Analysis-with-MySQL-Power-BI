# 📊 Ecommerce Data Analysis with MySQL & Power BI

A comprehensive data analysis project examining ecommerce performance across 6 countries, 5 product categories, and 2,000+ customers from 2021-2025. This analysis reveals critical business insights including growth patterns, market dynamics, and operational challenges.

## 🎯 Project Overview

This project analyzes multi-year ecommerce transaction data to uncover:
- Revenue trends and growth trajectories
- Geographic market performance
- Product category dynamics
- Customer behavior patterns
- Order cancellation insights
- Subscription status impact

## 📈 Key Findings

### Growth Trajectory
- **2021-2022:** 1,541.4% explosive growth
- **2022-2023:** 115.6% continued acceleration
- **2023-2024:** 77.53% strong growth
- **2024:** 15.14% maturation phase
- **2025 (YTD Aug):** -12.33% decline (requires intervention)

### Market Performance
| Country | Lifetime Revenue | Market Position |
|---------|-----------------|-----------------|
| Germany | $368,250 | Leader (2021-2023) |
| UK | $353,310 | Consistent performer |
| Pakistan | $343,160 | #2 in 2024 |
| India | $336,790 | Growing market |
| USA | $328,660 | Leader in 2024 |
| Canada | $321,520 | Stable market |

**Total Revenue:** $2.05M across all markets

### Category Analysis
| Category | Revenue | Cancellations | Status |
|----------|---------|---------------|--------|
| Clothing | $439,800 | 1,058 | ⚠️ Rising cancellations |
| Electronics | $411,630 | 1,059 | ⚠️ Rising cancellations |
| Beauty | $405,850 | 894 | ✅ Stable |
| Sports | $402,320 | 946 | ✅ Stable |
| Home | $392,090 | 926 | ✅ Stable |

### Critical Issues Identified
- **Cancellation Crisis:** Clothing & Electronics experiencing surge in cancellations
  - Germany: Clothing cancellations increased 72% (47→81) from 2023 to 2024
  - Germany: Electronics cancellations increased 24% (49→61) from 2023 to 2024
  - Pattern observed across ALL countries
- **Subscription Impact:** $5.17M in cancelled subscription revenue
- **Customer Distribution:** 60.2% active, 24.7% cancelled, 15.15% paused

## 🛠️ Technologies Used

- **Database:** MySQL
- **Visualization:** Power BI
- **Data Processing:** SQL queries for data extraction and transformation
- **Analysis:** Statistical analysis and trend identification

## 📊 Dashboard Features

### Main Dashboard
- Overall performance metrics (Growth Rate, Revenue, Items Sold)
- YTD and MTD trend analysis
- Subscription status distribution
- Country-wise revenue breakdown
- Order cancellations by category

### Product Analysis
- Top 5 and Bottom 5 products by sales
- Category performance comparison
- Gender-wise purchase patterns
- Geographic sales distribution

### Detailed Analytics
- Year-wise growth analysis
- Gender contribution metrics
- Active customer numbers by gender
- Revenue by subscription status
- Country-wise cancellation patterns
- Age segmentation
- Purchase frequency trends

## 🔍 Key Insights

1. **Market Leadership Shift:** USA overtook Germany as the leading market in 2024, with Pakistan emerging as #2
2. **Gender Balance:** Nearly equal distribution (51.17% female vs 45.42% male)
3. **Subscription Dominance:** Active subscribers represent 60.2% of customer base
4. **Systemic Quality Issues:** Simultaneous cancellation increases across all markets in top revenue categories
5. **Growth Inflection:** Transitioned from hypergrowth to decline within 4 years

## 📁 Project Structure

```
ecommerce-analysis/
├── data/
│   └── ecommerce_data.sql
├── queries/
│   ├── growth_analysis.sql
│   ├── cancellation_analysis.sql
│   ├── geographic_performance.sql
│   └── category_metrics.sql
├── visualizations/
│   └── ecommerce_dashboard.pbix
├── documentation/
│   └── analysis_report.pdf
└── README.md
```

## 🚀 Getting Started

### Prerequisites
- MySQL 8.0 or higher
- Power BI Desktop
- Basic understanding of SQL and data analysis

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/ecommerce-analysis.git
cd ecommerce-analysis
```

2. Import the database
```bash
mysql -u your_username -p < data/ecommerce_data.sql
```

3. Open the Power BI dashboard
```bash
# Open the .pbix file in Power BI Desktop
visualizations/ecommerce_dashboard.pbix
```

## 📝 SQL Queries Examples

### Year-wise Growth Analysis
```sql
SELECT 
    YEAR(order_date) as year,
    SUM(revenue) as total_revenue,
    COUNT(DISTINCT customer_id) as customers,
    ((SUM(revenue) - LAG(SUM(revenue)) OVER (ORDER BY YEAR(order_date))) 
     / LAG(SUM(revenue)) OVER (ORDER BY YEAR(order_date)) * 100) as growth_rate
FROM orders
GROUP BY YEAR(order_date)
ORDER BY year;
```

### Category-wise Cancellation Trends
```sql
SELECT 
    country,
    category,
    YEAR(order_date) as year,
    COUNT(*) as cancelled_orders
FROM orders
WHERE order_status = 'Cancelled'
GROUP BY country, category, YEAR(order_date)
ORDER BY country, year, cancelled_orders DESC;
```

## 🎓 Learning Outcomes

- Advanced SQL query optimization
- Multi-dimensional data analysis
- Interactive dashboard design in Power BI
- Business intelligence and KPI tracking
- Data-driven decision making
- Trend analysis and forecasting
