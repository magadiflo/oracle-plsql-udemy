--05. SQLCODE y SQLERRM
/*
SQLCODE, nos muestra el código de error producido (Es una función de PLSQL, no de SQL)
SQLERRM, nos devuelve el mensaje de error (Es una función de PLSQL, no de SQL)
*/

SET SERVEROUTPUT ON;

DECLARE
    empl employees%ROWTYPE;
    code NUMBER;
    message VARCHAR2(100);

BEGIN
    SELECT * 
        INTO empl
    FROM employees;
    
    dbms_output.put_line(empl.salary);
    
EXCEPTION
    WHEN OTHERS THEN
        code := SQLCODE;
        message := SQLERRM;
        
        INSERT INTO errors(code, message)
        VALUES(code, message);
        
        COMMIT;
END;
/

-- Creando la tabla errors para guardar los errores que se van produciendo
CREATE TABLE errors(
    code NUMBER,
    message VARCHAR2(100),
    create_at DATE
);
/

SELECT code, message, TO_CHAR(create_at, 'dd-MM-yyyy HH:mm') AS fecha
FROM errors;
/
