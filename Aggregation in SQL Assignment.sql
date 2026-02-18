use world;
Select * from city;
Select * from country;
Select * from countrylanguage;


#Question 1 : Count how many cities are there in each country?
Select distinct(Count(Name)) as Count_of_cities from city;

#Question 2 : Display all continents having more than 30 countries.
Select Continent,Count(*) as Count_ from country
group by Continent
having Count_ > 30;

#Question 3 : List regions whose total population exceeds 200 million.
Select Name ,Population from country
group by Population,Name
having Population > 200000000 ;

#Question 4 : Find the top 5 continents by average GNP per country.
Select continent, avg(GNP) as AVG_GNP from country
group by continent
order by AVG_GNP Desc
Limit 5;

#Question 5 : Find the total number of official languages spoken in each continent.

SELECT c.Continent, COUNT(cl.Language) AS TotalOfficialLanguages
FROM country c
JOIN countrylanguage cl 
ON c.Code = cl.CountryCode
WHERE cl.IsOfficial LIKE '%T%'
GROUP BY c.Continent;

#Question 6 : Find the maximum and minimum GNP for each continent.
Select continent, max(GNP) as MAxGNP, min(GNP)  as MinGNP
From Country
group by  continent;


#Question 7 : Find the country with the highest average city population.
Select c.name,avg(ci.population) AS AverageCityPopulation From Country c
Join city ci 
on c.code =ci.countrycode
group by c.name
order by AverageCityPopulation
limit 1;


#Question 8 : List continents where the average city population is greater than 200,000.

Select c.Continent, avg(ci.Population) as AG_Pop from country c
JOin City ci
on c.Code = ci.CountryCode
group by c.Continent
HAVING AVG(ci.Population) > 200000;

#Question 9 : Find the total population and average life expectancy for each continent, 
# ordered by average life expectancy descending

Select continent, sum(Population) as total_pop , avg(LifeExpectancy) as Avg_Life_Exp from country
group by continent 
order by Avg_Life_Exp Desc;


#Question 10 : Find the top 3 continents with the highest average life expectancy, 
#but only include those where the total population is over 200 million.

Select continent, avg (LifeExpectancy) as Avg_LE from country
group by continent 
having sum(Population) > 200000000
order by Avg_LE Desc
Limit 3;
