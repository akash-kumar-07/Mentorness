## Q1. Write a code to check NULL values 
select * from  `corona virus dataset`
where Province IS NULL OR 
`Country/Region` IS NULL OR 
Latitude IS NULL OR 
Longitude IS NULL OR 
Date IS NULL OR 
Confirmed IS NULL OR
Deaths IS NULL OR 
	IS NULL ;

## Q2. If NULL values are present, update them with zeros for all columns. 


## Q3. check total number of rows
SELECT COUNT(*) FROM `corona virus dataset`;



 ## Q4. Check what is start_date and end_date
 
 SELECT max(Date)  AS start_date , min(Date) AS end_date from `corona virus dataset`;
 
 
  ## Q5. Number of month present in dataset
  SELECT  count(DISTINCT MONTH(Date)) as Month from `corona virus dataset`;
  

## Q6. Find monthly average for confirmed, deaths, recovered
 SELECT  YEAR(Date) as Year , Month(date) as month ,
 AVG(Confirmed) as Avg_Confirmed , 
 avg(Deaths) as Avg_Deaths , avg(Recovered) as Avg_Recovered from `corona virus dataset`
 group by Year(Date) ,month(Date);
 
 
##  Q7. Find most frequent value for confirmed, deaths, recovered each month 

SELECT
 DATE_FORMAT(Date, '%m') AS Month,
 MAX(Confirmed) AS MostFrequentConfirmed,
 MAX(Deaths) AS MostFrequentDeaths,
 MAX(Recovered) AS MostFrequentRecovered FROM `corona virus dataset` 
GROUP BY
 MONTH(Date)
ORDER BY
 MONTH(Date);

## Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT
 DATE_FORMAT(Date, '%Y') AS Year, max(Confirmed) , max(Deaths) , max(Recovered)  FROM `corona virus dataset` 
GROUP BY YEAR(Date) 
ORDER BY YEAR(Date);

##  Q10. The total number of case of confirmed, deaths, recovered each month
SELECT DATE_FORMAT(Date, '%b') AS Month,
 SUM(Confirmed) AS TotalConfirmed,
 SUM(Deaths) AS TotalDeaths,
 SUM(Recovered) AS TotalRecovered FROM `corona virus dataset` 
 GROUP BY MONTH(Date)
ORDER BY MONTH(Date);

 ## Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
 COUNT(*) AS TotalConfirmedCases,
 AVG(Confirmed) AS AverageConfirmedCases,
 VARIANCE(Confirmed) AS
ConfirmedVariance,
 STDDEV(Confirmed) AS
ConfirmedStandardDeviation FROM `corona virus dataset` ;


 ## Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT
 DATE_FORMAT(Date, '%b') AS Month,
 COUNT(*) AS TotalDeathCases,
 AVG(Deaths) AS AverageDeathCases,
 VARIANCE(Deaths) AS DeathVariance,
 STDDEV(Deaths) AS DeathStandardDeviation FROM `corona virus dataset`
GROUP BY MONTH(Date)
ORDER BY MONTH(Date);

 ## Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
 COUNT(*) AS TotalRecoveredCases,
 AVG(Recovered) AS AverageRecoveredCases,
 VARIANCE(Recovered) AS
RecoveredVariance,
 STDDEV(Recovered) AS
RecoveredStandardDeviation
FROM `corona virus dataset` ; 

## Q14. Find Country having highest number of the Confirmed case
SELECT `Country/Region`, MAX(Confirmed) AS HighestConfirmedCases FROM `corona virus dataset` 
GROUP BY `Country/Region`
ORDER BY HighestConfirmedCases DESC;

## Q15. Find Country having lowest number of the death case
SELECT `Country/Region`, min(Deaths) AS HighestConfirmedCases FROM `corona virus dataset` 
GROUP BY `Country/Region`
ORDER BY HighestConfirmedCases DESC;

 ## Q16. Find top 5 countries having highest recovered case
 SELECT CountryRegion,SUM(Recovered) AS TotalRecoveredCases FROM  `corona virus dataset` 
GROUP BY CountryRegion
ORDER BY TotalRecoveredCases DESC
LIMIT 5;