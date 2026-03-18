-- 331. Display customers along with their account numbers.
select  c.customer_id, first_name, last_name, account_id, account_number  
from customers as c 
join accounts as a on c.customer_id = a.customer_id
order by c.customer_id asc, account_id asc;

-- 332. Show customers with their account balances.
select  c.customer_id, first_name, last_name, account_id, balance 
from customers as c 
join accounts as a on c.customer_id = a.customer_id
order by c.customer_id asc, account_id asc;

-- 333. Display customers with their account types.
select  c.customer_id, first_name, last_name, account_id, account_type 
from customers as c 
join accounts as a on c.customer_id = a.customer_id
order by c.customer_id asc, account_id asc;

-- 334. Show customers and the branch where their account was opened.
select  c.customer_id, first_name, last_name, account_id, a.branch_id , branch_name 
from customers as c 
join accounts as a on c.customer_id = a.customer_id
join branches as b on a.branch_id = b.branch_id
order by c.customer_id asc, account_id asc;

-- 335. Display customers and the open date of their accounts.
select  c.customer_id, first_name, last_name, account_id, open_date 
from customers as c 
join accounts as a on c.customer_id = a.customer_id
order by c.customer_id asc, open_date asc;

-- 336. List accounts with the name of the customer who owns them.
select account_id, c.customer_id, first_name, last_name
from accounts as a 
join customers as c on a.customer_id = c.customer_id
order by account_id;

-- 337. Show accounts with the city of the customer.
select account_id, c.customer_id, city
from accounts as a 
join customers as c on a.customer_id = c.customer_id
order by account_id;

-- 338. Display accounts with the branch name where they were opened.
select account_id, b.branch_id, branch_name
from accounts as a 
join branches as b on a.branch_id = b.branch_id
order by account_id;

-- 339. Show accounts with both branch name and branch city.
select account_id, b.branch_id, branch_name, city
from accounts as a 
join branches as b on a.branch_id = b.branch_id
order by account_id;

-- 340. Display accounts with the customer email.
select account_id, c.customer_id, first_name, last_name, email
from accounts as a 
join customers as c on a.customer_id = c.customer_id
order by account_id;

-- 341. Show employees along with the branch they work in.
select e.employee_id, first_name, last_name, position, salary, e.branch_id
from employees as e 
join branches as b on e.branch_id = b.branch_id 
order by e.employee_id;

-- 342. Display employees with branch name and state.
select e.employee_id, first_name, last_name, position, salary, e.branch_id, branch_name, state
from employees as e 
join branches as b on e.branch_id = b.branch_id 
order by e.employee_id;

-- 343. List employees along with their manager’s name.
select e1.employee_id, e1.first_name, e1.last_name, e1.manager_id, e2.first_name as manager_name 
from employees as e1
join employees as e2 on e1.manager_id = e2.employee_id 
where e1.manager_id is not null 
order by e1.employee_id;

-- 344. Show employees and their manager’s position.
select e1.employee_id, e1.first_name, e1.last_name, e1.manager_id, e2.position as manager_position 
from employees as e1
join employees as e2 on e1.manager_id = e2.employee_id 
where e1.manager_id is not null
order by e1.employee_id;

-- 345. Display employees with the salary of their manager.
select e1.employee_id, e1.first_name, e1.manager_id, e2.salary as "manager's_salary"
from employees as e1
join employees as e2 on e1.manager_id = e2.employee_id 
where e1.manager_id is not null
order by e1.employee_id;

-- 346. Show branches along with the name of the manager responsible for them.
select b.branch_id, branch_name, e.employee_id, first_name
from branches as b
join employees as e on b.manager_id = e.manager_id;

-- 347. Display branches with the city where they operate and the manager name.
select b.branch_id, branch_name, city, e.employee_id, first_name
from branches as b
join employees as e on b.manager_id = e.manager_id;

