-- 181. Count the total number of customers in the bank.
select count(customer_id) as total_customer from customers;

-- 182. Count the total number of branches.
select count(branch_id) as total_branch from branches;

-- 183. Count the total number of employees.
select count(employee_id) as total_employee from employees;

-- 184. Count the total number of accounts.
select count(account_id) as total_account from accounts;

-- 185. Count the total number of transactions recorded.
select count(transaction_id) as total_transaction from transactions;

-- 186. Count the total number of cards issued.
select count(card_id) as total_card from cards;

-- 187. Count the total number of loans issued.
select count(loan_id) as total_issued_loan from loans;

-- 188. Count the total number of loan payments made.
select count(payment_id) as total_loan_payment from loan_payments;

-- 189. Count how many accounts have status Active.
select count(account_id) as total_active_account from accounts where status = "Active";

-- 190. Count how many accounts have status Closed.
select count(account_id) as total_active_account from accounts where status = "Closed";

-- 191. Count how many cards are currently Active.
select count(card_id) as total_active_card from cards where status = "Active";

-- 192. Count how many cards are Blocked.
select count(card_id) as total_active_card from cards where status = "Blocked";

-- 193. Count how many cards are Expired.
select count(card_id) as total_active_card from cards where status = "Expired";

-- 194. Count how many loans are Active.
select count(loan_id) as total_active_loans from loans where status = "Active";

-- 195. Count how many loans are Closed.
select count(loan_id) as total_closed_loan from loans where status = "Closed";

-- 196. Count how many loans are Defaulted.
select count(loan_id) as total_closed_loan from loans where status = "Defaulted";

-- or select count(case when status = "Active" then 1 else null end) as total_active, count(case when status = "Closed" then 1 else null end) as total_closed, count(case when status = "Defaulted" then 1 else null end) as total_defaulted from loans;

-- 197. Count how many transactions have status Success.
select count(transaction_id) as total_success from transactions where status = "Success";

-- 198. Count how many transactions have status Failed.
select count(transaction_id) as total_success from transactions where status = "Failed";

-- 199. Count how many transactions have status Pending.
select count(transaction_id) as total_success from transactions where status = "Pending";


-- 200. Count how many transactions were performed using UPI.
select count(transaction_id) as total_upi from transactions where channel = "UPI";

-- 201. Count how many transactions were performed using ATM.
select count(transaction_id) as total_atm from transactions where channel = "ATM";

-- 202. Count how many transactions were performed using Mobile.
select count(transaction_id) as total_mobile from transactions where channel = "Mobile";

-- 203. Count how many transactions were performed using NetBanking.
select count(transaction_id) as total_netbanking from transactions where channel = "NetBanking";

-- 204. Count how many debit cards exist in the system.
select count(card_id) as total_debit_card from cards where card_type = "Debit";

-- 205. Count how many credit cards exist in the system.
select count(card_id) as total_debit_card from cards where card_type = "Credit";

-- 206. Calculate the total balance of all accounts in the bank.
select round(sum(balance),2) as total_balance from accounts;

-- 207. Calculate the total amount transferred in all transactions.
select round(sum(amount),2) as total_amount from transactions;

-- 208. Calculate the total loan amount issued by the bank.
select round(sum(loan_amount),2) as total_loan_amount from loans;

-- 209. Calculate the total salary paid to all employees.
select round(sum(salary),2) as total_salary from employees;

-- 210. Calculate the total loan payment amount collected.
select round(sum(payment_amount),2) as total_collected_amount from loan_payments;

-- 211. Find the average account balance.
select round(avg(balance),4) as average_balance from accounts;

-- 212. Find the average employee salary.
select round(avg(salary),2) as average_salary from employees;

-- 213. Find the average loan amount issued.
select round(avg(loan_amount),2) as average_amount from loans;

-- 214. Find the average transaction amount.
select round(avg(amount),2) as average_amount from transactions;

-- 215. Find the average loan payment amount.
select round(avg(payment_amount),2) as average_amount from loan_payments;

-- 216. Find the highest account balance.
select max(balance) as highest_account_balance from accounts;

-- 217. Find the highest employee salary.
select max(salary) as highest_salary from employees;

-- 218. Find the highest transaction amount.
select max(amount) as highest_amount from transactions;

-- 219. Find the highest loan amount issued.
select max(loan_amount) as highest_loan_amount from loans;

-- 220. Find the highest loan payment made.
select max(payment_amount) as highest_payment_loan_amount from loan_payments;

-- 221. Find the lowest account balance.
select min(balance) as lowest_account_balance from accounts;

-- 222. Find the lowest employee salary.
select min(salary) as lowest_salary from employees;

-- 223. Find the smallest transaction amount.
select min(amount) as smallest_amount from transactions;

-- 224. Find the smallest loan amount issued.
select min(loan_amount) as smallest_loan_amount from loans;

-- 225. Find the smallest loan payment amount.
select min(payment_amount) as smallest_payment_loan_amount from loan_payments;

-- 226. Find the earliest account opening date.
select min(open_date) as earliest_date from accounts;

-- 227. Find the most recent account opening date.
select max(open_date) as recent_date from accounts;

-- 228. Find the earliest employee hire date.
select min(hire_date) as earliest_date from employees;

-- 229. Find the latest transaction date recorded.
select max(transaction_date) as latest_transaction_date from transactions;

-- 230. Find the earliest loan start date.
select min(start_date) as earliest_start_date from loans;

