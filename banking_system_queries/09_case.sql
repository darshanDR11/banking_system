-- 431. Classify accounts as 'Low', 'Medium', or 'High' based on balance thresholds (e.g., <10k, 10k–100k, >100k).
select account_id, balance, case when balance < 10000 then "Low" when balance < 100000 then "Medium" else "High" end as balance_type from accounts;

-- 432. Label transactions as 'Small', 'Medium', or 'Large' based on amount.
select transaction_id, amount, case when amount < 10000 then "Small" when amount < 20000 then "Medium" else "Large" end as trasaction_type from transactions;

-- 433. Classify loans as 'Low Risk' or 'High Risk' based on interest rate.
select loan_id, customer_id, loan_amount, interest_rate, case when interest_rate < 7.00 then "Low Risk" else "High Risk" end as loan_risk from loans;
 
-- 434. Categorize employees into 'Low', 'Average', or 'High' salary groups.
select employee_id, first_name, last_name, salary, case when salary < 20000 then "Low Salary" when salary < 50000 then "Average Salary" else "High Salary" end as salary_type from employees;
 
-- 435. Label cards as 'Valid' or 'Expired' based on expiry_date.
select card_id, card_number, account_id, issue_date, expiry_date, case when expiry_date <= curdate() then "Expired" else "Valid" end as status from cards;

-- 436. Classify customers as 'New' or 'Old' based on created_at date.
select customer_id, first_name, last_name, case when created_at < curdate()  then "Old" else "New" end as old_new_customer from customers;

-- 437. Categorize accounts as 'Active' vs 'Inactive' using status.
select account_id, customer_id, case when status = "Active" then "Active" else "Inactive" end as status from accounts;

-- 438. Label loans as 'Open' vs 'Closed' using status.
select loan_id, customer_id, loan_amount, case when status = "Closed" then "Closed" else "Open" end as status from loans;

-- 439. Classify transactions as 'Success' vs 'Issue' (Failed/Pending).
select 
    transaction_id, 
    source_account_id, 
    destination_account_id, 
    amount, 
    case when status = "Success" then "Success" else "Issue" end as status 
from transactions;

-- 440. Categorize payment methods into 'Digital' (UPI, Card, NetBanking) and 'Offline' (Cash).
select
    transaction_id, 
    source_account_id, 
    destination_account_id, 
    amount, 
    case when channel in ("UPI","Card","NetBanking") then "Digital" else "Offline" end as channel
from transactions;
 
-- 441. Display account_number with a label 'Zero Balance' or 'Has Balance'.
select 
    account_number, 
    case when balance = 0 then "Zero Balance" else "Has Balance" end as balance
from accounts;

-- 442. Show transactions with label 'High Value' if amount > 10,000.
select 
    transaction_id, 
    case when amount > 10000 then "High Value" else null end as value 
from transactions where amount > 10000;
 
-- 443. Classify employees as 'Junior' or 'Senior' based on hire_date.

-- 444. Label customers as 'Premium' if they have any account > 200,000.
select 
    distinct c.customer_id, 
    case when balance > 200000 then "Premium" else null end as type 
from accounts as a, customers as c
where a.customer_id = c.customer_id and balance > 200000
order by c.customer_id;

-- 445. Categorize loans as 'Small', 'Medium', 'Large' based on loan_amount.
select 
    loan_id,
    loan_amount, 
    case when loan_amount < 200000 then "Small" when loan_amount < 500000 then "Medium" else "Large" end as loan_type
from loans;

-- 446. Count how many accounts fall into each balance category using CASE.
select 
    type, 
    count(account_id) as total_accounts 
from (select 
          account_id, 
          case when balance < 10000 then "Low Balance" when balance < 100000 then "Medium Balance" else "High Balance" end as type 
      from accounts) as ans
group by type
order by total_accounts;

-- 447. Count transactions by 'Small/Medium/Large' categories.
select 
    transaction_type, 
    count(transaction_id) as total_transaction
from (select 
          transaction_id, 
          case when amount < 5000 then "Small" when amount < 15000 then "Medium" else "Large" end as transaction_type 
      from transactions) as ans
group by transaction_type
order by transaction_type;

-- 448. Count employees by salary category.
select 
  salary_type, 
  count(employee_id) as total_employee 
from (	select 
		    employee_id, 
		    case when salary < 40000 then "Low Salary" when salary < 70000 then "Medium Salary" else "High Salary" end as salary_type 
	    from employees) as ans
group by salary_type
order by salary_type; 

-- 449. Count loans by risk category (based on interest rate).
select 
	loan_risk, 
	count(loan_id) 
from (	select 
		    loan_id, 
        	case when interest_rate < 7.00 then "Low Risk" else "High Risk" end as loan_risk 
	    from loans) as ans
group by loan_risk 
order by loan_risk desc;
 
-- 450. Count customers by 'New vs Old'.
select 
	old_new_customer, 
	count(customer_id) as total_customer
from (	select 
			customer_id, 
        	case when created_at < curdate()  then "Old" else "New" end as old_new_customer 
	    from customers) as ans
group by old_new_customer
order by old_new_customer;

-- 451. Find total balance grouped by balance category.
select 
	type, 
    round(sum(balance),2) as total_balance 
from (	select 
			account_id, 
	        balance,
		    case when balance < 20000 then "Low Balance" when balance < 200000 then "Medium Balance" else "High Balance" end as type 
		from accounts) as ans
