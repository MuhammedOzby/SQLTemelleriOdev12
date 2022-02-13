-- Example 1st

SELECT *
FROM film
WHERE "length" >
    (SELECT AVG("length")
     FROM film);

-- Example 2nd

SELECT *
FROM film
WHERE rental_rate =
    (SELECT MAX(rental_rate)
     FROM film);

-- Example 3th

SELECT *
FROM film
WHERE rental_rate =
    (SELECT MIN(rental_rate)
     FROM film)
  AND replacement_cost =
    (SELECT MIN(replacement_cost)
     FROM film);

-- Example 4th

SELECT customer.customer_id,
       customer.first_name,
       customer.last_name,
       COUNT(*) AS "payment_count"
FROM payment
RIGHT JOIN customer ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY "payment_count" DESC;