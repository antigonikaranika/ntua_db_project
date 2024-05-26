-- DONE!  
WITH RecipesCooked AS (
	SELECT Uses.Utensil_ID, Rating.Episode_ID
	FROM Rating
	JOIN Recipe ON Rating.Recipe_ID = Recipe.Recipe_ID
	JOIN Uses ON Recipe.Recipe_ID = Uses.Recipe_ID
	-- JOIN Utensil ON Uses.Utensil_ID = Utensil.Utensil_ID
	GROUP BY Rating.Recipe_ID, Rating.Cook_ID, Rating.Episode_ID, Uses.Utensil_ID
),
UtensilsPerEpisode AS (
	SELECT RecipesCooked.Episode_ID, COUNT(*) AS TimesUtensilUsed
	FROM RecipesCooked
	GROUP BY RecipesCooked.Episode_ID
	ORDER BY RecipesCooked.Episode_ID
),
MaxTimesUtensilUsed AS (
	SELECT MAX(TimesUtensilUsed) AS MaxCounter
	FROM UtensilsPerEpisode
)
SELECT UtensilsPerEpisode.Episode_ID, UtensilsPerEpisode.TimesUtensilUsed
FROM UtensilsPerEpisode JOIN MaxTimesUtensilUsed ON UtensilsPerEpisode.TimesUtensilUsed = MaxTimesUtensilUsed.MaxCounter;

-- Alternative Query Plan

WITH RecipesCooked AS (
	SELECT Uses.Utensil_ID, Rating.Episode_ID
	FROM Rating
	STRAIGHT_JOIN Recipe ON Rating.Recipe_ID = Recipe.Recipe_ID
	JOIN Uses ON Recipe.Recipe_ID = Uses.Recipe_ID
	-- JOIN Utensil ON Uses.Utensil_ID = Utensil.Utensil_ID
	GROUP BY Rating.Recipe_ID, Rating.Cook_ID, Rating.Episode_ID, Uses.Utensil_ID
),
UtensilsPerEpisode AS (
	SELECT RecipesCooked.Episode_ID, COUNT(*) AS TimesUtensilUsed
	FROM RecipesCooked
	GROUP BY RecipesCooked.Episode_ID
	ORDER BY RecipesCooked.Episode_ID
),
MaxTimesUtensilUsed AS (
	SELECT MAX(TimesUtensilUsed) AS MaxCounter
	FROM UtensilsPerEpisode
)
SELECT UtensilsPerEpisode.Episode_ID, UtensilsPerEpisode.TimesUtensilUsed
FROM UtensilsPerEpisode JOIN MaxTimesUtensilUsed ON UtensilsPerEpisode.TimesUtensilUsed = MaxTimesUtensilUsed.MaxCounter;

