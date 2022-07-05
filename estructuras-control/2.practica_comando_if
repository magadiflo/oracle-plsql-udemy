-- 2. Práctica comando IF
SET SERVEROUTPUT ON;

DECLARE
    numero NUMBER(2) := 18;
    
BEGIN
    IF MOD(numero,2) = 0 THEN
        dbms_output.put_line('El número ' || numero || ' es par');
    ELSE 
        dbms_output.put_line('El número ' || numero || ' es impar');
    END IF;
END;

-- ELSIF
DECLARE 
    tipo_producto CHAR(1) := 'B';
BEGIN
    IF tipo_producto = 'A' THEN
        DBMS_OUTPUT.PUT_LINE('Electrónica');
    ELSIF tipo_producto = 'B' THEN  
        dbms_output.put_line('Informática');
    ELSIF tipo_producto = 'C' THEN
        dbms_output.put_line('Ropa');
    ELSIF tipo_producto = 'D' THEN
        dbms_output.put_line('Música');
    ELSIF tipo_producto = 'E' THEN
        dbms_output.put_line('Libro');
    ELSE
        dbms_output.put_line('El código es incorrecto');
    END IF;
END;