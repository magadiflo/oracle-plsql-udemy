--10. Ámbito de las excepciones

/*
El ámbito de las excepciones es similar al ámbito de las variables.
Las excepciones declaradas en el bloque padre podrán ser leidas por 
el bloque hijo, mientras que las excepciones declaradas en el hijo
no podrán ser leidas desde el bloque padre.

Las excepciones debemos declararlas en el ámbito donde queremos 
manejarla.
*/
SET SERVEROUTPUT ON;

DECLARE
    --reg_max EXCEPTION; 
    regn NUMBER;
    regt VARCHAR2(200);

BEGIN
    regn := 101;
    regt := 'Asia';
    
    DECLARE 
        reg_max EXCEPTION; 
    BEGIN ----------------------------------------------------------------------
        IF regn > 100 THEN
            RAISE reg_max;
        ELSE
            INSERT INTO regions
            VALUES(regn, regt);
    
            COMMIT;
        END IF; 
    EXCEPTION
        WHEN reg_max THEN
            dbms_output.put_line('[Bloque Hijo] La región no puede ser mayor de 100');
    END; -----------------------------------------------------------------------

EXCEPTION
    --WHEN reg_max THEN
        --dbms_output.put_line('[Bloque Padre] La región no puede ser mayor de 100');
    WHEN OTHERS THEN
        dbms_output.put_line('Error indefinido');
END;
/

select * from regions;