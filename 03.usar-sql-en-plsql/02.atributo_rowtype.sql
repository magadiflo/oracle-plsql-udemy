--02.Atributo %ROWTYPE
DECLARE
    --%ROWTYPE, permite que la variable "empleado" tenga la misma cantidad de columnas que tiene employees.
    --Esto, con la finalidad de no estar declarando una variable por cada columna, como se hace con el %TYPE
    empleado employees%ROWTYPE; 
BEGIN

    --Solo devuelve una fila
    SELECT *
        INTO empleado
    FROM employees
    WHERE employee_id = 100;
    
    dbms_output.put_line(empleado.first_name || ' ' || empleado.last_name || '(' || empleado.hire_date || ')'  || ':' || empleado.salary);
    
END;