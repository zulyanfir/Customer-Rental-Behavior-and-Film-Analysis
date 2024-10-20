# Knowing the renters and how much they rented.
SELECT 
	cust.customer_id, 
	cust.first_name, 
	cust.last_name, 
	COUNT(rent.rental_id) AS total_rentals
FROM 
	customer cust
JOIN 
	rental rent ON cust.customer_id = rent.customer_id
GROUP BY 
	cust.customer_id;

# Knowing the total number of movies per category and rating.
SELECT 
	cate.name AS category, 
	fil.rating, 
	COUNT(fil.film_id) AS total_films
FROM 
	film fil
JOIN 
	film_category fil_cate ON fil.film_id = fil_cate.film_id
JOIN 
	category cate ON fil_cate.category_id = cate.category_id
GROUP BY 
	cate.name, fil.rating;

# Knowing the most or least frequently rented movies.
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
	
