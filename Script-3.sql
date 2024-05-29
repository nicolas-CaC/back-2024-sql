USE node24133;

CREATE TABLE users(
	id_user int AUTO_INCREMENT PRIMARY KEY,
	firstname varchar(100) NOT NULL,
	lastname varchar(100) NOT NULL,
	username varchar(100) NOT NULL,
	password varchar(100) NOT NULL,
	age TINYINT UNSIGNED DEFAULT 18,
	category enum('free','premium'),
	created_at timestamp NOT NULL DEFAULT current_timestamp(),
	updated_at timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);



INSERT INTO users(firstname, lastname, username, password, age, category) VALUES
	('Nico','Sanchez','nikito16','ABC123',20,1),
	('Pedro','Lopez','pepe2','abc123',30,2), 
	('Juan','Gomez','juanci1','123123',25,1), 
	('Ruben','Gomez','ruru','aaa111',35,2), 
	('Sandra','Patiño','san2','a1', 32, 1);
	
SELECT * FROM users;
DROP TABLE users;

-- PETS 

CREATE TABLE pets(
	id_pet int AUTO_INCREMENT PRIMARY KEY,
	name_pet varchar(100) NOT NULL,
	age TINYINT UNSIGNED,
	animal varchar(50),
	id_user int,
	FOREIGN KEY (id_user)
		REFERENCES users(id_user)
			ON DELETE CASCADE
			ON UPDATE RESTRICT
);

SELECT * FROM pets;
DROP TABLE pets;

INSERT INTO pets (name_pet, age, animal, id_user) VALUES 
	('Firulais', 12, 'perro', 2),
	('Garfield', 10, 'gato', 3),
	('Mickey', 3, 'ratón', 1),
	('Fatiga', 10, 'perro', 2),
	('Suertudo', 5, 'gato', 4),
	('Pulgoso', 2, 'perro', NULL);
	
SELECT * FROM users;
SELECT * FROM pets;

DELETE FROM users WHERE category = 1;

UPDATE users 
	SET id_user = 10
		WHERE id_user = 5;
		
SELECT users.id_user, users.firstname, users.lastname, pets.id_pet, pets.name_pet, pets.animal 
	FROM pets INNER JOIN users ON users.id_user = pets.id_user;
	
SELECT users.id_user, users.firstname, users.lastname, id_pet, name_pet, animal 
	FROM pets LEFT JOIN users ON users.id_user = pets.id_user;
	
SELECT users.id_user, users.firstname, users.lastname, id_pet, name_pet, animal 
	FROM pets RIGHT JOIN users ON users.id_user = pets.id_user;
	
SELECT users.id_user, users.firstname, users.lastname, id_pet, name_pet, animal 
	FROM pets CROSS JOIN users;
	
SELECT users.id_user, users.firstname, users.lastname, id_pet, name_pet, animal 
	FROM pets LEFT JOIN users ON users.id_user = pets.id_user
UNION	
SELECT users.id_user, users.firstname, users.lastname, id_pet, name_pet, animal 
	FROM pets RIGHT JOIN users ON users.id_user = pets.id_user;