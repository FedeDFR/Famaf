-- Parte 2 - Preguntas

-- Query 1:

-- Caso 1:
-- Selecciona el nombre de cada país y el nombre y población de su ciudad más poblada.
SELECT country.Name, (
    -- Subconsulta para obtener el nombre de la ciudad más poblada de cada país
    SELECT city.Name
    FROM city
    WHERE city.CountryCode = country.Code
    ORDER BY city.Population DESC
    LIMIT 1
    ) AS MaxCityName, (
    -- Subconsulta para obtener la población de la ciudad más poblada de cada país
    SELECT city.Population
    FROM city
    WHERE city.CountryCode = country.Code
    ORDER BY city.Population DESC
    LIMIT 1
    ) AS MaxCityPopulation
FROM country
-- Ordena los resultados por la población de la ciudad más poblada en orden descendente
ORDER BY MaxCityPopulation DESC;

-- Caso 2:
-- Selecciona el nombre de cada país, el nombre de su ciudad más poblada y la población de esa ciudad.
SELECT country.Name AS CountryName, city.Name AS MaxCityName, city.Population AS MaxCityPopulation
FROM country
-- Realiza una unión con la tabla de ciudades basada en el código del país
JOIN city ON city.CountryCode = country.Code
-- Filtra para obtener solo la ciudad más poblada de cada país
WHERE city.Population = (
    SELECT MAX(city2.Population)
    FROM city city2
    WHERE city2.CountryCode = country.Code
)
-- Ordena los resultados por la población de la ciudad más poblada en orden descendente
ORDER BY city.Population DESC;