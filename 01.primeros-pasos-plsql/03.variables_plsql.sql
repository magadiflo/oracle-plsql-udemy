--4. Variables en PLSQL

SET SERVEROUTPUT ON

DECLARE --Bloque para poder declarar e inicializar variables
    salary NUMBER(8) := 2000; --Declaraci�n e inicializaci�n de la variable salary
    name VARCHAR2(100);
    last_name VARCHAR2(100);

BEGIN
    name := 'Mart�n';
    last_name := 'D�az';
    DBMS_OUTPUT.PUT_LINE('El cliente ' || name || ' ' || last_name || ' tiene un sueldo de ' || salary);
END;