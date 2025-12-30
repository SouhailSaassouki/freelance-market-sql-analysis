---How many freelancers exist in total?
select 
count (*) as total_freelancers
from dbo.fact 

total_freelancers
500
---How many freelancers are there per country?
select 
count (freelancer_id) as total_freelancers_per_country,
country
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by country
order by count (freelancer_id)
  
total_freelancers_per_country	country
8	Japan
11	India
12	China
14	Australia
14	France
14	Philippines
15	Mexico
15	Colombia
15	Argentina
17	UK
20	Germany
21	Switzerland
24	Brazil
24	Canada
25	Poland
28	Romania
31	Ukraine
36	South Africa
36	Nigeria
39	UAE
39	US
42	Israel

---How many freelancers are there per region?
select 
count (freelancer_id) as total_freelancers_per_region,
region
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by region
order by count (freelancer_id)
  
total_freelancers_per_region	region
59	Asia Pacific
63	North America
69	Latin America
72	Western Europe
72	Africa
81	Middle East
84	Eastern Europe
  
---What is the average hourly_rate_usd per region?
select 
round (avg(hourly_rate_usd),2) as avg_hourly_rate_usd,
region
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by region
order by avg(hourly_rate_usd)
  
avg_hourly_rate_usd	region
51.41	Africa
64.55	Latin America
73.33	Eastern Europe
84.61	Asia Pacific
115.59	Middle East
142.14	North America
152.08	Western Europe
  
---What is the average hourly_rate_usd per experience_level?
select 
round (avg(hourly_rate_usd),2) as avg_hourly_rate_usd,
experience_level
from dbo.fact f
join dbo.profile p
on f.profile_id = p.profile_id
group by experience_level
order by avg(hourly_rate_usd)
  
avg_hourly_rate_usd	experience_level
45.51	junior
82.39	mid
114.92	senior

---Which categories have the highest average hourly rate?

select 
round (avg(hourly_rate_usd),2) as avg_hourly_rate_usd,
category
from dbo.fact f
join dbo.profile p
on f.profile_id = p.profile_id
group by category
order by avg(hourly_rate_usd) desc
avg_hourly_rate_usd	category
123.96	AI/ML Engineering
118.65	Blockchain
113.35	Cybersecurity
101.26	Data_Engineering
96.45	Full_Stack
89.89	DevOps
88.26	Mobile Development
84.39	Backend Development
77.75	UI/UX Design
76.48	Web Development
---How many freelancers work on each platform?

select 
count(freelancer_id) as total_freelancers_per_platform,
primary_platform
from dbo.fact
group by primary_platform
  
143	Direct Client
43	Fiverr
71	Freelancer
59	LinkedIn
10	Other
54	Toptal
120	Upwork
---What is the minimum, maximum, and average years_experience per category?

select 
min(years_experience) as min_years_experience,
max(years_experience) as max_years_experience,
round (avg(years_experience),2) as avg_years_experience,
category 
from dbo.fact f
join dbo.profile p 
on f.profile_id = p.profile_id
group by category
min_years_experience	max_years_experience	avg_years_experience	category
1.10	14.00	6.48	AI/ML Engineering
0.70	12.70	5.70	Backend Development
1.30	12.30	6.13	Blockchain
0.90	12.20	5.90	Cybersecurity
1.10	13.00	5.98	Data_Engineering
0.60	13.50	5.14	DevOps
1.20	10.30	5.38	Full_Stack
0.90	10.60	5.68	Mobile Development
0.50	12.80	5.94	UI/UX Design
0.70	12.70	6.24	Web Development
---Which countries have more than 30 freelancers?

select 
count (freelancer_id) as total_freelancers_per_country,
country 
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by country 
having count (freelancer_id) > 30
order by count (freelancer_id);

total_freelancers_per_country	country
31	Ukraine
36	Nigeria
36	South Africa
39	UAE
39	US
42	Israel

---What percentage of freelancers for each experience_level?

SELECT
    p.experience_level,
100.0 * COUNT(*) / SUM(COUNT(*)) OVER () AS percentage
FROM dbo.fact f
JOIN dbo.profile p
    ON f.profile_id = p.profile_id
GROUP BY p.experience_level;

experience_level	percentage
junior	9.20
mid	35.00
senior	55.80

---Top 10 countries by number of freelancers.

select top 10
count(*) freelancers_per_country ,
country
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by country 
order by count(*) desc
  
