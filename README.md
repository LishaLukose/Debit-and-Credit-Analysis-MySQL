# Debit-and-Credit-Analysis-MySQL

This project provides a comprehensive bank transaction analytics dashboard using SQL to extract and analyze transactional data involving credit, debit, and risk-related activity across branches and banks.

## Project Objective

To build data-driven KPIs and insights for a banking institution by using SQL queries on debit and credit transaction data. The goal is to help stakeholders monitor branch performance, 
identify high-risk transactions, and track overall account activity patterns.

## Dataset

- `Debit and Credit.csv`

## Tools & Technologies

- **Database:** MySQL 8.x
- **Client:** MySQL Workbench 
- **Language:** SQL

## Key Features
 
- Total Credit Amount: Total of all credit transactions
- Total Debit Amount: Total of all debit transactions
- Credit to Debit Ratio: Ratio of total credit amount to total debit amount
- Net Transaction Amount: Net difference between total credit and debit
- Account Activity Ratio: Ratio of total transactions to total account balance
- Transactions per Month: Monthly transaction volume trend
- Total Transaction Amount by Branch: Aggregated transaction values by each branch
- Transaction Volume by Bank: Total transaction volume processed by different banks
- Transaction Method Distribution: Split of transactions across credit card, debit card, and bank transfers
- Branch Transaction Growth: Month-over-month transaction growth % by branch using CTE
- High-Risk Transaction Flag: Classification of transactions into "High Risk" and "Normal"
- Suspicious Transaction Frequency: Monthly count of high-risk (suspicious) transactions

## Key Takeaways

- Balanced Credit and Debit Activity
      - Total credit: $127.6M, total debit: $127.3M → indicating almost balanced transactional behavior.
- Credit to Debit Ratio is ~1.0025, suggesting marginally more credits than debits.
- Healthy Account Engagement
      - Account Activity Ratio is 0.00019, reflecting steady transaction activity relative to balances.
- Net Positive Transactions
      - Net transaction amount is $318K, indicating a small surplus of credit over debit—positive flow.
- High-Risk Transaction Flag
      - About 20% of all transactions are flagged as high-risk, a significant portion warranting further scrutiny.
- Suspicious Activity Trends
      - Peak in suspicious transactions occurs in January (1973), with a consistent decrease toward December (61), suggesting improvement or seasonality.
- Branch Performance
      - City Center, Main, and East Branches contribute the highest transaction values (all > $42M).
      - North Branch lags behind with the lowest total (~$41.68M).
- Bank-Level Transaction Volume
      - Punjab National Bank and ICICI Bank lead in transaction volume, each over $42M+.
      - Axis Bank shows the lowest among peers at $42.71M.
- Even Distribution of Payment Methods
      - Bank Transfer, Credit Card, and Debit Card are used almost equally (~33.3% each).
- Transaction Growth by Month
      - Spikes in growth are observed in March (+8.86%), May (+7.86%), and August (+14.2%), indicating cyclical or seasonal peaks.
      - Months like June and October show negative growth, hinting at downturns.
- Stable Monthly Transactions
      - Monthly transaction volume remains consistent (~9200–9400), with a notable drop in December (305), likely due to incomplete data or seasonality.
