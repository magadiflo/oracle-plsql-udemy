--01. Crear un procedimiento
CREATE OR REPLACE PROCEDURE sp_p1
AS --Se puede usar el IS o el AS (yo para hacer similar a SQLServer usaré el AS)
    x NUMBER := 10;
BEGIN
    dbms_output.put_line(x);
END;
    
--EJECUTA PROCEDIMIENTO, cualquiera de las tres formas
--1° forma
EXEC sp_p1;

--2° forma
EXECUTE sp_p1;

--3° forma
SET SERVEROUTPUT ON;
BEGIN
    sp_p1;
END;