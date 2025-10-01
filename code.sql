SELECT *
FROM
data_analyst_jobss;

--How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM 
data_analyst_jobss;


--Write a query to look at just the first 10 rows. 
--What company is associated with the job posting on the 10th row?
--EXXONMOBIL
SELECT * 
FROM data_analyst_jobss;

SELECT * 
FROM data_analyst_jobss
LIMIT 10;

--How many postings are in Tennessee? --21 How many are there in either Tennessee or Kentucky?--27
SELECT COUNT(*)
FROM data_analyst_jobss
WHERE location = 'TN';

SELECT COUNT(*)
FROM data_analyst_jobss
WHERE location = 'TN' OR location = 'KY';

--How many postings in Tennessee have a star rating above 4? 416
SELECT COUNT(title)
FROM data_analyst_jobss
WHERE star_rating>4;

--How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*) 
FROM data_analyst_jobss
WHERE review_count between 500 and 1000;

--Show the average star rating for companies in each state. 
--The output should show the state as `state` and the average rating for the state as `avg_rating`. 
--Which state shows the highest average rating? Nebraska

SELECT location AS state , AVG(star_rating) as avg_rating
FROM data_analyst_jobss
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

--Select unique job titles from the data_analyst_jobs table. How many are there? 881
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobss;

--Find the name of each company and its average star rating for all companies that have more than 5000 reviews across.
--How many companies are there with more that 5000 reviews? 71

SELECT * FROM data_analyst_jobss;

SELECT company,SUM(review_count) AS total_reviews
FROM data_analyst_jobss
GROUP BY company
HAVING SUM(review_count)>5000
ORDER BY total_reviews DESC;

--Add the code to order the query in #9 from highest to lowest average star rating.
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- WALMART CA

SELECT company,SUM(review_count) AS total_reviews,AVG(star_rating) AS avg_star_rating,location
FROM data_analyst_jobss
GROUP BY company,location
HAVING SUM(review_count)>5000
ORDER BY total_reviews DESC,avg_star_rating DESC;

--Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 754
SELECT * FROM data_analyst_jobss;

SELECT DISTINCT title
FROM data_analyst_jobss
WHERE title LIKE '%Analyst%'

--How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
--What word do these positions have in common?
--The positions have 'Tableau' in common.

SELECT * FROM data_analyst_jobss

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE'%Analytics%';





