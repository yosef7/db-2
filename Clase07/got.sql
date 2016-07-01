-- Triggers, excepciones, if, set, 
-- variables (declare)


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






--Delimitador de secuencia SQL puede
--variar de ; a //
DELIMITER //
CREATE TRIGGER validar_cambio_nombre 
BEFORE UPDATE ON personajes
FOR EACH ROW
BEGIN
-- si el ID de la familia es 7,
-- haz el cambio. Si no, se cancela.
IF NEW.id_familia != 7 OR NEW.id != 29 THEN 
    SET NEW.nombre = OLD.nombre;
END IF;
END//
DELIMITER ;


SELECT * FROM personajes;
SELECT * FROM log_personajes;
--Probando trigger validar_cambio_nombre
UPDATE personajes
SET nombre = 'Khaleesi'
WHERE id = 30;


CREATE TABLE log_personajes (
id INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR(100) NOT NULL
);



DELIMITER //
CREATE TRIGGER registro_personajes 
AFTER UPDATE ON personajes
FOR EACH ROW
BEGIN
    INSERT INTO log_personaje
    VALUES (NULL,
    CONCAT ('Modifique a ',OLD.nombre, 
        'como ', NEW.nombre)
    );
END//
DELIMITER ;

UPDATE personajes
SET nombre = "La Guapa"
WHERE id = 29;

SELECT * FROM personajes;





SELECT * FROM personajes;
SELECT * FROM familia;
SELECT * FROM log_personajes;

SELECT f.nombre, AS CASA, COUNT (*) AS TOTAL
FROM familia f 
INNER JOIN personajes p ON p.id_familia = f.id 
GROUP BY f.nombre
ORDER BY 2 DESC, 1 ASC;



CREATE TRIGGER miembro_familia
BEFORE INSERT ON personajes
FOR EACH ROW
BEGIN
    DECLARE total_miembros INT;

    SELECT f.nombre, AS CASA, COUNT (*) AS TOTAL INTO total_miembros
    FROM familia f 
    INNER JOIN personajes p ON p.id_familia = f.id 
    WHERE f.id = NEW.id_familia
    GROUP BY f.nombre
    ORDER BY 2 DESC, 1 ASC;

    IF total_miembros <= 5 THEN
        INSERT INTO personajes
        VALUES (NEW.nombre,NEW.id_familia);
    END IF;
END //
DELIMITER ;


INSERT INTO personajes (nombre, id_familia)
VALUES(NULL, 'Pepito',1);

SELECT * FROM personajes WHERE id_familia = 1,

























DELIMITER //
CREATE TRIGGER e_personajes 
AFTER DELETE ON personajes
FOR EACH ROW
BEGIN
    INSERT INTO log_personaje
    VALUES (NULL,
    CONCAT ('Elimine a ',OLD.nombre)
    );
END//
DELIMITER ;


DELETE FOM personajes WHERE id_familia=3
SELECT * FROM log_personajes