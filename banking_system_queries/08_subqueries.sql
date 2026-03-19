-- 381. Find customers who own accounts with balance greater than the average account balance.
select c.customer_id, first_name, last_name, balance
from accounts as a
join customers as c on a.customer_id = c.customer_id
where balance > (select avg(balance) as average_balance from accounts);

-- 382. Find accounts whose balance is higher than the maximum balance of Savings accounts.
select * from accounts where balance > (select max(balance) from accounts where account_type = "Savings");

-- 383. Display employees whose salary is greater than the average employee salary.
select * from employees where salary > (select avg(salary) from employees);

-- 384. Find employees whose salary is lower than the average salary of their branch.
select employee_id, first_name, last_name, position, salary, e.branch_id 
from employees as e join (  select branch_id, avg(salary) as average_salary 
                            from employees 
                            group by branch_id 
                            order by branch_id) as ans on e.branch_id = ans.branch_id
where e.salary < ans.average_salary;

-- 385. Find branches whose average employee salary is greater than the bank-wide average salary.
select branch_id, round(avg(salary),2) as average_salary
from employees 
group by branch_id 
having avg(salary) > (select avg(salary) from employees);

-- 386. Find customers who opened accounts earlier than the average account opening date.
select * 
from accounts 
where open_date > (select avg(open_date) from accounts) 
order by account_id;

-- 387. Find accounts whose balance is higher than the average balance of their account type.
select account_id, account_number, customer_id, a.account_type, balance, open_date, status
from accounts as a join (select account_type, round(avg(balance),2) as average_balance 
                        from accounts 
                        group by account_type) 
as ans on a.account_type = ans.account_type
where a.balance > ans.average_balance;

-- 388. Find transactions whose amount is higher than the average transaction amount.
select * 
from transactions 
where amount > (select avg(amount) from transactions) order by transaction_id;

-- 389. Find transactions whose amount is greater than the maximum transaction done through ATM.
select * 
from transactions 
where amount > (select max(amount) from transactions where channel = "ATM");

-- 390. Find customers who made transactions larger than the average transaction value.
select customer_id, transaction_id, source_account_id, amount
from transactions as t 
join accounts as a on t.source_account_id = a.account_id
join (select avg(amount) as average_amount from transactions) as ans
where amount > average_amount
order by customer_id;

-- 391. Find branches that issued loans larger than the average loan amount.
select * from branches 
where branch_id in (select distinct branch_id from loans where loan_amount > (select round(avg(loan_amount),2) from loans));

-- 392. Find loans whose amount is greater than the average loan amount.
select * from loans where loan_amount > (select avg(loan_amount) from loans);

-- 393. Find loans whose interest rate is higher than the average interest rate.
select * from loans where interest_rate > (select avg(interest_rate) from loans);

-- 394. Find loans larger than any loan issued in branch 5.
select * from loans where loan_amount > all(select loan_amount from loans where branch_id = 5);

-- 395. Find customers who have loans greater than the bank's average loan amount.
select 
	customer_id, 
	sum(loan_amount) as total_loan_amount 
from loans 
group by customer_id 
having total_loan_amount > (select avg(loan_amount) from loans);

-- 396. Find accounts whose balance is greater than all balances of accounts opened in branch 3.
select *
from accounts 
where balance >= all(select balance from accounts where branch_id = 3);

-- 397. Find employees whose salary is greater than all employees in branch 2.
select *
from employees 
where salary > all(select salary from employees where branch_id = 2);

-- 398. Find branches where total account balance exceeds the average branch balance.
select 
	branch_id, 
  sum(balance) as total_balance 
from accounts 
group by branch_id 
having total_balance > (select avg(total_balance) as average_balance 
                        from (select sum(balance) as total_balance from accounts group by branch_id) as a1);

-- 399. Find customers whose total loan amount exceeds the average loan amount per customer.
select 
	a1.customer_id, 
  total_loan_amount 
from (select customer_id, sum(loan_amount) as total_loan_amount from loans group by customer_id) as a1
join (select customer_id, round(avg(loan_amount),2) as average_loan_amount from loans group by customer_id) as a2 
on a1.customer_id = a2.customer_id
where a1.total_loan_amount > average_loan_amount;

-- 400. Find branches whose total loan amount exceeds the average loan amount across branches.
select 
	branch_id, 
  sum(loan_amount) as total_amount
from loans
group by branch_id 
having total_amount > (select avg(total_amount) as average_amount 
                        from (select sum(loan_amount) as total_amount  from loans group by branch_id) as a1);

-- 401. Find customers who have accounts in branches located in North Carolina.
select 
	  distinct a.customer_id, 
    first_name, 
    last_name, 
    account_id 
from accounts as a 
join customers as c on a.customer_id = c.customer_id
where branch_id = (select branch_id from branches where state = "North Carolina") 
order by a.customer_id;

-- 402. Find customers who have cards linked to accounts with balance greater than 50,000.
select * 
from customers 
where customer_id in (select customer_id from cards as c, accounts as a 
                      where c.account_id = a.account_id and balance > 50000);
                        
