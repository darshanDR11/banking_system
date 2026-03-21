-- 481. Create a CTE to calculate total balance per customer, then display customers with total balance > 500,000.
with ans as (
    select customer_id, sum(balance) as total_balance
    from accounts 
    group by customer_id
    order by customer_id
)
select * from ans where total_balance > 500000;


-- 482. Create a CTE for average account balance, then find accounts above average.
with ans as (
    select avg(balance) as average_account_balance 
    from accounts
)
select * from accounts where balance > (select average_account_balance from ans);


-- 483. Use a CTE to compute total transactions per account, then display accounts with more than 40 transactions.
with ans as (
    select account_id, count(transaction_id) as total_transaction
    from accounts as a
    join transactions as t on a.account_id = t.source_account_id or a.account_id = t.destination_account_id
    group by account_id
    order by account_id
)
select * from ans where total_transaction > 40;


-- 484. Create a CTE for total loan amount per customer, then find customers with loans above average.
with ans as (
    select customer_id, sum(loan_amount) as total_loan_amount
    from loans 
    group by customer_id
    order by customer_id
)
select * from ans where total_loan_amount > (select avg(total_loan_amount) from ans);


-- 485. Use a CTE to calculate total salary per branch, then show branches with salary expense > 500,000.
with ans as (
    select branch_id, sum(salary) as total_salary
    from employees 
    group by branch_id
    order by branch_id
)
select * from ans where total_salary > 500000;


-- 486. Create a CTE to count employees per branch, then find branches with more than 10 employees.
with ans as (
    select branch_id, count(employee_id) as total_employee
    from employees 
    group by branch_id
    order by branch_id
)
select * from ans where total_employee > 10;


-- 487. Use a CTE to compute average salary per branch, then find branches above the overall average.
with ans as (
    select branch_id, round(avg(salary),2) as average_salary
    from employees 
    group by branch_id
    order by branch_id
)
select * from ans where average_salary > (select avg(average_salary) from ans);


-- 488. Create a CTE for total transaction amount per day, then find days with highest activity.
with ans as (
    select date(transaction_date) as "Day", count(transaction_id) as total_transaction
    from transactions
    group by Day
    order by Day
)
select * from ans where total_transaction = (select max(total_transaction) from ans);


-- 489. Use a CTE to calculate total payment per loan, then find loans fully repaid (payments >= loan amount).
with ans as (
    select loan_id, sum(payment_amount) as total_amount
    from loan_payments 
    group by loan_id
    order by loan_id
)
select l.loan_id, customer_id, branch_id, loan_type
from ans as a 
join loans as l on a.loan_id = l.loan_id
where a.total_amount >= l.loan_amount;


-- 490. Create a CTE for total accounts per customer, then find customers with multiple accounts.
with ans as (
    select customer_id, count(account_id) as total_account
    from accounts
    group by customer_id 
    order by customer_id
)
select * from ans where total_account > 1;


-- 491. Create a CTE for total cards per account, then find accounts with more than 2 cards.
with ans as (
	select account_id, count(card_id) as total_card
    from cards
    group by account_id
    order by account_id
)
select * from ans where total_card > 2;


-- 492. Use a CTE to compute total deposits per branch, then rank branches by deposits.
with ans as(
	select branch_id, round(sum(balance),0) as total_deposit
    from accounts
    group by branch_id
    order by branch_id
)
select branch_id, total_deposit, rank() over(order by total_deposit desc) as rank_total_deposit from ans order by rank_total_deposit;


-- 493. Create a CTE for average transaction amount per channel, then compare channels.
with ans as (
	select channel, round(avg(amount),2) as average_amount 
    from transactions 
    group by channel 
    order by channel
)
select * from ans;


-- 494. Use a CTE to compute total loan amount per branch, then find top 5 branches.
with ans as (
  	select branch_id, round(sum(loan_amount),2) as total_loan_amount 
    from loans 
    group by branch_id 
    order by total_loan_amount desc
)
select * from ans limit 5;


-- 495. Create a CTE for total transactions per customer, then find most active customers.
with ans as (
    select a.customer_id, count(transaction_id) as total_transaction 
    from transactions as t
    join accounts as a on t.source_account_id = a.account_id or t.destination_account_id = a.account_id
    group by a.customer_id
    order by a.customer_id
)
select * from ans where total_transaction = (select max(total_transaction) from ans);


-- 496. Create a CTE for accounts opened per year, then find year with maximum growth.
with ans as (
    select extract(year from open_date) as opened_year, count(account_id) as total_account 
    from accounts 
    group by opened_year
    order by total_account desc
)
select * from ans where total_account = (select max(total_account) from ans);


-- 497. Use a CTE to compute loan count per customer, then find customers with multiple loans.
with ans as (
    select customer_id, count(loan_id) as total_loan
    from loans 
    group by customer_id 
    order by customer_id
)
select * from ans where total_loan > 1;


-- 498. Create a CTE for total payments per customer, then compare customers.
with ans as (
    select l.customer_id, sum(payment_amount) as total_amount 
    from loans as l 
    join loan_payments as lp on l.loan_id = lp.loan_id 
    group by l.customer_id 
    order by l.customer_id
)
select * from ans where total_amount = (select max(total_amount) from ans);


-- 499. Use a CTE to compute average balance per account type, then find highest category.
with ans as (
    select account_type, round(avg(balance),2) as average_balance 
    from accounts 
    group by account_type 
    order by account_type
)
select * from ans where average_balance = (select max(average_balance) from ans);


-- 500. Create a CTE for failed transactions per account, then find accounts with most failures.
with ans as (
    select a.account_id, count(transaction_id) as total_failed_transaction 
    from accounts as a, transactions as t 
    where t.status = "Failed" and (a.account_id = t.source_account_id or a.account_id = t.destination_account_id)
    group by a.account_id
    order by a.account_id
)
select * from ans where total_failed_transaction = (select max(total_failed_transaction) from ans);
