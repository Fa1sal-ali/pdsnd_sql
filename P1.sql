/*The subquery is used to join all the tables which are required
to return the categories of movies which families are watching
 (Animation, Children, Classics, Comedy, Family and Music).*/
WITH sub1 AS
(SELECT ct.name AS category_name
FROM film_category fc
JOIN category ct
ON fc.category_id = ct.category_id
JOIN film fm
ON fm.film_id = fc.film_id
JOIN inventory ivt
ON fm.film_id = ivt.film_id
JOIN rental rt
ON ivt.inventory_id = rt.inventory_id
WHERE ct.name IN('Animation','Children','Classics','Comedy','Family','Music'))
/*This query picks up the category from the
subquery then we use an aggregation function (count) to calculate
 the number of times the movie of a certain category was rented out.*/
SELECT category_name,
       COUNT(*) AS rental_count
FROM sub1
GROUP BY 1
ORDER BY 1;
