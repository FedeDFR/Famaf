
-- Parte 1 - Consultas

-- Query 1:

SELECT city.Name, country.Name, country.Region, country.GovernmentForm, city.Population
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY  city.Population DESC
LIMIT 10;

-- Query 2:

SELECT country.Name, country.Population, city.Name
FROM country
LEFT JOIN city ON country.Capital = city.ID
ORDER BY country.Population ASC
LIMIT 10;

-- Query 3:

SELECT country.Name, Continent, countrylanguage.Language
FROM countrylanguage
LEFT JOIN country ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = TRUE;


-- Query 4:

SELECT country.Name, country.SurfaceArea, city.Name
FROM country
LEFT JOIN city ON city.ID = country.Capital
ORDER BY country.SurfaceArea DESC 
LIMIT 20;

-- Query 5:

SELECT city.Name, countrylanguage.Language, countrylanguage.Percentage
FROM city
JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = TRUE
ORDER BY city.Population DESC;

-- Query 6:

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