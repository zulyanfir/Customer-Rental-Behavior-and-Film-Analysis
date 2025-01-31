# Customer Rental Behavior and Film Analysis
Welcome to my first portfolio project about databases. This project focuses on Data Retrieval to retrieve information from the Sakila database using MySQL.  

The Sakila database is a well-normalized schema that models a DVD rental store, featuring things like movies, actors, movie-actor relationships, and a central inventory table that links movies, stores, and rentals. The sample Sakila database can be downloaded from the official MySQL website at the following link https://dev.mysql.com/doc/sakila/en/sakila-installation.html

In this portfolio, the information to be retrieved is about customer rental behavior and film analysis with the aim of knowing the following:
1. Knowing the renters and how much they rented.
2. Knowing the total number of movies per category and rating.
3. Knowing the most and least frequently rented movies.

These are the tables used to analyze Customer Rental Behavior and Film:
![image](https://github.com/user-attachments/assets/57af5dba-5ac5-486a-8012-b67df3aff750)


Query for knowing the renters and how much they rented:
```SQL
SELECT 
	cust.customer_id, 
	cust.first_name, 
	cust.last_name, 
	cust.email,
	COUNT(rent.rental_id) AS total_rentals
FROM 
	customer cust
LEFT JOIN 
	rental rent ON cust.customer_id = rent.customer_id
GROUP BY 
	cust.customer_id
ORDER BY total_rentals DESC;
```
With the query above, we can find out the 10 tenants with the highest number of rentals in descending order. The customer named Eleanor Hunt who is the customer with the highest number of rentals, which is 46 rentals.


![image](https://github.com/user-attachments/assets/5a9cf9af-764a-4da5-a675-16921847d0b0)


Query for knowing the total number of movies per category and rating:
```SQL
SELECT 
	cate.name AS category, 
	fil.rating, 
	COUNT(fil.film_id) AS total_films
FROM 
	film fil
LEFT JOIN 
	film_category fil_cate ON fil.film_id = fil_cate.film_id
LEFT JOIN 
	category cate ON fil_cate.category_id = cate.category_id
GROUP BY 
	cate.name, fil.rating
ORDER BY category;
```

Using the query above, we can find out the number of movies distributed by category and rating.

![image](https://github.com/user-attachments/assets/77af342c-f9a7-4d94-bbb6-5f6314b096a9)



Query for knowing the most frequently rented movies:
```SQL
SELECT 
	fil.title, 
	COUNT(rent.rental_id) AS total_rentals
FROM 
	film fil
LEFT JOIN 
	inventory inven ON fil.film_id = inven.film_id
LEFT JOIN 
	rental rent ON inven.inventory_id = rent.inventory_id
GROUP BY 
	fil.title
ORDER BY 
	total_rentals desc
LIMIT 10; 
```

With the query above, it can be seen that the most rented movie title is Bucket Brotherhood with 34 rentals.

![image](https://github.com/user-attachments/assets/b9b00a0a-083e-468b-92fa-a1431db5e2b6)


Query for knowing the least frequently rented movies:
```SQL
SELECT 
	fil.title, 
	cate.name as category,
	COUNT(rent.rental_id) AS total_rentals
FROM 
	film fil
LEFT JOIN 
	inventory inven ON fil.film_id = inven.film_id
LEFT JOIN 
	rental rent ON inven.inventory_id = rent.inventory_id
left join 
	film_category fil_cate ON fil_cate.film_id = fil.film_id 
left join
	category cate ON cate.category_id = fil_cate.category_id 
GROUP BY 
	fil.title, cate.name
HAVING total_rentals = 0
ORDER BY category;
```

With the above query, it can be seen that the least rented movie titles are Mixed Doors, Train Bunch, and Hardly Robbers with a total of 4 rentals.

![image](https://github.com/user-attachments/assets/c9b000ad-8ff1-4eaa-85c9-24138a8f27d1)


