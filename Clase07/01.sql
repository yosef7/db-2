mysql -u root -p 
show databases;
CREATE DATABASE got;

use got;

CREATE TABLE familia (id INT PRIMARY KEY AUTO_INCREMENT, nombre VARCHAR (50) 
    NOT NULL, frase VARCHAR(150) NOT NULL);

CREATE TABLE personajes (id INT PRIMARY KEY AUTO_INCREMENT, nombre VARCHAR(50) 
    NOT NULL, id_familia INT NOT NULL, CONSTRAINT fk_per_fam 
    FOREIGN KEY (id_familia) REFERENCES familia(id));

INSERT INTO familia
VALUES (NULL, 'Stark' , 'Winter is coming'),
(NULL, 'Baratheon', 'Ours is the fury'),
(NULL, 'Lannister', 'Hear me roar'),
(NULL, 'Tyrell', 'Growing strong'),
(NULL, 'Greyjoy', 'We do not sow'),
(NULL, 'Targaryen', 'Fire and blood'),
(NULL, 'Arryn', 'AS high as honour'),
(NULL, 'Martell', 'Unbowed unbet unbroken'),
(NULL, 'Wildlings', 'N/A');

INSERT INTO personajes
(NULL, 'Eddard', 1),
(NULL, 'Catelyn', 1),
(NULL, 'Robb', 1),
(NULL, 'Talisa', 1),
(NULL, 'Arya', 1),
(NULL, 'Brandon', 1),
(NULL, 'Rickon', 1),
(NULL, 'Sansa', 1),
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









DELIMITER //
CREATE TRIGGER validar_cambio_nombre 
BEFORE UPDATE ON personajes
FOR EACH ROW
BEGIN
-- si el ID de la familia es 7,
-- haz el cambio. Si no, se cancela.
IF NEW.id_familia = 7 THEN 
    UPDATE personajes
    SET nombre = NEW.nombre
    WHERE id = NEW.id;
END IF;
END//
DELIMITER;