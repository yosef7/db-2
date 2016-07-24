CREATE DATABASE got;

USE got;

CREATE TABLE familia (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
frase VARCHAR(150) NOT NULL
);

CREATE TABLE personajes (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
id_familia INT NOT NULL,
CONSTRAINT fk_per_fam FOREIGN KEY (id_familia) 
REFERENCES familia(id)
);

INSERT INTO familia 
VALUES (NULL, 'Stark', 'Winter is coming'),
(NULL, 'Baratheon', 'Ours is the fury'),
(NULL, 'Lannister', 'Hear me roar'),
(NULL, 'Tyrell', 'Growing strong'),
(NULL, 'Tully', 'Family, Duty, Honor'),
(NULL, 'Greyjoy', 'We do not sow'),
(NULL, 'Targaryen', 'Fire and blood'),
(NULL, 'Arryn', 'As high as honour'),
(NULL, 'Martell', 'Unbowed unbent unbroken'),
(NULL, 'Wildlings', 'N/A'),
(NULL, 'Night Watch', 'Sword in the darkness'),
(NULL, 'N/A', 'N/A');

INSERT INTO personajes
VALUES (NULL, 'Eddard', 1),
(NULL, 'Catelyn', 1),
(NULL, 'Robb', 1),
(NULL, 'Talisa', 1),
(NULL, 'Arya', 1),
(NULL, 'Brandon', 1),
(NULL, 'Rickon', 1),
(NULL, 'Benjen', 1),
(NULL, 'Sansa', 3),
(NULL, 'Robert', 2),
(NULL, 'Renly', 2),
(NULL, 'Stanis', 2),
(NULL, 'Joffrey', 2),
(NULL, 'Tommen', 2),
(NULL, 'Cersei', 3),
(NULL, 'Tywin', 3),
(NULL, 'Jaime', 3),
(NULL, 'Tyrion', 3),
(NULL, 'Margaery', 4),
(NULL, 'Lady Olenna', 4),
(NULL, 'Mace', 4),
(NULL, 'Ser Loras', 4),
(NULL, 'Holster', 5),
(NULL, 'Brynden', 5),
(NULL, 'Edmure', 5),
(NULL, 'Balon', 6),
(NULL, 'Yara', 6),
(NULL, 'Theon', 6),
(NULL, 'Daenerys', 7),
(NULL, 'Viserys', 7),
(NULL, 'Lysa', 8),
(NULL, 'Jon', 8),
(NULL, 'Robin', 8),
(NULL, 'Prince Doran', 9),
(NULL, 'Oberyn', 9),
(NULL, 'Mance Rayder', 10),
(NULL, 'Ygritte', 10),
(NULL, 'Osha', 10),
(NULL, 'Tormund', 10),
(NULL, 'Alliser Thorne', 11),
(NULL, 'Jeor Mormont', 11),
(NULL, 'Maester Aemon', 11),
(NULL, 'Alliser Thorne', 11),
(NULL, 'Samwell Tarly', 11),
(NULL, 'Khal Drogo', 12),
(NULL, 'Jorah Mormont', 12),
(NULL, 'Hodor', 12),
(NULL, 'Meera Reed', 12),
(NULL, 'Jojen Reed', 12),
(NULL, 'Brienne Of Tarth', 12),
(NULL, 'Melisandre', 12),
(NULL, 'Davos Seaworth', 12),
(NULL, 'Bronn', 12),
(NULL, 'Shae', 12),
(NULL, 'Rodrick Cassel', 12);

DELIMITER //
CREATE PROCEDURE ObtenerTodosPersonajes()
	BEGIN
		SELECT * FROM personajes;
	END //
DELIMITER ;

CALL ObtenerTodosPersonajes();

SHOW PROCEDURE STATUS;
SHOW PROCEDURE STATUS WHERE db = 'got';
SHOW PROCEDURE STATUS WHERE name LIKE '%Personajes%';
SHOW CREATE PROCEDURE ObtenerTodosPersonajes;


