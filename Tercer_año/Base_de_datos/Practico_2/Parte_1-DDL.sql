
-- PARTE 1 - DDL

USE world;

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

CREATE TABLE city (
	ID INT NOT NULL,
	Name VARCHAR(50),
	CountryCode CHAR(3),
	District VARCHAR(50),
	Population INT,
	
	PRIMARY KEY (ID)
	CONSTRAINT `city_ibfk_1` FOREIGN KEY (CountryCode) REFERENCES country (Code)

);

CREATE TABLE countrylanguage (
	CountryCode CHAR(3) NOT NULL,
	Language VARCHAR(50) NOT NULL,
	IsOfficial ENUM('T', 'F') NOT NULL,
	Percentage FLOAT,
	
	PRIMARY KEY (CountryCode, Language)
	CONSTRAINT `countryLanguage_ibfk_1` FOREIGN KEY (CountryCode) REFERENCES country (Code)
);

ALTER TABLE city
ADD CONSTRAINT FK_Country_City
FOREIGN KEY (CountryCode) REFERENCES country(Code);

ALTER TABLE countrylanguage
ADD CONSTRAINT FK_Country_CountryLanguage
FOREIGN KEY (CountryCode) REFERENCES country(Code);

-- Paso 3:
-- Insertar los datos
-- mysql -u root -h localhost < world-data.sql
-- o sino SOURCE /tmp/world-data.sql;

-- Paso 4:

CREATE TABLE continent (
	Name VARCHAR(50) NOT NULL,
	Area INT,
	PercentMass FLOAT,
	MostPopuCity VARCHAR(100),
	
	PRIMARY KEY (Name)
);

-- Paso 5:

INSERT INTO continent (Name, Area, PercentMass, MostPopuCity) VALUES
('Africa',30370000,20.4,'Cairo, Egypt'),
('Antarctica', 14000000, 9.2, 'McMurdo Station'),
('Asia', 44579000, 29.5, 'Mumbai, India'),
('Europe', 10180000, 6.8, 'Instanbul, Turquia'),
('North America', 24709000, 16.5, 'Ciudad de México, Mexico'),
('Oceania', 8600000, 5.9, 'Sydney, Australia'),
('South America', 17840000, 12.0, 'São Paulo, Brazil');

-- Paso 6:

ALTER TABLE country 
ADD CONSTRAINT fk_country_continent FOREIGN KEY (Continent) REFERENCES continent(Name);


-- Paso 7: Eliminar la tabla continent

DROP TABLE continent;
