/*
Table: profile
Description:
Dimension table describing freelancer professional attributes.
*/

CREATE TABLE dbo.profile (
  profile_id INT IDENTITY(1,1) PRIMARY KEY,
  category VARCHAR(30) NOT NULL,
  experience_level VARCHAR(10) NOT NULL,
  education VARCHAR(15) NOT NULL,
  CONSTRAINT UQ_profile UNIQUE (category, experience_level, education)
);

INSERT INTO dbo.profile (category, experience_level, education)
SELECT DISTINCT category, experience_level, education
FROM dbo.stg_freelancers
WHERE category IS NOT NULL
  AND experience_level IS NOT NULL
  AND education IS NOT NULL;
