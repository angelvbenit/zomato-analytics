CREATE DATABASE zomato_analysis;
USE zomato_analysis;
SELECT *FROM main1;
SELECT *FROM country;
SELECT *FROM currency;

-- Top rated restaurants 
SELECT `RestaurantName`, City, Votes
FROM main1
ORDER BY Votes DESC
LIMIT 10;

-- Restaurants count by city
SELECT City, COUNT(*) AS Total_Restaurants
FROM main1
GROUP BY City
ORDER BY Total_Restaurants DESC;

-- Average price range
SELECT City, AVG(Price_range) AS Avg_Price
FROM main1
GROUP BY City
ORDER BY Avg_Price DESC;

-- Restaurants with online delivery
SELECT `RestaurantName`, City
FROM main1
WHERE Has_Online_delivery = 'Yes';

-- Ranking restaurnats based on votes
SELECT `RestaurantName`,
       City,
       Votes,
       RANK() OVER (ORDER BY Votes DESC) AS Ranking
FROM main1;