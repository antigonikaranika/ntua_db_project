USE ntua_db_project;

-- new episodes for 3.5
INSERT INTO Episode (Episode_ID, Episode_Release_Date, Winner, Image, Image_Desc) VALUES
(51,'2023-09-15','Christopher Davis', 'http://example.com/images/episode51.jpg', 'dummy51'),
(52,'2023-01-17','Lucas Taylor', 'http://example.com/images/episode52.jpg', 'dummy52'),
(53,'2023-03-25','Harper Hernandez', 'http://example.com/images/episode53.jpg', 'dummy53'),
(54,'2023-04-16','Daniel Martinez', 'http://example.com/images/episode54.jpg', 'dummy54'),
(55,'2023-01-30','Daniel Martinez', 'http://example.com/images/episode55.jpg', 'dummy55'),
(56,'2023-03-26','Mason Carter', 'http://example.com/images/episode56.jpg', 'dummy56'),
(57,'2023-02-06','Chloe White', 'http://example.com/images/episode57.jpg', 'dummy57'),
(58,'2023-04-12','Madison Thomas', 'http://example.com/images/episode58.jpg', 'dummy58'),
(59,'2023-08-21','Chloe White', 'http://example.com/images/episode59.jpg', 'dummy59'),
(60,'2023-05-14','Sarah Anderson', 'http://example.com/images/episode60.jpg', 'dummy60');

-- new ratings for 3.5
-- Episode 51
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (5,105,4,4,51),
	 (5,94,5,4,51),
	 (1,47,17,4,51),
	 (4,16,47,4,51),
	 (2,99,12,4,51),
	 (2,74,13,4,51),
	 (4,49,15,4,51),
	 (4,92,25,4,51),
	 (2,57,43,4,51),
	 (4,20,29,4,51);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,105,4,79,51),
	 (5,94,5,79,51),
	 (2,47,17,79,51),
	 (2,16,47,79,51),
	 (1,99,12,79,51),
	 (1,74,13,79,51),
	 (5,49,15,79,51),
	 (2,92,25,79,51),
	 (1,57,43,79,51),
	 (2,20,29,79,51);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,105,4,96,51),
	 (4,94,5,96,51),
	 (1,47,17,96,51),
	 (2,16,47,96,51),
	 (3,99,12,96,51),
	 (3,74,13,96,51),
	 (1,49,15,96,51),
	 (3,92,25,96,51),
	 (4,57,43,96,51),
	 (1,20,29,96,51);


-- Episode 52
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,3,52),
	 (2,65,6,3,52),
	 (1,60,1,3,52),
	 (3,4,20,3,52),
	 (3,56,27,3,52),
	 (5,85,38,3,52),
	 (2,62,21,3,52),
	 (3,35,9,3,52),
	 (3,42,8,3,52),
	 (4,73,3,3,52);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (2,100,7,43,52),
	 (3,65,6,43,52),
	 (1,60,1,43,52),
	 (5,4,20,43,52),
	 (4,56,27,43,52),
	 (5,85,38,43,52),
	 (1,62,21,43,52),
	 (1,35,9,43,52),
	 (1,42,8,43,52),
	 (3,73,3,43,52);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,99,52),
	 (4,65,6,99,52),
	 (4,60,1,99,52),
	 (4,4,20,99,52),
	 (1,56,27,99,52),
	 (3,85,38,99,52),
	 (5,62,21,99,52),
	 (5,35,9,99,52),
	 (5,42,8,99,52),
	 (1,73,3,99,52);
	
	