DELIMITER $$
-- DROP PROCEDURE ObtenerTotalPersonajes;
CREATE PROCEDURE ObtenerTotalPersonajes()
	BEGIN
		DECLARE total_personajes INT DEFAULT 0;
		SELECT COUNT(*) INTO total_personajes FROM personajes;
		SELECT total_personajes;
	END $$
DELIMITER ;

CALL ObtenerTotalPersonajes()



DELIMITER $$
CREATE PROCEDURE ObtenerPersonajesFamilia(IN idFamilia INT)
	BEGIN
		SELECT *
		FROM personajes
		WHERE id_familia = idFamilia;
	END $$
DELIMITER ;

CALL ObtenerPersonajesFamilia(1)


DELIMITER $$
CREATE PROCEDURE ObtenerTotalPersonajesFamilia(
IN idFamilia INT, OUT total INT)
	BEGIN
		SELECT COUNT(*) INTO total
		FROM personajes
		WHERE id_familia = idFamilia;
	END $$
DELIMITER ;

CALL ObtenerTotalPersonajesFamilia(2,@total);
SELECT @total;

DELIMITER $$
CREATE PROCEDURE EstablecerContador(
INOUT conteo INT, IN incremento INT)
	BEGIN
		SET conteo = conteo + incremento;
	END $$
DELIMITER ;

SET @conteo = 1;
CALL EstablecerContador(@conteo, 1);
CALL EstablecerContador(@conteo, 3);
CALL EstablecerContador(@conteo, 5);
SELECT @conteo;


DELIMITER $$
CREATE PROCEDURE ObtenerTotalPorFamilia(
IN patron VARCHAR(255),
OUT stark INT,
OUT lannister INT,
OUT targaryen INT)
	BEGIN
		-- Stark
		SELECT COUNT(*) INTO stark
		FROM personajes
		WHERE id_familia = 1
		AND nombre LIKE CONCAT('%',patron,'%');
		
		-- Lannister
		SELECT COUNT(*) INTO lannister
		FROM personajes
		WHERE id_familia = 3
		AND nombre LIKE CONCAT('%',patron,'%');
		
		-- Targaryen
		SELECT COUNT(*) INTO targaryen
		FROM personajes
		WHERE id_familia = 7
		AND nombre LIKE CONCAT('%',patron,'%');
	END $$
DELIMITER ;

CALL ObtenerTotalPorFamilia('Ar',@s,@l,@t)
SELECT @s, @l, @t;


DELIMITER $$
CREATE PROCEDURE CicloWhile()
	BEGIN
		DECLARE i INT;
		DECLARE mensaje VARCHAR(150);
		
		SET i = 1;
		SET mensaje = 'Iteracion: ';
		
		WHILE i <= 3 DO
			SET mensaje = CONCAT(mensaje,i,',');
			SET i = i + 1;
		END WHILE;
		
		SELECT mensaje;
	END $$
DELIMITER ;

CALL CicloWhile();


DELIMITER $$
-- DROP PROCEDURE EjemploCursor
CREATE PROCEDURE EjemploCursor (IN patron VARCHAR(255),
OUT conteo INT)
	BEGIN
		DECLARE estado INT DEFAULT 0;
		DECLARE p VARCHAR(255) DEFAULT '';
		
		DECLARE personaje_cursor CURSOR FOR
		SELECT nombre FROM personajes;
		
		DECLARE CONTINUE HANDLER
			FOR NOT FOUND SET estado = 1;
			
		OPEN personaje_cursor;
		
		validar_nombre: LOOP
			FETCH personaje_cursor INTO p;
			SELECT p;
			
			IF estado = 1 THEN
				LEAVE validar_nombre;
			END IF;
						
			IF p LIKE CONCAT('%',patron,'%') THEN
				SET conteo = conteo + 1;
			END IF;
		END LOOP validar_nombre;
		
		CLOSE personaje_cursor;
	END $$
DELIMITER ;

SET @conteo = 0;
CALL EjemploCursor('Ar', @conteo)
SELECT @conteo;