-- 348. Show branches with the number of employees working there.
select e.branch_id, branch_name, city, count(employee_id) as total_employee 
from employees as e
join branches as b on e.branch_id = b.branch_id
group by e.branch_id 
order by e.branch_id;

-- 349. Display branches with total salary paid to employees in that branch.
select e.branch_id, branch_name, city, round(sum(salary),2) as total_paid_salary
from employees as e
join branches as b on e.branch_id = b.branch_id
group by e.branch_id 
order by e.branch_id;

-- 350. Show branches with the average employee salary.
select e.branch_id, branch_name, city, round(avg(salary),2) as average_salary
from employees as e
join branches as b on e.branch_id = b.branch_id
group by e.branch_id 
order by e.branch_id;

-- 351. Display accounts along with the cards issued for them.
select a.account_id, card_id
from accounts as a, cards as c 
where a.account_id = c.account_id
order by a.account_id, c.card_id;

-- 352. Show accounts with card numbers and card types.
select a.account_id, card_id, card_number, card_type
from accounts as a
join cards as c on  a.account_id = c.account_id
order by a.account_id, c.card_id;

-- 353. Display customers with their card numbers.
select a.customer_id, first_name, card_id
from accounts as a
join cards as cd on  a.account_id = cd.account_id
join customers as ct on a.customer_id = ct.customer_id
order by a.customer_id, cd.card_id;

-- 354. Show customers with the type of cards they hold.
select a.customer_id, first_name, card_id, card_type
from accounts as a
join cards as cd on  a.account_id = cd.account_id
join customers as ct on a.customer_id = ct.customer_id
order by a.customer_id, cd.card_id;

-- 355. Display cards with the balance of the associated account.
select a.account_id, a.customer_id, first_name, card_id, card_type, balance
from accounts as a
join cards as cd on  a.account_id = cd.account_id
join customers as ct on a.customer_id = ct.customer_id
order by a.account_id, cd.card_id;

-- 356. Show loans with the customer name who took the loan.
select loan_id, l.customer_id, concat(first_name," ",last_name) as full_name
from loans as l, customers as c
where l.customer_id = c.customer_id
order by loan_id;

-- 357. Display loans with the customer city.
select loan_id, l.customer_id, concat(first_name," ",last_name) as full_name, city
from loans as l 
join customers as c on l.customer_id = c.customer_id
order by loan_id;

-- 358. Show loans with the branch from which they were issued.
select loan_id, customer_id, l.branch_id, branch_name, loan_type 
from loans as l, branches as b 
where l.branch_id = b.branch_id 
order by loan_id;

-- 359. Display loans with both branch name and customer name.
select loan_id, l.customer_id, first_name, last_name, l.branch_id, branch_name, loan_type
from loans as l 
join branches as b on l.branch_id = b.branch_id 
join customers as c on l.customer_id = c.customer_id
order by loan_id;

-- 360. Show loans with customer email addresses.
select loan_id, l.customer_id, first_name, last_name, email
from loans as l 
join customers as c on l.customer_id = c.customer_id
order by loan_id;

-- 361. Display loan payments with the loan amount.
select payment_id, lp.loan_id, payment_amount 
from loan_payments as lp
join loans as l on lp.loan_id = l.loan_id
order by payment_id;

-- 362. Show loan payments with the loan type.
select lp.loan_id, loan_type, payment_amount
from loan_payments as lp
join loans as l on lp.loan_id = l.loan_id
order by lp.loan_id;

-- 363. Display loan payments with the customer who took the loan.
select lp.loan_id, loan_amount, payment_amount, first_name, last_name
from loan_payments as lp
join loans as l on lp.loan_id = l.loan_id
join customers as c on l.customer_id = c.customer_id
order by lp.loan_id;

-- 364. Show loan payments with branch name.
select lp.loan_id, loan_amount, payment_amount, b.branch_id, branch_name
from loan_payments as lp
join loans as l on lp.loan_id = l.loan_id
join branches as b on l.branch_id = b.branch_id
order by lp.loan_id;

