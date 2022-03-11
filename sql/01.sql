/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */


select distinct(title)
from film
where title not like '%F%'
and title not in
(select fi.title
    from film fi
    inner join film_actor fa on fi.film_id = fa.film_id
    inner join actor a on a.actor_id = fa.actor_id
    where a.first_name like '%F%' or a.last_name like '%F%')
and title not in
(select fi.title
    from film fi
    inner join inventory i on i.film_id = fi.film_id
    inner join rental r on i.inventory_id = r.inventory_id
    inner join customer c on r.customer_id = c.customer_id
    where c.first_name like '%F%' or c.last_name like '%F%')
order by title;
