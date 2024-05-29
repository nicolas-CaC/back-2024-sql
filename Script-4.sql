USE node24133;

CREATE TABLE productos(
	id int AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(50),
	precio float
);

INSERT INTO productos (nombre, precio) VALUES 
('abc', 1),
('bcd', 1),
('cde', 1),
('def', 1),
('efg', 1);

SELECT * FROM productos;

SELECT * FROM productos LIMIT 20;
SELECT * FROM productos LIMIT 20 offset 10;
SELECT * FROM productos ORDER BY nombre;
SELECT * FROM productos ORDER BY nombre LIMIT 20 offset 20;
SELECT * FROM productos ORDER BY precio;
