DROP DATABASE IF EXISTS ntua_db_project;
CREATE DATABASE ntua_db_project;
USE ntua_db_project;
CREATE TABLE Utensil
(
	Utensil_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Utensil_Name VARCHAR(30) UNIQUE NOT NULL,
	Instructions VARCHAR(1000) NOT NULL,
	Image VARCHAR(2048) NOT NULL,
	Image_Desc VARCHAR(1000) NOT NULL,
	PRIMARY KEY (Utensil_ID)
);

CREATE TABLE Step
(
	Step_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Execution_Order SMALLINT UNSIGNED NOT NULL CHECK (Execution_Order >= 1),
	Step_Desc VARCHAR(1000) NOT NULL,
	Image VARCHAR(2048) NOT NULL,
	Image_Desc VARCHAR(1000) NOT NULL,
	PRIMARY KEY (Step_ID)
);

CREATE TABLE Food_Group
(
	Food_Group_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Food_Group_Name VARCHAR(50) UNIQUE NOT NULL,
	Food_Group_Desc VARCHAR(1000) NOT NULL,
	Image VARCHAR(2048) NOT NULL,
	Image_Desc VARCHAR(1000) NOT NULL,
	PRIMARY KEY (Food_Group_ID)
);

CREATE TABLE Theme
(
	Theme_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Theme_Name VARCHAR(30) UNIQUE NOT NULL,
	Theme_Desc VARCHAR(1000) NOT NULL,
	Image VARCHAR(2048) NOT NULL,
	Image_Desc VARCHAR(1000) NOT NULL,
	PRIMARY KEY (Theme_ID)
);

CREATE TABLE Person
(
	Person_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	First_Name VARCHAR(30) NOT NULL,
	Last_Name VARCHAR(30) NOT NULL,
	Date_Of_Birth DATE NOT NULL,
	Age SMALLINT UNSIGNED GENERATED ALWAYS AS (TIMESTAMPDIFF(YEAR, Date_of_Birth, CURDATE())) VIRTUAL,
	Username VARCHAR(30) UNIQUE NOT NULL,	-- users can't have same username
	Password VARCHAR(30) NOT NULL,
	Image VARCHAR(2048) NOT NULL,
	Image_Desc VARCHAR(1000) NOT NULL,
	PRIMARY KEY (Person_ID)
);

CREATE TABLE Cuisine
(
	Cuisine_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Cuisine_Name VARCHAR(30) UNIQUE NOT NULL,
	Image VARCHAR(2048) NOT NULL,
	Image_Desc VARCHAR(1000) NOT NULL,
	PRIMARY KEY (Cuisine_ID)
);

CREATE TABLE Episode
(
	Episode_ID INT UNSIGNED NOT NULL,
	Episode_Release_Date DATE NOT NULL,
	Winner VARCHAR(30) DEFAULT NULL,
	Image VARCHAR(2048) DEFAULT NULL,
	Image_Desc VARCHAR(1000) DEFAULT NULL,
	PRIMARY KEY (Episode_ID)
);

-- Lookup table to compare cook ranks
-- Lower values mean higher up the hierarchy
-- https://www.highspeedtraining.co.uk/hub/kitchen-hierarchy-brigade-de-cuisine/
CREATE TABLE Cook_Rank_Comparison
(
	-- maybe use VARCHAR and constraint on what the string can be instead of ENUM
	Cook_Rank ENUM('Executive Chef', 'Chef de Cuisine', 'Sous Chef', 'Chef de Partie', 'Commis Chef', 'Kitchen Porter', 'Escuelerie', 'Aboyeur') NOT NULL,
	Rank_Number INT UNSIGNED NOT NULL,
	PRIMARY KEY (Cook_Rank)
);

