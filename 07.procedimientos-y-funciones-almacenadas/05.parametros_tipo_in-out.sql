--05. Parámetros de tipo IN-OUT
create or replace PROCEDURE sp_calc_tax_in_out(
    empl IN employees.employee_id%TYPE,
    t1 IN OUT NUMBER
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

    t1 := sal * t1/100;

    dbms_output.put_line('Salary: ' || sal);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No existe el empleado');

END;
/

-- Ejecutando store procedure
SET SERVEROUTPUT ON;

DECLARE
    a NUMBER;
    b NUMBER;

BEGIN
    a := 120;
    b := 10;
    
    sp_calc_tax_in_out(a, b);
    dbms_output.put_line('b = ' || b);

END;
/