-- 403. Find Customers who have both loan and account.
select * 
from customers 
where 
	customer_id in (select distinct customer_id from accounts) 
and 
	customer_id in (select distinct customer_id from loans);

-- 404. Find cards belonging to accounts whose balance exceeds the average balance.
select * 
from cards 
where account_id in (	
					select account_id from accounts 
					where balance > (select avg(balance) from accounts));

-- 405. Find employees who work in branches where average salary exceeds 60,000.
select * from employees where branch_id in (select branch_id from employees group by branch_id having avg(salary) > 60000);

-- 406. Find customers who do not have any accounts.
select * from customers where not customer_id in (select distinct customer_id from accounts);

-- 407. Find accounts that do not have any cards issued.
select * from accounts where not account_id in (select distinct account_id from cards);

-- 408. Find customers who do not have loans.
select * from customers where not customer_id in (select distinct customer_id from loans);

-- 409. Find loans that have not received any payments yet.
select * from loans where not loan_id in (select distinct loan_id from loan_payments) and status != "Closed";

-- 410. Find branches that do not have employees assigned.
select * from branches where not branch_id in (select distinct branch_id from employees);

-- 411. Find employees who are not managers of any branch.
select * from employees where not employee_id in (select manager_id from branches);

-- 412. Find customers who have never performed any transactions.
select * from customers 
where not customer_id in (	select distinct customer_id 
                         	from accounts 
                            where account_id in (select distinct source_account_id from transactions)
							or account_id in (select distinct destination_account_id from transactions));


-- 413. Find accounts that have never sent a transaction.
select * from accounts where not account_id in (select distinct source_account_id from transactions);

-- 414. Find accounts that have never received a transaction.
select * from accounts where not account_id in (select distinct destination_account_id from transactions);

-- 415. Find customers who have accounts but no cards.
select * 
from customers 
where 
	customer_id in (select distinct customer_id from accounts 
                  where not account_id in (select distinct account_id from cards));

-- 416. Find employees who earn more than at least one employee in branch 4.
select * from employees where salary > any(select salary from employees where branch_id = 4) and branch_id != 4;

-- 417. Find employees who earn more than all employees in branch 4.
select * from employees where salary > all(select salary from employees where branch_id = 4);

-- 418. Find accounts whose balance is greater than at least one account in branch 6.
select * from accounts where balance > any(select balance from accounts where branch_id = 6) and branch_id != 6;

-- 419. Find loans whose amount is greater than all loans issued in branch 2.
select * from loans where loan_amount > all(select loan_amount from loans where branch_id = 2);

-- 420. Find transactions whose amount exceeds all ATM transactions.
select * from transactions where amount > all(select amount from transactions where channel = "ATM");

-- 421. Find customers whose accounts have balances greater than the minimum balance in the bank.
select * 
from customers 
where customer_id in (select account_id from accounts 
						where balance > (select min(balance) from accounts where balance != 0.0));

-- 422. Find employees whose salary equals the maximum salary in the company.
select * from employees where salary = (select max(salary) from employees);

-- 423. Find accounts whose balance equals the minimum balance of Savings accounts.
select * from accounts where balance = (select min(balance) from accounts where account_type = "Savings") and account_type != "Savings";

-- 424. Find loans whose interest rate equals the highest interest rate in the system.
select * from loans where interest_rate = (select max(interest_rate) from loans);

-- 425. Find transactions whose amount equals the largest transaction amount.
select * from transactions where amount = (select max(amount) from transactions);

-- 426. Find customers whose total account balance exceeds the average total balance per customer.
select * from customers 
where customer_id in (
					select a1.customer_id
					from (select customer_id, sum(balance) as total_balance from accounts group by customer_id) as a1
					join (select customer_id, round(avg(balance),2) as average_balance from accounts group by customer_id) as a2
					on a1.customer_id = a2.customer_id 
					where total_balance > average_balance);
                    
-- 427. Find transactions where a cash withdrawal amount is greater than all previous successful withdrawal amounts
select *  
from transactions 
where destination_account_id is null 
and status = "Success"
and amount > all (select amount 
          		from transactions 
    			where destination_account_id is null 
				and status = "Success" 
          		and amount != (select max(amount) from (select amount from transactions where destination_account_id is null and status = "Success") as ans));

-- 428. Find loan types whose average loan amount exceeds the average of all loan types.
select 
	loan_type, 
    round(avg(loan_amount),2) as average_loan_amount 
from loans 
group by loan_type 
having average_loan_amount > (select avg(average_loan_amount) 
							  from (select loan_type round(avg(loan_amount),2) as average_loan_amount 
							  from loans group by loan_type) as ans
							 );

-- 429. Find loan payment methods whose average payment amount exceeds the bank average.
select payment_method, avg(payment_amount) as average_amount 
from loan_payments 
group by payment_method
having average_amount > (select avg(payment_amount) from loan_payments);

-- 430. Find customers who have the largest account balance in the bank.
select * from customers where customer_id in (select customer_id from accounts where balance = (select max(balance) from accounts));

