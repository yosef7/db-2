INSERT INTO empleados VALUES ('pepito')

SELECT json_extract(data, '$.nombre') FROM empleados;

#JSON = orden de objetos
#Termostato#

CREATE TABLE modelo_termostato (
id_modelo VARCHAR(50) PRIMARY KEY,
capacidades JSON);

CREATE TABLE lecturas (
lecturas JSON);

#Evaluar la longitud de un modelo de json, para validar json
SELECT json_array('programable','abanico','ac','horno') json_array;

INSERT INTO modelo_termostato VALUES
( 'qwerty', '["programable", "abanico", "ac", "horno"]'),
( 'asdfgh', '["abanico", "horno"]' );

SELECT * FROM modelo_termostato; #consulta

SELECT json_object
(
'id_dispositivo', 4001,
'unixtime', 1428440461,
'configuracion', 65.0,
'temp_actual', 60.07
) json_object;

SELECT * FROM lecturas;

INSERT INTO lecturas VALUES

UPDATE lecturas SET lecturas = json_insert (lectura, '$.estado', CAST( 'null' AS JSON ));


INSERT INTO lecturas VALUES
('{"diferencia": 3.95, "unixtime":1468540824,
  "temp_actual": 65.05, "configuracion": 69, "id_dispositivo": 4001}');


UPDATE lecturas SET lectura = json_set ( lectura, '$.diferencia',
  CAST( json_extract (lectura, '$.temp_actual')
AS DECIMAL(5,2) ) - CAST (json_extract( lectura, '')))


UPDATE modelo_termostato
SET capacidades = json_array_append( capacidades, '$', 'smart' )
WHERE id_modelo = 'qwerty';

SELECT * FROM modelo_termostato;

UPDATE modelo_termostato SET capacidades = json_merge
( capacidades, json_array( 'https', 'protegido', 'detector' ) )
WHERE id_modelo = 'qwerty';

SELECT json_length(lecturas) FROM lecturas;
SELECT json_depth(lecturas) FROM lecturas;

#muestra la informacion.
SELECT json_contains_path(lecturas, 'all', '$.diferencia') FROM lecturas;
SELECT json_contains_path(lecturas, 'all', '$.diferencia', '$.estado') FROM lecturas;
SELECT json_contains_path(lectura, 'one', '$.diferencia', '$.estado') FROM lecturas;

#ambos traen el mismo resultado.
SELECT json_contains(lecturas, json_object('diferencia', 10.0)) FROM lecturas;
SELECT json_extract(lecturas, '$.diferencia') = 10.0 FROM lecturas;

#
SELECT json_contains(capacidades, json_array('ac', 'abanico')) FROM modelo_termostato;
