-- 10. bloque_anidados
SET SERVEROUTPUT ON;

BEGIN
    dbms_output.put_line('Primer bloque');
    DECLARE
        x NUMBER(2) := 10;
    BEGIN
        dbms_output.put_line(x);
    END;

END;