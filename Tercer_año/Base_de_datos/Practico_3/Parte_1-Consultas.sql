-- Parte 1 - Consultas

USE world;

-- Query 1:
-- Selecciona los nombres de las ciudades, nombres de los países, regiones, formas de gobierno y poblaciones de las ciudades.
-- Ordena los resultados por la población de las ciudades en orden descendente y limita la salida a las 10 ciudades más pobladas.
SELECT city.Name, country.Name, country.Region, country.GovernmentForm, city.Population
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY  city.Population DESC
LIMIT 10;

-- Query 2:
-- Selecciona los nombres de los países, sus poblaciones y los nombres de sus capitales.
-- Ordena los resultados por la población de los países en orden ascendente y limita la salida a los 10 países menos poblados.
SELECT country.Name, country.Population, city.Name
FROM country
LEFT JOIN city ON country.Capital = city.ID
ORDER BY country.Population ASC
LIMIT 10;

-- Query 3:
-- Selecciona los nombres de los países, continentes y lenguajes oficiales.
-- Filtra los resultados para mostrar solo los lenguajes que son oficiales en los países.
SELECT country.Name, Continent, countrylanguage.Language
FROM countrylanguage
LEFT JOIN country ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = TRUE;

-- Query 4:
-- Selecciona los nombres de los países, sus áreas superficiales y los nombres de sus capitales.
-- Ordena los resultados por el área superficial de los países en orden descendente y limita la salida a los 20 países más grandes por superficie.
SELECT country.Name, country.SurfaceArea, city.Name
FROM country
LEFT JOIN city ON city.ID = country.Capital
ORDER BY country.SurfaceArea DESC 
LIMIT 20;

-- Query 5:
-- Selecciona los nombres de las ciudades, lenguajes oficiales y el porcentaje de hablantes de esos lenguajes en las ciudades.
-- Ordena los resultados por la población de las ciudades en orden descendente.
SELECT city.Name, countrylanguage.Language, countrylanguage.Percentage
FROM city
JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = TRUE
ORDER BY city.Population DESC;

-- Query 6:
-- Selecciona los nombres de las 10 ciudades más pobladas y las 10 ciudades con más de 100 habitantes ordenadas por población ascendente.
-- Combina los resultados de ambas selecciones utilizando UNION.
(
    SELECT city.Name
    FROM city
    ORDER BY city.Population DESC
    LIMIT 10
)
    UNION
(
    SELECT city.Name
    FROM city
    WHERE city.Population > 100
    ORDER BY city.Population ASC
    LIMIT 10
);

-- Query 7:
-- Selecciona los nombres de los países donde el lenguaje oficial es inglés o francés.
-- Intersecta estos resultados con los nombres de los países donde el lenguaje oficial es cualquier otro.
(
    SELECT country.Name
    FROM country
    JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.IsOfficial = TRUE
)
    INTERSECT
(
    SELECT country.Name
    FROM country
    JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.Language = 'English' OR countrylanguage.Language = 'French'
);

-- Query 8:
-- Selecciona los nombres de los países donde se habla inglés.
-- Excluye de estos resultados los nombres de los países donde también se habla español.
(
    SELECT country.Name
    FROM country
    JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.Language = 'English'
)
    EXCEPT
(
    SELECT country.Name
    FROM country
    JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.Language = 'Spanish' 
);