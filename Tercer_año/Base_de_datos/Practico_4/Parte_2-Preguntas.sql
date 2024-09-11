
-- Parte 2 - Preguntas

-- Query 1:

-- Caso 1:

SELECT country.Name, (
    SELECT city.Name
    FROM city
    WHERE city.CountryCode = country.Code
    ORDER BY city.Population DESC
    LIMIT 1
	) AS MaxCityName, (
	SELECT city.Population
    FROM city
    WHERE city.CountryCode = country.Code
    ORDER BY city.Population DESC
    LIMIT 1
	) AS MaxCityPopulation
FROM country
ORDER BY MaxCityPopulation DESC;

-- Caso 2:

SELECT country.Name AS CountryName, city.Name AS MaxCityName, city.Population AS MaxCityPopulation
FROM country
JOIN city ON city.CountryCode = country.Code
WHERE city.Population = (
    SELECT MAX(city2.Population)
    FROM city city2
    WHERE city2.CountryCode = country.Code
)
ORDER BY city.Population DESC;

