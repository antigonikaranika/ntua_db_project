-- DONE!
WITH CooksPerCuisine AS (
	SELECT Person.Person_ID, Person.First_Name, Person.Last_Name, Cuisine.Cuisine_Name
	FROM Specializes
	JOIN Cuisine ON Specializes.Cuisine_ID = Cuisine.Cuisine_ID
	JOIN Cook ON Specializes.Cook_ID = Cook.Cook_ID
	JOIN Person ON Cook.Person_ID = Person.Person_ID
),
CooksPerYear AS (
	SELECT Person.Person_ID, Person.First_Name, Person.Last_Name, YEAR(Episode.Episode_Release_Date) AS EpisodeYear
	FROM Rating
	JOIN Episode ON Rating.Episode_ID = Episode.Episode_ID
	JOIN Cook ON Rating.Cook_ID = Cook.Cook_ID
	JOIN Person ON Cook.Person_ID = Person.Person_ID
	GROUP BY Rating.Cook_ID, YEAR(Episode.Episode_Release_Date)
	ORDER BY EpisodeYear ASC
)
SELECT CooksPerCuisine.Person_ID, CooksPerCuisine.First_Name, CooksPerCuisine.Last_Name, CooksPerCuisine.Cuisine_Name, CooksPerYear.EpisodeYear
FROM CooksPerCuisine
LEFT JOIN CooksPerYear ON CooksPerCuisine.Person_ID = CooksPerYear.Person_ID
ORDER BY CooksPerYear.EpisodeYear ASC;
