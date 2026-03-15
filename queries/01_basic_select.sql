-- 1. Display all records from the customers table.
select * from customers;

-- 2. Show all records from the branches table.
select * from branches;

-- 3. Display all employees.
select * from employees;

-- 4. Show all accounts.
select * from accounts;

-- 5. Display all transactions.
select * from transactions;

-- 6. Show all cards.
select * from cards;

-- 7. Display all loans.
select * from loans;

-- 8. Show all loan payments.
select * from loan_payments;

-- 9. Display first_name and last_name of all customers.
select customer_id, first_name, last_name from customers;

-- 10. Show customer email addresses.
select customer_id, email from customers;

-- 11. Display customer phone numbers.
select customer_id, phone from customers;

-- 12. Show customer cities.
select customer_id, city from customers;

-- 13. Display branch_name and city from branches.
select branch_id, branch_name, city from branches;

-- 14. Show branch_name and state.
select branch_id, branch_name, state from branches;

-- 15. Display employee first and last names.
select employee_id, first_name, last_name from employees;

-- 16. Show employee positions.
select employee_id, position from employees;

-- 17. Display account_number and balance.
select account_id, account_number, balance from accounts;

-- 18. Show account_type for all accounts.
select account_id, account_type from accounts;

-- 19. Display account open dates.
select account_id, open_date from accounts;

-- 20. Show account status values.
select account_id, status from accounts;

-- 21. Display transaction_id and amount.
select transaction_id, amount from transactions;

-- 22. Show transaction_date for all transactions.
select transaction_id, transaction_date from transactions;

-- 23. Display transaction channels used in the bank.
select transaction_id, channel from transactions;

-- 24. Show transaction types.
select transaction_id, transaction_type from transactions;

-- 25. Display transaction status values.
select transaction_id, status from transactions;

-- 26. Show card_number and card_type.
select card_id, card_number, card_type from cards;

-- 27. Display card issue_date and expiry_date.
select card_id, issue_date, expiry_date from cards;

-- 28. Show card status values.
select card_id, status from cards;

-- 29. Display loan_id and loan_amount.
select loan_id, loan_amount from loans;

-- 30. Show loan interest rates.
select loan_id, interest_rate from loans;

-- 31. Display loan start_date.
select loan_id, start_date from loans;

-- 32. Show loan types available in the bank.
select distinct loan_type from loans;

-- 33. Display loan status values.
select loan_id, status from loans;

-- 34. Show loan payment amounts.
select loan_id, payment_amount from loan_payments;

-- 35. Display loan payment dates.
select payment_id, payment_date from loan_payments;

-- 36. Show loan payment methods.
select distinct payment_method from loan_payments;

-- 37. Display customer_id and created_at.
select customer_id, created_at from customers;

-- 38. Show employee salaries.
select employee_id, salary from employees;

-- 39. Display employee hire dates.
select employee_id, hire_date from employees;

-- 40. Show employee branch assignments.
select employee_id, first_name, last_name, branch_id from employees;

-- 41. Display branch manager IDs.
-- 42. Show employee manager IDs.

-- 43. Display accounts along with their customer_id.
select account_id, customer_id from accounts;

-- 44. Show accounts along with branch_id.
select account_id, branch_id from accounts;

-- 45. Display cards along with account_id.
select card_id, card_number, account_id from cards;

-- 46. Show loans with customer_id.
select loan_id, customer_id from loans;

-- 47. Display loans with branch_id.
select loan_id, branch_id from loans;

-- 48. Show loan payments with loan_id.
select loan_id, payment_amount from loan_payments;

-- 49. Display source_account_id from transactions.
select transaction_id, source_account_id from transactions;

-- 50. Show destination_account_id from transactions.
select transaction_id, destination_account_id from transactions;

-- 51. Display transaction amounts and channels.
select transaction_id, amount, channel from transactions;

-- 52. Show transaction types and status.
select transaction_id, transaction_type, status from transactions;

-- 53. Display employee names and salaries.
select first_name, last_name, salary from employees;

-- 54. Show branch names and states.
select branch_name, state from branches;

-- 55. Display account numbers and open dates.
select account_id, account_number, open_date from accounts;

-- 56. Show loan amounts and interest rates.
select loan_id, loan_amount, interest_rate from loans;

-- 57. Display payment amounts and payment methods.
select payment_id, payment_amount, payment_method from loan_payments;

-- 58. Show card numbers and expiry dates.
select card_id, card_number, expiry_date from cards;

-- 59. Display customer names and cities.
select first_name, last_name, city from customers;

-- 60. Show employee names and positions.
select first_name, last_name, position from employees;
