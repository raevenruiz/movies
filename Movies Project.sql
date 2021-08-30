-- Initialize a new table called 'films' that first takes in the
-- title of the movie as a TEXT type and the year it was released
-- as an INTEGER.

CREATE TABLE films (
	name TEXT,
  release_year INTEGER
 );
 
-- ############################################################################

-- Filling the table with a couple of my favorite films that I 
-- could think from the top of my head.
 
INSERT INTO films (name, release_year)
VALUES ('Avengers: Endgame', 2019),
 				('Spider-Man 2', 2002),
        ('Get Out', 2017),
        ('The Shawshank Redemption', 1984),
        ('Monster''s Inc.', 2001),
        ('Lilo & Stitch', 2002),
        ('The School of Rock', 2003),
        ('Inception', 2010),
        ('Parasite', 2019),
        ('Jojo Rabbit', 2019),
        ('Toy Story', 1995),
        ('Guardians of the Galaxy Vol. 2', 2017),
        ('500 Days of Summer', 2009),
        ('Dodgeball', 2004),
        ('Uncut Gems', 2019),
        ('Semi-Pro', 2008),
        ('The Dictator', 2012),
        ('Borat', 2006),
        ('The Interview', 2014);
        
INSERT INTO films (name, release_year)
VALUES  ('The Truman Show', 1998),
        ('The Prince of Egypt', 1998),
        ('Small Soldiers', 1998);

-- ############################################################################

-- Selecting all movies that came out after my birth year (1998).
        
SELECT *
FROM films
WHERE release_year > 1998
ORDER BY release_year;

-- ############################################################################

-- Added more columns - such as the movie's runtime, category, box office sales,
-- and its IMDb rating.

ALTER TABLE films
ADD COLUMN runtime INTEGER,
ADD COLUMN category TEXT,
ADD COLUMN box_office BIGINT,
ADD COLUMN rating REAL;

-- ############################################################################

-- Updating several rows to backfill the rest of the newly created columns.
-- Devloping queries for a couple movies in the table, the rest will be filled
-- using the Postbird's GUI.

UPDATE films -- Parasite
SET runtime = 132, category = 'Thriller/Comedy', box_office = 259000000, rating = 8.6
WHERE name = 'Parasite';
UPDATE films -- Jojo Rabbit
SET runtime = 108, category = 'War/Drama', box_office = 90300000, rating = 7.9
WHERE name = 'Jojo Rabbit';
UPDATE films -- Toy Story
SET runtime = 81, category = 'Family/Comedy', box_office = 373000000, rating = 8.3
WHERE name = 'Toy Story';
UPDATE films -- Guardians of the Category Vol. 2
SET runtime = 138, category = 'Action/Sci-fi', box_office = 863800000, rating = 7.6
WHERE name = 'Guardians of the Galaxy Vol. 2';
UPDATE films -- 500 Days of Summer
SET runtime = 97, category = 'Romance/Drama', box_office = 60700000, rating = 7.7
WHERE name = '500 Days of Summer';
UPDATE films -- Dodgeball
SET runtime = 98, category = 'Comedy/Sport', box_office = 168400000, rating = 6.7
WHERE name = 'Dodgeball';
UPDATE films -- Uncut Gems
SET runtime = 135, category = 'Crime/Comedy', box_office = 50000000, rating = 7.4
WHERE name = 'Uncut Gems';
UPDATE films -- Semi-Pro
SET runtime = 99, category = 'Comedy/Sport', box_office = 43900000, rating = 5.8
WHERE name = 'Semi-Pro';
UPDATE films -- The Dictator
SET runtime = 99, category = 'Comedy/Dark', box_office = 179400000, rating = 6.4
WHERE name = 'The Dictator';
UPDATE films -- Borat
SET runtime = 86, category = 'Comedy/Mockumentary', box_office = 262600000, rating = 7.3
WHERE name = 'Borat';
UPDATE films -- The Interview
SET runtime = 112, category = 'Comedy/Action', box_office = 12300000, rating = 6.5
WHERE name = 'The Interview';
UPDATE films -- The Truman Show
SET runtime = 107, category = 'Sci-fi/Drama', box_office = 264100000, rating = 8.1
WHERE name = 'The Truman Show';
UPDATE films -- The Prince of Egypt
SET runtime = 100, category = 'Family/Musical', box_office = 218600000, rating = 7.1
WHERE name = 'The Prince of Egypt';
UPDATE films -- Small Soldiers
SET runtime = 110, category = 'Action/Comedy', box_office = 87500000, rating = 6.2
WHERE name = 'Small Soldiers';

-- ############################################################################

-- Adding a UNIQUE constraint to the name column, then test out if it works.

ALTER TABLE films
ADD CONSTRAINT unique_name UNIQUE (name);

INSERT INTO films (name)
VALUES ('Spider-Man 2');

-- The above code will not work since Spider-Man 2 is already on the table

INSERT INTO films (name)
VALUES ('Spider-Man');

-- The above code will work at first since Spider-Man is not on the table yet,
-- but any future runs will cause an error since it was already added.
-- Let's backfill the new entry now.

UPDATE films
SET runtime = 121, category = 'Action/Fantasy', box_office = 82500000, rating = 7.3
WHERE name = 'Spider-Man';

-- ############################################################################

-- Let's look at our final table

SELECT *
FROM films;