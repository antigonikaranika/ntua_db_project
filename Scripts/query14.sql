-- DONE!
WITH ThemesAppearances AS (
	-- Divide by 3 because each recipe is graded by 3 critics
	SELECT Theme.Theme_ID, Theme.Theme_Name, COUNT(*)/3 AS Counter
	FROM Rating JOIN Groups_By ON Rating.Recipe_ID = Groups_By.Recipe_ID JOIN Theme ON Groups_By.Theme_ID = Theme.Theme_ID
	GROUP BY Theme_ID, Theme_Name
	ORDER BY Counter DESC
),
MaxCount AS (
	SELECT MAX(Counter) AS MaxCounter
	FROM ThemesAppearances
)
SELECT Theme_ID, Theme_Name, Counter
FROM ThemesAppearances JOIN MaxCount ON ThemesAppearances.Counter = MaxCount.MaxCounter;