-- Episode 53
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,3,53),
	 (2,65,6,3,53),
	 (1,60,1,3,53),
	 (3,4,20,3,53),
	 (3,56,27,3,53),
	 (5,85,38,3,53),
	 (2,62,21,3,53),
	 (3,35,9,3,53),
	 (3,42,8,3,53),
	 (4,73,3,3,53);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (2,100,7,43,53),
	 (3,65,6,43,53),
	 (1,60,1,43,53),
	 (5,4,20,43,53),
	 (4,56,27,43,53),
	 (5,85,38,43,53),
	 (1,62,21,43,53),
	 (1,35,9,43,53),
	 (1,42,8,43,53),
	 (3,73,3,43,53);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,99,53),
	 (4,65,6,99,53),
	 (4,60,1,99,53),
	 (4,4,20,99,53),
	 (1,56,27,99,53),
	 (3,85,38,99,53),
	 (5,62,21,99,53),
	 (5,35,9,99,53),
	 (5,42,8,99,53),
	 (1,73,3,99,53);
	
	
-- Episode 54
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,3,54),
	 (2,65,6,3,54),
	 (1,60,1,3,54),
	 (3,4,20,3,54),
	 (3,56,27,3,54),
	 (5,85,38,3,54),
	 (2,62,21,3,54),
	 (3,35,9,3,54),
	 (3,42,8,3,54),
	 (4,73,3,3,54);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (2,100,7,43,54),
	 (3,65,6,43,54),
	 (1,60,1,43,54),
	 (5,4,20,43,54),
	 (4,56,27,43,54),
	 (5,85,38,43,54),
	 (1,62,21,43,54),
	 (1,35,9,43,54),
	 (1,42,8,43,54),
	 (3,73,3,43,54);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,99,54),
	 (4,65,6,99,54),
	 (4,60,1,99,54),
	 (4,4,20,99,54),
	 (1,56,27,99,54),
	 (3,85,38,99,54),
	 (5,62,21,99,54),
	 (5,35,9,99,54),
	 (5,42,8,99,54),
	 (1,73,3,99,54);
	 
	
-- Episode 55
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (5,105,4,4,55),
	 (5,94,5,4,55),
	 (1,47,17,4,55),
	 (4,16,47,4,55),
	 (2,99,12,4,55),
	 (2,74,13,4,55),
	 (4,49,15,4,55),
	 (4,92,25,4,55),
	 (2,57,43,4,55),
	 (4,20,29,4,55);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,105,4,79,55),
	 (5,94,5,79,55),
	 (2,47,17,79,55),
	 (2,16,47,79,55),
	 (1,99,12,79,55),
	 (1,74,13,79,55),
	 (5,49,15,79,55),
	 (2,92,25,79,55),
	 (1,57,43,79,55),
	 (2,20,29,79,55);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,105,4,96,55),
	 (4,94,5,96,55),
	 (1,47,17,96,55),
	 (2,16,47,96,55),
	 (3,99,12,96,55),
	 (3,74,13,96,55),
	 (1,49,15,96,55),
	 (3,92,25,96,55),
	 (4,57,43,96,55),
	 (1,20,29,96,55);	
	
	
-- Episode 56
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (5,105,4,4,56),
	 (5,94,5,4,56),
	 (1,47,17,4,56),
	 (4,16,47,4,56),
	 (2,99,12,4,56),
	 (2,74,13,4,56),
	 (4,49,15,4,56),
	 (4,92,25,4,56),
	 (2,57,43,4,56),
	 (4,20,29,4,56);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,105,4,79,56),
	 (5,94,5,79,56),
	 (2,47,17,79,56),
	 (2,16,47,79,56),
	 (1,99,12,79,56),
	 (1,74,13,79,56),
	 (5,49,15,79,56),
	 (2,92,25,79,56),
	 (1,57,43,79,56),
	 (2,20,29,79,56);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,105,4,96,56),
	 (4,94,5,96,56),
	 (1,47,17,96,56),
	 (2,16,47,96,56),
	 (3,99,12,96,56),
	 (3,74,13,96,56),
	 (1,49,15,96,56),
	 (3,92,25,96,56),
	 (4,57,43,96,56),
	 (1,20,29,96,56);	
	 
	