group by type
order by total_balance;

-- 452. Find total transaction amount grouped by transaction size category.
select 
	transaction_type, 
    round(sum(amount),2) as total_amount
from (select 
      	transaction_id, 
      	amount,
      	case when amount < 5000 then "Small" when amount < 15000 then "Medium" else "Large" end as transaction_type 
      from transactions) as ans
group by transaction_type
order by transaction_type;
 
-- 453. Find average salary per salary category.
select 
	salary_type, 
	round(avg(salary),2) as average_salary
from (select 
      		employee_id, 
          salary,
      		case when salary < 40000 then "Low Salary" when salary < 70000 then "Medium Salary" else "High Salary" end as salary_type 
    	from employees) as ans
group by salary_type
order by salary_type; 

-- 454. Find total loan amount per loan category.
select 
	  loan_type, 
    round(sum(loan_amount),2) as total_loan_amount
from (select 
      		loan_id,
      		loan_amount, 
      		case when loan_amount < 300000 then "Small" when loan_amount < 600000 then "Medium" else "Large" end as loan_type
      from loans) as ans
 group by loan_type
 order by loan_type;

-- 455. Find total payment amount per payment category.
select 
	  payment_category,
    round(sum(payment_amount),2) as total_amount
from (select 
      		loan_id, 
      		payment_amount, 
      		case when payment_amount < 10000 then "Small amount" when payment_amount < 30000 then "Medium amount" else "Large amount" end as payment_category
      from loan_payments) as ans
group by payment_category
order by payment_category;

-- 456. Show each account with a flag 'High Balance' if above average balance.
select 
	account_id, 
    balance, 
    case when balance > (select avg(balance) from accounts) then 1 else 0 end as High_Balance 
from accounts;

-- 457. Show each employee with a flag 'Above Avg Salary' or 'Below Avg Salary'.
select  
	employee_id, 
    first_name, 
    last_name, 
    salary, 
    case when salary > (select avg(salary) from employees) then 1 else 0 end as "1_Above_avg_salary 0_Below_avg_salary"
from employees;
 
-- 458. Show each transaction with a flag 'Above Avg Transaction'.
select 
	  transaction_id, 
	  amount,
    case when amount > (select avg(amount) from transactions) then 1 else 0 end as "1_Above Avg Transaction"
from transactions;
 
-- 459. Show each loan with 'Above Avg Loan' flag.
select 
	loan_id, 
    loan_amount,
    case when loan_amount > (select avg(loan_amount) from loans) then 1 else 0 end as "Above Avg Loan"
from loans;
 
-- 460. Show each payment with 'Above Avg Payment'.
select 
	payment_id, 
    payment_amount,
    case when payment_amount > (select avg(payment_amount) from loan_payments) then 1 else 0 end as "Above Avg Payment"
from loan_payments;
 
-- 461. Classify branches as 'High Deposit' or 'Low Deposit' based on total balance.
select 
	 branch_id, 
    sum(balance) as total_balance, 
    case when sum(balance) > 80000000 then "High Deposit" else "Low Deposit" end as deposit_type
from accounts 
group by branch_id 
order by branch_id;

-- 462. Label customers as 'Multi-Account' or 'Single Account'.
select 
	customer_id,
    count(account_id) as total_account,
	case when count(account_id) > 1 then "Multi_account" else "Single_account" end as account_count 
from accounts 
group by customer_id;

-- 463. Classify accounts as 'Recently Opened' vs 'Old' and add the column in the accounts table.
alter table accounts
add open_type varchar(200);

update accounts
set open_type = case when open_date < "2026-01-01" then "Old" else "Recently Opened" end where 1 = 1;

select * from accounts;

-- 464. Label cards as 'Active Usage' vs 'Inactive' based on status.
select 
	card_id, 
    card_number, 
    card_type, 
	case when status = "Active" then "Active Usage" else "Inactive" end as status 
from cards;
 
-- 465. Classify loans as 'Long Term' vs 'Short Term' based on start_date.
 
-- 466. Categorize transactions by channel into 'Online' vs 'Offline'.
select 
  	transaction_id, 
  	source_account_id, 
    destination_account_id, 
    amount,
    channel,
    case when channel in ("UPI","Card","Mobile") then "Online" else "Offline" end as channel
from transactions;
 
-- 467. Label accounts as 'High Activity' if they have more than 30 transactions.
select 
  	account_id, 
    count(transaction_id) as total_transaction, 
	case when count(transaction_id) > 30 then "High Activity" else "Low Activity" end as activity 
from accounts as a, transactions as t 
where a.account_id = t.source_account_id or a.account_id = t.destination_account_id 
group by account_id;

-- 468. Classify customers as 'Loan Holder' vs 'Non-Loan Holder'.
select 
	distinct c.customer_id,
    case when loan_id is not null then "Loan Holder" else "Non-Loan Holder" end as have_loan_or_not
from customers as c 
left join loans as l on c.customer_id = l.customer_id;

-- 469. Label employees as 'Manager' vs 'Staff'.
select 
  	employee_id, 
  	first_name, 
    last_name, 
    case when manager_id is null then "Manager" else "Staff" end as position 
from employees;

-- 470. Classify branches as 'Large' vs 'Small' based on number of employees.
select 
	branch_id, 
    count(employee_id) as total_employee,
    case when count(employee_id) > 10 then "Large" else "Small" end as employee_size
from employees 
group by branch_id 
order by branch_id;
 
