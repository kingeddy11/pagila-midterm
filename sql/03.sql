/*
 * List the titles of all films in the 'Children' category that have a rating of 'R' or 'NC-17'.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */


select distinct(fi.title)
from film fi
inner join film_category fc on fi.film_id = fc.film_id
inner join category c on c.category_id = fc.category_id
where c.name = 'Children' and (fi.rating = 'R' or fi.rating = 'NC-17')
order by title;
