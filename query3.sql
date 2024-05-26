-- DONE!
WITH CookedRecipes AS (
	SELECT Person.Person_ID, Person.First_Name, Person.Last_Name, Person.Age, Rating.Cook_ID, Rating.Recipe_ID, Rating.Episode_ID
	FROM Rating
	JOIN Cook ON Rating.Cook_ID = Cook.Cook_ID
	JOIN Person ON Cook.Person_ID = Person.Person_ID
	GROUP BY Rating.Recipe_ID, Rating.Cook_ID, Rating.Episode_ID
)
SELECT CookedRecipes.Person_ID, CookedRecipes.First_Name, CookedRecipes.Last_Name, CookedRecipes.Age, COUNT(DISTINCT CookedRecipes.Recipe_ID) as Recipes_Per_Cook	
FROM CookedRecipes
WHERE CookedRecipes.Age < 30
GROUP BY CookedRecipes.Person_ID
ORDER BY Recipes_Per_Cook DESC, Age ASC;