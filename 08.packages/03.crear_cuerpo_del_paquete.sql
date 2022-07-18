--03. Crear el cuerpo de un paquete

--Cabecear del paquete
CREATE OR REPLACE PACKAGE pack1
AS
    v1 NUMBER := 10;
    v2 VARCHAR2(100);
    PROCEDURE CONVERT (name VARCHAR2, conversion_type CHAR);
END;
/

--Cuerpo del paquete
CREATE OR REPLACE PACKAGE BODY pack1
AS
    FUNCTION up(name VARCHAR2)
    RETURN VARCHAR2
    AS
    BEGIN
        RETURN UPPER(name);
    END up;
    
    FUNCTION lo(name VARCHAR2)
    RETURN VARCHAR2
    AS
    BEGIN
        RETURN LOWER(name);
    END lo;
    
    PROCEDURE CONVERT(
        name VARCHAR2,
        conversion_type CHAR
    )
    AS
    BEGIN
        IF conversion_type = 'U' THEN
            dbms_output.put_line(up(name));
        ELSIF conversion_type = 'L' THEN
            dbms_output.put_line(lo(name));
        ELSE 
            dbms_output.put_line('El parámetro debe ser U o L');
        END IF;
    END convert;
END pack1;


-- Usando el paquete
SET SERVEROUTPUT ON;
BEGIN
    pack1.convert('magadiflo', 'U');
END;
/