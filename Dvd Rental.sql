--- To view the names of the actors
SELECT FIRST_NAME, LAST_NAME FROM ACTOR;

--- GET THE CUSTOMER_ID, LASTNAME AND EMAIL OF OUR CUSTOMERS
SELECT CUSTOMER_ID, LAST_NAME, EMAIL FROM CUSTOMER;

-- To view the release year of films
SELECT DISTINCT RELEASE_YEAR FROM FILM;

-- To view the information of customers whose first name is Jamie
select * from customer
where first_name = 'Jamie';

---To view the information of customers whose first name is Jamie and last name is rice
select first_name, last_name from customer
where first_name = 'Jamie' and last_name = 'Rice';

-- To view what the movie “Outlaw  Hanky” is about. 
select title, description from film
where title = 'Outlaw Hanky';

-- To view who paid the rental rate which amount is either less than 1USD or greater than 8USD. 
select customer_id, amount from payment
where amount < 1 or amount > 8;

-- To view the average and total amount made
SELECT AVG(AMOUNT) AS AVERAGE_AMOUNT, SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENT;

-- Get the customer_id and rental_id for payments that are between 8 and 9 USD in descending order
SELECT CUSTOMER_ID, RENTAL_ID, AMOUNT FROM PAYMENT
WHERE AMOUNT >= 8 AND AMOUNT <= 11
ORDER BY AMOUNT DESC;

--  To view customer ID, rental ID and amount not within 8 USD AND 11 USD in descending order
SELECT CUSTOMER_ID, RENTAL_ID, AMOUNT FROM PAYMENT
WHERE AMOUNT NOT BETWEEN 8 AND 11
ORDER BY AMOUNT DESC;

-- To know the rental id of customer ID 1,2,56,343 and  the date they returned their DVDs
SELECT RENTAL_ID, CUSTOMER_ID , RETURN_DATE FROM RENTAL
WHERE CUSTOMER_ID IN (1,2,56,343);

-- To know the rental id of customer ID that are not 1,2,56,343 and the date they returned their DVDs
SELECT RENTAL_ID, CUSTOMER_ID , RETURN_DATE FROM RENTAL
WHERE CUSTOMER_ID NOT IN (1,2,56,343);

-- customers whose names starts with Jen
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER
WHERE FIRST_NAME LIKE 'Jen%';

--customers whose names contains en
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER
WHERE FIRST_NAME LIKE '%en%';

-- Customers that en is the 2nd and 3rd letters respectively and last 2 letters in their name
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER
WHERE FIRST_NAME LIKE '_en';

-- Customers that en is the 2nd and 3rd letters in their name
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER
WHERE FIRST_NAME LIKE '_en%';

--customers whose names ends with er
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER
WHERE FIRST_NAME LIKE '%er';

--customers whose names is a 5 letter words ends with er
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER
WHERE FIRST_NAME LIKE '___er'

-- TOP 10 TOTAL AMOUNT EACH CUSTOMER PAID 
SELECT CUSTOMER_ID, SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENT
GROUP BY CUSTOMER_ID
ORDER BY SUM(AMOUNT) DESC
LIMIT 10;

-- HOW MANY TIMES EACH CUSTOMER PAID?
SELECT CUSTOMER_ID, COUNT(AMOUNT) AS COUNT_AMOUNT FROM PAYMENT
GROUP BY CUSTOMER_ID;

--How many payments did each staff member handle? And how much was the total amount processed by  each staff member?
SELECT STAFF_ID, COUNT(AMOUNT) PAYMENT_HANDLED, SUM(AMOUNT) AS TOTAL_PAYMENT FROM PAYMENT
GROUP BY STAFF_ID;

-- How much has the customers who spent above $200 spent  exactly?
SELECT CUSTOMER_ID, SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENT
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) > 200;

-- To know the average rental rate of these 3 ratings: R,  PG, G.
SELECT RATING, AVG(RENTAL_RATE) AS AVG_RENTAL_RATE FROM FILM
GROUP BY RATING
HAVING RATING IN ('R', 'PG', 'G');

-- WE WANT TO KNOW THE NAME OF THE CUSTOMERS THAT PATRONISES US
SELECT * FROM CUSTOMER;
SELECT * FROM PAYMENT;
-- MERGE THE TWO TABLES
SELECT C.FIRST_NAME, C.LAST_NAME, P.CUSTOMER_ID, P.AMOUNT
FROM CUSTOMER C INNER JOIN PAYMENT P
ON C.CUSTOMER_ID = P.CUSTOMER_ID;

-- To know the Top 5 first name of customers that patronize
SELECT C.FIRST_NAME, SUM(P.AMOUNT)
FROM CUSTOMER C INNER JOIN PAYMENT P
ON C.CUSTOMER_ID = P.CUSTOMER_ID
GROUP BY FIRST_NAME
ORDER BY SUM(AMOUNT) DESC
limit 5;

-- How many actors have a first name that starts with the letter P?
select first_name, last_name, count(first_name) as district_count 
from actor
where first_name like 'P%'
group by first_name, last_name;

-- How many unique districts are our customers from?
select count (distinct district)as district_count
from address;

-- How many films have the word Truman somewhere in the title?
select title, count (title) as film_count from film
where title like '%Truman%'
group by title;
