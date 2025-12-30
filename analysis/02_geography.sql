---How many freelancers are there per country?
select 
count (freelancer_id) as total_freelancers_per_country,
country
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by country
order by count (freelancer_id)

  /*
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
42	Israel */

---How many freelancers are there per region?
select 
count (freelancer_id) as total_freelancers_per_region,
region
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by region
order by count (freelancer_id)

  /*
total_freelancers_per_region	region
59	Asia Pacific
63	North America
69	Latin America
72	Western Europe
72	Africa
81	Middle East
84	Eastern Europe */


  
---What is the average hourly_rate_usd per region?

select 
round (avg(hourly_rate_usd),2) as avg_hourly_rate_usd,
region
from dbo.fact f
join dbo.region r
on f.geo_id = r.geo_id
group by region
order by avg(hourly_rate_usd)
/*
avg_hourly_rate_usd	region
51.41	Africa
64.55	Latin America
73.33	Eastern Europe
84.61	Asia Pacific
115.59	Middle East
142.14	North America
152.08	Western Europe
*/
