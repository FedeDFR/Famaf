-- Iniciar MySQL

-- Poner el comando: mysql -u root -p

-- SHOW DATABASES;
-- USE nombre_de_la_base_de_datos;
-- SHOW TABLES;
-- DESCRIBE nombre_de_la_tabla;
-- DROP TABLE nombre_de_la_tabla;

-- ALTER TABLE directors
-- ADD COLUMN director_id INT;

-- ALTER TABLE customer
-- DROP COLUMN premium_customer;



-- PARTE 1 - DDL

USE world;
USE world; -- Selecciona la base de datos 'world' para ejecutar las siguientes operaciones.

-- Paso 2:

CREATE TABLE country (
    Code CHAR(3) NOT NULL, -- Código del país, clave primaria.
    Name VARCHAR(255), -- Nombre del país.
    Continent VARCHAR(50), -- Continente donde se encuentra el país.
    Region VARCHAR(50), -- Región del país.
    SurfaceArena DECIMAL(11,2), -- Área superficial del país.
    IndepYear SMALLINT, -- Año de independencia del país.
    Population INT, -- Población del país.
    LifeExpectancy DECIMAL(3,1), -- Esperanza de vida en el país.
    GNP DECIMAL(10,2), -- Producto Nacional Bruto del país.
    GNPOld DECIMAL(10,2), -- Producto Nacional Bruto antiguo del país.
    LocalName VARCHAR(50), -- Nombre local del país.
    GovernmentForm VARCHAR(255), -- Forma de gobierno del país.
    HeadOfState VARCHAR(50), -- Jefe de estado del país.
    Capital INT, -- Capital del país.
    Code2 VARCHAR(3), -- Código alternativo del país.
    
    PRIMARY KEY (Code) -- Define 'Code' como clave primaria.
);

-- Crea la tabla 'country' con varias columnas para almacenar información sobre los países. La columna 'Code' es la clave primaria.

CREATE TABLE city (
    ID INT NOT NULL, -- Identificador de la ciudad, clave primaria.
    Name VARCHAR(50), -- Nombre de la ciudad.
    CountryCode CHAR(3), -- Código del país al que pertenece la ciudad.
    District VARCHAR(50), -- Distrito de la ciudad.
    Population INT, -- Población de la ciudad.
    
    PRIMARY KEY (ID), -- Define 'ID' como clave primaria.
    CONSTRAINT `city_ibfk_1` FOREIGN KEY (CountryCode) REFERENCES country (Code) -- Define 'CountryCode' como clave foránea que referencia 'Code' en la tabla 'country'.
);

-- Crea la tabla 'city' con varias columnas para almacenar información sobre las ciudades. La columna 'ID' es la clave primaria y 'CountryCode' es una clave foránea que referencia la columna 'Code' en la tabla 'country'.

CREATE TABLE countrylanguage (
    CountryCode CHAR(3) NOT NULL, -- Código del país, parte de la clave primaria.
    Language VARCHAR(50) NOT NULL, -- Idioma, parte de la clave primaria.
    IsOfficial ENUM('T', 'F') NOT NULL, -- Indica si el idioma es oficial ('T' para verdadero, 'F' para falso).
    Percentage FLOAT, -- Porcentaje de hablantes del idioma en el país.
    
    PRIMARY KEY (CountryCode, Language), -- Define 'CountryCode' y 'Language' como clave primaria compuesta.
    CONSTRAINT `countryLanguage_ibfk_1` FOREIGN KEY (CountryCode) REFERENCES country (Code) -- Define 'CountryCode' como clave foránea que referencia 'Code' en la tabla 'country'.
);

-- Crea la tabla 'countrylanguage' con varias columnas para almacenar información sobre los idiomas hablados en los países. La clave primaria es compuesta por 'CountryCode' y 'Language'. 'CountryCode' es una clave foránea que referencia la columna 'Code' en la tabla 'country'.

ALTER TABLE city
ADD CONSTRAINT FK_Country_City
FOREIGN KEY (CountryCode) REFERENCES country(Code); -- Añade una restricción de clave foránea en la tabla 'city' que referencia 'Code' en la tabla 'country'.

-- Añade una restricción de clave foránea en la tabla 'city' para asegurar que 'CountryCode' referencia una entrada válida en la tabla 'country'.

