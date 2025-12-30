/*
Table: region
Description:
Geographic dimension table.
*/

CREATE TABLE dbo.region (
  geo_id INT IDENTITY(1,1) PRIMARY KEY,
  region VARCHAR(35) NOT NULL,
  country VARCHAR(20) NOT NULL,
  CONSTRAINT UQ_region UNIQUE (region, country)
);

INSERT INTO dbo.region (region, country)
SELECT DISTINCT region, country
FROM dbo.stg_freelancers
WHERE region IS NOT NULL AND country IS NOT NULL;
