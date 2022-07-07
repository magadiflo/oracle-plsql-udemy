--02.Sintaxis de las excepciones
SET SERVEROUTPUT ON;

DECLARE
    empl employees%ROWTYPE;

BEGIN
    SELECT *
        INTO empl
    FROM employees
    WHERE employee_id = 1000;

    dbms_output.put_line(empl.first_name);

--Sintaxis de las excepciones, donde ex1, ex2 son ejemplos ficticios de excepciones que esperamos que puedan producirse
EXCEPTION
    WHEN ex1 THEN
        NULL;
    WHEN ex2 THEN
        NULL;
    WHEN OTHERS THEN
        NULL;    
END;