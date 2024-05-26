-- DONE!
WITH EpisodeRatings AS (
	SELECT Rating.Cook_ID, Rating.Episode_ID
	FROM Rating
	GROUP BY Rating.Cook_ID, Rating.Episode_ID
),
CookRanks AS(
SELECT EpisodeRatings.Episode_ID, SUM(Cook_Rank_Comparison.Rank_Number) AS CookRankSum
FROM EpisodeRatings 
JOIN Cook ON EpisodeRatings.Cook_ID  = Cook.Cook_ID 
JOIN Cook_Rank_Comparison ON Cook.Cook_Rank  = Cook_Rank_Comparison.Cook_Rank
GROUP BY EpisodeRatings.Episode_ID
),
CookCriticRanks AS (
	SELECT CriticRating.Episode_ID, SUM(Cook_Rank_Comparison.Rank_Number) AS CriticRankSum	
	FROM (SELECT * FROM Rating GROUP BY Rating.Critic_ID, Rating.Episode_ID) AS CriticRating
	JOIN Critic ON CriticRating.Critic_ID = Critic.Critic_ID
	JOIN Cook ON Critic.Cook_ID  = Cook.Cook_ID
	JOIN Cook_Rank_Comparison ON Cook.Cook_Rank  = Cook_Rank_Comparison.Cook_Rank
	GROUP BY CriticRating.Episode_ID
)
SELECT SUM(CookRanks.CookRankSum + CookCriticRanks.CriticRankSum) AS TotalSum, CookRanks.Episode_ID
FROM CookRanks
JOIN CookCriticRanks ON CookRanks.Episode_ID = CookCriticRanks.Episode_ID
GROUP BY CookRanks.Episode_ID
ORDER BY TotalSum DESC, RAND()
LIMIT 1;
