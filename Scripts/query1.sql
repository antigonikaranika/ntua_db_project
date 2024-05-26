-- DONE!
SELECT Person.First_Name, Person.Last_Name, ROUND(AVG(Rating.Score), 1) AS CookAverageScore
FROM Rating
JOIN Cook ON Rating.Cook_ID = Cook.Cook_ID
JOIN Person ON Cook.Person_ID = Person.Person_ID
GROUP BY Rating.Cook_ID;

SELECT Cuisine.Cuisine_Name, ROUND(AVG(Rating.Score), 1) AS CuisineAverageScore
FROM Rating
JOIN Recipe ON Rating.Recipe_ID = Recipe.Recipe_ID
JOIN Cuisine ON Recipe.Cuisine_ID = Cuisine.Cuisine_ID
GROUP BY Cuisine.Cuisine_Name;
