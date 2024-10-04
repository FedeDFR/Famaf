-- Parte 1 - Consultas

USE world; -- Selecciona la base de datos 'world' para ejecutar las consultas.

-- Query 1:
-- Selecciona los nombres y regiones de todos los países y los ordena alfabéticamente por nombre y región.
SELECT Name, Region
FROM country
ORDER BY Name, Region ASC;

-- Query 2:
-- Selecciona los nombres y poblaciones de los países y los ordena de mayor a menor población, limitando el resultado a los 10 países más poblados.
SELECT Name, Population
FROM country
ORDER BY Population DESC
LIMIT 10;

-- Query 3:
-- Selecciona los nombres, regiones, áreas de superficie y formas de gobierno de los países y los ordena de mayor a menor área de superficie, limitando el resultado a los 10 países más grandes por superficie.
SELECT Name, Region, SurfaceArea, GovernmentForm 
FROM country
ORDER BY SurfaceArea DESC
LIMIT 10;

-- Query 4:
-- Selecciona todos los campos de los países que no tienen un año de independencia registrado (IndepYear es NULL).
SELECT * 
FROM country
WHERE IndepYear IS NULL;

-- Query 5:
-- Selecciona los idiomas y sus porcentajes de uso en los países donde el idioma es oficial, ordenando los resultados por porcentaje de uso en orden descendente.
SELECT Language, Percentage
FROM countrylanguage
WHERE IsOfficial = TRUE
ORDER BY Percentage DESC;