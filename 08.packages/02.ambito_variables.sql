--02. �mbito de las variables en un paquete
/*
- Desde que se abre un paquete permanece abierto durante toda la sesi�n.
- Las variables p�blicas o globales(declaradas en la cabecera) permanecen 
  con el valor que tengan durante toda la sesi�n. Solo desaparecen si las 
  borramos del proceso o nos salimos de la sesi�n.
*/

CREATE OR REPLACE PACKAGE pack1
AS
    v1 NUMBER := 10;
    v2 VARCHAR2(100);
END;
/

-- Usando el package
SET SERVEROUTPUT ON;

BEGIN
    pack1.v1 := pack1.v1 + 10;
    dbms_output.put_line(pack1.v1);
END;
/