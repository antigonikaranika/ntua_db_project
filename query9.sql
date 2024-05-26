-- DONE!
WITH CookedRecipes AS (
	SELECT Recipe_ID, Episode.Episode_ID, YEAR(Episode_Release_Date) AS EpisodeYear
	FROM Rating JOIN Episode ON Rating.Episode_ID = Episode.Episode_ID
	-- Used to remove duplicate recipes due to ratings for x critics.
	-- Cook matters in case requirements change and 2 cooks can cook same recipe in episode
	GROUP BY Recipe_ID, Cook_ID, Episode_ID
)
SELECT ROUND(AVG(ROUND((Requires.Quantity / 100) * Macronutrients.Carbs_100g, 2)), 2) AS AverageCarbs, CookedRecipes.EpisodeYear
FROM CookedRecipes
JOIN Requires ON CookedRecipes.Recipe_ID = Requires.Recipe_ID
JOIN Macronutrients ON Requires.Ingredient_ID = Macronutrients.Ingredient_ID
GROUP BY CookedRecipes.EpisodeYear;