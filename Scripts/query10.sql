WITH YearPairs AS (
	SELECT DISTINCT YEAR(e1.Episode_Release_Date) AS Year1, YEAR(e2.Episode_Release_Date) AS Year2
	FROM Episode e1
	JOIN Episode e2 ON YEAR(e2.Episode_Release_Date) = YEAR(e1.Episode_Release_Date) + 1
),
YearCuisines AS (
	SELECT YEAR(e.Episode_Release_Date) AS EpisodeYear, i.Cuisine_ID, COUNT(*) AS CuisineAppearancesperYear
	FROM Episode e
	JOIN Involved i ON e.Episode_ID = i.Episode_ID
	GROUP BY YEAR(e.Episode_Release_Date), i.Cuisine_ID
)
SELECT c.Cuisine_Name, Year1Cuisines.CuisineAppearancesperYear + Year2Cuisines.CuisineAppearancesperYear AS Total_Participations, YearPairs.Year1, YearPairs.Year2	
FROM YearPairs
JOIN YearCuisines AS Year1Cuisines ON YearPairs.Year1 = Year1Cuisines.EpisodeYear
JOIN YearCuisines AS Year2Cuisines ON YearPairs.Year2 = Year2Cuisines.EpisodeYear AND Year1Cuisines.Cuisine_ID = Year2Cuisines.Cuisine_ID
JOIN Cuisine c ON Year1Cuisines.Cuisine_ID = c.Cuisine_ID
WHERE Year1Cuisines.CuisineAppearancesperYear >= 3 AND Year2Cuisines.CuisineAppearancesperYear >= 3
-- GROUP BY Total_Participations, Year1, Year2
-- HAVING COUNT(*) > 1 
ORDER BY Year1 ASC, Year2 ASC, Total_Participations ASC;
