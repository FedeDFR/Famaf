-- Parte 1 - Consultas

USE world;

-- Query 1:

SELECT Name, Region
FROM country
ORDER BY Name, Region ASC;

-- Query 2:

SELECT Name, Population
FROM country
ORDER BY Population DESC
LIMIT 10;

-- Query 3:

SELECT Name, Region, SurfaceArea, GovernmentForm 
FROM country
ORDER BY SurfaceArea DESC
LIMIT 10;

-- Query 4:

SELECT * 
FROM country
WHERE IndepYear IS NULL;

-- Query 5:

SELECT Language, Percentage
FROM countrylanguage
WHERE IsOfficial = TRUE
ORDER BY Percentage DESC;