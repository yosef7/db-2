CREATE TABLE EMBAJADOR (ID INT AUTO_INCREMENT=1 PRIMARY KEY,NOMBRE VARCHAR(50) NOT NULL,EDAD INT NOT NULL,PAIS VARCHAR(20) NOT NULL,CONSTRAINT chk_edad CHECK (EDAD >0 AND EDAD <100));