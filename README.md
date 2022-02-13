# SQL Temeller - Ödev 12

Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.

1. *film* tablosunda film uzunluğu *length* sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
2. *film* tablosunda en yüksek *rental_rate* değerine sahip kaç tane film vardır?
3. *film* tablosunda en düşük *rental_rate* ve en düşük *replacement_cost* değerlerine sahip filmleri sıralayınız.
4. *payment* tablosunda en fazla sayıda alışveriş yapan müşterileri(*customer*) sıralayınız.

***

1.

```SQL
SELECT *
FROM film
WHERE "length" >
    (SELECT AVG("length")
     FROM film);
```

2.

```SQL
SELECT *
FROM film
WHERE rental_rate =
    (SELECT MAX(rental_rate)
     FROM film);
```

3.

```SQL
SELECT *
FROM film
WHERE rental_rate =
    (SELECT MIN(rental_rate)
     FROM film)
  AND replacement_cost =
    (SELECT MIN(replacement_cost)
     FROM film);
```

4.

```SQL
SELECT customer.customer_id,
       customer.first_name,
       customer.last_name,
       COUNT(*) AS "payment_count"
FROM payment
RIGHT JOIN customer ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY "payment_count" DESC;
```
