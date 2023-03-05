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
---Upper
EXEC sp_rename 'dbo.NFA.year', 'YEAR', 'COLUMN';

-- Standardize Format

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
---Change name
EXEC sp_rename 'dbo.NFA.[Percapita GDP (2010 USD)]', 'Percapita GDP', 'COLUMN';
ALTER TABLE dbo.NFA
ALTER COLUMN [Percapita GDP] INT;

---population
ALTER TABLE dbo.NFA
ALTER COLUMN [population] FLOAT;


-- Check for null values

SELECT 
    COUNT(CASE WHEN [country] IS NULL THEN 1 ELSE NULL END) AS [country_nulls],
	COUNT(CASE WHEN [ISO alpha-3 code] IS NULL THEN 1 ELSE NULL END) AS [ISO alpha-3 code_nulls],
    COUNT(CASE WHEN [UN_region] IS NULL THEN 1 ELSE NULL END) AS [UN_region_nulls],
	COUNT(CASE WHEN [UN_subregion] IS NULL THEN 1 ELSE NULL END) AS [UN_subregion_nulls],
	COUNT(CASE WHEN [YEAR] IS NULL THEN 1 ELSE NULL END) AS [YEAR_nulls],
	COUNT(CASE WHEN [record] IS NULL THEN 1 ELSE NULL END) AS [record_nulls],
	COUNT(CASE WHEN [crop_land] IS NULL THEN 1 ELSE NULL END) AS [crop_land_nulls],
	COUNT(CASE WHEN [grazing_land] IS NULL THEN 1 ELSE NULL END) AS [grazing_land_nulls],
	COUNT(CASE WHEN [built_up_land] IS NULL THEN 1 ELSE NULL END) AS [built_up_land_nulls],
	COUNT(CASE WHEN [carbon] IS NULL THEN 1 ELSE NULL END) AS [carbon_nulls],
	COUNT(CASE WHEN [total] IS NULL THEN 1 ELSE NULL END) AS [total_nulls],
	COUNT(CASE WHEN [Percapita GDP] IS NULL THEN 1 ELSE NULL END) AS [Percapita GDP_nulls],
	COUNT(CASE WHEN [population] IS NULL THEN 1 ELSE NULL END) AS [population_nulls]
FROM dbo.NFA;

-- Check for 0 values

SELECT 
	COUNT(CASE WHEN [crop_land] = 0  THEN 1 ELSE NULL END) AS [crop_land_nulls],
	COUNT(CASE WHEN [grazing_land] = 0  THEN 1 ELSE NULL END) AS [grazing_land_nulls],
	COUNT(CASE WHEN [built_up_land] = 0  THEN 1 ELSE NULL END) AS [built_up_land_nulls],
	COUNT(CASE WHEN [carbon] = 0  THEN 1 ELSE NULL END) AS [carbon_nulls],
	COUNT(CASE WHEN [total] = 0  THEN 1 ELSE NULL END) AS [total_nulls],
	COUNT(CASE WHEN [Percapita GDP] = 0  THEN 1 ELSE NULL END) AS [Percapita GDP_nulls],
	COUNT(CASE WHEN [population] = 0  THEN 1 ELSE NULL END) AS [population_nulls]
FROM dbo.NFA;



---Number of Rows per Country
SELECT [country], COUNT(*) AS [number_of_rows]
FROM dbo.NFA
GROUP BY [country]
ORDER BY [number_of_rows] DESC;


--- Last Year by Country 
SELECT [country], MAX(YEAR([year])) AS [last_year]
FROM dbo.NFA
GROUP BY [country]
ORDER BY [country] ASC;

