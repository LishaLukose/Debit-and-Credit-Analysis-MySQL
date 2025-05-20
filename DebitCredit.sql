create database DebitCredit;
use DebitCredit;
rename table `debit and credit` to debit_credit;
alter table debit_credit rename column ï»¿CustomerID to CustomerID;
select * from debit_credit;



-- SQL QUERIES

#KPI-1 Total Credit Amount:
select concat('$ ', round(sum(Amount) / 1000000, 2), ' M') as Credit_Amount
from debit_credit where TransactionType = 'Credit'
group by TransactionType;

#KPI-2 Total Debit Amount:
select concat('$ ', round(sum(Amount) / 1000000, 1), ' M') as Debit_Amount
from debit_credit where TransactionType = 'Debit'
group by TransactionType;

#KPI-3 Credit to Debit Ratio:
select round(sum(case when TransactionType = 'Credit' then Amount else 0 end) * 1.0 /
nullif(sum(case when TransactionType = 'Debit' then Amount else 0 end), 0),5) 
as Credit_to_Debit_Ratio from debit_credit;
  
#KPI-4 Net Transaction Amount:
select concat('$ ', round((
sum(case when TransactionType = 'Credit' then Amount else 0 end) -
sum(case when TransactionType = 'Debit' then Amount else 0 end)
) / 1000, 2), 'K') as Net_Transaction_Amount
from debit_credit;


#KPI-5 Account Activity Ratio:
select round(sum(Transactions) /sum(Balance), 5) as AccountActivityRatio
from debit_credit;

#KPI-6 Transactions per Month:
select Month,
sum(Transactions) as TransactionsPerMonth
from Debit_credit
group by Month, MonthNo
order by MonthNo;

#KPI-7 Total Transaction Amount by Branch
select Branch,
concat('$ ', round(sum(Amount) / 1000000, 2), ' M') as TotalTransactionAmount
from Debit_credit
group by Branch
order by sum(Amount) desc;

#KPI-8 Transaction Volume by Bank
select BankName,
concat('$ ', round(sum(Amount) / 1000000, 2), ' M') as TotalTransactionAmount
from Debit_credit
group by BankName order by sum(Amount) desc;

#KPI-9 Transaction Method Distribution:
select TransactionMethod, count(Transactions) as Trancation_Distribution, 
concat(round(100.0 * count(*) / sum(count(*)) over (), 2)," %") as Transaction_Percentage_Distribution 
from debit_credit group by TransactionMethod;

#KPI-10 Branch Transaction Growth:
with MonthlyTotals as (
select branch, date_format(TransactionDate, '%Y-%m-01') as month, SUM(Amount) as total_amount
from debit_credit group by branch, date_format(TransactionDate, '%Y-%m-01')
),
MonthOverMonthGrowth as (
select curr.branch, curr.month,
round((curr.total_amount - prev.total_amount) * 100.0 / nullif(prev.total_amount, 0),2
) as growth_percentage
from MonthlyTotals curr left join MonthlyTotals prev on curr.branch = prev.branch
and str_to_date(prev.month, '%Y-%m-%d') = date_sub(str_to_date(curr.month, '%Y-%m-%d'), interval 1 month)
)
select
month(str_to_date(month, '%Y-%m-%d')) as `Month Number`,
concat(round(max(case when branch = 'City Center Branch' then growth_percentage end), 2), ' %') as `City Center Branch`,
concat(round(max(case when branch = 'Downtown Branch' then growth_percentage end), 2), ' %') as `Downtown Branch`,
concat(round(max(case when branch = 'East Branch' then growth_percentage end), 2), ' %') as `East Branch`,
concat(round(max(case when branch = 'Main Branch' then growth_percentage end), 2), ' %') as `Main Branch`,
concat(round(max(case when branch = 'North Branch' then growth_percentage end), 2), ' %') as `North Branch`,
concat(round(max(case when branch = 'Suburban Branch' then growth_percentage end), 2), ' %') as `Suburban Branch`
from MonthOverMonthGrowth
group by `Month Number`
order by `Month Number`;

#KP-11 High-Risk Transaction Flag:
select RiskFlag, count(Transactions) as Transactions from debit_credit group by RiskFlag;

#KP-12 Suspicious Transaction Frequency
select Month,
sum(case when RiskFlag='High Risk' then 1 else 0 end) as `High Risk Count`
from debit_credit
group by MonthNo,Month order by MonthNo asc;







