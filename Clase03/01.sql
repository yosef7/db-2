CREATE DATABASE HEROES;
USE HEROES







CREATE TABLE MUTANTES
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(25) NOT NULL,
    SUPERPODER VARCHAR(75) NOT NULL
);

INSERT INTO MUTANTES
VALUES (NULL, 'WOLVERINE','Inmortalidad'),
(NULL, 'MAGNETO','Inmortalidad'),
(NULL, 'XAVIER','Inmortalidad'),
(NULL, 'CYCLOPS','Laser'),
(NULL, 'JEAN GRAY','Telepatia'),
(NULL, 'MYSTIQUE','Mimetismo'),
(NULL, 'PSYLOCKE','Telepatia'),
(NULL, 'BISHOP','Energía');








CREATE TABLE EQUIPOS
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(25) NOT  NULL,
    TIPO VARCHAR(15) NOT NULL
);

INSERT INTO EQUIPOS
VALUES (NULL, 'X-MEN','Buenos'),
(NULL, 'Fraternidad','Malos');










CREATE TABLE MUTANTES_EQUIPOS
(
    ID_MUTANTE INT,
    ID_EQUIPO INT,
    CONSTRAINT PK_ME PRIMARY KEY (ID_MUTANTE, 
    ID_EQUIPO),
    CONSTRAINT FK_MUTANTE FOREIGN KEY (ID_MUTANTE)
    REFERENCES MUTANTES(ID),
    CONSTRAINT FK_EQUIPO FOREIGN KEY (ID_EQUIPO)
    REFERENCES EQUIPOS(ID)
);

INSERT INTO MUNTANTES_EQUIPOS 
VALUES (1,1),(2,2),(3,1),(4,1),(5,1),(6,2),(7,3),(8,1),(6,1),(2,1);






DESC MUTANTES 
/*Añadiremos una nueva tabla que nos diga
nivel del mutante*/
ALTER TABLE MUTANTES
ADD COLUMN NIVEL INT NOT NULL
AFTER SUPERPODER;

/* ELIMINAR UNA COLUMNA*/
DROP COLUMN NIVEL;


/*CAMBIAR EL VALOR*/
ALTER TABLE MUTANTES
CHANGE COLUMN NIVEL NIVEL DECIMAL NOT NULL;

/*AÑADIR NIVEL 50 A TODOS LOS MUTANTES*/
UPDATE MUTANTES
SET NIVEL = 50;

/*AÑADIR NIVEL RANDOM*/
UPDATE MUTANTES
SET NIVEL = FLOOR(RAND()*91 + 10);

SELECT * FROM MUTANTES;




/*
Funciones escalares: UPER, LOWER

*/
SELECT AVG (NIVEL)
FROM MUTANTES;

SELECT COUNT (*)
FROM MUTANTES
WHERE SUPERPODER LIKE '%ia%';


/*Saber el nivel mas alto y bajo*/
SELECT MAX(NIVEL)
FROM MUTANTES;

SELECT MIN(NIVEL)
FROM MUTANTES;

/**/
SELECT SUM(NIVEL)
FROM MUTANTES
WHERE ID <=5;

/*CADENAS: MAYUSCULAS MINISCULAS*/
SELECT UPPER()
FROM EQUIPOS;

SELECT LOWER()
FROM EQUIPOS;

/*CONCATENAR*/
SELECT CONCAT (UPPER(NOMBRE),', tiene ',LOWER
(SUPERPODER),'.')
AS IDENTIFICACION
FROM MUTANTES;

/*Conocer el largo del nombre*/
SELECT LENGTH ('NOMBRE')
FROM MUTANTES;

SELECT *
FROM MUTANTES
LIMIT 3;

SELECT NOMBRE, SUPERPODER
FROM MUTANTES
ORDER BY NIVEL DESC
LIMIT 3;

/*BACKUP*/
CREATE TABLE MUTANTES_BACKUP
(
ID INT AUTO_INCREMENT PRIMARY KEY,
NOMBRE VARCHAR(25) NOT NULL,
SUPERPODER VARCHAR (75) NOT NULL
);
ALTER TABLE MUTANTES_BACKUP
ADD COLUMN NIVEL INT
AFTER SUPERPODER;

DESC MUTANTES_BACKUP


SELECT * FROM MT_BACKUP;

SELECT * FROM MT_BACKUP
SELECT * FROM MUTANTES_BACKUP;

CREATE TABLE MT_BACKUP;
SELECT * FROM MUTANTES;
DESC MT_BACKUP

/**/

SELECT ID_EQUIPO, COUNT(*)
FROM MUTANTES_EQUIPOS
GROUP BY ID_EQUIPO;

SELECT * FROM MUTANTES_EQUIPOS;

/**/
SELECT ME.ID_EQUIPO AS ID , 
E.NOMBRE AS MUTANTE,
COUNT(*) AS TOTAL
FROM MUTANTES_EQUIPOS ME, EQUIPOS E
WHERE ME.ID_EQUIPO = E.ID
GROUP BY ME.ID_EQUIPO;


SELECT E.NOMBRE
FROM MUTANTES_EQUIPOS ME, EQUIPOS E 
WHERE ME.ID_EQUIPO = E.ID 
GROUP BY ME.ID_EQUIPO
HAVING COUNT(*) > 5;