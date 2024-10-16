# Customer-Rental-Behavior-and-Film-Analysis
Welcome to my first portfolio project about databases. This project focuses on Data Retrieval to retrieve information from the Sakila database using MySQL.  

The Sakila database is a well-normalized schema that models a DVD rental store, featuring things like movies, actors, movie-actor relationships, and a central inventory table that links movies, stores, and rentals.

In this portfolio, the information to be retrieved is about customer rental behavior and film analysis with the aim of knowing the following:
1. Knowing the renters and how much they rented.
2. Knowing the total number of movies per category and rating.
3. Knowing the most and least frequently rented movies.


Query for knowing the renters and how much they rented:
```SQL
select 
	cust.customer_id,
	cust.first_name,
	cust.last_name,
	cust.email,
	count(rent.customer_id) as number_of_rent
from 
	customer cust
join 
	rental rent on cust.customer_id = rent.customer_id
group by cust.customer_id
order by number_of_rent desc # Sorting from the tenants with the highest number of rentals
limit 10;
```
With the query above, we can find out the 10 tenants with the highest number of rentals in descending order.


![image](https://github.com/user-attachments/assets/f5783745-f7ab-4cc0-9856-132d0c6caef2)


Query for knowing the total number of rentals made:
```SQL
select 
	cate.name as category_name,
	fil.rating,
	count(fil.film_id) as total_film
from 
	film fil
join 
	film_category fil_cate on fil_cate.film_id = fil.film_id 
join 
	category cate on cate.category_id = fil_cate.category_id
group by cate.name, fil.rating;
```

![image](https://github.com/user-attachments/assets/59e324b8-4eeb-44bb-8820-ec2a6d42f975)


Query for knowing the most frequently rented movies:
```SQL
# Ordered by most rented movies
SELECT 
	fil.title, 
	COUNT(rent.rental_id) AS total_rentals
FROM 
	film fil
JOIN 
	inventory inven ON fil.film_id = inven.film_id
JOIN 
	rental rent ON inven.inventory_id = rent.inventory_id
GROUP BY 
	fil.title
ORDER BY 
	total_rentals DESC;  
```

![image](https://github.com/user-attachments/assets/a7ad4ba4-caa1-448b-8089-ab8d5b6cff02)


Query for knowing the least frequently rented movies:
```SQL
# Ordered by least rented movies
SELECT 
	fil.title, 
	COUNT(rent.rental_id) AS total_rentals
FROM 
	film fil
JOIN 
	inventory inven ON fil.film_id = inven.film_id
JOIN 
	rental rent ON inven.inventory_id = rent.inventory_id
GROUP BY 
	fil.title
ORDER BY 
	total_rentals ASC;
```

![image](https://github.com/user-attachments/assets/c14bfad4-5e0d-4d6b-8775-771a85b7a846)

