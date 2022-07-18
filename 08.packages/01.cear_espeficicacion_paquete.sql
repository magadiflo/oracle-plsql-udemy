--01. Crear las especificaciones de un paquete
/*
Package: 2 partes
1) Heder
2) Body
*/

CREATE OR REPLACE PACKAGE pack1
AS
    --Declaramos todos los objetos que será públicos
    v1 NUMBER;
    v2 VARCHAR2(100);
END;
/

-- Usando el package creado
SET SERVEROUTPUT ON;
BEGIN
    pack1.v1 := 100;
    pack1.v2 := 'Mi nombre es Martín';
    dbms_output.put_line(pack1.v1);
    dbms_output.put_line(pack1.v2);
END;
/