freelancers_per_country	country
42	Israel
39	UAE
39	US
36	Nigeria
36	South Africa
31	Ukraine
28	Romania
25	Poland
24	Canada
24	Brazil
  
---Top 5 regions by average hourly_rate_usd.

select top 5
round (avg(hourly_rate_usd),2) avg_hourly_rate_usd,
region
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by region 
order by round (avg(hourly_rate_usd),2)desc
  
avg_hourly_rate_usd	region
152.08	Western Europe
142.14	North America
115.59	Middle East
84.61	Asia Pacific
73.33	Eastern Europe

---Count freelancers by education.

select count(*) as freelancers_per_education,
education
from dbo.fact f
join dbo.profile p
on f.profile_id = p.profile_id
group by education 
order by count(*) desc
  
freelancers_per_education	education
187	Bachelor
139	Master
112	Self-taught
38	Bootcamp
24	PhD
  
---Find the overall min, max, avg of hourly_rate_usd.

select 
min(hourly_rate_usd) as min_hourly_rate_usd,
max(hourly_rate_usd) as max_hourly_rate_usd,
round(avg(hourly_rate_usd),2) as avg_hourly_rate_usd
from dbo.fact
min_hourly_rate_usd	max_hourly_rate_usd	avg_hourly_rate_usd
17.28	281.47 97.150000

---List all distinct skills (alphabetical).

select distinct skill
from dbo.skills 
order by skill 

	skill
Adobe XD
Android
Angular
AWS
Azure
BigQuery
C#
CD
CI
Computer Vision
Cryptography
CSS
Data_Science
Data_Warehousing
DeFi
Docker
Ethereum
ETL
Figma
Flutter
'Go'
GraphQL
HTML
iOS
Java
JavaScript
Kotlin
Kubernetes
MongoDB
Network Security
NLP
Node.js
Penetration Testing
PHP
PostgreSQL
Prototyping
Python
PyTorch
React
React Native
REST API
Ruby
Security Audit
Sketch
Smart Contracts
Solidity
Spark
'SQL'
Swift
TensorFlow
Terraform
User_Research
Vue.js
Web3
Wireframing

---Count skills per freelancer (how many skills each one has).

select 

    f.freelancer_id,
    count(skill)

from dbo.fact f
join dbo.skills s
on f.freelancer_id = s.freelancer_id
group by f.freelancer_id

---Which platform has the highest average hourly rate?

select top 1
primary_platform,
round (avg(hourly_rate_usd),2) as avg_hourly_rate_usd
from dbo.fact 
group by primary_platform
order by round (avg(hourly_rate_usd),2) desc
	
primary_platform	avg_hourly_rate_usd
Other	135.26

---For each country, show: total freelancers + avg hourly rate.

select 
    country,
    count(*) total_freelancers_per_country ,
    round (avg(hourly_rate_usd),2) as avg_hourly_rate_usd
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by country
order by round (avg(hourly_rate_usd),2) desc


---For each region, show: avg years_experience by experience_level.


select 
 round (avg(years_experience),2) as avg_years_experience,
 experience_level,
 region 
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
join dbo.profile p
on f.profile_id = p.profile_id
group by experience_level,region 


---For each category, show total freelancers and avg annual income.
select 
 round (avg(annual_income_usd),2) as avg_years_experience,
 count (*) total_freelancers_per_category,
 category
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
join dbo.profile p
on f.profile_id = p.profile_id
group by  category 


---Categories where avg hourly rate is above overall average.

with overall as ( 
select 
    avg(hourly_rate_usd) as overall_avg
from dbo.fact)


select 
    category,
    round(avg(hourly_rate_usd),2) as avg_hourly_rate,
    round(o.overall_avg,2) as overall_average
from dbo.fact f
join dbo.profile p
on 
f.profile_id = p.profile_id
cross join overall o
group by category, o.overall_avg
having round(avg(hourly_rate_usd),2) > o.overall_avg


---For each platform: total freelancers + avg annual income + avg hourly.
select 
primary_platform,
count(*) as total_freelancers,
round(avg(annual_income_usd),2) as avg_annual_income,
round(avg(hourly_rate_usd),2) as avg_hourly
from dbo.fact 
group by primary_platform

---Find the top country per region by freelancer count.

