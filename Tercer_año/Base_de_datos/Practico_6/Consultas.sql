
-- Query 1:

SELECT e.officeCode , COUNT(e.officeCode) AS Num_de_empleados
FROM employees e 
GROUP BY e.officeCode 
ORDER BY Num_de_empleados DESC
LIMIT 1;
-- Query 2:

SELECT o.officeCode, AVG(o2.orderNumber) AS Num_de_ordenes
FROM offices o 
JOIN employees e ON e.officeCode = o.officeCode 
JOIN customers c ON c.salesRepEmployeeNumber = e.employeeNumber 
JOIN orders o2 ON o2.customerNumber = c.customerNumber 
GROUP BY o.officeCode 
ORDER BY Num_de_ordenes DESC

SELECT o.officeCode, COUNT(o2.orderNumber) AS Num_de_ordenes
FROM offices o 
JOIN employees e ON e.officeCode = o.officeCode 
JOIN customers c ON c.salesRepEmployeeNumber = e.employeeNumber 
JOIN orders o2 ON o2.customerNumber = c.customerNumber 
GROUP BY o.officeCode 
ORDER BY Num_de_ordenes DESC

-- Query 3:

SELECT DATE_FORMAT(p.paymentDate, '%Y-%m') AS mes_año, AVG(p.amount), MAX(p.amount), MIN(p.amount)
FROM payments p 
GROUP BY mes_año
ORDER BY mes_año DESC;

-- Query 4:

DELIMITER //

CREATE PROCEDURE UpdateCredit(
    IN p_customerNumber INT,
    IN p_newCreditLimit DECIMAL(10,2)
)
BEGIN
    UPDATE customers
    SET creditLimit = p_newCreditLimit
    WHERE customerNumber = p_customerNumber;
END //

DELIMITER ;

-- Query 5:

CREATE VIEW Premium_customers AS
SELECT c.customerName, c.city, SUM(p.amount) AS total_gastado
FROM payments p
JOIN customers c ON c.customerNumber = p.customerNumber
GROUP BY c.customerName;

-- Test
SELECT * FROM premium_customers;

-- Query 6:

DELIMITER //

CREATE FUNCTION emplyee_of_the_month (year INT, month INT)
    RETURNS VARCHAR(255)
    BEGIN
	    DECLARE employee_name VARCHAR(255);
    	SELECT CONCAT(e.lastName, ' ', e.firstName) INTO  employee_name
    	FROM employees e
    	JOIN customers c ON c.salesRepEmployeeNumber = e.employeeNumber
    	JOIN payments p ON p.customerNumber = c.customerNumber
    	WHERE 
			MONTH(o.orderDate) = input_month AND 
			YEAR(o.orderDate) = input_year
		GROUP BY e.employeeNumber
		ORDER BY COUNT(o.orderNumber) DESC 
		LIMIT 1;
    	RETURN employee_name;
    END //
DELIMITER ;

-- Query 7:

CREATE TABLE Product_refillment (
	refillmentID INT AUTO_INCREMENT PRIMARY KEY,
	productCode VARCHAR(15),
	CONSTRAINT fk_productCode FOREIGN KEY (productCode) REFERENCES products(productCode),
	orderDate DATE,
	quantity INT
)


-- Query 8:

DROP TRIGGER IF EXISTS restock_product;
DELIMITER //
CREATE TRIGGER restock_product 
AFTER INSERT ON orderdetails 
FOR EACH ROW
BEGIN
	DECLARE currentStock INT;
	-- Obtener la cantidad en stock del producto
	SELECT p.quantityInStock INTO currentStock
	FROM products p 
	WHERE productCode = NEW.productCode;
	-- Si el stock actual es menor a 10, generar un pedido de reabastecimiento
	IF currentStock < 10 THEN
		INSERT INTO product_refillment (productCode, orderDate, quantity)
        VALUES (NEW.productCode, CURDATE(), 10);
		-- Actualizar el stock de productos
       	UPDATE products
        SET quantityInStock = quantityInStock + 10
        WHERE productCode = NEW.productCode;
    END IF;    
END;//
DELIMITER ;




DELIMITER ;

-- Query 9:

CREATE ROLE empleado;
GRANT SELECT ON classicmodels.* TO empleado;
GRANT CREATE VIEW ON classicmodels.* TO empleado;

/*CREATE ROLE empleado;:

Esta línea crea un nuevo rol llamado empleado. Un rol en SQL es un conjunto de permisos que se pueden asignar a uno o más usuarios. Esto facilita la gestión de permisos, ya que puedes asignar el rol a varios usuarios en lugar de asignar permisos individualmente a cada usuario.
GRANT SELECT ON classicmodels.* TO empleado;:

Esta línea otorga el permiso de SELECT (selección) al rol empleado sobre todas las tablas de la base de datos classicmodels. Esto significa que cualquier usuario que tenga asignado el rol empleado podrá realizar consultas de selección (lectura) en cualquier tabla dentro de la base de datos classicmodels.
GRANT CREATE VIEW ON classicmodels.* TO empleado;:

Esta línea otorga el permiso de CREATE VIEW (crear vistas) al rol empleado sobre todas las tablas de la base de datos classicmodels. Esto permite que cualquier usuario con el rol empleado pueda crear vistas basadas en las tablas de la base de datos classicmodels.*/

