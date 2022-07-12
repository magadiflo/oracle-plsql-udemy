--04. Recorrer un cursor con el bucle for
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_cursor
    IS SELECT * 
        FROM regions;
    
BEGIN 
    FOR i IN c_cursor LOOP    
        dbms_output.put_line(i.region_name);
    END LOOP;
END;

/*
NOTA:
Cuando se usa el bucle for, el OPEN, FETCH, CLOSE..
están implícitos
*/