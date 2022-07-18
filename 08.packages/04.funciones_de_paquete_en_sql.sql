--04. Funciones de paquete en SQL

--Cabecear del paquete
CREATE OR REPLACE PACKAGE pack1
AS
    FUNCTION CONVERT (name VARCHAR2, conversion_type CHAR) RETURN VARCHAR2;
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
    
    FUNCTION CONVERT(
        name VARCHAR2,
        conversion_type CHAR
    )
    RETURN VARCHAR2
    AS
    BEGIN
        IF conversion_type = 'U' THEN
            RETURN up(name);
        ELSIF conversion_type = 'L' THEN
            RETURN lo(name);
        ELSE 
            RETURN 'El parámetro debe ser U o L';
        END IF;
    END convert;
END pack1;


-- Usando el paquete
SET SERVEROUTPUT ON;
DECLARE 
    v1 VARCHAR2(100);
BEGIN
    v1 := pack1.convert('magadiflo', 'U');
    dbms_output.put_line(v1);
END;
/

-- Usando la función del paquete en una consulta SQL
SELECT pack1.convert(first_name, 'U') AS nombre, 
       pack1.convert(last_name, 'U') AS apellido
FROM employees;

