-- DONE!
(
	SELECT Food_Group_ID, Food_Group_Name
	FROM Food_Group
)
EXCEPT
(
	SELECT DISTINCT Food_Group.Food_Group_ID, Food_Group.Food_Group_Name FROM
	Rating JOIN Requires ON Rating.Recipe_ID = Requires.Recipe_ID
	JOIN Ingredient ON Requires.Ingredient_ID = Ingredient.Ingredient_ID
	JOIN Food_Group ON Ingredient.Food_Group_ID = Food_Group.Food_Group_ID
)
ORDER BY Food_Group_ID ASC;