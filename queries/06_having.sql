-- 291.  Find city that have more than 10 customers.
select city, count(customer_id) as total_customer from customers group by city having total_customer > 10 order by city; 

-- 292.  Find cities that have fewer than 5 customers.
select city, count(customer_id) as total_customer from customers group by city having total_customer < 5 order by city; 

-- 293.  Find customer last names that appear more than once
select last_name, count(customer_id) as total_customer from customers group by last_name having total_customer > 1 order by last_name;

-- 294.  Find email domains used by more than 3300 customers
select substring_index(email, '@', -1) as domain, count(customer_id) as total_customer from customers group by domain having total_customer > 3300 order by domain;

-- 295.  Find cities where more than 15 customers registered
select city, count(customer_id) as total_customer from customers group by city having total_customer > 15 order by city; 

-- 296.  Find branches that have more than 10 employees
select branch_id, count(employee_id) as total_employee from employees group by branch_id having total_employee > 10 order by branch_id;

-- 297.  Find branches that have fewer than 7 employees
select branch_id, count(employee_id) as total_employee from employees group by branch_id having total_employee < 7 order by branch_id;

-- 298.  Find employee positions that have more than 10 employees
select position, count(employee_id) as total_employee from employees group by position having total_employee > 10 order by position;

-- 299.  Find positions where the average salary exceeds 60000
select position, round(avg(salary),2) as average_salary from employees group by position having average_salary > 60000 order by position;

-- 300.  Find branches where the average employee salary exceeds 65000
select branch_id, round(avg(salary),2) as average_salary from employees group by branch_id having average_salary > 65000 order by branch_id;

-- 301.  Find account types with more than 100 accounts
select account_type, count(account_id) as total_account from accounts group by account_type having total_account > 100 order by account_type;

-- 302.  Find account types where the total balance exceeds 1,000,000
select account_type, round(sum(balance),2) as total_account_balance from accounts group by account_type having total_account_balance > 1000000 order by account_type;

-- 303.  Find account types where the average balance exceeds 50,000
select account_type, round(avg(balance),2) as total_account_balance from accounts group by account_type having total_account_balance > 50000 order by account_type;

-- 304.  Find branches with more than 300 accounts opened
select branch_id, count(account_id) as total_account from accounts group by branch_id having total_account > 300 order by branch_id;

-- 305.  Find branches where the total account balance exceeds 70,000,000
select branch_id, round(sum(balance),2) as total_balance from accounts group by branch_id having total_balance > 70000000 order by branch_id;

-- 306.  Find branches where the average account balance exceeds 250,000
select branch_id, round(avg(balance),2) as average_balance from accounts group by branch_id having average_balance > 250000 order by branch_id;

-- 307.  Find years where more than 2500 accounts were opened
select extract(year from open_date) as open_year, count(account_id) as total_account from accounts group by open_year having total_account > 2500 order by open_year;

-- 308.  Find account types where the maximum balance exceeds 1,00,000
select account_type, max(balance) as maximum_balance from accounts group by account_type having maximum_balance > 100000 order by account_type;

-- 309.  Find account types where the minimum balance exceeds 1000
select account_type, min(balance) as minimum_balance from accounts where balance != 0 group by account_type having minimum_balance > 1000 order by account_type;

-- 310.  Find branches where the total number of accounts is less than 280
select branch_id, count(account_id) as total_account from accounts group by branch_id having total_account > 280 order by branch_id;

-- 311.  Find transaction channels used more than 50000 times
select channel, count(transaction_id) as total_transaction from transactions group by channel having total_transaction > 50000 order by channel;

-- 312.  Find transaction channels where the average transaction amount exceeds 10,000
select channel, round(avg(amount),2) as average_amount from transactions group by channel having average_amount > 10000 order by channel;

-- 313.  Find transaction types with more than 1,00,000 transactions
select transaction_type, count(transaction_id) as total_transaction from transactions group by transaction_type having total_transaction > 1000000 order by transaction_type;

-- 314.  Find days where more than 100 transactions occurred

-- 315.  Find days where total transaction value exceeded 1,000,000

-- 316.  Find card types issued more than 6000 times
select card_type, count(card_id) as total_card from cards group by card_type having total_card > 6000 order by card_type;

-- 317.  Find card statuses that appear more than 4000 times
select status, count(card_id) as total_card from cards group by status having total_card > 4000 order by status;

-- 318.  Find accounts that have more than 2 cards issued
select account_id, count(card_id) as total_card from cards group by account_id having total_card > 2 order by account_id;

-- 319.  Find years where more than 2000 cards were issued
select extract(year from issue_date) as issue_year, count(card_id) as total_card from cards	group by issue_year having total_card > 2000 order by issue_year;

-- 320.  Find card types where the earliest issue date is before 2020

-- 321. Find loan types issued more than 700 times.
select loan_type, count(loan_id) as total_loan from loans group by loan_type having total_loan > 700 order by loan_type;

-- 322. Find loan types where the average loan amount exceeds 1,000,000.
select loan_type, round(avg(loan_amount),2) as average_loan_amount from loans group by loan_type having average_loan_amount > 1000000 order by loan_type;

-- 323. Find branches that issued more than 80 loans.
select branch_id, count(loan_id) as total_loan from loans group by branch_id having total_loan > 80 order by branch_id;

-- 324. Find branches where the total loan amount exceeds 600,000,000.
select branch_id, round(sum(loan_amount),2) as total_loan_amount from loans group by branch_id having total_loan_amount > 60000000 order by branch_id;

-- 325. Find loan types where the highest loan amount exceeds 2,000,000.
select loan_type, max(loan_amount) as highest_loan_amount from loans group by loan_type having highest_loan_amount > 200000 order by loan_type;

-- 326. Find payment methods used more than 4000 times.
select payment_method, count(payment_id) as total_payment from loan_payments group by payment_method having total_payment > 4000 order by payment_method;

-- 327. Find payment methods where the average payment exceeds 20,000.
select payment_method, round(avg(payment_amount),2) as average_payment_amount from loan_payments group by payment_method having average_payment_amount > 4000 order by payment_method;

-- 328. Find loans that have received more than 10 payments.
select loan_id, count(payment_id) as total_payment from loan_payments group by loan_id having total_payment > 10 order by loan_id;

-- 329. Find loans where total payments exceed 200,000.
select loan_id, round(sum(payment_amount),2) as total_payment_amount from loan_payments group by loan_id having total_payment_amount > 200000 order by loan_id;

-- 330. Find loans where the maximum payment exceeds 45,000.
select loan_id, max(payment_amount) as maximum_payment_amount from loan_payments group by loan_id having maximum_payment_amount > 45000 order by loan_id;

