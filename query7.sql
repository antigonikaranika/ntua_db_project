-- DONE!
WITH EpisodeRatings AS (
	SELECT Person.Person_ID, Person.First_Name, Person.Last_Name, Rating.Cook_ID
	FROM Rating
	JOIN Cook ON Rating.Cook_ID = Cook.Cook_ID
	JOIN Person ON Cook.Person_ID = Person.Person_ID
	GROUP BY Rating.Recipe_ID, Rating.Cook_ID, Rating.Episode_ID
),
AppearancesPerCook AS (
	SELECT EpisodeRatings.Cook_ID, COUNT(*) AS AppearancesCounter
	FROM EpisodeRatings
	GROUP BY EpisodeRatings.Cook_ID
),
TotalMaxAppearances AS (
	SELECT MAX(AppearancesPerCook.AppearancesCounter)  AS MaxAppearances
	FROM AppearancesPerCook
)
SELECT AppearancesPerCook.Cook_ID, EpisodeRatings.First_Name, EpisodeRatings.Last_Name, AppearancesPerCook.AppearancesCounter, TotalMaxAppearances.MaxAppearances	
FROM AppearancesPerCook
JOIN EpisodeRatings ON AppearancesPerCook.Cook_ID = EpisodeRatings.Cook_ID
CROSS JOIN TotalMaxAppearances
WHERE AppearancesPerCook.AppearancesCounter <= TotalMaxAppearances.MaxAppearances - 5
GROUP BY AppearancesPerCook.Cook_ID, AppearancesPerCook.AppearancesCounter
ORDER BY AppearancesPerCook.AppearancesCounter DESC;