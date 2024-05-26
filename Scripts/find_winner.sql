-- CHECK IF RESULTS ARE CORRECT WHEN USING ORDER BY RAND()
WITH CookAverageScores AS (
	SELECT Rating.Cook_ID, Cook_Rank_Comparison.Rank_Number, AVG(Score) AS Average_Score
	FROM Rating JOIN Cook ON Cook.Cook_ID=Rating.Cook_ID JOIN Cook_Rank_Comparison ON Cook.Cook_Rank = Cook_Rank_Comparison.Cook_Rank 
	WHERE Episode_ID=1
	GROUP BY Rating.Cook_ID
),
MaxAverage AS (
	SELECT MAX(Average_Score) AS MaxAverageScore
	FROM CookAverageScores
)
SELECT First_Name, Last_Name
FROM CookAverageScores
JOIN MaxAverage ON MaxAverage.MaxAverageScore = CookAverageScores.Average_Score
JOIN Cook ON CookAverageScores.Cook_ID = Cook.Cook_ID
JOIN Person ON Cook.Person_ID = Person.Person_ID
ORDER BY CookAverageScores.Rank_Number ASC, RAND() LIMIT 1;