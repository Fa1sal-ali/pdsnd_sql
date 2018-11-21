/*This query returns the top 10 customer's who have made the highest payments
in a month along with the payment month, number of payments made in a month
 and total amount paid in that month*/
SELECT DATE_TRUNC('month',pt.payment_date) AS payment_mon,
       ct.first_name||' '||ct.last_name AS full_name,
       COUNT(*) AS paycount_permonth,
       SUM(pt.amount)
FROM customer ct
JOIN payment pt
ON ct.customer_id = pt.customer_id
WHERE pt.payment_date BETWEEN '2007-01-01' AND '2007-12-31'
GROUP BY 1,2
ORDER BY 4 DESC
LIMIT 10;
