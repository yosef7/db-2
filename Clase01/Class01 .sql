CREATE DATABASE prueba;
SHOW DATABASE;
DROP DATABASE prueba1;

USE prueba1;

CREATE TABLE Fabricantes (id INT,nombre VARCHAR(25));

CREATE fab INT );

SHOW TABLES

CREATE TABLE x (a INT NOT NULL);
CREATE TABLE y (b INT NOT NULL, CONSTRAINT uk_b UNIQUE(b));
ALTER TABLE y DROP INDEX uk_b;

SHOW CREATE TABLE x;
--


--

CREATE TABLE w (id INT PRIMARY KEY);
CREATE TABLE r (id INT,PRIMARY KEY (id));
CREATE TABLE s (id INT,CONSTRAINT pk_id PRIMARY KEY (id));

ALTER TABLE x ADD PRIMARY KEY (a);
ALTER TABLE y ADD CONSTRAINT pk_b PRIMARY KEY (b);

DROP TABLE fabricantes;
DROP TABLE articulos;

ALTER TABLE x
DROP PRIMARY KEY;

--

CREATE TABLE v
(
c INT NOT NULL,
CONSTRAINT fk_c_b FOREIGN KEY (c) REFERENCES y (b));

ALTER TABLE x ADD CONSTRAINT fk_a_b FOREING KEY (a)REFERENCE y(b);

ALTER TABLE x
DROP FOREIGN KEY fk_a_b

CREATE TABLE m (nombre VARCHAR(255) NOT NULL,edad INT NOT NULL,CONSTRAINT chk_edad CHECK (edad>0));

ALTER TABLE m ADD CONSTRAINT chk_nombre CHECK (nombre='Juan');

ALTER TABLE n (id INT NOT NULL, ciudad VARCHAR(255) DFAULT 'Panama');

ALTER TABLE n
ALTER id SET DEFAULT 5

ALTER TABLE n
ALTER id DROP DEFAULT

CREATE TABLE 1 (id INT AUTO_INCREMENT PRIMARY KEY)

ALTER TABLE n
CHANGE id
id INT AUTO_INCREMENT
PRIMARY KEY

SHOW CREATE TABLE n


DROP CHECK chk_nombr





CREATE TABLE fab,





creacion, eliminacion.
