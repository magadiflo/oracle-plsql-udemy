--06. Deletes en PLSQL
SET SERVEROUTPUT ON;

DECLARE
    col_1 test.c1%TYPE;
    
BEGIN
    col_1 := 10;
    DELETE FROM test WHERE c1 = 10;

    COMMIT; 
END;
/ --Barra del final de bloque.Deben llevar esa barra cuando juntamos nuestro bloque plsql con otros componentes sql o bloques plsql. En este caso, debajo hay un SELECT

SELECT * FROM test;