ALTER TABLE customer
ADD COLUMN premium_customer CHAR(1) NOT NULL DEFAULT 'F';

UPDATE customer
SET premium_customer = 'T'
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    ORDER BY SUM(amount) DESC
    LIMIT 10
);