With country_counts AS(
    select 
        r.region,
        r.country,
        count (*) as total_freelancers,
        ROW_NUMBER () over (Partition by r.region order by count (*) Desc ) As Ranking

    From dbo.fact f
    join dbo.region r
    on f.geo_id = r.geo_id
    Group by r.region, r.country 
)

select 
    region,
    country,
    total_freelancers,
    Ranking
From country_counts
where Ranking = 1
order by region;


---For each experience level: min/max/avg annual income.

select
experience_level,
min(annual_income_usd) as min_annual_income_usd,
max(annual_income_usd) as max_annual_income_usd,
round(avg(annual_income_usd),2) as avg_annual_income_usd
from dbo.profile p
join dbo.fact f
on p.profile_id = f.profile_id
group by experience_level

---Top 15 most common skills overall.

select Top 15
    count (skill) as total_freelancer_per_skill,
    skill
from dbo.fact f
join dbo.skills s
on f.freelancer_id = s.freelancer_id
group by skill
order by count (skill) desc 

---Top 5 skills per category (rank them).

with ranking as (
    select 
    skill,
    category,
    count(*) as total_freelancers ,
    ROW_NUMBER () over (Partition by category order by count(*) desc ) as rate
    from dbo.fact f
    join dbo.profile p
    on f.profile_id = p.profile_id
    join dbo.skills s
    on f.freelancer_id = s.freelancer_id
    group by category, skill
 )
 select 
 skill,
 category,
 total_freelancers,
 rate
 from ranking
 where rate in ('1','2','3','4','5')
 order by category , rate desc


---Skills that appear in at least 50 freelancers.

select 
    count (f.freelancer_id) as total_freelancers_per_skill,
    skill
from dbo.fact f
join dbo.skills s 
on f.freelancer_id = s.freelancer_id 
group by skill
having count (f.freelancer_id) >= 50


---For each country: most common 8 skill.

with ranking as (
    select 
    skill,
    country,
    count(*) as total_freelancers ,
    ROW_NUMBER () over (Partition by country order by count(*) desc  ) as rate
    from dbo.fact f
    join dbo.region r
    on f.geo_id = r.geo_id
    join dbo.skills s
    on f.freelancer_id = s.freelancer_id
    group by country, skill
 )
 select 
 skill,
 country,
 total_freelancers,
 rate
 from ranking
 where rate between 1 and 8
 order by country, total_freelancers desc



---For each experience level: top 5 skills.


with ranking as (
    select 
    skill,
    experience_level,
    count(*) as total_freelancers ,
    ROW_NUMBER () over (Partition by experience_level order by count(*) desc ) as rate
    from dbo.fact f
    join dbo.profile p
    on f.profile_id = p.profile_id
    join dbo.skills s
    on f.freelancer_id = s.freelancer_id
    group by experience_level, skill
 )
 select 
 skill,
 experience_level,
 total_freelancers,
 rate
 from ranking
 where rate between 1 and 5
 order by experience_level , total_freelancers desc


---Find freelancers who have both skill A and B (choose any two like Python + SQL).

SELECT DISTINCT s1.freelancer_id,
s1.skill,
s2.skill
FROM dbo.skills s1
JOIN dbo.skills s2
  ON s1.freelancer_id = s2.freelancer_id
WHERE s1.skill = 'Python'
  AND s2.skill = 'SQL';

/*SELECT s.freelancer_id
FROM dbo.skills s
WHERE s.skill IN ('Python', 'SQL')
GROUP BY s.freelancer_id
HAVING COUNT(DISTINCT s.skill) = 2;*/



---Find categories where skill Python is most common.

select count(*)Total_freelancers,
category,
skill
from dbo.fact f
join dbo.profile p
on f.profile_id = p.profile_id
join dbo.skills s
on f.freelancer_id = s.freelancer_id
where skill = 'Python'
group by category, skill
order by category 

---Rank freelancers by hourly rate within each country (Top 3 per country).


with ranking as (
    select 
    hourly_rate_usd,
    country,
    count(*) as total_freelancers ,
    ROW_NUMBER () over (Partition by country order by count(*) desc ) as rate
    from dbo.fact f
    join dbo.region r
    on f.geo_id = r.geo_id
    group by country, hourly_rate_usd

    )

 select 
 hourly_rate_usd,
 country,
 total_freelancers,
 rate
 from ranking
 where rate between 1 and 3
 order by country , rate desc



---Create hourly-rate bands: <50, 50–100, 100–200, >200 and count per band.

