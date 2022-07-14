--04. Parámetros del tipo OUT
CREATE OR REPLACE PROCEDURE sp_calc_tax_out(
    empl IN employees.employee_id%TYPE,
    t1 IN NUMBER,
    r1 OUT NUMBER
)
AS
    sal NUMBER := 0;
    
BEGIN
    IF t1 < 0 OR t1 > 60 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El porcentaje debe estar entre 0 y 60');
    END IF;
    
    SELECT salary
        INTO sal
    FROM employees
    WHERE employee_id = empl;
    
    r1 := sal * t1/100;
    
    dbms_output.put_line('Salary: ' || sal);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No existe el empleado');
    
END;

--Ejecutando procedimiento *****************************************************
SET SERVEROUTPUT ON;
DECLARE 
    a NUMBER;
    b NUMBER;
    r_out NUMBER;
    
BEGIN
    a := 120;
    b := 5;
    r_out := 0;
    
    sp_calc_tax_out(a, b, r_out);
    dbms_output.put_line('r_out = ' || r_out);
END;