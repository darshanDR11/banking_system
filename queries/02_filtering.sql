-- 61. Find customers who live in Danielton.
select * from customers where city = "Danielton";

-- 62. Show customers who live in Mumbai.
select * from customers where city = "Aguirrestad";

-- 63. Display customers whose email ends with @example.org
select * from customers where email like "%example.org";

-- 64. Show customers whose first name starts with the letter A.
select * from customers where first_name like "A%";

-- 65. Display customers whose last name contains the letter S.
select * from customers where last_name like "%S%" or last_name like "S%";

-- 66. Find customers whose phone number starts with 9.
select * from customers where phone like "9%";

-- 67. Show customers whose email is NULL.
select * from customers where email is null;

-- 68. Display customers whose phone number is not NULL.
select * from customers where phone is not null;

-- 69. Find customers created after 2026-03-14 20:08:40
select * from customers where created_at > "2026-03-14 20:08:40";

-- 70. Show customers created before 2026-03-14 20:08:50
select * from customers where created_at < "2026-03-14 20:08:50";

-- 71. Find employees whose salary is greater than 50000.
select * from employees where salary > 50000;

-- 72. Show employees whose salary is less than 40000.
select * from employees where salary < 40000;

-- 73. Display employees whose salary is between 50000 and 60000.
select * from employees where salary between 50000 and 60000;

-- 74. Find employees hired after 2022-01-01.
select * from employees where hire_date = "2022-01-01";

-- 75. Show employees hired before 2018-01-01.
select * from employees where hire_date < "2018-01-01";

-- 76. Find employees whose position is Branch Manager.
select * from employees where manager_id is null;

-- 77. Show employees whose position is not Manager.
select * from employees where not manager_id is null;

-- 78. Display employees working in branch 3.
select * from employees where branch_id = 3;

-- 79. Find employees working in branch 5.
select * from employees where branch_id = 5;

-- 80. Show employees who report to manager_id = 2.
select * from employees where manager_id = 2;

-- 81. Find accounts with balance greater than 100000.
select * from accounts where balance > 100000;

-- 82. Show accounts with balance less than 5000.
select * from accounts where balance < 5000;

-- 83. Display accounts whose balance is between 10000 and 2000.
select * from accounts where balance between 1000 and 2000;

-- 84. Find accounts opened after 2023-01-01.
select * from accounts where open_date > "2023-01-01";

-- 85. Show accounts opened before 2022-01-01.
select * from accounts where open_date < "2022-01-01";

-- 86. Display accounts with status Active.
select * from accounts where status = "Active";

-- 87. Find accounts with status Frozen.
select * from accounts where status = "Frozen";

-- 88. Show accounts with status Closed.
select * from accounts where status = "Closed";

-- 89. Display accounts whose account_type is Savings.
select * from accounts where account_type = "Savings";

-- 90. Find accounts whose account_type is Current.
select * from accounts where account_type= "Current";

-- 91. Show accounts whose account_type is Salary.
select * from accounts where account_type= "Salary";

-- 92. Display accounts belonging to customer_id = 10.
select * from accounts where customer_id = 10;

-- 93. Find accounts opened in branch_id = 4.
select * from accounts where branch_id = 4;

-- 94. Show accounts where balance is exactly 0.
select * from accounts where balance = 0;

-- 95. Display accounts where balance is not equal to 0.
select * from accounts where not balance = 0;

-- 96. Find transactions with amount greater than 10000.
select * from transactions where amount > 10000;

-- 97. Show transactions with amount less than 500.
select * from transactions where amount < 500;

-- 98. Display transactions where amount is between 1000 and 10000.
select * from transactions where amount between 1000 and 10000;

-- 99. Find transactions with status Failed.
select * from transactions where status = "Failed";

-- 100. Show transactions with status Pending.
select * from transactions where status = "Pending";

-- 101. Display transactions with status Success.
select * from transactions where status = "Success";

-- 102. Find transactions performed through UPI.
select * from transactions where channel = "UPI";

-- 103. Show transactions performed through ATM.
select * from transactions where channel = "ATM";

-- 104. Display transactions performed through NetBanking.
select * from transactions where channel = "NetBanking";

-- 105. Find transactions performed through Mobile.
select * from transactions where channel = "Mobile";

-- 106. Show transactions performed through Card.
select * from transactions where channel = "Card";

-- 107. Display transactions of type Deposit.
select * from transactions where transaction_type = "Deposit";

-- 108. Find transactions of type Withdrawal.
select * from transactions where transaction_type = "Withdrawal";

-- 109. Show transactions of type Transfer.
select * from transactions where transaction_type = "Transfer";

-- 110. Display transactions that occurred after 2024-01-01.
select * from transactions where transaction_date > "2024-01-01";

-- 111. Find cards that are Active.
select * from cards where status = "Active";

-- 112. Show cards that are Blocked.
select * from cards where status = "Blocked";

-- 113. Display cards that are Expired.
select * from cards where status = "Expired"; -- or select * from cards where expiry_date <= curdate();

-- 114. Find cards issued after 2023-01-01.
select * from cards where issue_date > "2023-01-01";

-- 115. Show cards expiring before 2026-01-01.
select * from cards where expiry_date < "2027-01-01";

-- 116. Find loans with loan_amount greater than 500000.
select * from loans where loan_amount > 500000;

-- 117. Show loans with loan_amount less than 100000.
select * from loans where loan_amount < 100000;

-- 118. Display loans whose interest_rate is greater than 9%.
select * from loans where interest_rate > 9;

-- 119. Find loans whose interest_rate is less than 7%.
select * from loans where interest_rate < 7;

-- 120. Show loans whose status is Active.
select * from loans where status = "Active";

-- 121. Display loans whose status is Closed.
select * from loans where status = "Closed";

-- 122. Find loans whose status is Defaulted.
select * from loans where status = "Defaulted";

-- 123. Show loans of type Home.
select * from loans where loan_type = "Home";

-- 124. Display loans of type Car.
select * from loans where loan_type = "Car";

-- 125. Find loans of type Education.
select * from loans where loan_type = "Education";

-- 126. Show loan payments greater than 10000.
select * from loan_payments where payment_amount > 10000;

-- 127. Display loan payments less than 3000.
select * from loan_payments where payment_amount < 3000;

-- 128. Find loan payments made through UPI.
select * from loan_payments where payment_method = "UPI";

-- 129. Show loan payments made through Cash.
select * from loan_payments where payment_method = "Cash";

-- 130. Display loan payments made through AutoDebit.
select * from loan_payments where payment_method = "AutoDebit";

