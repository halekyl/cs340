-- Find the first_name, last_name and total_combined_film_length of Animation films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Animation films) and the total length of Animation films they have been in.
-- Look at the category table to figure out how to filter data for Animation films.
-- Order your results by the actor_id in ascending order.
-- Put query for Q3 here

SELECT a.actor_id, a.first_name,a.last_name, coalesce(Animation.sum, 0) as total_combined_film_length
FROM actor a
LEFT JOIN
(SELECT a.actor_id AS actor_id, SUM(f.length) AS sum FROM actor a
INNER JOIN film_actor fa ON a.actor_id=fa.actor_id
INNER JOIN film f ON fa.film_id=f.film_id
INNER JOIN film_category fc ON f.film_id=fc.film_id
INNER JOIN category cat ON fc.category_id=cat.category_id
WHERE cat.name='Animation'
GROUP BY a.actor_id ORDER BY sum ASC)
AS Animation ON a.actor_id=Animation.actor_id
ORDER BY a.actor_id ASC
