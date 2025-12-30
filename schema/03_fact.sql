/*
Table: fact
Description:
Central fact table storing freelancer metrics.
*/

CREATE TABLE dbo.fact (
  freelancer_id VARCHAR(7) PRIMARY KEY,
  years_experience DECIMAL(5,2),
  hourly_rate_usd DECIMAL(10,2),
  annual_income_usd DECIMAL(15,2),
  primary_platform VARCHAR(35),
  geo_id INT NOT NULL,
  profile_id INT NOT NULL,
  CONSTRAINT FK_fact_region FOREIGN KEY (geo_id) REFERENCES dbo.region(geo_id),
  CONSTRAINT FK_fact_profile FOREIGN KEY (profile_id) REFERENCES dbo.profile(profile_id)
);

INSERT INTO dbo.fact
SELECT
  stg.freelancer_id,
  stg.years_experience,
  stg.hourly_rate_usd,
  stg.annual_income_usd,
  stg.primary_platform,
  r.geo_id,
  p.profile_id
FROM dbo.stg_freelancers stg
JOIN dbo.region r
  ON r.region = stg.region AND r.country = stg.country
JOIN dbo.profile p
  ON p.category = stg.category
 AND p.experience_level = stg.experience_level
 AND p.education = stg.education;
