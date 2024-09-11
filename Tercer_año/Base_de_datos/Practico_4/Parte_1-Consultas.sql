
-- Parte 1 - Consultas

-- Query 1:

SELECT city.Name, country.Name
FROM country
LEFT JOIN city ON city.CountryCode = country.Code
WHERE country.Name IN (
        SELECT country.Name 
        FROM country
        WHERE country.Population < 10000
    );


-- Query 2:

SELECT city.Name
FROM city
WHERE city.Population >= (
    SELECT AVG(city.Population)
    FROM city
);


-- Query 3:

SELECT city.Name
FROM city
RIGHT JOIN country ON city.CountryCode = country.Code
WHERE city.Population >= (
    SELECT MAX(city.Population)
    FROM city
    RIGHT JOIN country ON city.CountryCode = country.Code
    WHERE country.Continent = 'Asia'
) AND country.Continent != 'Asia';


-- Query 4:

SELECT country.Name, countrylanguage.Language
FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'F' AND countrylanguage.Percentage > ALL (
    SELECT cl2.Percentage
    FROM countrylanguage cl2
    WHERE cl2.CountryCode = country.Code AND cl2.IsOfficial = 'T'
);


-- Query 5:

SELECT coun.Region
FROM country coun
WHERE 1000 > coun.SurfaceArea AND 100000 < SOME (
    SELECT city.Population
    FROM city
    WHERE city.CountryCode = coun.Code
);


-- Query 6:

-- Caso 1:

SELECT country.Name, MAX(city.Population) AS MaxCityPopulation
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.Name;

-- Caso 2:

SELECT country.Name, (
    SELECT city.Population
    FROM city
    WHERE city.CountryCode = country.Code
    ORDER BY city.Population DESC
    LIMIT 1
) AS MaxCityPopulation
FROM country;


-- Query 7:

SELECT country.Name, countrylanguage.Language
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'F' AND countrylanguage.Percentage > (
    SELECT AVG(cl2.Percentage)
    FROM countrylanguage cl2
    WHERE cl2.IsOfficial = 'T'
);


-- Query 8:

WITH population_total AS (
    SELECT city.CountryCode, SUM(city.Population) AS total_population_country
    FROM city
    GROUP BY city.CountryCode
)
SELECT country.Continent, SUM(population_total.total_population_country) AS total_population_continent
FROM country
JOIN population_total ON population_total.CountryCode = country.Code
GROUP BY country.Continent
ORDER BY total_population_continent DESC;


-- Query 9:

SELECT country.Continent, AVG(esperanza_entre40y70.esperanza_vida)
FROM country
JOIN (
    SELECT coun.Continent, coun.LifeExpectancy AS esperanza_vida
    FROM country coun
    WHERE coun.LifeExpectancy > 40 AND coun.LifeExpectancy < 70
) AS esperanza_entre40y70 ON esperanza_entre40y70.Continent = country.Continent
GROUP BY country.Continent;


-- Query 10:

WITH sumPopulation AS (
    WITH population_total AS (
        SELECT city.CountryCode, SUM(city.Population) AS sum_population_country
        FROM city
        GROUP BY city.CountryCode
    )
    SELECT country.Continent, SUM(population_total.sum_population_country) AS sum_population_continent
    FROM country
    JOIN population_total ON population_total.CountryCode = country.Code
    GROUP BY country.Continent;
)
WITH minPopulation AS (
    WITH min_population AS (
        SELECT city.CountryCode, MIN(city.Population) AS min_population_country
        FROM city
        GROUP BY city.CountryCode
    )
    SELECT country.Continent, MIN(min_population.min_population_country) AS min_population_continent
    FROM country
    JOIN min_population ON min_population.CountryCode = country.Code
    GROUP BY country.Continent;
)
WITH maxPopulation AS (
    WITH max_population AS (
        SELECT city.CountryCode, MAX(city.Population) AS max_population_country
        FROM city
        GROUP BY city.CountryCode
    )
    SELECT country.Continent, MAX(max_population.max_population_country) AS max_population_continent
    FROM country
    JOIN max_population ON max_population.CountryCode = country.Code
    GROUP BY country.Continent;
)
WITH promPopulation AS (
    WITH prom_population AS (
        SELECT city.CountryCode, AVG(city.Population) AS prom_population_country
        FROM city
        GROUP BY city.CountryCode
    )
    SELECT country.Continent, AVG(prom_population.prom_population_country) AS prom_population_continent
    FROM country
    JOIN prom_population ON prom_population.CountryCode = country.Code
    GROUP BY country.Continent;
)
SELECT  country.Continent, sum_population_continent, max_population_continent, min_population_continent, prom_population_continent
FROM country
GROUP BY country.Continent;
