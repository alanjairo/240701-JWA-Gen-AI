-- if you are not sure if your connection to SQLite is going to enforce foreign key
-- relationships you can use the following query: if it returns 1 you are good to go,
-- if it returns 0 then you need to set the value of foreign_keys = ON
pragma foreign_keys;
pragma foreign_keys = ON;

-- at first glance this table works: we get relevant information about our students
CREATE TABLE students(
	first_name text,
	last_name text,
	grade integer
);

-- we will run into a problem, though, if any students share the same name and grade, like below
INSERT INTO students VALUES 
('Billy', 'Billington', 5), 
('Sally', 'Sallyington', 4),
('Billy', 'Billington', 5);

-- in order to avoid this kind of confusion we can add a primary key column to the students
-- table. This value should be unique across all records in the table and can be used to identify
-- specific records even if all other data is similar to another record

--DROP TABLE students;

-- we can add an id column to the table and set it to be the PRIMARY KEY and to autoincrement
-- primary key is a combination of the "unique" and "not null" constraints, meaning
-- the id column must be given a non null value, and it must be unique inside of the table
-- autoincrement tells SQLite we would like for it to handle assigning a value to the column
-- using integer, the value will first be 1, then 2 for the next record, then 3, etc.
CREATE TABLE students(
	student_id integer PRIMARY KEY autoincrement,
	first_name text,
	last_name text,
	grade integer
);


INSERT INTO students (first_name, last_name, grade) VALUES 
('Billy', 'Billington', 5), 
('Sally', 'Sallyington', 4),
('Billy', 'Billington', 5);

SELECT * FROM students;



-- In relational databases, you can create connections between data in your different tables
-- for instance, if you are running a sports league you may need to keep track of what players
-- are on each team. You can facilitate this relationship between teams and players using a
-- combination of primary keys and foreign keys

CREATE TABLE teams(
	team_id integer PRIMARY KEY autoincrement,
	team_name text
);

INSERT INTO teams (team_name) VALUES 
('Tampa Bay Lightning'),
('Cleveland Browns'),
('New York Jets');

--DROP TABLE players;
CREATE TABLE players(
	player_id integer PRIMARY KEY autoincrement,
	player_name text,
	-- for a robust foreign key relationship you need both "not null" and the references
	team_id integer NOT null REFERENCES teams(team_id)
);

INSERT INTO players (player_name, team_id) VALUES
('Flash', 1),
('Lebron James', 2),
('Bugs Bunny', 3);

SELECT * FROM players;





