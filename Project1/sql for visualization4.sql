WITH t1 AS

(SELECT DATE_PART('month', rental_date) as month,
        DATE_PART('year', rental_date) as year,
		store_id, COUNT (film_id) OVER (PARTITION BY DATE_TRUNC('month', rental_date) ORDER BY store_id) as count_rentals
		
FROM rental ren

        JOIN inventory inv
        ON inv.inventory_id = ren.inventory_id)

SELECT t1.month rental_month,
       t1.year rental_year,
	   t1.store_id,
	   COUNT(count_rentals) count_rentals
	   
FROM t1
GROUP BY 1, 2, 3
ORDER BY count_rentals DESC ;