-- Episode 57
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (5,105,4,4,57),
	 (5,94,5,4,57),
	 (1,47,17,4,57),
	 (4,16,47,4,57),
	 (2,99,12,4,57),
	 (2,74,13,4,57),
	 (4,49,15,4,57),
	 (4,92,25,4,57),
	 (2,57,43,4,57),
	 (4,20,29,4,57);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,105,4,79,57),
	 (5,94,5,79,57),
	 (2,47,17,79,57),
	 (2,16,47,79,57),
	 (1,99,12,79,57),
	 (1,74,13,79,57),
	 (5,49,15,79,57),
	 (2,92,25,79,57),
	 (1,57,43,79,57),
	 (2,20,29,79,57);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,105,4,96,57),
	 (4,94,5,96,57),
	 (1,47,17,96,57),
	 (2,16,47,96,57),
	 (3,99,12,96,57),
	 (3,74,13,96,57),
	 (1,49,15,96,57),
	 (3,92,25,96,57),
	 (4,57,43,96,57),
	 (1,20,29,96,57);
	 
	
-- Episode 58
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,3,58),
	 (2,65,6,3,58),
	 (1,60,1,3,58),
	 (3,4,20,3,58),
	 (3,56,27,3,58),
	 (5,85,38,3,58),
	 (2,62,21,3,58),
	 (3,35,9,3,58),
	 (3,42,8,3,58),
	 (4,73,3,3,58);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (2,100,7,43,58),
	 (3,65,6,43,58),
	 (1,60,1,43,58),
	 (5,4,20,43,58),
	 (4,56,27,43,58),
	 (5,85,38,43,58),
	 (1,62,21,43,58),
	 (1,35,9,43,58),
	 (1,42,8,43,58),
	 (3,73,3,43,58);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,99,58),
	 (4,65,6,99,58),
	 (4,60,1,99,58),
	 (4,4,20,99,58),
	 (1,56,27,99,58),
	 (3,85,38,99,58),
	 (5,62,21,99,58),
	 (5,35,9,99,58),
	 (5,42,8,99,58),
	 (1,73,3,99,58);
	 
	
-- Episode 59
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,3,59),
	 (2,65,6,3,59),
	 (1,60,1,3,59),
	 (3,4,20,3,59),
	 (3,56,27,3,59),
	 (5,85,38,3,59),
	 (2,62,21,3,59),
	 (3,35,9,3,59),
	 (3,42,8,3,59),
	 (4,73,3,3,59);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (2,100,7,43,59),
	 (3,65,6,43,59),
	 (1,60,1,43,59),
	 (5,4,20,43,59),
	 (4,56,27,43,59),
	 (5,85,38,43,59),
	 (1,62,21,43,59),
	 (1,35,9,43,59),
	 (1,42,8,43,59),
	 (3,73,3,43,59);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,99,59),
	 (4,65,6,99,59),
	 (4,60,1,99,59),
	 (4,4,20,99,59),
	 (1,56,27,99,59),
	 (3,85,38,99,59),
	 (5,62,21,99,59),
	 (5,35,9,99,59),
	 (5,42,8,99,59),
	 (1,73,3,99,59);
	 
	
-- Episode 60
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,3,60),
	 (2,65,6,3,60),
	 (1,60,1,3,60),
	 (3,4,20,3,60),
	 (3,56,27,3,60),
	 (5,85,38,3,60),
	 (2,62,21,3,60),
	 (3,35,9,3,60),
	 (3,42,8,3,60),
	 (4,73,3,3,60);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (2,100,7,43,60),
	 (3,65,6,43,60),
	 (1,60,1,43,60),
	 (5,4,20,43,60),
	 (4,56,27,43,60),
	 (5,85,38,43,60),
	 (1,62,21,43,60),
	 (1,35,9,43,60),
	 (1,42,8,43,60),
	 (3,73,3,43,60);
INSERT INTO Rating (Score,Recipe_ID,Cook_ID,Critic_ID,Episode_ID) VALUES
	 (4,100,7,99,60),
	 (4,65,6,99,60),
	 (4,60,1,99,60),
	 (4,4,20,99,60),
	 (1,56,27,99,60),
	 (3,85,38,99,60),
	 (5,62,21,99,60),
	 (5,35,9,99,60),
	 (5,42,8,99,60),
	 (1,73,3,99,60);
	 
	
	