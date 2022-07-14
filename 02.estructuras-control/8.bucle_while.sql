--8. Bucle WHILE
SET SERVEROUTPUT ON;

DECLARE
    done BOOLEAN := false;
BEGIN
    WHILE done LOOP
        dbms_output.put_line('No imprimas esto');
        done := true;
    END LOOP;
    
    WHILE NOT done LOOP
        dbms_output.put_line('He pasado por aquí');
        done := true;
    END LOOP;
END;