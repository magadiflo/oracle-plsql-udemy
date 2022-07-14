--01.SELECTS dentro de PLSQL
DECLARE
    salario employees.salary%TYPE;
    nombre  employees.first_name%TYPE;
    empleado_id employees.employee_id%TYPE;
    cantidad INTEGER;
    
BEGIN
    empleado_id := 100;
    
    SELECT COUNT(*)
        INTO cantidad
    FROM employees
    WHERE employee_id = empleado_id;
    
    IF cantidad = 1 THEN
        --Solo devuelve una fila
        SELECT salary, first_name 
            INTO salario, nombre
        FROM employees
        WHERE employee_id = empleado_id;
        
        dbms_output.put_line(nombre || ':' || salario);
    ELSIF cantidad > 1 THEN
        dbms_output.put_line('Existen más de un empleado. No se puede procesar');
    ELSE
        dbms_output.put_line('El empleado con id ' || empleado_id || ' no existe en la BD');
    END IF;
END;