CREATE TABLE Cook
(
	Cook_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Person_ID INT UNSIGNED UNIQUE NOT NULL,
	Cook_Rank ENUM('Executive Chef', 'Chef de Cuisine', 'Sous Chef', 'Chef de Partie', 'Commis Chef', 'Kitchen Porter', 'Escuelerie', 'Aboyeur') NOT NULL,
	Years_of_Experience SMALLINT NOT NULL CHECK (Years_of_Experience > 0),
	PRIMARY KEY (Cook_ID),
	FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

CREATE TABLE Admin
(
	Admin_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Person_ID INT UNSIGNED UNIQUE NOT NULL,
	PRIMARY KEY (Admin_ID),
	FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

CREATE TABLE Specializes
(
	Cook_ID INT UNSIGNED NOT NULL,
	Cuisine_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (Cook_ID, Cuisine_ID),
	FOREIGN KEY (Cuisine_ID) REFERENCES Cuisine(Cuisine_ID), 
	FOREIGN KEY (Cook_ID) REFERENCES Cook(Cook_ID)
);

CREATE TABLE Involved
(
	Episode_ID INT UNSIGNED NOT NULL,
	Cuisine_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (Episode_ID, Cuisine_ID),
	FOREIGN KEY (Episode_ID) REFERENCES Episode(Episode_ID),
	FOREIGN KEY (Cuisine_ID) REFERENCES Cuisine(Cuisine_ID)
);

CREATE TABLE Person_Phone_Number
(
	Person_ID INT UNSIGNED NOT NULL,
	Phone_Number VARCHAR(20) UNIQUE NOT NULL,
	PRIMARY KEY (Person_ID, Phone_Number),
	FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

CREATE TABLE Recipe
(
	Recipe_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Cuisine_ID INT UNSIGNED NOT NULL,
	Difficulty SMALLINT NOT NULL CHECK (Difficulty >= 1 && Difficulty <= 5),
	Kind ENUM('Cooking', 'Pastry') NOT NULL,
	Recipe_Name VARCHAR(30) UNIQUE NOT NULL,
	Recipe_Desc VARCHAR(1000) NOT NULL,
	Meal_Category ENUM('breakfast', 'brunch', 'lunch', 'supper', 'dinner') NOT NULL,
	-- Meal_Type VARCHAR(100) NOT NULL,	-- moved as separate entity like phone number because each recipe can have "unlimited" labels
	Tip1 VARCHAR(1000) DEFAULT NULL,
	Tip2 VARCHAR(1000) DEFAULT NULL,
	Tip3 VARCHAR(1000) DEFAULT NULL,
	Preparation_time TIME NOT NULL,
	Execution_Time TIME NOT NULL,
	Portions SMALLINT UNSIGNED NOT NULL CHECK (Portions >= 1),
	Image VARCHAR(2048) NOT NULL,
	Image_Desc VARCHAR(1000) NOT NULL,
	PRIMARY KEY (Recipe_ID),
	FOREIGN KEY (Cuisine_ID) REFERENCES Cuisine(Cuisine_ID)
);

CREATE TABLE Recipe_Meal_Label
(
	Recipe_ID INT UNSIGNED NOT NULL,
	Meal_Label VARCHAR(100) NOT NULL,
	PRIMARY KEY (Recipe_ID, Meal_Label),
	FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID)
);

CREATE TABLE Assign
(
	Recipe_ID INT UNSIGNED NOT NULL,
	Cook_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (Recipe_ID, Cook_ID),
	FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID),
	FOREIGN KEY (Cook_ID) REFERENCES Cook(Cook_ID)
);

CREATE TABLE Ingredient
(
	Ingredient_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Ingredient_Name VARCHAR(30) NOT NULL,
	Food_Group_ID INT UNSIGNED NOT NULL,
	Image VARCHAR(2048) NOT NULL,
	Image_Desc VARCHAR(1000) NOT NULL,
	PRIMARY KEY (Ingredient_ID),
	FOREIGN KEY (Food_Group_ID) REFERENCES Food_Group(Food_Group_ID)	-- as long as there are ingredients with such food group the food group should exist
);

-- Currently stores nutritional value for 100g regardless of ingredient
-- For loosely defined ingredients lie 1 egg, we could assume that the nutritional value refers to such a "unit of measurement"
-- Currently this isn't true
CREATE TABLE Macronutrients
(
	Macronutrients_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Ingredient_ID INT UNSIGNED UNIQUE NOT NULL,
	Calories_100g SMALLINT UNSIGNED NOT NULL,
	Carbs_100g FLOAT UNSIGNED NOT NULL,
	Fats_100g FLOAT UNSIGNED NOT NULL,
	Protein_100g FLOAT UNSIGNED NOT NULL,
	PRIMARY KEY (Macronutrients_ID, Ingredient_ID),
	FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient(Ingredient_ID)
);

CREATE TABLE Critic
(
	Critic_ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	Cook_ID INT UNSIGNED UNIQUE NOT NULL,	-- probably needs UNIQUE constraint
	PRIMARY KEY (Critic_ID),
	FOREIGN KEY (Cook_ID) REFERENCES Cook(Cook_ID)
);

CREATE TABLE Rating
(
	Rating_ID INT UNSIGNED  AUTO_INCREMENT NOT NULL,
	Score SMALLINT UNSIGNED NOT NULL CHECK (Score >= 1 && Score <= 5),
	Recipe_ID INT UNSIGNED NOT NULL,
	Cook_ID INT UNSIGNED NOT NULL,
	Critic_ID INT UNSIGNED NOT NULL,
	Episode_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (Rating_ID),
	FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID),
	FOREIGN KEY (Cook_ID) REFERENCES Cook(Cook_ID),
	FOREIGN KEY (Critic_ID) REFERENCES Critic(Critic_ID),
	FOREIGN KEY (Episode_ID) REFERENCES Episode(Episode_ID)
);

