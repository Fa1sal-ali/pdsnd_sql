/*Here we take the amount of payments received and use the window function
to generate a running total of revenue month wise and usning partition by on
 store_id and payments date we divide the data store_id and month wise. We
  also use a join to map the store id*/
SELECT pt.amount,
       stf.store_id,
       DATE_TRUNC('month',pt.payment_date) AS payment_month,
       SUM(pt.amount) OVER (PARTITION BY stf.store_id,DATE_TRUNC('month',pt.payment_date) ORDER BY pt.payment_date) AS running_total_revenue
FROM payment pt
JOIN staff stf
ON stf.staff_id = pt.staff_id;
