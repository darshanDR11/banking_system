-- 231. Count how many customers live in each city.
select city, count(customer_id) as total_customers from customers group by city order by city;

-- 232. Count how many customers registered in each year based on created_at.
select created_at, count(customer_id) as total_customer from customers group by created_at order by created_at;

-- 233. Find the number of customers for each email domain (e.g., gmail, yahoo).
select substring_index(email, '@', -1) as domain, count(customer_id) as total_customer from customers group by domain order by domain;

-- 234. Count how many customers share the same last name.
select last_name, count(customer_id) as total_customer from customers group by last_name order by last_name;

-- 235. Find the number of customers grouped by city and last name.
select city, last_name, count(customer_id) as total_customer from customers group by city, last_name;

-- 236. Count the number of branches in each state.
select state, count(branch_id) as total_branch from branches group by state order by state;

-- 237. Count how many branches exist in each city.
select city, count(branch_id) as total_branch from branches group by city order by city;

-- 238. Find the number of employees working in each branch.
select branch_id, count(employee_id) as total_employees from employees group by branch_id order by branch_id;

-- 239. Calculate the average employee salary per branch.
select branch_id, round(avg(salary),2) as average_salary from employees group by branch_id order by branch_id;

-- 240. Find the highest salary in each branch.
select branch_id, max(salary) as highest_salary from employees group by branch_id order by branch_id;

-- 241. Find the lowest salary in each branch.
select branch_id, min(salary) as lowest_salary from employees group by branch_id order by branch_id;

-- 242. Count how many employees have each position.
select position, count(employee_id) as total_employees from employees group by position order by position;

-- 243. Calculate the average salary for each position.
select position, round(avg(salary),2) as average_salary from employees group by position order by position;

-- 244. Find the highest salary for each position.
select position, max(salary) as highest_salary from employees group by position order by position;

-- 245. Count employees hired each year.
select extract(year from hire_date) as hireyear, count(employee_id) as total_employees from employees group by hireyear order by hireyear;

-- 246. Count how many accounts exist for each account type.
select account_type, count(account_id) as total_employees from accounts group by account_type order by account_type;

-- 247. Count how many accounts exist for each status.
select status, count(account_id) as total_employees from accounts group by status order by status;

-- 248. Calculate the total balance for each account type.
select account_type, round(sum(balance),2) as total_balance from accounts group by account_type order by account_type;

-- 249. Calculate the average balance for each account type.
select account_type, round(avg(balance),2) as average_balance from accounts group by account_type order by account_type;

-- 250. Find the highest balance within each account type.
select account_type, max(balance) as highest_balance from accounts group by account_type order by account_type;

-- 251. Find the lowest balance within each account type.
select account_type, min(balance) as lowest_balance from accounts group by account_type order by account_type;

-- 252. Count the number of accounts opened each year.
select extract(year from open_date) as open_year, count(account_id) as total_accounts from accounts group by open_year order by open_year;

-- 253. Count the number of accounts opened in each branch.
select branch_id, count(account_id) as total_customer from accounts group by branch_id order by branch_id;

-- 254. Calculate the total balance held in each branch.
select branch_id, round(sum(balance),2) as total_balance from accounts group by branch_id order by branch_id;

-- 255. Calculate the average account balance per branch.
select branch_id, round(avg(balance),2) as average_balance from accounts group by branch_id order by branch_id;

-- 256. Count transactions by transaction type.
select transaction_type, count(transaction_id) as total_transaction from transactions group by transaction_type order by transaction_type;

-- 257. Count transactions by transaction channel.
select channel, count(transaction_id) as total_transaction from transactions group by channel order by channel;

-- 258. Count transactions by transaction status.
select status, count(transaction_id) as total_transaction from transactions group by status order by status;

-- 259. Calculate total transaction amount per channel.
select channel, round(sum(amount),2) as total_amount from transactions group by channel order by channel;

-- 260. Calculate average transaction amount per channel.
select channel, round(avg(amount),2) as average_amount from transactions group by channel order by channel;

-- 261. Find the highest transaction amount for each channel.
select channel, max(amount) as highest_amount from transactions group by channel order by channel;

-- 262. Find the lowest transaction amount for each channel.
select channel, min(amount) as lowest_amount from transactions group by channel order by channel;

-- 263. Count transactions per month based on transaction_date.
select extract(month from transaction_date) as tmonth, count(transaction_id) as total_transaction from transactions group by tmonth order by tmonth;

