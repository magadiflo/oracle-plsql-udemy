--03. Insert, update con PLSQL records
SET SERVEROUTPUT ON;    


--Creamos una tabla regions a partir de regions, pero vacía
CREATE TABLE regiones AS
SELECT * 
FROM regions
WHERE region_id = 0;

SELECT * FROM regiones;
SELECT * FROM regions;


DECLARE
    reg1 regions%ROWTYPE;
    
BEGIN
    SELECT * 
        INTO reg1
    FROM regions
    WHERE region_id = 1;
    
    --INSERT
    INSERT INTO regiones VALUES reg1;
    --VALUES(reg1.region_id, reg1.region_name);
    COMMIT;
END;
/

DECLARE
    reg1 regions%ROWTYPE;
BEGIN
    reg1.region_id := 1;
    reg1.region_name := 'AUSTRALIA';
    
    --UPDATE
    UPDATE regiones
    SET ROW = reg1
    WHERE region_id = reg1.region_id;
    COMMIT;
END;
/