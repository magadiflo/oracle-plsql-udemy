-- 09. Práctica adicional con variables, constantes y %type
SET SERVEROUTPUT ON;

DECLARE
    impuesto  CONSTANT NUMBER(2) := 21; --21%
    precio    NUMBER(5, 2);
    resultado precio%TYPE;
BEGIN
    precio := 100;
    resultado := precio * impuesto / 100;
    dbms_output.put_line(resultado);
END;