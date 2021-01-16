WITH t1 AS

(SELECT cat.name as name,
	    NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
       FROM category cat
  
       JOIN film_category fcat
       ON cat.category_id = fcat.category_id

       JOIN film f
       ON f.film_id = fcat.film_id

  WHERE cat.name IN ('Animation', 'Children','Classics','Comedy','Family','Music')
  ORDER BY name, standard_quartile)

SELECT t1.name,
       t1.standard_quartile,
	   COUNT(*)
   FROM t1
   GROUP BY 1,2
   ORDER BY name, standard_quartile;