-- 365. Display loan payments with both loan amount and payment amount.
select lp.loan_id, payment_id, loan_amount, payment_amount 
from loan_payments as lp
join loans as l on lp.loan_id = l.loan_id
order by payment_id;

-- 366. Show transactions with the account number they originated from.

-- 367. Display transactions with the account number they were sent to.
select transaction_id, source_account_id, destination_account_id, account_number
from transactions as t
left join accounts as a on t.destination_account_id = a.account_id
order by transaction_id;

-- 368. Show transactions with both source and destination account numbers.
select transaction_id, source_account_id, a2.account_number as "source_account_number", destination_account_id, a1.account_number as "destination_account_number"
from transactions as t
left join accounts as a1 on t.destination_account_id = a1.account_id
left join accounts as a2 on t.source_account_id = a2.account_id
order by transaction_id;

-- 369. Display transactions with the customer who initiated them.
select transaction_id, source_account_id, destination_account_id, a.customer_id 
from transactions as t 
join accounts as a on t.source_account_id = a.account_id
order by transaction_id;

-- 370. Show transactions with the branch where the source account exists.
select transaction_id, source_account_id, destination_account_id, a.branch_id, branch_name 
from transactions as t
join accounts as a on t.source_account_id = a.account_id
join branches as b on a.branch_id = b.branch_id;

-- 371. Display transactions along with the balance of the source account.
select transaction_id, source_account_id, balance as "source_account_balance"
from transactions as t
join accounts as a on t.source_account_id = a.account_id
order by transaction_id;

-- 372. Show transactions with the account type of the source account.
select transaction_id, source_account_id, account_type 
from transactions as t
join accounts as a on t.source_account_id = a.account_id
order by transaction_id;

-- 373. Display transactions with the customer name and transaction amount.
select transaction_id, source_account_id, destination_account_id, a.customer_id, first_name, last_name, amount
from transactions as t 
join accounts as a on t.source_account_id = a.account_id
join customers as c on a.customer_id = c.customer_id
order by transaction_id;

-- 374. Show transactions with customer email and transaction channel.
select transaction_id, source_account_id, destination_account_id, a.customer_id, email, channel
from transactions as t 
join accounts as a on t.source_account_id = a.account_id
join customers as c on a.customer_id = c.customer_id
order by transaction_id;

-- 375. Display transactions with both customer name and account number.
select transaction_id, source_account_id, a1.account_number, c1.first_name as "Sender Name", destination_account_id, a2.account_number, c2.first_name as "Receiver Name"
from transactions as t 
left join accounts as a1 on t.source_account_id = a1.account_id
left join accounts as a2 on t.destination_account_id = a2.account_id
left join customers as c1 on a1.customer_id = c1.customer_id
left join customers as c2 on a2.customer_id = c2.customer_id
order by transaction_id;

-- 376. Find customers who have more than one account.
select a.customer_id, first_name, last_name, count(account_id) as total_account
from accounts as a 
join customers as c on a.customer_id = c.customer_id 
group by a.customer_id 
having total_account > 1
order by a.customer_id;

-- 377. Find customers who own accounts in multiple branches.
select a.customer_id, first_name, last_name, count(account_id) as total_account
from accounts as a 
join customers as c on a.customer_id = c.customer_id 
group by a.customer_id
having count(distinct branch_id) > 1
order by a.customer_id;

-- 378. Find accounts that have more than one card issued..
select c.account_id, count(card_id) as total_card
from cards as c 
join accounts as a on c.account_id = a.account_id 
group by c.account_id 
having total_card > 1 
order by c.account_id;

-- 379. Find branches that have both employees and accounts.

-- 380. Find customers who have both accounts and loans.
select c.customer_id, first_name, last_name, account_id, loan_id 
from customers as c 
join accounts as a on c.customer_id = a.customer_id
join loans as l on c.customer_id = l.customer_id
order by c.customer_id;
