/*
Cleaning Data in SQL Queries
*/

SELECT *
FROM dbo.NFA;

/*
The SQL code retrieves a list of all columns and their data types for the "dbo.NFA" table in the database. Everything is in varchar
*/

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'NFA' AND TABLE_SCHEMA = 'dbo';




-- Standardize Date Format

UPDATE dbo.NFA
SET year = CAST(year AS DATE);

-- If it doesn't Update properly

---Year
ALTER TABLE dbo.NFA
ALTER COLUMN year DATE;

---crop_land
ALTER TABLE dbo.NFA
ALTER COLUMN crop_land FLOAT;

---grazing_land
ALTER TABLE dbo.NFA
ALTER COLUMN grazing_land FLOAT;

---forest_land
ALTER TABLE dbo.NFA
ALTER COLUMN forest_land FLOAT;

---fishing_ground
ALTER TABLE dbo.NFA
ALTER COLUMN fishing_ground FLOAT;

---built_up_land
ALTER TABLE dbo.NFA
ALTER COLUMN built_up_land FLOAT;

---carbon
ALTER TABLE dbo.NFA
ALTER COLUMN carbon FLOAT;

---total
ALTER TABLE dbo.NFA
ALTER COLUMN total FLOAT;

---Percapita GDP(2010 USD)
ALTER TABLE dbo.NFA
RENAME COLUMN [Percapita GDP(2010 USD)] TO Percapita_GDP;

ALTER TABLE dbo.NFA
ALTER COLUMN Percapita_GDP FLOAT;



ALTER TABLE dbo.NFA
ALTER COLUMN [Percapita GDP(2010 USD)] FLOAT;


---population
ALTER TABLE dbo.NFA
ALTER COLUMN [population] INT;


-- If it doesn't Update properly

