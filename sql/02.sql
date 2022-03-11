/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * You're where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */


select count(distinct(r.customer_id))
from rental r
inner join inventory i on r.inventory_id = i.inventory_id
inner join film fi on fi.film_id = i.film_id
inner join film_actor fa on fi.film_id = fa.film_id
inner join actor a on fa.actor_id = a.actor_id
where a.first_name = 'RUSSELL' and last_name = 'BACALL';
