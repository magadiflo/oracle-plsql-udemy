--09. Prácticas excepciones de usuario
SET SERVEROUTPUT ON;

DECLARE
    control_regiones EXCEPTION;
    codigo regions.region_id%TYPE;
    
BEGIN
    codigo := 201;
    
    IF codigo >= 200 THEN
        RAISE control_regiones;
    ELSE 
        INSERT INTO regions(region_id, region_name)
        VALUES(codigo, 'Nueva región');
    END IF;
    
EXCEPTION
    WHEN control_regiones THEN
        dbms_output.put_line('Código no permitido. Debe ser inferior a 200');
    WHEN OTHERS THEN
        dbms_output.put_line('Error no reconocido');

END;

SELECT * FROM regions;