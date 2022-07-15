--07. funciones
CREATE OR REPLACE FUNCTION udf_calc_tax(empl employees.employee_id%TYPE, t1 NUMBER)
RETURN NUMBER
AS
    tax NUMBER := 0;
    sal NUMBER := 0;
BEGIN
    IF t1 < 0 OR t1 > 60 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El porcentaje debe estar entre 0 y 60');
    END IF;
    
    SELECT salary
        INTO sal
    FROM employees
    WHERE employee_id = empl;
    
    tax := sal * t1 / 100;
    
    RETURN tax;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No existe el empleado');
END;
/   

--Ejecutando función
DECLARE
    val NUMBER := 0;
BEGIN
    val := udf_calc_tax(1000, 50);
    dbms_output.put_line('val = ' || val);
END;