SELECT
  CASE
    WHEN hourly_rate_usd < 50 THEN 'Low'
    WHEN hourly_rate_usd >= 50 AND hourly_rate_usd < 100 THEN 'Midium'
    WHEN hourly_rate_usd >= 100 AND hourly_rate_usd < 200 THEN 'High'
    ELSE 'Very high'
  END AS hourly_rate_band,
  COUNT(*) AS total_freelancers
FROM dbo.fact
GROUP BY
  CASE
    WHEN hourly_rate_usd < 50 THEN 'Low'
    WHEN hourly_rate_usd >= 50 AND hourly_rate_usd < 100 THEN 'Midium'
    WHEN hourly_rate_usd >= 100 AND hourly_rate_usd < 200 THEN 'High'
    ELSE 'Very high'
  END
ORDER BY total_freelancers DESC;




---Compute percentile (or quartile) groups for hourly rate (e.g., NTILE(4)).

select hourly_rate_usd,
freelancer_id,
Ntile (4) over (order by hourly_rate_usd) as quartiles 
from dbo.fact 
order by quartiles 


---For each category: compare avg hourly rate vs global avg (difference + % difference).

with comparing as (
    select 
    avg(hourly_rate_usd) as total_avg
    from dbo.fact f
    )

select
category,
round(avg(hourly_rate_usd),2) as avg_per_category,
round(c.total_avg,2) total_average,
( round(c.total_avg,2) - round(avg(hourly_rate_usd),2) ) as diff,
(100 * ( round(c.total_avg,2) - round(avg(hourly_rate_usd),2) ) / round(avg(hourly_rate_usd),2)) as diff_percent
from dbo.fact f
join dbo.profile p
on f.profile_id = p.profile_id
cross join comparing c
group by category, c.total_avg


---Find countries where the gap between senior avg hourly and junior avg hourly is largest.

with senior_avg as (
    select 
    country,
    avg(hourly_rate_usd) as snr_avg
    from dbo.fact f
    join dbo.profile p 
    on f.profile_id = p.profile_id
    join dbo.region r
    on f.geo_id = r.geo_id
    where experience_level = 'senior'
    group by country
    )
, junior_avg as (
    select 
    country,
    avg(hourly_rate_usd) as jnr_avg
    from dbo.fact f
    join dbo.profile p 
    on f.profile_id = p.profile_id
    join dbo.region r
    on f.geo_id = r.geo_id
    where experience_level = 'junior'
    group by country
    )

select top 5
s.country,
round (s.snr_avg,2) as senior_average ,
round (j.jnr_avg,2) as junior_average,
(round (s.snr_avg,2) - round (j.jnr_avg,2)) as diff_snr_jnr
from junior_avg j
join senior_avg s
on j.country = s.country 

order by diff_snr_jnr desc


---For each platform: show top 3 categories by avg hourly rate.

with catg_hourly as (
    select 
    primary_platform,
    category,
    avg(hourly_rate_usd) as avg_hru,
    ROW_NUMBER () over (Partition by primary_platform order by avg(hourly_rate_usd )Desc) as ranking
    from dbo.fact f
    join dbo.profile p
    on f.profile_id = p.profile_id
    group by primary_platform,category 

)
select 
    primary_platform,
    category,
    round(cat.avg_hru,2),
    ranking 
from catg_hourly cat
where ranking between 1 and 3
order by primary_platform , ranking desc 

---For each region: top 3 skills among seniors only.


   with prep as
   (select r.region,
            s.skill,
            experience_level,
            count(skill) as skill_nbr,
            row_number () over (partition by region order by count(skill) desc) as ranking
        from dbo.fact f
        join dbo.region r
        on f.geo_id = r.geo_id
        join dbo.profile p 
        on f.profile_id = p.profile_id
        join dbo.skills s
        on f.freelancer_id = s.freelancer_id
        where experience_level = 'senior'
        group by r.region, s.skill, experience_level

    )

select 
    region,
    skill,
    experience_level,
    skill_nbr,
    ranking
from prep
where ranking between 1 and 3
order by region, ranking 


---“Which region is best for high-paying AI/ML freelancers?”

select 
region,
category,
avg(annual_income_usd) as average 
from 
        dbo.fact f
        join dbo.region r
        on f.geo_id = r.geo_id
        join dbo.profile p 
        on f.profile_id = p.profile_id
where category = 'AI/ML Engineering'
group by region, category 
order by average desc 
