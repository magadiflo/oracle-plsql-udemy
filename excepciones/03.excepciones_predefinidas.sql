--03.Excepciones predefinidas
SET SERVEROUTPUT ON;

DECLARE
    empl employees%ROWTYPE;

BEGIN
    SELECT *
        INTO empl
    FROM employees
    WHERE employee_id > 1;

    dbms_output.put_line(empl.first_name);

EXCEPTION
-- NO_DATA_FOUND        -> ORA-01403
-- TOO_MANY_ROWS        -> ORA-01422
-- ZERO_DIVIDE          -> ORA-01476
-- DUP_VAL_ON_INDEX     -> ORA-00001

    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Error, empleado inexistente!');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Error, se devolvieron más de un registro!');
    WHEN OTHERS THEN
        dbms_output.put_line('Error, ocurrió un error al procesar bloque plsql');
END;