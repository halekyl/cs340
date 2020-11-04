-- We want to find out how many of each category of film MAE HOFFMAN has starred in.

-- So return a table with category_name and the count of the number_of_films that MAE was in that category.

-- Your query should return every category even if MAE has been in no films in that category

-- Order by the category name in descending order.

SELECT cate.name as category_name, COUNT(act.actor_id) as number_of_films FROM category cate
    LEFT JOIN film_category AS fc ON cate.category_id=fc.category_id
    LEFT JOIN film AS f ON fc.film_id=f.film_id
    LEFT JOIN film_actor AS fa ON f.film_id=fa.film_id 
    LEFT JOIN actor AS act ON 
        (fa.actor_id=act.actor_id) AND 
        (act.first_name='MAE' AND act.last_name='HOFFMAN')
GROUP BY cate.category_id
ORDER BY cate.name DESC