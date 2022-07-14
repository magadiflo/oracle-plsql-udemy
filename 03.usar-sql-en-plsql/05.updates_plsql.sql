--04. Updates en PLSQL
SET SERVEROUTPUT ON;

DECLARE
    col_1 test.c1%TYPE;
    
BEGIN
    col_1 := 10;
    UPDATE test 
    SET c2 = 'Nuevo registro 1'
    WHERE c1 = col_1;

    COMMIT; 
END;


SELECT * FROM test;