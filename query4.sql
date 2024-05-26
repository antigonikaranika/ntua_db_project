-- DONE!
(
	SELECT First_Name, Last_Name
	FROM Cook
	JOIN Person ON Cook.Person_ID = Person.Person_ID
)
EXCEPT
(
	SELECT First_Name, Last_Name
	FROM Critic
	JOIN Cook ON Critic.Cook_ID = Cook.Cook_ID
	JOIN Person ON Cook.Person_ID = Person.Person_ID
);