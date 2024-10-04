-- Parte 1 - Consultas

-- Query 1:
-- Selecciona el nombre de las ciudades y los países donde la población del país es menor a 10,000.
-- Primero, se hace una subconsulta para obtener los nombres de los países con población menor a 10,000.
-- Luego, se hace un LEFT JOIN entre las tablas 'country' y 'city' para obtener las ciudades de esos países.
SELECT city.Name, country.Name
FROM country
LEFT JOIN city ON city.CountryCode = country.Code
WHERE country.Name IN (
        SELECT country.Name 
        FROM country
        WHERE country.Population < 10000
    );

-- Query 2:
-- Selecciona el nombre de las ciudades cuya población es mayor o igual al promedio de la población de todas las ciudades.
-- Primero, se calcula el promedio de la población de todas las ciudades.
-- Luego, se seleccionan las ciudades cuya población es mayor o igual a ese promedio.
SELECT city.Name
FROM city
WHERE city.Population >= (
    SELECT AVG(city.Population)
    FROM city
);

-- Query 3:
-- Selecciona el nombre de las ciudades que no están en Asia y cuya población es mayor o igual a la población máxima de una ciudad en Asia.
-- Primero, se calcula la población máxima de una ciudad en Asia.
-- Luego, se seleccionan las ciudades fuera de Asia cuya población es mayor o igual a esa población máxima.
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
-- Selecciona el nombre de los países y los idiomas no oficiales que tienen un porcentaje mayor que cualquier idioma oficial en el mismo país.
-- Primero, se hace un LEFT JOIN entre las tablas 'country' y 'countrylanguage'.
-- Luego, se seleccionan los idiomas no oficiales cuyo porcentaje es mayor que el porcentaje de cualquier idioma oficial en el mismo país.
SELECT country.Name, countrylanguage.Language
FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'F' AND countrylanguage.Percentage > ALL (
    SELECT cl2.Percentage
    FROM countrylanguage cl2
    WHERE cl2.CountryCode = country.Code AND cl2.IsOfficial = 'T'
);

-- Query 5:
-- Selecciona las regiones de los países que tienen una superficie menor a 1000 y al menos una ciudad con una población mayor a 100,000.
-- Primero, se filtran los países con una superficie menor a 1000.
-- Luego, se verifica que al menos una ciudad en esos países tenga una población mayor a 100,000.
SELECT coun.Region
FROM country coun
WHERE 1000 > coun.SurfaceArea AND 100000 < SOME (
    SELECT city.Population
    FROM city
    WHERE city.CountryCode = coun.Code
);

-- Query 6:
-- Caso 1:
-- Selecciona el nombre de los países y la población máxima de sus ciudades.
-- Se hace un JOIN entre las tablas 'country' y 'city' y se agrupan los resultados por país.
-- Luego, se selecciona la población máxima de las ciudades en cada país.
SELECT country.Name, MAX(city.Population) AS MaxCityPopulation
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.Name;

-- Caso 2:
-- Selecciona el nombre de los países y la población de la ciudad más poblada en cada país.
-- Se hace una subconsulta para obtener la población de la ciudad más poblada en cada país.
-- Luego, se seleccionan los nombres de los países y la población de su ciudad más poblada.
SELECT country.Name, (
    SELECT city.Population
    FROM city
    WHERE city.CountryCode = country.Code
    ORDER BY city.Population DESC
    LIMIT 1
) AS MaxCityPopulation
FROM country;

-- Query 7:
-- Selecciona el nombre de los países y los idiomas no oficiales que tienen un porcentaje mayor que el promedio de los idiomas oficiales.
-- Primero, se hace un JOIN entre las tablas 'country' y 'countrylanguage'.
-- Luego, se seleccionan los idiomas no oficiales cuyo porcentaje es mayor que el promedio de los idiomas oficiales.
SELECT country.Name, countrylanguage.Language
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'F' AND countrylanguage.Percentage > (
    SELECT AVG(cl2.Percentage)
    FROM countrylanguage cl2
    WHERE cl2.IsOfficial = 'T'
);

-- Query 8:
-- Calcula la población total por continente sumando la población de todas las ciudades en cada continente y ordena los resultados de mayor a menor.
-- Primero, se calcula la población total por país.
-- Luego, se agrupan los resultados por continente y se suman las poblaciones totales de los países en cada continente.
-- Finalmente, se ordenan los resultados de mayor a menor.
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
-- Calcula la esperanza de vida promedio por continente para los países cuya esperanza de vida está entre 40 y 70 años.
-- Primero, se filtran los países cuya esperanza de vida está entre 40 y 70 años.
-- Luego, se agrupan los resultados por continente y se calcula la esperanza de vida promedio en cada continente.
SELECT country.Continent, AVG(esperanza_entre40y70.esperanza_vida)
FROM country
JOIN (
    SELECT coun.Continent, coun.LifeExpectancy AS esperanza_vida
    FROM country coun
    WHERE coun.LifeExpectancy > 40 AND coun.LifeExpectancy < 70
) AS esperanza_entre40y70 ON esperanza_entre40y70.Continent = country.Continent
GROUP BY country.Continent;

-- Query 10:
-- Calcula la suma, el máximo, el mínimo y el promedio de la población de las ciudades por continente.
-- Primero, se calculan la suma, el máximo, el mínimo y el promedio de la población por país.
-- Luego, se agrupan los resultados por continente y se calculan la suma, el máximo, el mínimo y el promedio de la población en cada continente.
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