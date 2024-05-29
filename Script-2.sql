USE node24133;

SHOW INDEX FROM usuarios;

-- Primary Key

SELECT * FROM usuarios;
DROP TABLE usuarios;
DESCRIBE usuarios;

CREATE TABLE usuarios(
	id int AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(100) NOT NULL,
	edad TINYINT UNSIGNED DEFAULT 18
);

INSERT INTO usuarios (nombre, edad) VALUES ('Juan', 20);
INSERT INTO usuarios VALUES (6, 'Juan', 20);
INSERT INTO usuarios VALUES (NULL, 'Juan', 60);

-- Clave Primaria Compuesta

SELECT * FROM usuarios;
DROP TABLE usuarios;
DESCRIBE usuarios;

CREATE TABLE usuarios(
	id int AUTO_INCREMENT NOT NULL,
	nombre varchar(100) NOT NULL,
	edad TINYINT UNSIGNED DEFAULT 18,
	PRIMARY KEY (id, nombre)
);

INSERT INTO usuarios VALUES(1, 'Juan', 20);
INSERT INTO usuarios VALUES(2, 'Pedro', 24);
INSERT INTO usuarios VALUES(2, 'Ruben', 19);
INSERT INTO usuarios VALUES(3, 'Sandra', 32);
INSERT INTO usuarios VALUES(4, 'Sandra', 12);

-- Indice

SELECT * FROM usuarios;
DROP TABLE usuarios;
DESCRIBE usuarios;

CREATE TABLE usuarios(
	id int AUTO_INCREMENT NOT NULL,
	nombre varchar(100) NOT NULL,
	edad TINYINT UNSIGNED DEFAULT 18,
	INDEX clave_compuesta(id, nombre)
);

INSERT INTO usuarios VALUES(1, 'Juan', 20);
INSERT INTO usuarios VALUES(2, 'Pedro', 24);
INSERT INTO usuarios VALUES(2, 'Ruben', 19);
INSERT INTO usuarios VALUES(3, 'Sandra', 32);
INSERT INTO usuarios VALUES(5, 'Sandra', 12);

-- UNIQUE

SELECT * FROM usuarios;
DROP TABLE usuarios;
DESCRIBE usuarios;

CREATE TABLE usuarios(
	id int NOT NULL,
	nombre varchar(100),
	edad TINYINT UNSIGNED DEFAULT 18,
	UNIQUE (nombre)
);

INSERT INTO usuarios VALUES(1, 'Juan', 20);
INSERT INTO usuarios VALUES(2, NULL, 24);
INSERT INTO usuarios VALUES(2, NULL, 19);
INSERT INTO usuarios VALUES(3, 'Sandra', 32);
INSERT INTO usuarios VALUES(4, 'Sandra', 12);