--01. Introducción a las excepciones
SET SERVEROUTPUT ON;
    
    
DECLARE
    empl employees%ROWTYPE;
    
BEGIN
    SELECT * 
        INTO empl
    FROM employees
    WHERE employee_id = 1000;
    
    dbms_output.put_line(empl.first_name);    
END;

/*
Hay dos tipos de EXCEPCIONES
1) LAS GENERADAS POR ORACLE
2) LAS GENERADAS POR EL PROPIO USUARIO
*/