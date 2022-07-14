--04. Inserts en PLSQL
SET SERVEROUTPUT ON;

CREATE TABLE test(
    c1 NUMBER,
    c2 VARCHAR2(20)
);

SELECT * FROM test;

DECLARE
    col_1 test.c1%TYPE;
    
BEGIN
    col_1 := 10;
    INSERT INTO test(c1, c2) 
    VALUES(col_1, 'Registro 1');
    
    /*
    Deben llevar un commit en los puntos donde queremos que la información se confirme,
    o rollback si queremos deshacer algún cambio.
    Si no tenemos el commit en automático y cerramos sin guardar este archivo, 
    la información se perdería
    */
    COMMIT; 
END;
