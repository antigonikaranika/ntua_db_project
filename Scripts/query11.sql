-- DONE!
WITH ScoreCookPerCritic AS (
	SELECT Cook_ID, Critic_ID, SUM(Score) AS SumScore
	FROM Rating
	GROUP BY Cook_ID, Critic_ID
),
RankedCritics AS (
	SELECT Cook_ID, Critic_ID, SumScore, ROW_NUMBER() OVER (PARTITION BY Cook_ID ORDER BY SumScore DESC, RAND()) AS Rank
    FROM ScoreCookPerCritic
)
SELECT Cook_ID, Critic_ID, SumScore
FROM RankedCritics
WHERE Rank <= 5;
