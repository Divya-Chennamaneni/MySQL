
use mavenmovies

-- 1. Write a SQL query to count the number of characters except for the spaces for each actor. 
-- Return the first 10 actors name lengths along with their names.

select  length(concat(first_name,last_name)) as Actor_Name_length , 
concat(first_name,' ',last_name) as Actor_Full_Name from actor  
limit 10

-- 2. List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.

select concat(first_name,' ', last_name) as Oscar_awardees_Full_Name , 
length(concat(first_name,' ', last_name)) as Oscar_awardees_Full_Name_Length from actor_award
 where awards like '%oscar%'

-- or

select concat(first_name,' ', last_name) as Oscar_awardees_Full_Name , 
length(concat(first_name,' ', last_name)) as Oscar_awardees_Full_Name_Length from actor_award 
where awards in('oscar')



-- 3. Find the actors who have acted in the film ‘Frost Head.’

select concat(first_name, ' ', last_name) as Actor_Name from actor a
inner join film_actor fa
on a.actor_id=fa.actor_id
inner join film f
on fa.film_id= f.film_id
where title ='Frost Head'


-- 4. Pull all the films acted by the actor ‘Will Wilson.’

select f.film_id,f.title from film f
inner join film_actor fa
on f.film_id= fa.film_id 
inner join actor a 
on a.actor_id= fa.actor_id
where first_name='Will' and last_name='Wilson'

-- 5. Pull all the films which were rented and return them in the month of May.

select distinct f.title 
from rental r
inner join inventory i
on r.inventory_id=i.inventory_id
inner join film f
on i.film_id=f.film_id
where monthname(rental_date) = 'May' and monthname(return_date) ='May'


-- 6. Pull all the films with ‘Comedy’ category.

-- select * from film_category

select f.film_id,f.title
from category c
inner join film_category fc
on c.category_id=fc.category_id
inner join film f
on fc.film_id=f.film_id
where name = 'Comedy'