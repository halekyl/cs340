-- Find the film_title of all films which feature both RALPH CRUZ and WILL WILSON
-- Order the results by film_title in ascending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.

SELECT title as film_title FROM
(SELECT
film.title,
COUNT(actor.first_name) as name_count
FROM film JOIN
film_actor ON film.film_id = film_actor.film_id JOIN
actor ON film_actor.actor_id = actor.actor_id
WHERE concat(actor.first_name,' ',actor.last_name) IN ('RALPH CRUZ','WILL WILSON')
GROUP BY film.title
ORDER BY film.title ASC)
A WHERE name_count = 2