CREATE TABLE Consists_of
(
	Recipe_ID INT UNSIGNED NOT NULL,
	Step_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (Recipe_ID, Step_ID),
	FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID),	-- no point in keeping steps if recipe doesn't exist
	FOREIGN KEY (Step_ID) REFERENCES Step(Step_ID)	-- don't delete a step that's part of a recipe
);

CREATE TABLE Uses
(
	Recipe_ID INT UNSIGNED NOT NULL,
	Utensil_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (Recipe_ID, Utensil_ID),
	FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID),	-- if recipe is removed, remove everything
	FOREIGN KEY (Utensil_ID) REFERENCES Utensil(Utensil_ID)	-- don't delete utensil that is being used
);

CREATE TABLE Requires
(
	Is_Primary BOOLEAN NOT NULL,
	Quantity INT UNSIGNED NOT NULL,
	Ingredient_ID INT UNSIGNED NOT NULL,
	Recipe_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (Ingredient_ID, Recipe_ID),
	FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient(Ingredient_ID),	-- if an ingredient is required it should be deleted
	FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID)	-- if recipe is removed, remove everything
);

CREATE TABLE Groups_By
(
	Recipe_ID INT UNSIGNED NOT NULL,
	Theme_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (Recipe_ID, Theme_ID),
	FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID),	-- if recipe is removed, remove everything
	FOREIGN KEY (Theme_ID) REFERENCES Theme(Theme_ID)	-- if a recipe is grouped in a theme don't delete the theme
);

-- To remove triple duplicates because of critics per cook
CREATE INDEX Unique_Ratings ON Rating (Recipe_ID, Cook_ID, Episode_ID);
-- Because Score is sometimes used as counter or average or sum
CREATE INDEX Score ON Rating (Score);
-- Year is frequently used on Episode_Release_Date and joined on
CREATE INDEX Episode_Release_Date ON Episode (Episode_Release_Date);


