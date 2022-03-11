/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch similar movies.
 * You've already watched all other movies with the same actors,
 * so now you need a new strategy for finding similar movies.
 * You decide that two movies X and Y are similar if they have been rented by the same customer,
 * and you further quantify this similarity by defining the "similarity score" to be the number of distinct customers that have rented both X and Y.
 *
 * Write a SQL SELECT query that:
 * computes the "similarity score" for all movies with 'AMERICAN CIRCUS'
 * and orders the results from highest to lowest.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 * NOTE:
 * You do not have to include movies with similarity score 0 in your results (but you may if you like).
 */


select title, count(*) as "similarity score"
from (
    select distinct fi.title, c.customer_id
    from film fi
    inner join inventory i on fi.film_id = i.film_id
    inner join rental r on r.inventory_id = i.inventory_id
    inner join customer c on c.customer_id = r.customer_id
    where c.customer_id in (
        select distinct(c.customer_id)
        from film fi
        inner join inventory i on fi.film_id = i.film_id
        inner join rental r on r.inventory_id = i.inventory_id
        inner join customer c on c.customer_id = r.customer_id
        where fi.title in
        (select title
            from film
            where title = 'AMERICAN CIRCUS')
        order by c.customer_id)
    order by fi.title
) t
group by title
order by count(*) desc, title;
