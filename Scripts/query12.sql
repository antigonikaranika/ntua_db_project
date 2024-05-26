-- DONE!
WITH EpisodeRatings AS (
	SELECT e.Episode_ID, e.Episode_Release_Date, re.Difficulty
	FROM Episode e
	JOIN Rating ra ON ra.Episode_ID = e.Episode_ID
	JOIN Recipe re ON re.Recipe_ID = ra.Recipe_ID
	GROUP BY ra.Recipe_ID, ra.Cook_ID, ra.Episode_ID
),
AVG_DIFF AS (
SELECT EpisodeRatings.Episode_ID, YEAR(EpisodeRatings.Episode_Release_Date) AS EpisodeYear, ROUND(AVG(EpisodeRatings.Difficulty), 1) AS avg_difficulty
FROM EpisodeRatings
GROUP BY EpisodeYear, EpisodeRatings.Episode_ID
),
MAX_DIFF AS (
SELECT Episode_ID, EpisodeYear, avg_difficulty
, ROW_NUMBER() OVER (PARTITION BY EpisodeYear ORDER BY avg_difficulty DESC, RAND()) AS Ranking
    FROM AVG_DIFF
)
SELECT Episode_ID, EpisodeYear, avg_difficulty
FROM MAX_DIFF
WHERE Ranking = 1;