DELIMITER //
CREATE DEFINER = Admin PROCEDURE Cook_Select_Recipes()
SQL SECURITY DEFINER
	BEGIN
		WITH CorrectCook AS (
			SELECT Cook.Cook_ID
			FROM Person
			JOIN Cook ON Person.Person_ID = Cook.Person_ID
			WHERE Person.Username = SUBSTRING_INDEX(USER(), '@', 1)
		),
		AssignedRecipes AS (
			SELECT Recipe_ID
			FROM Assign
			JOIN CorrectCook ON Assign.Cook_ID = CorrectCook.Cook_ID
		)
		SELECT Recipe_Name, Cuisine.Cuisine_Name, Difficulty, Kind,  Recipe_Desc, Meal_Category, Tip1, Tip2, Tip3, Preparation_time, Execution_Time, Portions	
		FROM Recipe
		JOIN AssignedRecipes ON Recipe.Recipe_ID = AssignedRecipes.Recipe_ID
		JOIN Cuisine ON Recipe.Cuisine_ID = Cuisine.Cuisine_ID;
	END
//

CREATE DEFINER = Admin PROCEDURE Cook_Select_Credentials()
SQL SECURITY DEFINER
	BEGIN
		SELECT First_Name, Last_Name, Date_Of_Birth, Age, Username, Password
		FROM Person
		WHERE Person.Username = SUBSTRING_INDEX(USER(), '@', 1);
	END
//
	
CREATE DEFINER = Admin PROCEDURE Cook_Insert_Recipe (
	IN CuisineName VARCHAR(30),
	IN Difficulty SMALLINT,
	IN Kind ENUM('Cooking', 'Pastry'),
	IN Recipe_Name VARCHAR(30),
	IN Recipe_Desc VARCHAR(1000),
	IN Meal_Category ENUM('breakfast', 'brunch', 'lunch', 'supper', 'dinner'),
	IN Tip1 VARCHAR(1000),
	IN Tip2 VARCHAR(1000),
	IN Tip3 VARCHAR(1000),
	IN Preparation_time TIME,
	IN Execution_Time TIME,
	IN Portions SMALLINT
)
SQL SECURITY DEFINER
	BEGIN
		DECLARE CorrectCuisineID INT UNSIGNED;
	
		INSERT IGNORE INTO Cuisine (Cuisine_Name) VALUES (CuisineName);
	
		SELECT Cuisine.Cuisine_ID INTO CorrectCuisineID
		FROM Cuisine
		WHERE CuisineName = Cuisine.Cuisine_Name;
	
		INSERT INTO Recipe (Cuisine_ID, Difficulty, Kind, Recipe_Name, Recipe_Desc, Meal_Category, Tip1, Tip2, Tip3, Preparation_time, Execution_Time, Portions)	
		VALUES (CorrectCuisineID, Difficulty, Kind, Recipe_Name, Recipe_Desc, Meal_Category, Tip1, Tip2, Tip3, Preparation_time, Execution_Time, Portions);
	
		-- INSERT INTO Assign (Recipe_ID, Cook_ID)
		-- VALUES ();
	END
//


CREATE DEFINER = Admin PROCEDURE Cook_Update_Recipe (
)
SQL SECURITY DEFINER
	BEGIN
	END	
//
DELIMITER ;

-- Create all Roles
CREATE OR REPLACE ROLE Admin;
GRANT ALL PRIVILEGES ON ntua_db_project.* TO Admin WITH GRANT OPTION;
GRANT Cook TO Admin WITH ADMIN OPTION;

CREATE OR REPLACE ROLE Cook;
GRANT EXECUTE ON PROCEDURE ntua_db_project.Cook_Select_Recipes TO Cook;
GRANT EXECUTE ON PROCEDURE ntua_db_project.Cook_Select_Credentials TO Cook;
GRANT EXECUTE ON PROCEDURE ntua_db_project.Cook_Insert_Recipe TO Cook;
GRANT EXECUTE ON PROCEDURE ntua_db_project.Cook_Update_Recipe TO Cook;


