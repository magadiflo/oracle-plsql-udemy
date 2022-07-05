--3. Visualizar salida por pantalla DBMS_OUTPUT

SET SERVEROUTPUT ON --Habilita la salida por pantalla

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola' || ' mundo!');
END;