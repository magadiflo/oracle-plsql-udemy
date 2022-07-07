--07. Controlador SQL con excepciones
SET SERVEROUTPUT ON;

DECLARE
    reg regions%ROWTYPE;
    reg_control regions.region_id%TYPE;

BEGIN
    reg.region_id := 100;
    reg.region_name := 'África';
    
    SELECT region_id
        INTO reg_control
    FROM regions
    WHERE region_id = reg.region_id;
    
    dbms_output.put_line('La región ya existe');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO regions
        VALUES(reg.region_id, reg.region_name);
        
        COMMIT;   
END;
/

select * from regions;