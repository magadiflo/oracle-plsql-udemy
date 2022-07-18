--02. Ámbito de las variables en un paquete
/*
- Desde que se abre un paquete permanece abierto durante toda la sesión.
- Las variables públicas o globales(declaradas en la cabecera) permanecen 
  con el valor que tengan durante toda la sesión. Solo desaparecen si las 
  borramos del proceso o nos salimos de la sesión.
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