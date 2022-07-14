--USER_OBJECTS: para saber qué objetos se tienen
--Selecciona los objetos PROCEDURE
SELECT * 
FROM user_objects
WHERE object_type = 'PROCEDURE';

-- Ver cantidad de objetos
SELECT object_type, COUNT(*) AS total
FROM user_objects
GROUP BY object_type;

--Ver código fuente
SELECT * 
FROM user_source
WHERE name = 'SP_P1';

