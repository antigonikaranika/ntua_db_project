-- DONE!! Original query plan
WITH Episode_Ratings AS(
	SELECT *
	FROM Rating
	GROUP BY Recipe_ID, Cook_ID,Episode_ID
),
Theme_Pairs AS(
	SELECT g1.Recipe_ID, g1.Theme_ID AS G1Theme, g2.Theme_ID AS G2Theme
	FROM Groups_By g1 JOIN Groups_By g2 ON g1.Recipe_ID = g2.Recipe_ID
	WHERE g1.Theme_ID < g2.Theme_ID
)
SELECT COUNT(*) AS Theme_Pair_Appearances, Theme_Pairs.G1Theme, Theme_Pairs.G2Theme
FROM Episode_Ratings
JOIN Theme_Pairs ON Episode_Ratings.Recipe_ID = Theme_Pairs.Recipe_ID
GROUP BY Theme_Pairs.G1Theme, Theme_Pairs.G2Theme
ORDER BY Theme_Pair_Appearances DESC, RAND()
LIMIT 3;

-- DONE!! Alternate query plan
WITH Episode_Ratings AS(
	SELECT *
	FROM Rating
	FORCE INDEX FOR GROUP BY (Unique_Rating)
	GROUP BY Recipe_ID, Cook_ID,Episode_ID
),
Theme_Pairs AS(
	SELECT g1.Recipe_ID, g1.Theme_ID AS G1Theme, g2.Theme_ID AS G2Theme
	FROM Groups_By g1
	FORCE INDEX (Theme_ID)
	JOIN Groups_By g2 FORCE INDEX (Theme_ID) ON g1.Recipe_ID = g2.Recipe_ID
	WHERE g1.Theme_ID < g2.Theme_ID
)
SELECT COUNT(*) AS Theme_Pair_Appearances, Theme_Pairs.G1Theme, Theme_Pairs.G2Theme
FROM Episode_Ratings
JOIN Theme_Pairs ON Episode_Ratings.Recipe_ID = Theme_Pairs.Recipe_ID
GROUP BY Theme_Pairs.G1Theme, Theme_Pairs.G2Theme
ORDER BY Theme_Pair_Appearances DESC, RAND()
LIMIT 3;