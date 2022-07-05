-- Pr�ctica bloques an�nimos y variables

SET SERVEROUTPUT ON;

DECLARE
    name      VARCHAR2(100);
    last_name VARCHAR2(100);
    age       NUMERIC(2);
    birthday  DATE;
BEGIN
    name := 'Mart�n';
    last_name := 'D�az';
    age := 33;
    birthday := '14-05-1989';
    dbms_output.put_line(name);
    dbms_output.put_line(last_name);
    dbms_output.put_line(name
                         || ' '
                         || last_name);
    dbms_output.put_line(name
                         || ' '
                         || last_name
                         || ', tengo '
                         || age
                         || ' a�os. Soy del '
                         || birthday);

END;

DECLARE
    fijo CONSTANT NUMERIC(2) := 20;
    a    NUMERIC(2);
    b    NUMERIC(2);
    suma NUMERIC(2);
BEGIN
    a := 17;
    b := 15;
    suma := a + b + fijo;
    dbms_output.put_line(suma);
END;