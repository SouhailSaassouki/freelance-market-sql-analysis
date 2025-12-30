/*
Table: skills
Description:
Bridge table between freelancers and skills.
*/

CREATE TABLE dbo.skills (
  freelancer_id VARCHAR(7),
  skill VARCHAR(20),
  CONSTRAINT FK_skills_fact FOREIGN KEY (freelancer_id)
    REFERENCES dbo.fact(freelancer_id)
);

INSERT INTO dbo.skills
SELECT
  freelancer_id,
  LTRIM(RTRIM(value))
FROM dbo.stg_freelancers
CROSS APPLY STRING_SPLIT(primary_skills, '/')
WHERE primary_skills IS NOT NULL;
