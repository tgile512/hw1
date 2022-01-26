DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS roles;

-------------------------------------------------------

-- Creating Tables
CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_name TEXT,
    release_year INTEGER,
    rating TEXT,
    director_id INTEGER
);

CREATE TABLE actors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    actor_name TEXT,
    role_id INTEGER,
    movie_id INTEGER
);

CREATE TABLE directors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);



-------------------------------------------------------

-- Populating movies table

INSERT INTO movies (movie_name, release_year, rating, director_id)
VALUES ('Batman Begins', '2005', 'PG-13','1');

INSERT INTO movies (movie_name, release_year, rating, director_id)
VALUES ('The Dark Knight', '2008', 'PG-13','1');

INSERT INTO movies (movie_name, release_year, rating, director_id)
VALUES ('The Dark Knight Rises', '2012', 'PG-13','1');

-- Populating directors table

INSERT INTO directors (name)
VALUES ('Christopher Nolan');

-- Populating roles table

INSERT INTO roles (name)
VALUES ('Bruce Wayne');
INSERT INTO roles (name)
VALUES ('Alfred');
INSERT INTO roles (name)
VALUES ('Commissioner Gordon');
INSERT INTO roles (name)
VALUES ("Ra's Al Ghul");
INSERT INTO roles (name)
VALUES ('Rachel Dawes');
INSERT INTO roles (name)
VALUES ('Joker');
INSERT INTO roles (name)
VALUES ('Harvey Dent');
INSERT INTO roles (name)
VALUES ('Bane');
INSERT INTO roles (name)
VALUES ('John Blake');
INSERT INTO roles (name)
VALUES ('Selina Kyle');

-- Populating actors table

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Christian Bale', '1', '1');
INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Christian Bale', '1', '2');
INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Christian Bale', '1', '3');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Michael Caine', '2', '1');
INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Michael Caine', '2', '2');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Gary Oldman', '3', '1');
INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Gary Oldman', '3', '3');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Liam Neeson', '4', '1');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Katie Holmes', '5', '1');
INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Maggie Gyllenhaal', '5', '2');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Heath Ledger', '6', '2');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Aaron Eckhart', '7', '2');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Tom Hardy', '8', '3');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Joseph Gordon-Levitt', '9', '3');

INSERT INTO actors (actor_name, role_id, movie_id)
VALUES ('Anne Hathaway', '10', '3');

.mode column
.headers off

-------------------------------------------------------

.print "Movies"
.print "======"
.print ""

.width 30 10 10 30
SELECT movies.movie_name, movies.release_year, movies.rating, directors.name
FROM directors INNER JOIN movies ON movies.director_id = directors.id;

-------------------------------------------------------

.print ""
.print "Top Cast"
.print "========"
.print ""

.width 30 30 30
SELECT movies.movie_name, actors.actor_name, roles.name
FROM actors INNER JOIN movies ON movies.id = actors.movie_id
INNER JOIN roles ON roles.id = actors.role_id
ORDER BY movies.movie_name;