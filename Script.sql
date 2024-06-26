-- DB

SHOW DATABASES;
CREATE DATABASE node24132;
CREATE DATABASE IF NOT EXISTS node24132;
DROP DATABASE node24132;
USE node24132;

-- DDL (Data Definition Language)

CREATE TABLE numeros(
	numero_sin_signo TINYINT UNSIGNED,
	numero_con_signo TINYINT
);

SELECT * FROM numeros;

INSERT INTO numeros(numero_sin_signo) VALUES (0);
INSERT INTO numeros(numero_con_signo) VALUES (0);
INSERT INTO numeros(numero_sin_signo) VALUES (-10);
INSERT INTO numeros(numero_con_signo) VALUES (-10);
INSERT INTO numeros(numero_sin_signo) VALUES (-1);
INSERT INTO numeros(numero_con_signo) VALUES (-10);
INSERT INTO numeros(numero_con_signo) VALUES (-129);

DROP TABLE numeros;

ALTER TABLE numeros ADD columna_agregada int NOT NULL;
ALTER TABLE numeros DROP columna_agregada;

ALTER TABLE numeros 
	ADD columna_1 int, 
	ADD columna_2 int;

ALTER TABLE numeros 
	DROP columna_1,
	DROP columna_2;
	
ALTER TABLE numeros 
	MODIFY columna_agregada SMALLINT;

ALTER TABLE numeros 
	CHANGE columna_agregada 
		columna_modificada int NOT NULL;

ALTER TABLE numeros 
	DROP columna_modificada;


-- DML (Data Manipulation Language)

-- READ
SELECT * FROM numeros;

-- DELETE
DELETE FROM numeros;

-- CREATE 
INSERT INTO numeros(numero_sin_signo, numero_con_signo) values(1, 1);
INSERT INTO numeros values(2, 2);
INSERT INTO numeros(numero_sin_signo) values(1);
INSERT INTO numeros(numero_con_signo) values(2);

-- UPDATE
UPDATE numeros 
	SET numero_sin_signo = 22
		WHERE numero_con_signo = 1 
			AND numero_sin_signo = 10;


-- Numeros~

CREATE TABLE numericos(
	tipotiny TINYINT NOT NULL,
	tiposmall SMALLINT,
	tipomedium MEDIUMINT NOT NULL,
	tipoint int,
	tipobigint bigint,
	tipodecimal decimal(3,2),
	tipofloat float,
	tipodouble double DEFAULT 3,
	tiporeal REAL
);

INSERT INTO numericos VALUES (
	127,
	32767,
	8388607,
	2147483647,
	9223372036854775807,
	1.23,
	0.123456789,
	0.12345678901234567,
	0.12345678901234567
);

SELECT format (tipofloat, 3, 'es_AR') FROM numericos;

	
-- DATOS
	
CREATE TABLE datos(
	tipochar char,
	tipovarchar varchar(100),
	tipobinary BINARY,
	tipovarbinary varbinary(65000),
	tipotinyblob TINYBLOB,
	tipotinytext TINYTEXT,
	tipoblob blob,
	tipotext text,
	tipomediumblob MEDIUMBLOB,
	tipomediumtext MEDIUMTEXT,
	tipolongblob LONGBLOB,
	tipolongtext LONGTEXT,
	tipoenum enum('a','b','c'),
	tiposet set('a','b','c','x','y','z')
);

SELECT * FROM datos;
INSERT INTO datos(tipochar, tipovarchar,tipobinary,tipovarbinary,tipotinytext, tipoenum, tiposet) values(
	'a',
	'Abcdef',
	'0',
	X'ff0000',
	'Hola',
	3,
	'a,c,b'
);
-- Blob: LOAD_FILE('<ruta-archivo>')


-- Booleanos

CREATE TABLE booleanos(
	tipobit bit(3),
	tipoboolean boolean
);

SELECT * FROM booleanos;
INSERT INTO booleanos values(b'100',0);
INSERT INTO booleanos values(b'010',1);

-- Tiempo

CREATE TABLE tiempo(
	tipodate date DEFAULT NULL,
	tipotime time,
	tipodatetime datetime,
	tipoyear YEAR,
	tipotimestamp timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO tiempo(tipodate) values('2000-12-31');
UPDATE tiempo SET tipodate='2001-01-01';
INSERT INTO tiempo(tipodate) values('2000/12/31');
INSERT INTO tiempo(tipodate) values('20001231');

INSERT INTO tiempo(tipotime) values('120000');
INSERT INTO tiempo(tipodatetime) values('20131220235959');

-- JSON

-- Creamos tabla, en ese campo pondré el tipo JSON
CREATE TABLE tablajson(campo JSON NOT NULL);

-- La inserción de valores se hace como si fuese un Stringify
INSERT INTO tablajson VALUES ('{"mascota":{"animal":"perro","raza":"Malamute"}}');
INSERT INTO tablajson VALUES (
'{
	"mascota": {
		"animal": "perro",
		"raza": "Chihuahua"
	}
}'
);

-- Trae el objeto mascota
SELECT json_extract(campo, '$.mascota') AS animalito FROM tablajson;

-- Traen valores puntuales
SELECT json_extract(campo, '$.mascota.animal') AS animalito FROM tablajson;
SELECT json_extract(campo, '$.mascota.raza') AS animalito FROM tablajson;

-- Devuelven un array con lo pedido
SELECT json_extract(campo, '$.mascota.animal', '$.mascota.raza') AS animalito FROM tablajson;

-- Reemplazo todos los valores del campo raza (dentro de mascota)
UPDATE tablajson 
	SET campo = JSON_REPLACE(campo, '$.mascota.raza', 'Akita Inu');

-- Reemplazo valores con condiciones
UPDATE tablajson
	SET campo = JSON_REPLACE(campo, '$.mascota.raza', 'Akita Inu')
		WHERE JSON_EXTRACT(campo, '$.mascota.raza') = 'Chihuahua';

-- Remuevo clave
UPDATE tablajson 
	SET campo = JSON_REMOVE(campo, '$.mascota.animal')
		WHERE JSON_EXTRACT(campo, '$.mascota.raza') = 'Akita Inu';
	
-- Borramos valores con condiciones
DELETE FROM tablajson 
	WHERE json_extract(campo, '$.mascota.raza') = 'Akita Inu'; 