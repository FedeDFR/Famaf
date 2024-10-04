
-- Query 1:

CREATE TABLE directors (
    name CHAR(20) NOT NULL,
    last_name CHAR(20) NOT NULL,
    number_of_films INT NOT NULL
)

-- Query 2:

INSERT INTO directors (director_id, first_name, last_name, number_of_films)
SELECT 
    ROW_NUMBER() OVER (ORDER BY COUNT(fa.film_id) DESC) AS director_id,
    a.first_name, 
    a.last_name,
    COUNT(fa.film_id) AS number_of_films
FROM 
    (SELECT actor_id
     FROM film_actor
     GROUP BY actor_id
     ORDER BY COUNT(film_id) DESC
     LIMIT 5) top_actors
JOIN 
    film_actor fa ON top_actors.actor_id = fa.actor_id
JOIN 
    actor a ON fa.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name;

-- Query 3:

ALTER TABLE customer
ADD COLUMN premium_customer BOOLEAN NOT NULL DEFAULT FALSE;

-- Query 4:

UPDATE customer c
JOIN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    ORDER BY SUM(amount) DESC
    LIMIT 10
) top_customers ON c.customer_id = top_customers.customer_id
SET c.premium_customer = TRUE;

-- Query 5:

SELECT film.rating, COUNT(rating) 
FROM film
GROUP BY rating 
ORDER BY COUNT(rating) DESC 

-- Query 6:

SELECT 
    MIN(payment_date) AS primera_fecha_pago,
    MAX(payment_date) AS ultima_fecha_pago
FROM payment;

-- Query 7:

SELECT DATE_FORMAT(payment_date, '%Y-%m') AS mes_anio, AVG(amount) AS promedio_pago
FROM payment
GROUP BY mes_anio
ORDER BY mes_anio;

-- Query 8:

SELECT a.district, COUNT(r.rental_id) AS total_de_alquileres
FROM address a 
JOIN customer c ON c.address_id  = a.address_id 
JOIN rental r ON r.customer_id = c.customer_id 
GROUP BY a.district 
ORDER BY total_de_alquileres DESC
LIMIT 10;

-- Query 9:

ALTER TABLE inventory 
ADD COLUMN stock INT DEFAULT 5;

-- Query 10:

DELIMITER $$

CREATE TRIGGER update_stock
AFTER INSERT ON rental
FOR EACH ROW
BEGIN
    UPDATE inventory
    SET stock = stock - 1
    WHERE inventory_id = NEW.inventory_id;
END$$

DELIMITER ;

-- Query 11:

CREATE TABLE fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT,
    CONSTRAINT fk_rental_id FOREIGN KEY (rental_id) REFERENCES rental(rental_id),
    amount DECIMAL(7,2)
);

-- Query 12:

