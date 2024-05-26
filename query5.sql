-- DONE!
WITH CriticAppearancesPerYear AS (
	SELECT Critic_ID, COUNT(Critic_ID) AS AppearancesPerYear, EpisodeYear
	FROM (
		SELECT Cook_ID, Critic_ID, Episode.Episode_ID, YEAR(Episode_Release_Date) AS EpisodeYear
		FROM Rating
		JOIN Episode ON Rating.Episode_ID = Episode.Episode_ID
		GROUP BY Critic_ID, Episode_ID -- To avoid dividing by magic number 10
	) AS EpisodeRatings
	GROUP BY Critic_ID, EpisodeYear
	HAVING AppearancesPerYear > 3
)
SELECT CriticAppearancesPerYear.Critic_ID, Person.First_Name, Person.Last_Name, CriticAppearancesPerYear.AppearancesPerYear, CriticAppearancesPerYear.EpisodeYear	
FROM CriticAppearancesPerYear
JOIN Critic ON CriticAppearancesPerYear.Critic_ID = Critic.Critic_ID
JOIN Cook ON Critic.Cook_ID = Cook.Cook_ID
JOIN Person ON Cook.Person_ID = Person.Person_ID
ORDER BY CriticAppearancesPerYear.AppearancesPerYear ASC;
