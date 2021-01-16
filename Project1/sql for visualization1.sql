
 SELECT 
        cat.name, 
        count(ren.rental_id) AS rent_count
  FROM category AS cat
  
       JOIN film_category AS fcat
        ON cat.category_id = fcat.category_id
        AND cat.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')

       JOIN film AS f
        ON f.film_id = fcat.film_id

       JOIN inventory AS inv
        ON f.film_id = inv.film_id

       JOIN rental AS ren
        ON inv.inventory_id = ren.inventory_id
		
 GROUP BY 1
 ORDER BY 1;