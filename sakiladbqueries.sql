-- Display the first and last name of each actor in a single column in upper case
-- Letters. Name the column Actor Name.
SELECT UPPER(concat(first_name,' ',last_name)) As `Actor Name` FROM actor;

-- You need to find the ID number, first name, and last name of an actor, of
-- whom you know only the first name, "Joe."
SELECT actor_id,first_name,last_name FROM actor where first_name='Joe';

-- Find all actors whose last name contain the letters GEN.
SELECT * FROM actor WHERE last_name like '%GEN%';

-- Find all actors whose last names contain the letters "LI". This time, order the
-- rows by last name and first name, in that order.
SELECT * FROM actor WHERE last_name like '%LI%' ORDER BY last_name ,first_name ASC;

-- Using IN, display the country_id and country columns of the following
-- countries: Afghanistan, Bangladesh, and China
SELECT * FROM country where country IN ('Afghanistan','Bangladesh','China');


-- List last names of actors and the number of actors who have that last name,
-- but only for names that are shared by at least two actors
SELECT last_name,COUNT(*) AS actor_count FROM actor group by last_name HAVING COUNT(*) > 2 order by actor_count DESC;

-- The actor HARPO WILLIAMS was accidentally entered in the actor table
-- as GROUCHO WILLIAMS. Write a query to fix the record, and another to verify
-- the change.
select actor_id from actor where first_name='GROUCHO' and last_name='WILLIAMS';
update actor set first_name='HARPO' where actor_id=172;


select * from actor where last_name='WILLIAMS';


-- Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out
-- that GROUCHO was the correct name after all! In a single query, if the first name
-- of the actor is currently HARPO, change it to GROUCHO. Then write a query to
-- verify your change
UPDATE actor a
JOIN (
    SELECT actor_id 
    FROM actor 
    WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS'
) sub ON a.actor_id = sub.actor_id
SET a.first_name = 'GROUCHO';

select * from actor where first_name='GROUCHO';


-- Use JOIN to display the total amount rung up by each staff member in
-- August of 2005. Use tables staff and payment
select * from staff;
select * from payment;
select S.first_name,S.last_name,sum(P.amount) FROM  Staff S join payment P ON P.staff_id=S.staff_id
where  DATE_FORMAT(P.payment_date, '%Y-%m') = '2005-08'
group by S.first_name,S.last_name;

-- List each film and the number of actors who are listed for that film. Use
-- tables film_actor and film. Use inner join.
Select F.title ,COUNT(FA.actor_id) AS NumberofActors from film F join film_actor FA ON F.film_id=FA.film_id Group by F.Title order by NumberofActors DESC;

-- How many copies of the film Hunchback Impossible exist in the inventory
-- system?
Select F.title ,COUNT(I.film_id) AS Number_in_Inventory from film F join inventory I ON F.film_id=I.film_id
where F.title='Hunchback Impossible'
 Group by F.Title;
 
 -- The music of Queen and Kris Kristofferson have seen an unlikely resurgence.
-- As an unintended consequence, films starting with the letters K and Q have
-- also soared in popularity. Use subqueries to display the titles of movies
-- starting with the letters K and Q whose language is English.
select * from film;
select * from language;
select Title from Film where title Like('k%') OR title Like('Q%') AND language_id=(select language_id from language where name="English");

-- Insert a record to represent Mary Smith renting the movie
-- ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today. Then write a
-- query to capture the exact row you entered into the rental table

select * from customer where first_name='Mary' and last_name='Smith';
select * from rental order by rental_id desc;
INSERT INTO `sakila`.`rental`
(
`rental_date`,
`inventory_id`,
`customer_id`,
`return_date`,
`staff_id`,
`last_update`)
VALUES
(
CURRENT_TIMESTAMP,
1,
1,null,
1,
 CURRENT_TIMESTAMP);
 
 select * from rental order by rental_id desc;












 