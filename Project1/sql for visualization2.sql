WITH t1 AS

(SELECT * FROM category cat
	 
     JOIN film_category fcat
     ON cat.category_id = fcat.category_id

     JOIN film f
     ON f.film_id = fcat.film_id

WHERE cat.name IN ('Animation', 'Children','Classics','Comedy','Family','Music') )

SELECT t1.title,
       t1.name,
       t1.rental_duration,
       NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
    FROM t1
   
ORDER BY standard_quartile ;