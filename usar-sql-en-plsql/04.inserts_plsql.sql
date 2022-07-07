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
    Deben llevar un commit en los puntos donde queremos que la informaci�n se confirme,
    o rollback si queremos deshacer alg�n cambio.
    Si no tenemos el commit en autom�tico y cerramos sin guardar este archivo, 
    la informaci�n se perder�a
    */
    COMMIT; 
END;
