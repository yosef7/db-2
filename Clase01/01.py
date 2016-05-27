create database prueba;
drop database prueba;

CREATE USER 'nombreusuario'@'localhost' IDENTIFIED BY 'password';

CREATE USER 'yoseft'@'localhost' IDENTIFIED BY '---';
CREATE USER 'dfriend'@'localhost' IDENTIFIED BY 'psswd';

GRANT SELECT ON prueba.* TO 'dfriend'@'localhost' IDENTIFIED BY 'psswd';
GRANT SELECT,INSERT,DROP,CREATE ON prueba.* TO 'yoseft'@'localhost' IDENTIFIED BY '---';