-- Athletes (name, DOB, height, weight, gender, sports, event)
-- Medal (name, DOB, gold, silver, bronze)
-- Activities (Sports, type)
-- Pokemon (name, HP, total, speed, defense, attack, gender, type, image_NO)

-- the number listed below match with the number of questions on the first milestone

--1. Who/What is the Usain Bolt in Pokémon? 
For this one, we might change our matching algorithm a bit so we will leave this query
to be finished by the next milestone

--2. Who is the best pokemon?
SELECT p1.name
FROM Pokemon p1
WHERE p1.total >= ALL (SELECT p2.total
					   FROM Pokemon p2)

SELECT p1.name
FROM Pokemon p1
WHERE p1.type = "water"
AND p1.total >= ALL (SELECT p2.total
					 FROM Pokemon p2)

--3. What will swimmers do in Pokemon?
SELECT type
FROM Activities
WHERE Sports = "swimming"

--use the type above, select some sample pokemon. Pictures will be linked by image_NO
--using AWS S3, more description will be provided by noSQL database and a json file
--which has not been set up yet
Select p.name
from Pokemon p
where p.type = "above type" AND ROWNUM < 10


--2. who is the best athletes
Select m.name
From Medal m
where 5*m.gold + 3*m.silver + m.bronze >= ALL ( select 5*m2.gold + 3*m2.silver + m2.bronze
					from Medal m2)
					
---- in certain category
Select a.name
From Athletes a inner join Medal m on a.name = m.name AND a.DOB = m.DOB
where a.sports = 'Swimming' AND 5*m.gold + 3*m.silver + m.bronze >= ALL ( select 5*m2.gold + 3*m2.silver + m2.bronze
					from Athletes a2 inner join Medal m2 on a2.name = m2.name AND a2.DOB = m2.DOB
					where a2.sports = 'Swimming')
					
--4. Given two atheletes name, show which one would win
Select 5*m.gold + 3*m.silver + m.bronze
From Medal m
where where m.name = "name1 or name2"  
-- then in NodeJS, compare the number and print out the name with the higher number
-- we will then use our matching algorithm to select two pokemon for each athelets
--then
Select p.total
from Pokemon p
where p.name = "above name"
-- then in NodeJS, compare two number and print out the name with the higher total

--5. Who are the first/second/... generations of Olympic athletes (like different generations of Pokémon game)?
We decided to not include this question in our project, because we will not include all 1896 - 2016 athelets, and 
without some old athelets, this question is kind of meaningless (and also a little boring)

--6. Who is the Pikachu/Squirtle/Charmander among all Olympic athletes? (Popularity, based on news coverage/twitter feeds...)
For this question, we will write some web crawler to get data from google search. (we will see the number of time a name has been
searched on GOOGLE and use that information to create a table of "popularity"). Then we will be able to find out the most popular
pokemon and the most popular athletes.

--7. Please give a detailed description about an athlete or about a Pokémon (year, birthday, height, picture, other personal information...)
This will be done by using the noSQL part of our database, which we are having trouble setting up... But we have upload all image for 
all pokemon into our AWS S3, which should provide enough information for a pokemon (people need to see the picture to 
know what a pokemon is).


/****************************
			VIEWS
*****************************/

CREATE VIEW SwimmingView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Swimming';

CREATE VIEW ShootingView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Shooting';

CREATE VIEW ArcheryView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Archery';

CREATE VIEW AquaticsView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Aquatics';

CREATE VIEW WaterpoloView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Water polo';

CREATE VIEW SailingView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Sailing';

CREATE VIEW RowingView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Rowing';

CREATE VIEW CanoeView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Canoe';

CREATE VIEW FootballView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Football';

CREATE VIEW TennisView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Tennis';

CREATE VIEW HockyView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Hocky';

CREATE VIEW BadmintonView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Badminton';

CREATE VIEW HandballView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Handball';

CREATE VIEW TableTennisView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Table tennis';

CREATE VIEW BasketballView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Basketball';

CREATE VIEW VolleyballView AS
	SELECT *
	FROM Athletes
	WHERE Sports = 'Volleyball';
	
CREATE VIEW EquestrianView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Equestrian';

CREATE VIEW CyclingView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Cycling';

CREATE VIEW AthleticsView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Athletics';

CREATE VIEW TrampolingView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Trampoling';

CREATE VIEW GymasticsView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Gymastics';

CREATE VIEW TaekwondoView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Taekwondo';

CREATE VIEW WrestlingView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Wrestling';

CREATE VIEW FencingView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Fencing';

CREATE VIEW JudoView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Judo';

CREATE VIEW BoxingView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Boxing';

CREATE VIEW ModernpentathlonView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Modern pentathlon';

CREATE VIEW TriathlonView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Triathlon';

CREATE VIEW WeightliftingView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Weightlifting';

CREATE VIEW RugbysevensView AS
	SELECT *
	FROM Athletes
	WHERE sports = 'Rugby sevens';
	
______________________________________________________________________________________

CREATE VIEW WaterView AS
	SELECT *
	FROM Pokemon
	WHERE type = 'Water';

CREATE VIEW GrassView AS
	SELECT *
	FROM Pokemon
	WHERE type = 'Grass';

CREATE VIEW NormalView AS
	SELECT *
	FROM Pokemon
	WHERE type = 'Normal';

CREATE VIEW FireView AS
	SELECT *
	FROM Pokemon
	WHERE type = 'Fire';

CREATE VIEW FlyingView AS
	SELECT *
	FROM Pokemon
	WHERE type = 'Flying';

CREATE VIEW GroundView AS
	SELECT *
	FROM Pokemon
	WHERE type = 'Ground';

CREATE VIEW FightingView AS
	SELECT *
	FROM Pokemon
	WHERE type = 'Fighting';

CREATE VIEW PsychicView AS
	SELECT *
	FROM Pokemon
	WHERE type = 'Psychic';
