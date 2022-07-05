-- 1. Comando IF
SET SERVEROUTPUT ON

DECLARE
    is_enabled BOOLEAN := true;
BEGIN
    IF is_enabled THEN
        dbms_output.put_line('El usuario está habilitado');
    ELSE
        dbms_output.put_line('El usuario está bloqueado');
    END IF;
END;

-- Comando con ELSIF
DECLARE
    sales NUMBER := 25000;
    bonus NUMBER := 0;
BEGIN
    IF sales > 50000 THEN
        bonus := 1500;
    ELSIF sales > 35000 THEN
        bonus := 500;
    ELSIF sales > 20000 THEN
        bonus := 150;
    ELSE
        bonus := 100;
    END IF;

    dbms_output.put_line('Sales = '
                         || sales
                         || ', bonus = '
                         || bonus
                         || '.');

END;