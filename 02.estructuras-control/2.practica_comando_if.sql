-- 2. Pr�ctica comando IF
SET SERVEROUTPUT ON;

DECLARE
    numero NUMBER(2) := 18;
    
BEGIN
    IF MOD(numero,2) = 0 THEN
        dbms_output.put_line('El n�mero ' || numero || ' es par');
    ELSE 
        dbms_output.put_line('El n�mero ' || numero || ' es impar');
    END IF;
END;

-- ELSIF
DECLARE 
    tipo_producto CHAR(1) := 'B';
BEGIN
    IF tipo_producto = 'A' THEN
        DBMS_OUTPUT.PUT_LINE('Electr�nica');
    ELSIF tipo_producto = 'B' THEN  
        dbms_output.put_line('Inform�tica');
    ELSIF tipo_producto = 'C' THEN
        dbms_output.put_line('Ropa');
    ELSIF tipo_producto = 'D' THEN
        dbms_output.put_line('M�sica');
    ELSIF tipo_producto = 'E' THEN
        dbms_output.put_line('Libro');
    ELSE
        dbms_output.put_line('El c�digo es incorrecto');
    END IF;
END;