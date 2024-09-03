
-- Parte 2 - Preguntas

-- 1) ¿Devuelven los mismos valores las siguientes consultas? ¿Por qué?

SELECT city.Name, country.Name
FROM city
INNER JOIN country ON city.CountryCode = country.Code AND country.Name = 'Argentina';

SELECT city.Name, country.Name
FROM city
INNER JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Argentina';

-- Si las dos consultas devuelven lo mismo.

-- 2) ¿Y si en vez de INNER JOIN fuera un LEFT JOIN?

-- Devuelven lo mismo pero si en algun caso hay alguna ciudad NULL esta se veria 
-- con LEFT JOIN, cosa que con INNER JOIN no.