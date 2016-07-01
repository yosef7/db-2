CREATE DATABASE STARK;
USE STARK;

CREATE TABLE EMBAJADOR (
ID INT AUTO_INCREMENT PRIMARY KEY,
NOMBRE VARCHAR(50) NOT NULL,
EDAD INT NOT NULL,
PAIS VARCHAR(20) NOT NULL,
CONSTRAINT chk_edad CHECK (EDAD >0 AND EDAD <100)
);

/*ALTER TABLE EMBAJADOR AUTO_INCREMENT=1;*/

DESC EMBAJADOR

/*Insercion de valores*/
INSERT INTO EMBAJADOR(NOMBRE,EDAD,PAIS)
VALUES("Jose Jose",27,"Panama");

INSERT INTO EMBAJADOR
VALUES (NULL,"Juan Perez",25,"Panama");

INSERT INTO EMBAJADOR
VALUES (NULL,"Ana Torres",32,"Brasil"),
(NULL,"Rosa Mel",22,"Canada"),
(NULL,"Carlos Cruz",23,"Argentina"),
(NULL,"Juan Cautela",22,"Uruguay"),
(NULL,"Juan Seguro",29,"Panama"),
(NULL,"Carla Ruiz",28,"Brasil"),
(NULL,"Rey Barria",27,"Canada"),
(NULL,"Hodor",35,"Panama");

/* SELECT * FROM EMBAJADOR; "este comando 
muestra la info de la tabla"
---select distint nombre from embajador;
---select id

*/
INSERT INTO EMBAJADOR(NOMBRE,EDAD,PAIS)
VALUES("Jose Jose",80,"Panama");

INSERT INTO EMBAJADOR(NOMBRE,EDAD,PAIS)
VALUES("Jose Jose",35,"Panama");

SELECT DISTINCT NOMBRE
FROM EMBAJADOR
WHERE PAIS = 'Panama';

SELECT DISTINCT NOMBRE
FROM EMBAJADOR
WHERE PAIS <> 'Panama';

SELECT DISTINCT NOMBRE
FROM EMBAJADOR
WHERE EDAD >30;

SELECT DISTINCT NOMBRE
FROM EMBAJADOR
WHERE ID <=6;

SELECT DISTINCT NOMBRE
FROM EMBAJADOR
WHERE EDAD  BETWEEN 20 AND 30;

SELECT NOMBRE
FROM EMBAJADOR
WHERE NOMBRE LIKE 'Ju%';

SELECT DISTINCT NOMBRE
FROM EMBAJADOR
WHERE PAIS IN ('Brasil','Canada');

SELECT DISTINCT NOMBRE
FROM EMBAJADOR
WHERE PAIS = 'Brasil' OR PAIS = 'Canada';

SELECT DISTINCT NOMBRE
FROM EMBAJADOR
ORDER BY NOMBRE DESC;
/*No colocas "desc" y sale en orden ascendente*/

SELECT *
FROM EMBAJADOR
ORDER BY NOMBRE DESC, EDAD ASC;


UPDATE EMBAJADOR
SET PAIS='USA'
WHERE PAIS='Canada';

UPDATE EMBAJADOR
SET PAIS='Canada'
WHERE ID=4;

DELETE FROM EMBAJADOR
WHERE NOMBRE LIKE '%Jose%';

UPDATE EMBAJADOR
SET ID=1
WHERE NOMBRE = 'Jose Jose' OR ID = 14;

SELECT * FROM EMBAJADOR;
/*Muestra todo los datos*/

TRUCATE TABLE EMBAJADOR;

DELETE FROM EMBAJADOR;