/*This subquery joins all the tables, then using DATE_PART we extract the
 month and year of all the purchases*/
WITH sub1 AS(SELECT DATE_PART('month',rt.rental_date) AS rental_month,
       DATE_PART('year',rt.rental_date) AS rental_year,
       sf.store_id AS store_id
FROM rental rt
JOIN staff sf
ON rt.staff_id = sf.staff_id)
/*This query returns all the values fetched from the subquery, then we
 use COUNT function to count all the rentals and by using GROUP BY we divide
  data month and year wise*/
SELECT rental_month,
       rental_year,
       store_id,
       COUNT(*) AS rental_count
FROM sub1
GROUP BY 1,2,3
ORDER BY 4 DESC;
