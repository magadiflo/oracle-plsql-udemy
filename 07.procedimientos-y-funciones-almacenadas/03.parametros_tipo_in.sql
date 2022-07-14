--03. Parámetros del tipo IN

/*
NOTA:
 - El IN (parámetro de entrada) es el POR DEFECTO, no es necesario colocarlo
 - Los parámetros de entrada son solo de LECTURA, no pueden ser modifcadas
*/
CREATE OR REPLACE PROCEDURE sp_calc_tax(
    empl IN employees.employee_id%TYPE,
    t NUMBER
)
AS
    tax NUMBER := 0;
    sal NUMBER := 0;
    
BEGIN
    IF t < 0 OR t > 60 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El porcentaje debe estar entre 0 y 60');
    END IF;
    
    SELECT salary 
        INTO sal
    FROM employees
    WHERE employee_id = empl;
    
    --t := 0; es un parámetro de entrada, no puede ser modificada
    tax := sal * t/100;
    
    dbms_output.put_line('Salary: ' || sal);
    dbms_output.put_line('Tax: ' || tax);
    
EXCEPTION 
     WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No existe el empleado');
    
END;

--Ejecutando procedimiento******************************************************
--1° Forma
EXECUTE sp_calc_tax(100, 20);

--2° Forma, usando bloque anónimo
SET SERVEROUTPUT ON;
DECLARE
    a NUMBER;
    b NUMBER;
BEGIN
    a := 120;
    b := 50;
    sp_calc_tax(a, b);
END;
/

