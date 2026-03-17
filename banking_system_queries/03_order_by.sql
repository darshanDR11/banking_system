-- 131. List all customers ordered by first_name alphabetically.
select * from customers order by first_name;

-- 132. Display customers ordered by last_name descending.
select * from customers order by first_name desc;

-- 133. Show customers ordered by city and then first_name.
select * from customers order by city desc, first_name asc;

-- 134. Display customers ordered by created_at from newest to oldest.
select * from customers order by created_at desc;

-- 135. Show the 10 most recently created customers.
select * from customers order by created_at desc limit 10;

-- 136. Display employees ordered by salary ascending.
select * from employees order by salary asc;

-- 137. Show employees ordered by salary descending.
select * from employees order by salary desc;

-- 138. Display the 5 highest paid employees.
select * from employees order by salary desc limit 5;

-- 139. Show the 5 lowest paid employees.
select * from employees order by salary limit 5;

-- 140. List employees ordered by hire_date from oldest hire to newest.
select * from employees order by hire_date;

-- 141. Display employees ordered by position then salary.
select * from employees order by position asc, salary desc;

-- 142. Show employees ordered by branch_id and salary descending.
select * from employees order by branch_id asc, salary desc;

-- 143. Display the 10 most recently hired employees.
select * from employees order by hire_date desc limit 10;

-- 144. Show employees ordered by manager_id.
select * from employees order by manager_id;

-- 145. Display employees ordered by salary and hire_date.
select * from employees order by salary asc, hire_date asc;

-- 146. Show accounts ordered by balance ascending.
select * from accounts order by balance;

-- 147. Display accounts ordered by balance descending.
select * from accounts order by balance desc;

-- 148. Show the 10 accounts with the highest balance.
select * from accounts order by balance desc limit 10;

-- 149. Display the 10 accounts with the lowest balance and balance is not 0.
select * from accounts where balance > 0 order by balance limit 10;

-- 150. List accounts ordered by open_date from oldest to newest.
select * from accounts order by open_date;

-- 151. Display accounts ordered by open_date descending.
select * from accounts order by open_date desc;

-- 152. Show accounts ordered by account_type and balance.
select * from accounts order by account_type asc, balance asc;

-- 153. Display accounts ordered by status then balance.
select * from accounts order by status asc, balance desc;

-- 154. Show the 20 newest accounts opened in the bank.
select * from accounts order by open_date desc limit 20;

-- 155. Display the earliest 10 accounts opened.
select * from accounts order by open_date desc limit 10;

-- 156. Show transactions ordered by transaction_date descending.
select * from transactions order by transaction_date desc;

-- 157. Display the 20 most recent transactions.
select * from transactions order by transaction_date desc limit 20;

-- 158. Show transactions ordered by amount descending.
select * from transactions order by amount desc;

-- 159. Display the 10 largest transactions in the bank.
select * from transactions order by amount desc limit 10;

-- 160. Show the 10 smallest transactions.
select * from transactions order by amount limit 10;

-- 161. Display transactions ordered by channel then amount.
select * from transactions order by channel asc, amount asc;

-- 162. Show transactions ordered by transaction_type then amount.
select * from transactions order by transaction_type asc, amount asc;

-- 163. Display transactions ordered by status and transaction_date.
select * from transactions order by status asc, transaction_date asc;

-- 164. Show transactions ordered by amount ascending and transaction_date.
select * from transactions order by amount desc, transaction_date asc;

-- 165. Display transactions ordered by channel and transaction_date.
select * from transactions order by channel asc, transaction_date asc;

-- 166. Show cards ordered by issue_date descending.
select * from cards order by issue_date desc;

-- 167. Display cards ordered by expiry_date.
select * from cards order by expiry_date;

-- 168. Show the 10 cards expiring soonest.
select * from cards where not expiry_date < curdate() order by expiry_date limit 10;

-- 169. Display cards ordered by status then expiry_date.
select * from cards order by status asc, expiry_date asc;

-- 170. Show cards ordered by card_type then issue_date.
select * from cards order by card_id asc, issue_date asc;

-- 171. Display loans ordered by loan_amount descending.
select * from loans order by loan_amount desc;

-- 172. Show the 10 largest loans issued by the bank.
select * from loans order by loan_amount desc limit 10;

-- 173. Display loans ordered by interest_rate descending.
select * from loans order by interest_rate desc;

-- 174. Show the 10 loans with the highest interest rates.
select * from loans order by interest_rate desc limit 10;

-- 175. Display loans ordered by start_date.
select * from loans order by start_date;

-- 176. Show loans ordered by status then loan_amount.
select * from loans order by status asc, loan_amount asc;

-- 177. Display loans ordered by branch_id and loan_amount.
select * from loans order by branch_id asc, loan_amount asc;

-- 178. Show loan payments ordered by payment_amount descending.
select * from loan_payments order by payment_amount desc;

-- 179. Display the 10 largest loan payments.
select * from loan_payments order by payment_amount desc limit 10;

-- 180. Show loan payments ordered by payment_date descending.
select * from loan_payments order by payment_date desc;

