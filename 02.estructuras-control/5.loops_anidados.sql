-- 5. Loops anidados
SET SERVEROUTPUT ON;

DECLARE
    s PLS_INTEGER := 0;
    i PLS_INTEGER := 0;
    j PLS_INTEGER;

BEGIN
    <<PARENT>> /*<<>> es una ETIQUETA, en este caso para nombrar al 1° bucle como PARENT*/
    LOOP
        --Print parent
        i := i + 1;
        j := 100;
        dbms_output.put_line('Parent:' || i);
        
        <<CHILD>>
        LOOP
            --Print child
            EXIT PARENT WHEN (i > 3); /*Le decimos que se salga del bucle PARENT cuando cumple esa condición*/
            dbms_output.put_line('Child:' || j);
            j := j + 1;
            EXIT CHILD WHEN (j > 105); /*Le decimos que salga del bucle CHILD cuando cumpla esa condición*/
        END LOOP CHILD;
    END LOOP PARENT;
    dbms_output.put_line('¡Finish!');
END;