-- 264. Calculate total transaction value per month.
select extract(month from transaction_date) as tmonth, round(sum(amount),2) as total_transaction_amount from transactions group by tmonth order by tmonth;

-- 265. Count transactions by transaction type and channel.
select transaction_type, channel, count(transaction_id) as total_transaction from transactions group by transaction_type, channel order by transaction_type asc, channel asc;

-- 266. Count cards by card type.
select card_type, count(card_id) as total_card from cards group by card_type order by card_type;

-- 267. Count cards by card status.
select status, count(card_id) as total_card from cards group by status order by status;

-- 268. Count cards issued per year.
select  extract(year from issue_date) as issue_year, count(card_id) as total_card from cards group by issue_year order by issue_year;

-- 269. Find how many cards belong to each account.
select account_id, count(card_id) as total_card from cards group by account_id order by account_id;

-- 270. Count cards grouped by account and card type.
select account_id, card_type, count(card_id) as total_card from cards group by account_id, card_type order by account_id asc, card_type asc;
-- or easiest way to identify the accounts and total cards 
-- select account_id, count(case when card_type = "Debit" then 1 else null end) as Debit_card, count(case when card_type = "Credit" then 1 else null end) as Credit_card, count(card_id) as total_card from cards group by account_id, card_type order by account_id asc, card_type asc;

-- 271. Count loans by loan type.
select loan_type, count(loan_id) as total_loan from loans group by loan_type order by loan_type;

-- 272. Count loans by loan status.
select status, count(loan_id) as total_loan from loans group by status order by status;

-- 273. Calculate total loan amount per loan type.
select loan_type, round(sum(loan_amount),2) as total_loan_amount from loans group by loan_type order by loan_type;

-- 274. Calculate average loan amount per loan type.
select loan_type, round(avg(loan_amount),2) as average_loan_amount from loans group by loan_type order by loan_type;

-- 275. Find highest loan amount per loan type.
select loan_type, max(loan_amount) as highest_loan_amount from loans group by loan_type order by loan_type;

-- 276. Find lowest loan amount per loan type.
select loan_type, min(loan_amount) as lowest_loan_amount from loans group by loan_type order by loan_type;

-- 277. Count loans issued per branch.
select branch_id, count(loan_id) as total_loan from loans group by branch_id order by branch_id;

-- 278. Calculate total loan amount issued by each branch.
select branch_id, round(sum(loan_amount),2) as total_loan_amount from loans group by branch_id order by branch_id;

-- 279. Calculate average loan interest rate per branch.
select branch_id, round(avg(interest_rate),2) as average_interest from loans group by branch_id order by branch_id;

-- 280. Count loans issued each year.
select extract(year from start_date) as issue_year, count(loan_id) as total_loan from loans group by issue_year order by issue_year;

-- 281. Count loan payments per payment method.
select payment_method, count(payment_id) as total_payment from loan_payments group by payment_method order by payment_method;

-- 282. Calculate total payment amount per payment method.
select payment_method, round(sum(payment_amount),2) as total_payment_amount from loan_payments group by payment_method order by payment_method;

-- 283. Calculate average payment amount per payment method.
select payment_method, round(avg(payment_amount),2) as average_payment_amount from loan_payments group by payment_method order by payment_method;

-- 284. Find highest payment amount per payment method.
select payment_method, max(payment_amount) as highest_payment_amount from loan_payments group by payment_method order by payment_method;

-- 285. Count payments made per day.
select payment_method, min(payment_amount) as lowest_payment_amount from loan_payments group by payment_method order by payment_method;

-- 286. Calculate total payment amount per loan.
select loan_id, round(sum(payment_amount),2) as total_payment_amount from loan_payments group by loan_id order by loan_id;

-- 287. Find the average payment amount per loan.
select loan_id, round(avg(payment_amount),2) as average_payment_amount from loan_payments group by loan_id order by loan_id;

-- 288. Count how many payments were made for each loan.
select loan_id, count(payment_id) as total_payment from loan_payments group by loan_id order by loan_id;

-- 289. Find the highest payment recorded for each loan.
select loan_id, max(payment_amount) as highest_payment_amount from loan_payments group by loan_id order by loan_id;

-- 290. Find the lowest payment recorded for each loan.
select loan_id, min(payment_amount) as lowest_payment_amount from loan_payments group by loan_id order by loan_id;
