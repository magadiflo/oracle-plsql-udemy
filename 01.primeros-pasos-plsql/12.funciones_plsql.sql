-- 12. Funciones PL/SQL
SET SERVEROUTPUT ON;

DECLARE
    nombre VARCHAR2(100);
    fecha_actual DATE := SYSDATE;
BEGIN
    nombre := 'Martín';
    dbms_output.put_line(upper(substr(nombre, 1, 2)));
    dbms_output.put_line(TO_CHAR(fecha_actual, 'dd/mm/yyyy'));
END;

--Mostrar las iniciales del nombre en mayúscula separádas por punto
DECLARE
    nombre VARCHAR2(50) := 'martín';
    apellido1 VARCHAR2(50) := 'díaz';
    apellido2 VARCHAR2(50) := 'flores';
    iniciales VARCHAR2(10);
BEGIN
    iniciales := SUBSTR(nombre, 1,1) || '.' || SUBSTR(apellido1, 1,1) || '.' || SUBSTR(apellido2, 1,1);
    dbms_output.put_line(UPPER(iniciales));
END;

--Mostrar nombre del día en que nací
DECLARE
    nacimiento DATE := '14-05-1989';
BEGIN
    dbms_output.put_line(TO_CHAR(nacimiento, 'DAY'));
END;