ALTER TABLE countrylanguage
ADD CONSTRAINT FK_Country_CountryLanguage
FOREIGN KEY (CountryCode) REFERENCES country(Code); -- Añade una restricción de clave foránea en la tabla 'countrylanguage' que referencia 'Code' en la tabla 'country'.

-- Añade una restricción de clave foránea en la tabla 'countrylanguage' para asegurar que 'CountryCode' referencia una entrada válida en la tabla 'country'.

-- Paso 2:

CREATE TABLE country (
    Code CHAR(3) NOT NULL,
    Name VARCHAR(255),
    Continent VARCHAR(50),
    Region VARCHAR(50),
    SurfaceArena DECIMAL(11,2),
    IndepYear SMALLINT,
    Population INT,
    LifeExpectancy DECIMAL(3,1),
    GNP DECIMAL(10,2),
    GNPOld DECIMAL(10,2),
    LocalName VARCHAR(50),
    GovernmentForm VARCHAR(255),
    HeadOfState VARCHAR(50),
    Capital INT,
    Code2 VARCHAR(3),
    
    PRIMARY KEY (Code)
    
);

-- Repite la creación de la tabla 'country' con las mismas columnas y clave primaria.

CREATE TABLE city (
    ID INT NOT NULL,
    Name VARCHAR(50),
    CountryCode CHAR(3),
    District VARCHAR(50),
    Population INT,
    
    PRIMARY KEY (ID)
    CONSTRAINT `city_ibfk_1` FOREIGN KEY (CountryCode) REFERENCES country (Code)

);

-- Repite la creación de la tabla 'city' con las mismas columnas, clave primaria y clave foránea.

CREATE TABLE countrylanguage (
    CountryCode CHAR(3) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    IsOfficial ENUM('T', 'F') NOT NULL,
    Percentage FLOAT,
    
    PRIMARY KEY (CountryCode, Language)
    CONSTRAINT `countryLanguage_ibfk_1` FOREIGN KEY (CountryCode) REFERENCES country (Code)
);

-- Repite la creación de la tabla 'countrylanguage' con las mismas columnas, clave primaria compuesta y clave foránea.

ALTER TABLE city
ADD CONSTRAINT FK_Country_City
FOREIGN KEY (CountryCode) REFERENCES country(Code);

-- Repite la adición de la restricción de clave foránea en la tabla 'city'.

ALTER TABLE countrylanguage
ADD CONSTRAINT FK_Country_CountryLanguage
FOREIGN KEY (CountryCode) REFERENCES country(Code);

-- Repite la adición de la restricción de clave foránea en la tabla 'countrylanguage'.

-- Paso 3:
-- Insertar los datos
-- mysql -u root -h localhost < world-data.sql
-- o sino SOURCE /tmp/world-data.sql;

-- Instrucciones para insertar datos en las tablas creadas usando un archivo SQL externo.

-- Paso 4:

CREATE TABLE continent (
    Name VARCHAR(50) NOT NULL,
    Area INT,
    PercentMass FLOAT,
    MostPopuCity VARCHAR(100),
    
    PRIMARY KEY (Name)
);

-- Crea la tabla 'continent' con varias columnas para almacenar información sobre los continentes. La columna 'Name' es la clave primaria.

-- Paso 5:

INSERT INTO continent (Name, Area, PercentMass, MostPopuCity) VALUES
('Africa',30370000,20.4,'Cairo, Egypt'),
('Antarctica', 14000000, 9.2, 'McMurdo Station'),
('Asia', 44579000, 29.5, 'Mumbai, India'),
('Europe', 10180000, 6.8, 'Instanbul, Turquia'),
('North America', 24709000, 16.5, 'Ciudad de México, Mexico'),
('Oceania', 8600000, 5.9, 'Sydney, Australia'),
('South America', 17840000, 12.0, 'São Paulo, Brazil');

-- Inserta datos en la tabla 'continent' con información sobre cada continente, incluyendo su nombre, área, porcentaje de masa terrestre y ciudad más poblada.

-- Paso 6:

ALTER TABLE country 
ADD CONSTRAINT fk_country_continent FOREIGN KEY (Continent) REFERENCES continent(Name);

-- Añade una restricción de clave foránea en la tabla 'country' que referencia la columna 'Name' en la tabla 'continent'.

-- Paso 7: Eliminar la tabla continent

DROP TABLE continent;

-- Elimina la tabla 'continent' de la base de datos.